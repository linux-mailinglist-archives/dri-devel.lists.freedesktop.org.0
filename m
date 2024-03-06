Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A019873E19
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C941133D4;
	Wed,  6 Mar 2024 18:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="agkDsmsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E01133D2;
 Wed,  6 Mar 2024 18:07:23 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3c19aaedfdaso4386595b6e.2; 
 Wed, 06 Mar 2024 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709748443; x=1710353243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQwUmBSggnRD0pcG/xZbZRZTuuiVEi9qcHO+7tcjts0=;
 b=agkDsmsB9S+Jtt37PkiMIy1Rc4gMIlJPUQl0ffwCxkfQA5lBvYiKmsHo+tU8c/ErAC
 zUPowVlQvOBPX2A35HaMS6bhibv0xnoENqxX6jTYh1m/x3xIDsNWBod85PfZKb88uvv2
 WasZ/aC/b2zPj+ZQA9kWeJiMeKS6aaK3sMR6lQjJozn8XTlSEDSOMC39LteMsRhyrWgC
 QnHdJjXSVHtznrDtNRWM8iNZ4sFOOUYUXKHDVijxs4Mmp8tT6/vO7/UL4ci+0aWfaSG9
 B5rI6ZyY0MGakBqEDUT6+ha9lkaGWSTDquOrxLB9GKcOAefyccT5ByFR1WyVOh9LyhZC
 814w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709748443; x=1710353243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQwUmBSggnRD0pcG/xZbZRZTuuiVEi9qcHO+7tcjts0=;
 b=OBHLuwZ/7/KbF7BXUgvzupqRaaaxVv3MnstTyR4rH05hUIL1PMrlMdzW/GdZrcKO8b
 iYrGWaDaA0dU22eEm25Zw9vuiRPXcbHn69L/HnuzyRB0FdDD+X2S9WygbGxXBfEJ7BEv
 uVhMGsI3Pxfehtqj9yeYhwHLlPn2B9V3ixtiyf/zo7ijGQJxSZiFS5cF1sUsNdNmkat0
 cv42ijPdNzQcJLU6t/nTd0bB30Cdgqq7eNvmeYYJsrEaUgVXYl5EqydUdmEys1f/iZS4
 4o52FCtQfRyOForzwm4Qc/jb6mBzbah8SmpeEqZB94LVgGSmaUNSu/myVcfr8RpbE0rX
 zh5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Uok6D0n3croMk6lRIRS84qBHylBvJUtWSx2ePwlYcAUpT7jAKroVvCVUmrWAawoR2kKO3N0FP8hLl0SE173B6zyc+Kizav0v2JBfKe+j4a+1RNpesvz14lReRu+TLZKsmI20egDjn/dWm+uoLQ==
X-Gm-Message-State: AOJu0Yx49ornVK1n3jgTlcZA98EXXFcaiRDlsxthUWMMXGCHNUr5ftNY
 /GH7vaLtiUgrTzwkE/5N4G6OtTbe9dU2PXspO4Ry007TXo6OsVt9TJKqzgssIPyXCwG2xhQKrC/
 9kMMjewx+4BtS1t1IA2iEHaTECKU=
X-Google-Smtp-Source: AGHT+IGPrOh7Nxf2XCNqNWJRrgy482/ux2E59iFt0t+DK4BrB5tNqimAy468jOtXO5UB4zF2DYDQvfbz5R4CL5EqVyY=
X-Received: by 2002:a05:6808:2985:b0:3c2:1f27:832c with SMTP id
 ex5-20020a056808298500b003c21f27832cmr1561706oib.1.1709748442874; Wed, 06 Mar
 2024 10:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20240306032414.18488-1-prosunofficial@gmail.com>
In-Reply-To: <20240306032414.18488-1-prosunofficial@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Mar 2024 13:07:09 -0500
Message-ID: <CADnq5_Nnx47dQCCyWrx9sNExFjZAOR=qt+nPdN0cqj1zyRLYRg@mail.gmail.com>
Subject: Re: [PATCH] Removed redundant @ symbol to fix kernel-doc warnings in
 -next repo
To: R SUNDAR <prosunofficial@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, rdunlap@infradead.org, 
 mario.limonciello@amd.com, mwen@igalia.com, swarupkotikalapudi@gmail.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Fixed up patch title prefix and applied.

Thanks!

Alex

On Tue, Mar 5, 2024 at 10:48=E2=80=AFPM R SUNDAR <prosunofficial@gmail.com>=
 wrote:
>
> For linux-next repository.
>
> ./drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured =
comments found
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use=
 of kernel-doc format:          * @@overlap_only: Whether overlapping of di=
fferent planes is allowed.
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use=
 of kernel-doc format:          * @@overlap_only: Whether overlapping of di=
fferent planes is allowed.
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1: warning: no structured c=
omments found
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use=
 of kernel-doc format:          * @@overlap_only: Whether overlapping of di=
fferent planes is allowed.
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function para=
meter or struct member 'pre_multiplied_alpha' not described in 'mpcc_blnd_c=
fg'
>
> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/dr=
m/amd/display/dc/inc/hw/mpc.h
> index ba9b942ce09f..34a398f23fc6 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -110,9 +110,8 @@ struct mpcc_blnd_cfg {
>          */
>         enum mpcc_alpha_blend_mode alpha_mode;
>
> -       /***
> -        * @@pre_multiplied_alpha:
> -        *
> +       /**
> +        * @pre_multiplied_alpha:
>          * Whether pixel color values were pre-multiplied by the alpha ch=
annel
>          * (MPCC_ALPHA_MULTIPLIED_MODE).
>          */
> @@ -129,7 +128,7 @@ struct mpcc_blnd_cfg {
>         int global_alpha;
>
>         /**
> -        * @@overlap_only: Whether overlapping of different planes is all=
owed.
> +        * @overlap_only: Whether overlapping of different planes is allo=
wed.
>          */
>         bool overlap_only;
>
> --
> 2.34.1
>
