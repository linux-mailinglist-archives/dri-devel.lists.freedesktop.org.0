Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A049085EE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB9410EC7C;
	Fri, 14 Jun 2024 08:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ETp5A1ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2023D10ECC3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718352927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U6u6oHwgoeea95K+ELmfRv1oi19gd8QmUZw4bs+x3k=;
 b=ETp5A1ma3I0kKb4Dkz+lsZtoHZC3WHIW2sTidoPo9aVOMfMATZROp0Q4zwoFOOr8+2uJqO
 VUFybPNdrUcWhGD8ZGfUdkdOPfKLNHef2hRd/I0xmzp+ySe8d7JaSt7hvnwWzNcxzwVcZ7
 IHxCglw6NGZAFwt2kGR3j3x1xwuGQZc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-NKh8z9V3P72sSCFcPPjY4g-1; Fri, 14 Jun 2024 04:15:25 -0400
X-MC-Unique: NKh8z9V3P72sSCFcPPjY4g-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ebe771d008so3018331fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 01:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718352924; x=1718957724;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+U6u6oHwgoeea95K+ELmfRv1oi19gd8QmUZw4bs+x3k=;
 b=S/THCDHDu2u0vthTk+54T9J+8sWcOMRaZyDHnjwIURppHaEr//kmjyV/ct+LhC4Ej7
 ELJrQKwIdvKQLbb083y1orGyTfjcKldLkDPElk1597sZarwzdIqMA2ygHQaPy6xYDzv1
 aIWNGrx/8IRJlm4pz8yXtyflCC+Mc8d0v7FlNYdAln2Tz72WijdxMxoe5scKsuPsa1vQ
 f4kW9MbO5LHYO4dANJyQaLlMOVYng6aig3wkMFQcZVvIwzwEMaiVSwmPlLrIlGF8Zrx0
 zfzFLFAi3jkU0XInvBhbJTyXgWZjvM9K8U8HyHu9D+H/oZ02fxExcgdRMsWolvWqDLlu
 KkKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOM9xv5S4f1fqKhn6O3Arha+uP/nxvAx1rI+NaB+ht6VISl6KrnfSerzGGxpRD/SxQaD4UEc7wRuFdbTXoKFOTHOeoxm21XAKuqU0V3VtY
X-Gm-Message-State: AOJu0Yz+xhl4HDHpA55aPvzQom/vY59XxRnNHpqM7jDfuJU4WzSNTg1e
 VnfJaLTgN+KptKrwZphR2okUuaiYFKYJMbHG1/i9vK/7dXXOBvF/dx9lJ2D/isZ8rQ1y+0M2fRy
 dya5elcU8ibm7DVBH4RvNgg/UwFbj49mN7Q+f9gerBVWp5Om2KWRZxu2d4Rb3DTLowg==
X-Received: by 2002:a19:520c:0:b0:52c:9f10:947a with SMTP id
 2adb3069b0e04-52ca6e56a5fmr1341212e87.1.1718352924521; 
 Fri, 14 Jun 2024 01:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwnIjU6dq4qRlzWQDBdnh4stXDr2ytBrb+EVi+jPLU5m8J7sXt/GESIh+foWt4ZaUGAu8U4A==
X-Received: by 2002:a19:520c:0:b0:52c:9f10:947a with SMTP id
 2adb3069b0e04-52ca6e56a5fmr1341191e87.1.1718352924101; 
 Fri, 14 Jun 2024 01:15:24 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad082sm3590791f8f.59.2024.06.14.01.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:15:23 -0700 (PDT)
Message-ID: <105f167697e4421237884ebece1cf9a28293c762.camel@redhat.com>
Subject: Re: [PATCH v7 09/13] PCI: Give pcim_set_mwi() its own devres callback
From: Philipp Stanner <pstanner@redhat.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-pci@vger.kernel.org
Date: Fri, 14 Jun 2024 10:15:22 +0200
In-Reply-To: <17445053-18a1-a56d-79d0-3b3d3ecab033@linux.intel.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
 <20240605081605.18769-11-pstanner@redhat.com>
 <17445053-18a1-a56d-79d0-3b3d3ecab033@linux.intel.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

On Thu, 2024-06-13 at 20:19 +0300, Ilpo J=C3=A4rvinen wrote:
> On Wed, 5 Jun 2024, Philipp Stanner wrote:
>=20
> > Managing pci_set_mwi() with devres can easily be done with its own
> > callback, without the necessity to store any state about it in a
> > device-related struct.
> >=20
> > Remove the MWI state from struct pci_devres.
> > Give pcim_set_mwi() a separate devres-callback.
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0drivers/pci/devres.c | 29 ++++++++++++++++++-----------
> > =C2=A0drivers/pci/pci.h=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > =C2=A02 files changed, 18 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> > index 936369face4b..0bafb67e1886 100644
> > --- a/drivers/pci/devres.c
> > +++ b/drivers/pci/devres.c
> > @@ -361,24 +361,34 @@ void __iomem
> > *devm_pci_remap_cfg_resource(struct device *dev,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(devm_pci_remap_cfg_resource);
> > =C2=A0
> > +static void __pcim_clear_mwi(void *pdev_raw)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_dev *pdev =3D pde=
v_raw;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pci_clear_mwi(pdev);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * pcim_set_mwi - a device-managed pci_set_mwi()
> > - * @dev: the PCI device for which MWI is enabled
> > + * @pdev: the PCI device for which MWI is enabled
> > =C2=A0 *
> > =C2=A0 * Managed pci_set_mwi().
> > =C2=A0 *
> > =C2=A0 * RETURNS: An appropriate -ERRNO error value on error, or zero
> > for success.
> > =C2=A0 */
> > -int pcim_set_mwi(struct pci_dev *dev)
> > +int pcim_set_mwi(struct pci_dev *pdev)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_devres *dr;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dr =3D find_pci_dr(dev);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!dr)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D devm_add_action(&pde=
v->dev, __pcim_clear_mwi, pdev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret !=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return ret;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pci_set_mwi(pdev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret !=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0devm_remove_action(&pdev->dev, __pcim_clear_mwi,
> > pdev);
>=20
> I'm sorry if this is a stupid question but why this cannot use=20
> devm_add_action_or_reset()?

For MWI that could be done.

This is basically just consistent with the new pcim_enable_device() in
patch No.11 where devm_add_action_or_reset() could collide with
pcim_pin_device().

We could squash usage of devm_add_action_or_reset() in here. I don't
care.

P.


>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dr->mwi =3D 1;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pci_set_mwi(dev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(pcim_set_mwi);
>=20

