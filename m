Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537288C9EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F8C10EF21;
	Tue, 26 Mar 2024 16:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KeV6UZHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981F10EF4C;
 Tue, 26 Mar 2024 16:54:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2a072747fc6so1385100a91.2; 
 Tue, 26 Mar 2024 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711472040; x=1712076840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t11QCUWfmd+nyP0xdTPwxlB0/6v6Tz8ppRiV86S/Tcw=;
 b=KeV6UZHMHSOqEAS48J/nkYidXpYfrHU5J36UrOoP7rI6i+y0/9bjhhAgJOAcjiaP2l
 +qRtn062NgZy+1UXaDP+uko7wJzHTe+Q0ui9FSTNOkSOydPPQO4j1hIygUi1cYmxeSEz
 R31cI/vzZGW7aqqruAM0gDitk04rQWztJ2+9dFK90T5u+yeg+C1h6ze18ufG3H2RLVuN
 qAAYR/ZC4lEwVxs6IingYD1sqP0JxE9Sl3h0do2n09Jj+Hfi+BqIeMbuadxWACKGHVFg
 Dli9CaGV2OYQ0WsO5fTQFJ8F+ufZtrpHujd4VjM3yOSx72Ko0YjttgC4VDHzNePdaHuI
 eEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711472040; x=1712076840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t11QCUWfmd+nyP0xdTPwxlB0/6v6Tz8ppRiV86S/Tcw=;
 b=txW/XehXl0pQBV7W6r3w+cDDSEADTrRGecpv78ouT+9aPc7FC3rBYpsfS0SuthPTgU
 ZyDpmGjnDdkf2ViCiT4T4LmITTCkpQ6NBm2k0V1zL0GZHECFDaBi6Bnd4ZUuYsBm5SiQ
 3AfWJtGgt55e/UGW14M2Punhzg4Fa6d2CUASVbDG1Lowq517st7SbOzQjJimMrSZ6fL2
 qwSJ36CwC2wLYvQBJ4bb/hr0rimFcl+chGRFraldnLwGoYS6zOubq67ZASsZW4spIe1o
 ZnmUcY7KiU2YnT3RbiqWLeP6Rl+qR3krVrc0Fg2ceFJK+NE4XoagsdCXItrTWxj6Zt9c
 CL+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd1ylLv6pMeWQL54TErxIa3M6d+WKGrDypWeYWDKDSDmmzEdhKXn+ww1gVJrPAitdDQXmzTWZdyanpGv4GzLu111HKJoTmRIQxfnl5I8AlbQlLGxElLe/BWlLc8onB6LZ7WdL4rBwsK1GPPxLAIA==
X-Gm-Message-State: AOJu0YyurTHX5nUAfsfnU3EaLZFFoNcH5nCIVTMNz/38mHZEOBvP9EcG
 MlxCGF9P71V2nP7qKGAXzZnJyAl8uKVrZFLFnac0xen1XKRjQoQOyKt6aTeTa+/62i0XD0nIdy7
 mI/pMLQhyh3hsOvG+3An5z4QIFcqP7S9r
X-Google-Smtp-Source: AGHT+IFtWAEzhIPMNoFBSEntuEwU3Hqapb1b1h4hN9tob/9RjINt3JfIqdvs1LLqudNz8iSJVELcF2O02oRH6GLLlsM=
X-Received: by 2002:a17:90b:193:b0:2a0:5b4b:f5e2 with SMTP id
 t19-20020a17090b019300b002a05b4bf5e2mr362318pjs.33.1711472039726; Tue, 26 Mar
 2024 09:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240326143750.2292945-1-sunil.khatri@amd.com>
In-Reply-To: <20240326143750.2292945-1-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Mar 2024 12:53:48 -0400
Message-ID: <CADnq5_Nm6gyMf1mhGiyVDe6n69yabdf8EN5t=OmzJ7oBVZmEtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add support of bios dump in devcoredump
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
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

On Tue, Mar 26, 2024 at 10:38=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com=
> wrote:
>
> dump the bios binary in the devcoredump.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 44c5da8aa9ce..f33963d777eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -132,6 +132,26 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,=
 size_t count,
>         drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fa=
ult_info->addr);
>         drm_printf(&p, "Protection fault status register: 0x%x\n\n", faul=
t_info->status);
>
> +       /* Dump BIOS */
> +       if (coredump->adev->bios && coredump->adev->bios_size) {
> +               int i =3D 0;
> +
> +               drm_printf(&p, "BIOS Binary dump\n");
> +               drm_printf(&p, "Valid BIOS  Size:%d bytes type:%s\n",
> +                          coredump->adev->bios_size,
> +                          coredump->adev->is_atom_fw ?
> +                          "Atom bios":"Non Atom Bios");
> +
> +               while (i < coredump->adev->bios_size) {
> +                       /* Printing 15 bytes in a line */
> +                       if (i % 15 =3D=3D 0)
> +                               drm_printf(&p, "\n");
> +                       drm_printf(&p, "0x%x \t", coredump->adev->bios[i]=
);
> +                       i++;
> +               }
> +               drm_printf(&p, "\n");
> +       }

I don't think it's too useful to dump this as text.  I was hoping it
could be a binary.  I guess, we can just get this from debugfs if we
need it if a binary is not possible.

Alex


> +
>         /* Add ring buffer information */
>         drm_printf(&p, "Ring buffer information\n");
>         for (int i =3D 0; i < coredump->adev->num_rings; i++) {
> --
> 2.34.1
>
