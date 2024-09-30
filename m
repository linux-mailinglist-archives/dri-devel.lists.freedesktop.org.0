Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A301198A903
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 17:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F61610E53C;
	Mon, 30 Sep 2024 15:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kk0/lXMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99EB10E53C;
 Mon, 30 Sep 2024 15:49:34 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20b3e1a27f7so2146185ad.1; 
 Mon, 30 Sep 2024 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727711374; x=1728316174; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+q8VOr+aRJdcUf16Ay//IQ3TQ8L8t3ZXCDFmufxzXSc=;
 b=kk0/lXMNgwwBjdcFyb3UNYr4qHH1GbR8CtzqaPGJakGX1QPUtbKBo9uqXYE+g75egV
 mCVFSKxHA2x+ZTet/ggKOVcHiKtZO9Bl+HyXU3Gs4Hem7OruiC4qjHLbBj055RZPN+wL
 w9jV4Mj4MmrEo8TPaUJzBDa+dX9ewPq7qFr6g5cC4cQEYbn4ppFl36Fs8fBu/4wkHHc7
 4hcLl8nzCjV8vwPGyXqF1RxVVoCl9WGkctAdbWGCBIid5gc/RAQuiMmGPCoBnMYxXcLA
 KqHyJGIfqFsTXVp8EQgPunqZnuLLlmPdbS+5Z7sNGWh9JKbEYjZo7LZbtwMznw3Ey+6K
 HKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727711374; x=1728316174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+q8VOr+aRJdcUf16Ay//IQ3TQ8L8t3ZXCDFmufxzXSc=;
 b=iQL07DP80kjlmMqve7zenXymSWLGoCo5mAbWLaPiT69dzfwyw84mhENpRGSOMm4Eqh
 k6iHwGjCxQJLtxAanDJ4HA5iiu8UDjPPr1yfDKlmlJz1RUNGdti9blq2e2OkDE47uHMP
 /14NYyE7vV/48hZM7TxhfgBV9ROfX4aXQoHoup+/c7JO33SV2faimhlOn6tvHwcgdYDP
 xxs5BbS1yjUQvvLkaQCWmpn5M+3z07WUzdPMkzJTc9pp/ftyMSb/EBX4CuMzTcu781ku
 gxkf/L58xO5u7TLTzNynxkBNOJ3sn8Kmnq3nlOP6A86nvw/9Sd/nTVCYP+/A6tR+GGyy
 et8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUESNwU6++0X8F95YMC/SEPl50Z6CwbcAa3YidIJnnt15qKXXRNcyPTPCRG7sEaOhizSTClRbOrXs7x@lists.freedesktop.org,
 AJvYcCXmMRAgcoA2tANXdsNgXgDg8rIgC0J+0da+vw9r6dnuZ9lg94vodh83W5lKt2ksZvGqMJLBqd2y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC0IVXjdGTAuT9iUZx50PoXhBl6Zju/SrPBLDCzDLn3phGx3e1
 MiCv0GM9HCT6/laIcr+HoRuu6bTaBRzYvg2zHazzMgSvc4kvA+mZA0aedM/pVegIKXm4B7XoYUQ
 tEFsucBILTnWy867l9vDCjI7XzSU=
X-Google-Smtp-Source: AGHT+IFq/iE3aElnPOuCP9DKQvEjbGBpk613KgJlE7+aVGD1RqPXBUEW0GIQXjPQCIYKQU5+51L2ka5tsPpXb6apOLQ=
X-Received: by 2002:a05:6a21:78a0:b0:1cf:4e49:bc74 with SMTP id
 adf61e73a8af0-1d509b8a3d1mr6134049637.9.1727711374087; Mon, 30 Sep 2024
 08:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240927150719.1432625-1-Igor.A.Artemiev@mcst.ru>
In-Reply-To: <20240927150719.1432625-1-Igor.A.Artemiev@mcst.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Sep 2024 11:49:22 -0400
Message-ID: <CADnq5_P6UT+sbR_4g9cmZ0fHZ4CgU5WLr-NZJ_uqnfEsJdZD_w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r600_cs: Fix possible int overflow in
 r600_packet3_check()
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
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

On Sun, Sep 29, 2024 at 8:08=E2=80=AFPM Igor Artemiev <Igor.A.Artemiev@mcst=
.ru> wrote:
>
> It is possible, although unlikely, that an integer overflow will occur
> when the result of radeon_get_ib_value() is shifted to the left.
>
> Avoid it by casting one of the operands to larger data type (u64).
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>

The chips supported by this code only support a 32 bit internal GPU
address space, so it should never overflow.  That said, I've applied
the patch.  We already cast other similar code in that file.

Alex

> ---
>  drivers/gpu/drm/radeon/r600_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r6=
00_cs.c
> index 1b2d31c4d77c..ac77d1246b94 100644
> --- a/drivers/gpu/drm/radeon/r600_cs.c
> +++ b/drivers/gpu/drm/radeon/r600_cs.c
> @@ -2104,7 +2104,7 @@ static int r600_packet3_check(struct radeon_cs_pars=
er *p,
>                                 return -EINVAL;
>                         }
>
> -                       offset =3D radeon_get_ib_value(p, idx+1) << 8;
> +                       offset =3D (u64)radeon_get_ib_value(p, idx+1) << =
8;
>                         if (offset !=3D track->vgt_strmout_bo_offset[idx_=
value]) {
>                                 DRM_ERROR("bad STRMOUT_BASE_UPDATE, bo of=
fset does not match: 0x%llx, 0x%x\n",
>                                           offset, track->vgt_strmout_bo_o=
ffset[idx_value]);
> --
> 2.39.2
>
