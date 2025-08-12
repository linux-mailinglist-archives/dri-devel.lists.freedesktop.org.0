Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017AB23AC8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 23:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDCD10E646;
	Tue, 12 Aug 2025 21:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dMEkOKeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E826B10E644;
 Tue, 12 Aug 2025 21:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 432E85C6A94;
 Tue, 12 Aug 2025 21:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A6EC4CEF5;
 Tue, 12 Aug 2025 21:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755034466;
 bh=qYZXBCQZW0NS7yyFxgT1T+gMnT59ooQ/IwvAwn+NEeM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dMEkOKeKThG4i1r3dIdqgPPGIYp61AjRnrJN7AbkNb87klLF+FlNMHSHFgMNltwt6
 qyMkSI+S7k0xxC3pzrJW8MW5VvWtn+BhQqP0pRX9FJZ+0bletsAeYHLM/tbnWCBdBc
 5FQLz+zF5k/ujzSLIeWB75UA6n9Z6l92PLAFjwLMvJ/4b4U/0XVAraVLG58COCVIfO
 2NSB7sMpgGtox4RIAuTegNhVxQhWl038xfEONWMdy9D6/6FkR4w8NMxeg7COjDGEvh
 d+14/KdLH2BfXbnhiilp5eqyPJzLCTxU65jvE6kMjUUxhL+K1VsBu3tpofHHX5R6k4
 Qp4zjeqCDZAqA==
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6153a19dddfso8832351a12.1; 
 Tue, 12 Aug 2025 14:34:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/+QuUH7Hh8WkGF4X8x+agDEFCu4j0LAKvtbNCZ7wMe05XgVkA8sY3hy27kA4Cti45O35mSWh0wc8=@lists.freedesktop.org,
 AJvYcCVgO6q/0IVU4E/fNEU+QxmkBLm50VO+JPi14IR8t72dpZ3Pui5+H1wDWLFDIB8tE2n/7FLljhWi5R4=@lists.freedesktop.org,
 AJvYcCWo53QJeCTKDlrGrPMQcx4rNMaLx777+QRiHIFpyMikkaKqiA43TdAr5QfrHEqWRDGEX4dyTbFgPg==@lists.freedesktop.org,
 AJvYcCXu98jZmC/s4vBkV79LFdSYJNaPkE4wehGuYKZtOoZm8nOYS36IOn2JXEikwoUpuBhpJCYOpy0YvcAU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHD8kPmE8zFypwKLeUnfbm0dQq9sQ5sqH1Lp/kVIsRY3ANq8O5
 eyYw/QECGUMVE9XyvgsnKemuCBYOj63YnStcoky15j8hQZJtbXudxUJdVNNp7QpEZyT/unc7ELL
 Ip3um/RiMUxrnm/qby3kvlzY19CnuFQA=
X-Google-Smtp-Source: AGHT+IHerJvcEL8VdKszSTVYF2YX9Y+kxZsRDe8ZbCQ/79SrokGxKk8NPPxYmfpA/IXFGw5nZ4c4gpbKYC8mjznMr0c=
X-Received: by 2002:a17:907:2d09:b0:afa:1d30:1437 with SMTP id
 a640c23a62f3a-afca4e9e5c7mr73305766b.53.1755034465461; Tue, 12 Aug 2025
 14:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
 <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk> <aIOTaOA6bUelUtBm@ideak-desk>
 <aIPES8pWAdCVB07L@finisterre.sirena.org.uk> <aIdPW1a5OgTlHweN@ideak-desk>
In-Reply-To: <aIdPW1a5OgTlHweN@ideak-desk>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 12 Aug 2025 16:33:48 -0500
X-Gmail-Original-Message-ID: <CAOZdJXWKs0ZWjpiOKFOZRn8UiSsFnAsQ86f=KaCYJwhuvqkDDg@mail.gmail.com>
X-Gm-Features: Ac12FXzPijuyXTwtLrwmCrv2kjKkWBhiKJKN3DZw6gNA4f_6KXgIYoNBx8bsC-k
Message-ID: <CAOZdJXWKs0ZWjpiOKFOZRn8UiSsFnAsQ86f=KaCYJwhuvqkDDg@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
To: imre.deak@intel.com, nouveau@lists.freedesktop.org, 
 Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Mon, Jul 28, 2025 at 5:25=E2=80=AFAM Imre Deak <imre.deak@intel.com> wro=
te:
>
> Ok, thanks for testing it. I realized that it's better to fix this
> aligning with the conversion for the rest of the drivers in the original
> [1] patchset, could you still give a try if the corresponding patch [2]
> also fixes the issue for you?

Looks like Nouveau is broken the same way:

> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index 1ddd92901526..e1e542126310 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -321,7 +321,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>         if (!(fb =3D *pfb =3D kzalloc(sizeof(*fb), GFP_KERNEL)))
>                 return -ENOMEM;
>
> -       drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +       drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>         fb->obj[0] =3D gem;
>
>         ret =3D drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs)=
;

fb->format is NULL when drm_framebuffer_init() is called.  This is in
the drm-misc-next branch.
