Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90599CB4D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 15:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5BE10E29F;
	Mon, 14 Oct 2024 13:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JT+JInbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC4210E29F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 13:15:28 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2e2a96b242cso849965a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728911728; x=1729516528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6pOdCyL8CGOnJRufM2vHXCfTiind8Cz/wWkGoyY+gg=;
 b=JT+JInbbNopA+Bit3bkB06wZYX8xjIfB8CnRCiuWU43ePsVJD8gL2RPK7Q0D7bqvzP
 +Ir4RDVtFOzA9XXZRE7XtVGICcolpU9QniDPzxTpgf7sjy5Pu7acQZXEQR1ToCMLvJFi
 ap0VSeCaMczGFaorbEtGvqSEUaqqMEg+iweSAePId7qsyUAbBYa4cJzm3w+HrkoU4cfo
 oD+z9a/9TecA/qCOtvGPz76Kukdyityc1KnA+8z/H/kKYchjJo+38EJr/O/3VM+ugBex
 8rySj2tATj8hdoaPmfLxqQU+46MrlQ0M+tiKQ9QVACWQupBV6k2oOJZWHLsFnvbT1AfX
 BHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728911728; x=1729516528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6pOdCyL8CGOnJRufM2vHXCfTiind8Cz/wWkGoyY+gg=;
 b=ATRRV/uO0nZPXjObdB1a/WNJm6EefNjaIFrNsbcMiqw/TPISrfJ0XarOZhv5itWiwa
 +VHuwVVQzBGDQDyIPpzcuE6WiL/86ia02GvFAhU5RHK8Fh7so99y8HTVHR+q6+xp1/gm
 GH0Vmentbx+mL95MtJw8fkLFnvq5DKNAZSJdW2Pr4WtRWrOaox097mBaHQSCzHcVK+FE
 8+441jojvYWbG0V2zTOEmDiWxhg602eNxBwCQZZ4/5HPL5W2KyXoTesPnLexJDb0SNJm
 rePXWu4EsU2c4r1R2VEorv3ntltvFIooNpqS0DdfG8udcaqcUtngmSmh1WB3jwm//Rt/
 mftA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ/BIJQpjbS+4TDG6jI/sVrvSJa0cGM3c7FmO+6iHzazthJhgdmcysKyPMMWFs6drHovg4Qgv8+Cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbtsFCZ7lmRMFpWJndOIabDDRR5SZoE3rcxzvaeHjcDytPk9GZ
 NVpuyowX7gyFgl0WwGUnGiEevJqGXLkQD0zHXwLPCafn+QoUbkiOvkE1LU9CC9taExeMtHg6+QP
 qpWYU5tKqyIvODtqnQZDlt65DI3M=
X-Google-Smtp-Source: AGHT+IFOCvFm6Ckq+Px7bg1J+KuhyZZX05J4yQRGS5oIFmZBXyplRYC785U2C7lg8XYTvcSD/h1O0wCIG+vX4zeBcKE=
X-Received: by 2002:a17:90a:c7c4:b0:2e2:a60f:289e with SMTP id
 98e67ed59e1d1-2e2f0811b98mr5620781a91.0.1728911727969; Mon, 14 Oct 2024
 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241009000321.418e4294@yea> <ZwYinD22dTiBkCh8@intel.com>
 <20241009125549.56e2782e@yea>
In-Reply-To: <20241009125549.56e2782e@yea>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Oct 2024 09:15:16 -0400
Message-ID: <CADnq5_PYFgHHJgp0+qsA0-QPk1nqJv5ofJVmVRL7OzCKQvJ=AQ@mail.gmail.com>
Subject: Re: radeon drm fails to load on v6.12-rc2 "Bogus possible_clones:
 [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)" ( Thinkpad
 T60)
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
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

On Wed, Oct 9, 2024 at 7:13=E2=80=AFAM Erhard Furtner <erhard_f@mailbox.org=
> wrote:
>
> On Wed, 9 Oct 2024 09:28:44 +0300
> Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
>
> > On Wed, Oct 09, 2024 at 12:03:21AM +0200, Erhard Furtner wrote:
> > > Greetings!
> > >
> > > On kernel v6.12-rc I get no X and dmesg (via netconsole) shows this a=
t loading radeon drm:
> > >
> > > [...]
> > > [drm] PCIE GART of 512M enabled (table at 0x0000000000040000).
> > > radeon 0000:01:00.0: WB enabled
> > > radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x0000000008=
000000
> > > radeon 0000:01:00.0: radeon: MSI limited to 32-bit
> > > [drm] radeon: irq initialized.
> > > [drm] Loading R500 Microcode
> > > [drm] radeon: ring at 0x0000000008001000
> > > [drm] ring test succeeded in 0 usecs
> > > [drm] ib test succeeded in 0 usecs
> > > stackdepot: allocating hash table of 65536 entries via kvcalloc
> > > acpi device:06: registered as cooling_device2
> > > [drm] Radeon Display Connectors
> > > [drm] Connector 0:
> > > [drm]   VGA-1
> > > [drm]   DDC: 0x7e40 0x7e40 0x7e44 0x7e44 0x7e48 0x7e48 0x7e4c 0x7e4c
> > > [drm]   Encoders:
> > > [drm]     CRT1: INTERNAL_KLDSCP_DAC1
> > > [drm] Connector 1:
> > > [drm]   LVDS-1
> > > [drm]   DDC: 0x7e60 0x7e60 0x7e64 0x7e64 0x7e68 0x7e68 0x7e6c 0x7e6c
> > > [drm]   Encoders:
> > > [drm]     LCD1: INTERNAL_LVTM1
> > > [drm] Connector 2:
> > > [drm]   DVI-I-1
> > > [drm]   HPD1
> > > [drm]   DDC: 0x7e50 0x7e50 0x7e54 0x7e54 0x7e58 0x7e58 0x7e5c 0x7e5c
> > > [drm]   Encoders:
> > > [drm]     DFP1: INTERNAL_KLDSCP_TMDS1
> > > ------------[ cut here ]------------
> > >
> > > Bogus possible_clones: [ENCODER:46:TV-46] possible_clones=3D0x4 (full=
 encoder mask=3D0x7)
> > <snip>
> > > Bogus possible_clones: [ENCODER:48:TMDS-48] possible_clones=3D0x1 (fu=
ll encoder mask=3D0x7)
> > <snip>
> >
> > Presumably something like this should fix it:
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm=
/radeon/radeon_encoders.c
> > index 0f723292409e..fafed331e0a0 100644
> > --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> > +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> > @@ -43,7 +43,7 @@ static uint32_t radeon_encoder_clones(struct drm_enco=
der *encoder)
> >       struct radeon_device *rdev =3D dev->dev_private;
> >       struct radeon_encoder *radeon_encoder =3D to_radeon_encoder(encod=
er);
> >       struct drm_encoder *clone_encoder;
> > -     uint32_t index_mask =3D 0;
> > +     uint32_t index_mask =3D drm_encoder_mask(encoder);
> >       int count;
> >
> >       /* DIG routing gets problematic */
> >
> > Ville Syrj=C3=A4l=C3=A4
> > Intel
>
> Many thanks! Your patch solves the issue.

Ville,

Can you send out a proper patch?

Thanks!

Alex

>
> Regards,
> Erhard
