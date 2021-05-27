Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE887392607
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53EC6EE1A;
	Thu, 27 May 2021 04:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71BF6EE1A;
 Thu, 27 May 2021 04:20:18 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so832573ool.1; 
 Wed, 26 May 2021 21:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tB2Ch1VAJgDCULc93W+ONDreVArjrFcuA8jYDECY1ZU=;
 b=VM40zPswSOR0WHvr7mFAcvMsytjXslU5Xgt+a/AKBXSjgv6TrTQs0dH4MkkEhHrOvL
 8jPmWmQyiWe7TrPAaIHA9Gfr52wEHkLY70Egh0S02aC3JFEcO20d5Gb8IhfiuexWPJdF
 55/8L8gLDKONp/XbKR9e/o6n3wKlNJjmjzqxvmLhEx4ApaT4PMTl7ZL3Ep6wgzgLxQOL
 CRuPpyYxYZ/yrv8Q2K5OhLGjS5BmF4SYuAygcOTmfqLp6OatL7qcIMWBWZ44g//tekLo
 IULOUlvA/hZcz4aIAXfsYZ+o0YhTw1cV0BA9p21vrF1UEQboL5BAkmlCmFLIamJIdKgp
 oBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tB2Ch1VAJgDCULc93W+ONDreVArjrFcuA8jYDECY1ZU=;
 b=rgnRYSFQTfWcaYUOTFIkD6p1Tjlq2daI9S7zTQSL1R3i5y6udiQ5WvRC3NNI+YwifD
 nzrYPYdo59mTmzxbGeFcdDXLYe873m3kbfmb87JZm/0iHzLw6hbBo8Demj5sYOuXKps1
 DSjvELVUm7fjqlj19sh/ddX4mGBIldEKlx87x3A0w6e4ZXDzAUpQJcgWSwJrtPWJJmSm
 uS3F8hzs1Ul43Pm24okJjUVZ0D6V2BeZv9ieF1PBjQ9iHVbR3SpddV9ic8UtsoXtyjeF
 ac/JfVKIYGNMLlP5Bu1BbJr0eA5j/PMsjT/UdhMx9A4AFX9oLzSYs2SwFTfFMU0FpUId
 py6w==
X-Gm-Message-State: AOAM5324XHNlHCrDAzzqFJAx16tS993koOcXI4K0p+kOokX0ipnaeg/R
 KZluFyqlkQuotv1FB9Df666I3AbLwoCgrGRbeNk=
X-Google-Smtp-Source: ABdhPJwgz6poKjp8tEOBLdsTE0+QFAawghJ+wX2eX3p3YHYTocBFCGx4CvV0sbQAbiCWjtFokYUIMyhGhaj/mrup5/k=
X-Received: by 2002:a4a:d004:: with SMTP id h4mr1268994oor.90.1622089218043;
 Wed, 26 May 2021 21:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-19-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-19-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:20:07 -0400
Message-ID: <CADnq5_P3fdAutZTgKJVQW=7aj-9gi5fJWCafYgQ_0XDd8UV-Bg@mail.gmail.com>
Subject: Re: [PATCH 18/34] drm/amd/display/dc/dce/dce_mem_input: Remove
 duplicate initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce=
60_resource.c:29:
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:727=
0:45: warning: initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: not=
e: in expansion of macro =E2=80=98GRPH_CONTROL__GRPH_NUM_BANKS__SHIFT=E2=80=
=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note=
: in expansion of macro =E2=80=98SFB=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note=
: in expansion of macro =E2=80=98MI_GFX6_TILE_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:657:3: n=
ote: in expansion of macro =E2=80=98MI_DCE6_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:727=
0:45: note: (near initialization for =E2=80=98mi_shifts.GRPH_NUM_BANKS=E2=
=80=99)
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: not=
e: in expansion of macro =E2=80=98GRPH_CONTROL__GRPH_NUM_BANKS__SHIFT=E2=80=
=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note=
: in expansion of macro =E2=80=98SFB=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note=
: in expansion of macro =E2=80=98MI_GFX6_TILE_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:657:3: n=
ote: in expansion of macro =E2=80=98MI_DCE6_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:726=
9:43: warning: initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: not=
e: in expansion of macro =E2=80=98GRPH_CONTROL__GRPH_NUM_BANKS_MASK=E2=80=
=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note=
: in expansion of macro =E2=80=98SFB=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note=
: in expansion of macro =E2=80=98MI_GFX6_TILE_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:662:3: n=
ote: in expansion of macro =E2=80=98MI_DCE6_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_sh_mask.h:726=
9:43: note: (near initialization for =E2=80=98mi_masks.GRPH_NUM_BANKS=E2=80=
=99)
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:155:28: not=
e: in expansion of macro =E2=80=98GRPH_CONTROL__GRPH_NUM_BANKS_MASK=E2=80=
=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:159:2: note=
: in expansion of macro =E2=80=98SFB=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_mem_input.h:264:2: note=
: in expansion of macro =E2=80=98MI_GFX6_TILE_MASK_SH_LIST=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:662:3: n=
ote: in expansion of macro =E2=80=98MI_DCE6_MASK_SH_LIST=E2=80=99
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h b/drivers=
/gpu/drm/amd/display/dc/dce/dce_mem_input.h
> index 9b1c4d56275a4..08a4c8d029d9f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h
> @@ -206,7 +206,6 @@ struct dce_mem_input_registers {
>         SFB(blk, GRPH_ENABLE, GRPH_ENABLE, mask_sh),\
>         SFB(blk, GRPH_CONTROL, GRPH_DEPTH, mask_sh),\
>         SFB(blk, GRPH_CONTROL, GRPH_FORMAT, mask_sh),\
> -       SFB(blk, GRPH_CONTROL, GRPH_NUM_BANKS, mask_sh),\
>         SFB(blk, GRPH_X_START, GRPH_X_START, mask_sh),\
>         SFB(blk, GRPH_Y_START, GRPH_Y_START, mask_sh),\
>         SFB(blk, GRPH_X_END, GRPH_X_END, mask_sh),\
> --
> 2.31.1
>
