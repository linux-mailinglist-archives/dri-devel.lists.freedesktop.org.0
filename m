Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB8C85F9D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 17:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A993A10E44E;
	Tue, 25 Nov 2025 16:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a0oatR1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5224B10E444
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764088151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwREsPe1hhrreIC8KS4q7/1gO+h3q57lrb5V+Imx64M=;
 b=a0oatR1ARcQqBjPfHo3QCeuvDfhg9f4DiJqpB0cXPywATskvpVoWkwnYA9KSlpje3okXVU
 q6CpIuhDsC61btjj9pE81yiJZr0GyXnfWk7RTDW0QMUDr2HBQ1jnk/4UoLXdRTNCTibwnz
 3cmTox8W7fnX3gDVQiPVsGWrrbgY5wA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-9Mv6lh-uPUqt7zniqZo87A-1; Tue, 25 Nov 2025 11:29:10 -0500
X-MC-Unique: 9Mv6lh-uPUqt7zniqZo87A-1
X-Mimecast-MFC-AGG-ID: 9Mv6lh-uPUqt7zniqZo87A_1764088149
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-295595cd102so124152495ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764088149; x=1764692949;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/9VdPfUeGGC/W4hs0+0u5m9NGyRulUJvhrFT3kOxAUc=;
 b=H1P4NjihETxNxFZCV4UZsf/xqQ5+8O5okF0gLEZ5opE9OkW2a07XvMmB3AkRtzGyR7
 sDyTPhmvmbxU7LFeYjxTnEjqw7c27ULdSd2ScEMhEJEbcrGD5HnOm0xVkTJJwtMGlOW7
 q4uwQx7WNEtV3fkEsGLUuooDDFW+NBID8GGjk24uMwGCdT6AfOsCaI72WFxUCTVriy0E
 MnXa+ab0Y2rgyU6fmh02jU4LGnhdsc6zh7HDTBy61V24OloW5joJ0XKOAWxukRnWNjLz
 QpXrtyJKdB3oHMqRjpSAWGCMU+PKZcmgD9qyCURyM1Ju8s3fWfTcyCLEyVI3g+2J1lWG
 iP0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Oe5KVpbuo/NbCiLRecvu6QRWnbgUYHnyjPW/+ed5XDCUoO0EHHX5A5fE8OPwXM+CvC+m6C0WfCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL91GkCrEZIcFC1Jxme6ox8qzsChHn9F8MI3Y3CAwUjnFguc7N
 yGHsj4fj9iULSv/eCsu8cVkWiXcsSvd7ZEpjZPcrsGCg00yGjgowQ39g8SRTmMvT4K0uCkp0Ozv
 ngvfwRum947c4X87liYQuaB4vQIdwUQAOpJQ4ajwQ/OhmIubPy+ojyqs+yaSUQ5e9r+dOVQ==
X-Gm-Gg: ASbGncty8rSCcErSmgQlH0EEXNnlaYAWd1ui1dzpWzP4sniO/0PDz68hKVnBwLzqEw9
 6zoGR2QdtKLd74egXmEn+xrbsJfm2I9Sqyw2+ekJWEfPaIG1DWE67+IkWlmTPb3JdI5v0Q5DFGh
 TLGOmn2Vgqg9zPt4Rg6jBEF2qnpi2cImz0/LsDHXQhp0jrf2Ejw0J0rfeKyZcLENl+NqYsC52j+
 VqCQbBGb0dMtXfvroSbvz2gq7O7t+gWK+LSJjwm30Bme9xJW68FMo6lNKoqFveyIYs/b1VnUHDo
 Kble9pgbtds8hXlBJm/MQu0mH13ZSUd/VLmGF2xk+QGtABoYPRPymHBIQ738/ULCOM+K6n5ybiM
 bByisgwe0c18VqE6CfwLV8D6kQ7LWnwxo+cuC
X-Received: by 2002:a17:903:3c6f:b0:295:8c51:64ff with SMTP id
 d9443c01a7336-29b6bf37d57mr164174895ad.29.1764088148925; 
 Tue, 25 Nov 2025 08:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEok0ss3gIQ0hLyr6LzY46SNfe/5xP0Mg5Had2izv07cMVi9rYxGcIgLMurharveVJBPsL79Q==
X-Received: by 2002:a17:903:3c6f:b0:295:8c51:64ff with SMTP id
 d9443c01a7336-29b6bf37d57mr164174555ad.29.1764088148497; 
 Tue, 25 Nov 2025 08:29:08 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b29b37fsm169912725ad.79.2025.11.25.08.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 08:29:08 -0800 (PST)
Message-ID: <6e43c821658de1f388de99aac9cbbbbfdccb7ffd.camel@redhat.com>
Subject: Re: [PATCH v9 02/13] PCI: Add devres helpers for iomap table
 [resulting in backtraces on HPPA]
From: Philipp Stanner <pstanner@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-parisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>
Date: Tue, 25 Nov 2025 17:28:55 +0100
In-Reply-To: <6c749a78-2c98-45a8-b9d4-47f79b56c918@roeck-us.net>
References: <20240613115032.29098-1-pstanner@redhat.com>
 <20240613115032.29098-3-pstanner@redhat.com>
 <16cd212f-6ea0-471d-bf32-34f55d7292fe@roeck-us.net>
 <414bc2c721bfc60b8b8a1b7d069ff0fc9b3e5283.camel@redhat.com>
 <6c749a78-2c98-45a8-b9d4-47f79b56c918@roeck-us.net>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mDioI0E84ao7j5_GO0eKTPabUH1kBSQawvHDPiVzjoY_1764088149
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-11-25 at 08:12 -0800, Guenter Roeck wrote:
> On 11/25/25 07:48, Philipp Stanner wrote:
> > On Sun, 2025-11-23 at 08:42 -0800, Guenter Roeck wrote:
> > > Hi,
> > >=20
> > > On Thu, Jun 13, 2024 at 01:50:15PM +0200, Philipp Stanner wrote:
> > > > The pcim_iomap_devres.table administrated by pcim_iomap_table() has=
 its
> > > > entries set and unset at several places throughout devres.c using m=
anual
> > > > iterations which are effectively code duplications.
> > > >=20
> > > > Add pcim_add_mapping_to_legacy_table() and
> > > > pcim_remove_mapping_from_legacy_table() helper functions and use th=
em where
> > > > possible.
> > > >=20
> > > > Link: https://lore.kernel.org/r/20240605081605.18769-4-pstanner@red=
hat.com
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > [bhelgaas: s/short bar/int bar/ for consistency]
> > > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > ---
> > > > =C2=A0=C2=A0drivers/pci/devres.c | 77 +++++++++++++++++++++++++++++=
++++-----------
> > > > =C2=A0=C2=A01 file changed, 58 insertions(+), 19 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > > > index f13edd4a3873..845d6fab0ce7 100644
> > > > --- a/drivers/pci/devres.c
> > > > +++ b/drivers/pci/devres.c
> > > > @@ -297,6 +297,52 @@ void __iomem * const *pcim_iomap_table(struct =
pci_dev *pdev)
> > > > =C2=A0=C2=A0}
> > > > =C2=A0=C2=A0EXPORT_SYMBOL(pcim_iomap_table);
> > > > =C2=A0=20
> > > > +/*
> > > > + * Fill the legacy mapping-table, so that drivers using the old AP=
I can
> > > > + * still get a BAR's mapping address through pcim_iomap_table().
> > > > + */
> > > > +static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
> > > > +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 void __iomem *mapping, int bar)
> > > > +{
> > > > +=09void __iomem **legacy_iomap_table;
> > > > +
> > > > +=09if (bar >=3D PCI_STD_NUM_BARS)
> > > > +=09=09return -EINVAL;
> > > > +
> > > > +=09legacy_iomap_table =3D (void __iomem **)pcim_iomap_table(pdev);
> > > > +=09if (!legacy_iomap_table)
> > > > +=09=09return -ENOMEM;
> > > > +
> > > > +=09/* The legacy mechanism doesn't allow for duplicate mappings. *=
/
> > > > +=09WARN_ON(legacy_iomap_table[bar]);
> > > > +
> > >=20
> > > Ever since this patch has been applied, I see this warning on all hpp=
a
> > > (parisc) systems.
> > >=20
> > > [=C2=A0=C2=A0=C2=A0 0.978177] WARNING: CPU: 0 PID: 1 at drivers/pci/d=
evres.c:473 pcim_add_mapping_to_legacy_table.part.0+0x54/0x80
> > > [=C2=A0=C2=A0=C2=A0 0.978850] Modules linked in:
> > > [=C2=A0=C2=A0=C2=A0 0.979277] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 No=
t tainted 6.18.0-rc6-64bit+ #1 NONE
> > > [=C2=A0=C2=A0=C2=A0 0.979519] Hardware name: 9000/785/C3700
> > > [=C2=A0=C2=A0=C2=A0 0.979715]
> > > [=C2=A0=C2=A0=C2=A0 0.979768]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 YZrvWESTH=
LNXBCVMcbcbcbcbOGFRQPDI
> > > [=C2=A0=C2=A0=C2=A0 0.979886] PSW: 00001000000001000000000000001111 N=
ot tainted
> > > [=C2=A0=C2=A0=C2=A0 0.980006] r00-03=C2=A0 000000000804000f 000000004=
14e10a0 0000000040acb300 00000000434b1440
> > > [=C2=A0=C2=A0=C2=A0 0.980167] r04-07=C2=A0 00000000414a78a0 000000000=
0029000 0000000000000000 0000000043522000
> > > [=C2=A0=C2=A0=C2=A0 0.980314] r08-11=C2=A0 0000000000000000 000000000=
0000008 0000000000000000 00000000434b0de8
> > > [=C2=A0=C2=A0=C2=A0 0.980461] r12-15=C2=A0 00000000434b11b0 000000004=
156a8a0 0000000043c655a0 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 0.980608] r16-19=C2=A0 000000004016e080 000000004=
019e7d8 0000000000000030 0000000043549780
> > > [=C2=A0=C2=A0=C2=A0 0.981106] r20-23=C2=A0 0000000020000000 000000000=
0000000 000000000800000e 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 0.981317] r24-27=C2=A0 0000000000000000 000000000=
800000f 0000000043522260 00000000414a78a0
> > > [=C2=A0=C2=A0=C2=A0 0.981480] r28-31=C2=A0 00000000436af480 000000004=
34b1680 00000000434b14d0 0000000000027000
> > > [=C2=A0=C2=A0=C2=A0 0.981641] sr00-03=C2=A0 0000000000000000 00000000=
00000000 0000000000000000 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 0.981805] sr04-07=C2=A0 0000000000000000 00000000=
00000000 0000000000000000 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 0.981972]
> > > [=C2=A0=C2=A0=C2=A0 0.982024] IASQ: 0000000000000000 0000000000000000=
 IAOQ: 0000000040acb31c 0000000040acb320
> > > [=C2=A0=C2=A0=C2=A0 0.982185]=C2=A0 IIR: 03ffe01f=C2=A0=C2=A0=C2=A0 I=
SR: 0000000000000000=C2=A0 IOR: 00000000436af410
> > > [=C2=A0=C2=A0=C2=A0 0.982322]=C2=A0 CPU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 CR30: 0000000043549780 CR31: 0000000000000000
> > > [=C2=A0=C2=A0=C2=A0 0.982458]=C2=A0 ORIG_R28: 00000000434b16b0
> > > [=C2=A0=C2=A0=C2=A0 0.982548]=C2=A0 IAOQ[0]: pcim_add_mapping_to_lega=
cy_table.part.0+0x54/0x80
> > > [=C2=A0=C2=A0=C2=A0 0.982733]=C2=A0 IAOQ[1]: pcim_add_mapping_to_lega=
cy_table.part.0+0x58/0x80
> > > [=C2=A0=C2=A0=C2=A0 0.982871]=C2=A0 RP(r2): pcim_add_mapping_to_legac=
y_table.part.0+0x38/0x80
> > > [=C2=A0=C2=A0=C2=A0 0.983100] Backtrace:
> > > [=C2=A0=C2=A0=C2=A0 0.983439]=C2=A0 [<0000000040acba1c>] pcim_iomap+0=
xc4/0x170
> > > [=C2=A0=C2=A0=C2=A0 0.983577]=C2=A0 [<0000000040ba3e4c>] serial8250_p=
ci_setup_port+0x8c/0x168
> > > [=C2=A0=C2=A0=C2=A0 0.983725]=C2=A0 [<0000000040ba7588>] setup_port+0=
x38/0x50
> > > [=C2=A0=C2=A0=C2=A0 0.983837]=C2=A0 [<0000000040ba7d94>] pci_hp_diva_=
setup+0x8c/0xd8
> > > [=C2=A0=C2=A0=C2=A0 0.983957]=C2=A0 [<0000000040baa47c>] pciserial_in=
it_ports+0x2c4/0x358
> > > [=C2=A0=C2=A0=C2=A0 0.984088]=C2=A0 [<0000000040baa8bc>] pciserial_in=
it_one+0x31c/0x330
> > > [=C2=A0=C2=A0=C2=A0 0.984214]=C2=A0 [<0000000040abfab4>] pci_device_p=
robe+0x194/0x270
> > >=20
> > > Looking into serial8250_pci_setup_port():
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pci_resource_fla=
gs(dev, bar) & IORESOURCE_MEM) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pcim_iomap(dev, bar, 0) && !pcim_iomap_tab=
le(dev))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -ENOMEM;
> >=20
> > Strange. From the code I see here the WARN_ON in
> > pcim_add_mapping_to_legacy_table() should not fire. I suspect that it's
> > actually triggered somewhere else.
> >=20
>=20
> pcim_iomap() calls pcim_add_mapping_to_legacy_table() which triggers the =
traceback.
> The caller uses the returned error to determine that it needs to call pci=
m_iomap_table()
> instead. As you point out below, that may not be necessary, but then it i=
s already
> too late and the warning was triggered.
>=20
> > >=20
> > > This suggests that the failure is expected. I can see that pcim_iomap=
_table()
> > > is deprecated, and that one is supposed to use pcim_iomap() instead. =
However,
> > > pcim_iomap() _is_ alrady used, and I don't see a function which lets =
the
> > > caller replicate what is done above (attach multiple serial ports to =
the
> > > same PCI bar).
> >=20
> > Is serial8250_pci_setup_port() invoked in a loop somewhere? Where does
> > the "attach multiple" happen?
> >=20
>=20
> It is called for multiple serial ports, each of which are in the same bar=
 but
> with different offset into the bar.
>=20
> > >=20
> > > How would you suggest to fix the problem ?
> >=20
> > I suggest you try to remove the `&& pcim_iomap_table(dev)` from above
> > to see if that's really the cause. pcim_iomap() already creates the
> > table, and if it succeeds the table has been created with absolute
> > certainty. The entries will also be present. So the table-check is
> > surplus.
> >=20
>=20
> How would that fix anything ? The warning would still be triggered from t=
he
> failed call to pcim_iomap() for the 2nd and subsequent serial port on the
> same bar.

OK, I failed to see that it's really pcim_iomap() which is called
multiple times for the same bar.

The warning itself is harmless, so it's not urgent.
Cleanup is always done through devres callbacks, one per resource. The
table is not used for that, just for accessors of existing mappings. So
at first glance I think that removing the WARN_ON would be OK. I'd like
to hear Bjorn's opinion on that, though.

Maybe you could investigate removing pcim_iomap_table() from this
driver, obtaining the mappings directly from calls to pcim_iomap().
Calling it multiple times for the same BAR is valid, it's just the
table which complains. Since you are the first party I ever hear from
about that WARN_ON. So with this driver ported one could argue that
removing it is justified..

Another possiblity could be to switch to unmanaged PCI. Use pci_iomap()
and pci_enable_device() etc.

In case you have lots of spare cycles, the cleanest way would be to
remove the legacy table altogether. To do so, one would have to port
all users of pcim_iomap_table(). I have worked on that for a while and
have removed many of them. The most difficult remaining users are AFAIR
in drivers/ata/


P.

