Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC577EE75C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CB510E686;
	Thu, 16 Nov 2023 19:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE47710E686;
 Thu, 16 Nov 2023 19:18:34 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1f54c538869so621064fac.2; 
 Thu, 16 Nov 2023 11:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700162314; x=1700767114; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STPFJgJTmWckMd9fvN+D7up8AUbhHF9YB+XgQB9vdw4=;
 b=C4Q99+JeulVgWzdHu1sG3rEXBs2rkmn1VUg1/v1BXY91EVH7QAF0CMi90jxZJdPl3M
 UZ0HAiYNZPLtwUpQ4gzl/JTU9GEU/8s9aXg5rInNhXikjajRRc6evFkBngH7kJS8+TDJ
 +iaeNWQ7TfX/Rws9eyi4rBuJjefWcGW6iQLOrmhnOdDL/vSHf3RyMKVtQNpRXMoN4t0t
 72C7yBKfyY9PfExHJwm2mSnloYqMFITZggHYrfqxQPgVJLpkm9E1Rw/A1zKraC37OcF9
 NUvTQLSI31ez4P3XQj0alWAW8O6hdT+4RZjoHqQEAdxY/EeHDac9dTytFCX+O/uqWgtt
 NPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700162314; x=1700767114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STPFJgJTmWckMd9fvN+D7up8AUbhHF9YB+XgQB9vdw4=;
 b=RDuwR5WVT6iR1hbGFMYA/G/lSUQw8xsQw3us4ZVnDkFUTUZ+EwW333eyQtqaNlR8mF
 Bs0b6gox+NzjpS341S+85m8xTaC6PEQwQpkg+dvYe7AUwtbiPLF56MH0cWM+SYIN2NYM
 OAVXJvL1Z0Sck8M8vOtvGGlqUXwNRFJz+SgFLo0E0/neXeaM523eFdHuuJm4CW6OaP34
 6Z29WN3cBPavI+D3+Ob15gHil/4KzLCd4OughUJ5ZfTlAIfi8KQnBRNq6ZL5CDB0x5zZ
 qNy4ACKtk+EGPi0r3niijqLiaWCjRLt27GaCfn1okRnFth/pxgusqYfAgo25jWHRms67
 jPkA==
X-Gm-Message-State: AOJu0YxCommjssYmtho5nkSqyLGzhdkRslzDQ26TstdYzZ386Mod0E1f
 kQno7FFOluUEWflVsigXzVHBBGq/oJadhJdcBZE=
X-Google-Smtp-Source: AGHT+IH3DRdTfKoOMyMOzkQDCigyhHbNJcoUpI6PmnvC7T6AkuKRO4z5Oxn0dWHKqFPRDwgDEBJUuRuS8SdMX1s4iaI=
X-Received: by 2002:a05:6870:169b:b0:1ef:bfd8:90d1 with SMTP id
 j27-20020a056870169b00b001efbfd890d1mr20538538oae.22.1700162314073; Thu, 16
 Nov 2023 11:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-4-hkallweit1@gmail.com>
 <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
In-Reply-To: <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:18:23 -0500
Message-ID: <CADnq5_NjZkGLz-J39h_6djdgaD8zT3_pEq4iy5FfcYTz646SFg@mail.gmail.com>
Subject: Re: [PATCH 03/20] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:
 remove I2C_CLASS_DDC support
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 12:50=E2=80=AFPM Harry Wentland <harry.wentland@amd=
.com> wrote:
>
> Please just use "drm/amd/display:" as tag in the commit subject.
>
> With that fixed, this is
> Acked-by: Harry Wentland <harry.wentland@amd.com>
>

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via the i2c tree if you prefer.

Alex

> Harry
>
> On 2023-11-13 06:23, Heiner Kallweit wrote:
> > After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> > olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> > Class-based device auto-detection is a legacy mechanism and shouldn't
> > be used in new code. So we can remove this class completely now.
> >
> > Preferably this series should be applied via the i2c tree.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 6f99f6754..ae1edc6ab 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
> >       if (!i2c)
> >               return NULL;
> >       i2c->base.owner =3D THIS_MODULE;
> > -     i2c->base.class =3D I2C_CLASS_DDC;
> >       i2c->base.dev.parent =3D &adev->pdev->dev;
> >       i2c->base.algo =3D &amdgpu_dm_i2c_algo;
> >       snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c h=
w bus %d", link_index);
> >
>
