Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DFF5100D5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BA710E058;
	Tue, 26 Apr 2022 14:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2F210E084;
 Tue, 26 Apr 2022 14:45:20 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e922e68b0fso8495440fac.1; 
 Tue, 26 Apr 2022 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OOtL5wcXcfwJhLOAEydGIIJp5UrBXd8LJmT1yWYvkhg=;
 b=hg60SGGEIYf9LGl/ckHOj11ljvLU6FltdZryKK3hKyICRySODEM+Ts9UOEfpUno8x1
 tvi2ettjfr7e11bCDm6tI65FtAcNtbaFVNwbO4ufUhHZMKQmiAkEnKFZRgYBgqjD+s3W
 5EcsKhiMpzd+jFYCkMFa8m4BVN6JcK+yFh7S8bsW/LU3CfsV5tZhE1MxXCZ1JYxO/pdZ
 JpyqDAV4Fy5dZ0WWgpcPV1QmzKo57ASHxpcb8H+OxhJFKCHtYk65ukCsSGeH9TjPWYA5
 6abFyXwweAOLTtP4k9WW7DP67UVllayYGv132yUVtizUaJD2HR8V8sNAydzY1gxWSy7M
 P8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OOtL5wcXcfwJhLOAEydGIIJp5UrBXd8LJmT1yWYvkhg=;
 b=j7y8fWL8IUXZkY8fCrzpTFMR/CH4yrDapZ3pRdRCXvB2hoC7/tcZerYU6pBPHU2lzq
 uCFQpH0eyNkwcax3QyCL8B6VtsI1Vlbb6FT2twpWnBSbLEAvc1Q0PWKr9PBeofnOt/hl
 6Ob5OmydbTy3Jb8+VibvbV+d1lkyVam6usjhwEbIJCOLb/oaj0JsaqeZgxaX1x8/8VJL
 OLeeULXMyjWAVZgykEqgxA95ISABBy1rMqZP1dYQQ6F0kGPyJ+cXAzFaccgfd32eQ8tv
 B58fa8EMTSCmn6ZvAbSgttKwvXUCF6wX+mDHfWXfbd8DD5g0GDeHfbOXKQ+iLTCmZHxT
 1DtA==
X-Gm-Message-State: AOAM530kOl5ht0p18EPGB2M1GbtmyQdwIH0NrTLcARW/k/O1YfQkIJ1P
 kTYjdtflbeS8+cvjlzQCpp86WaEkw8nDMnh58nQ=
X-Google-Smtp-Source: ABdhPJwHcWQUioAJE5Gzf7IrAv5O02o8R34v3YhNiHp4iz5J4jxvZx1WBL8DmYQhwimHz7+UeHiJbn/2VAy9Vof7z4U=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr9872967oap.253.1650984319966; Tue, 26
 Apr 2022 07:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220426084959.3345358-1-lizhenneng@kylinos.cn>
In-Reply-To: <20220426084959.3345358-1-lizhenneng@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Apr 2022 10:45:08 -0400
Message-ID: <CADnq5_MoXnchJyB+VgXnv7RihXcmSCPuNcL8nE7GVfJW9KB34Q@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/radeon: Fix typo in comments
To: Zhenneng Li <lizhenneng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Apr 26, 2022 at 4:50 AM Zhenneng Li <lizhenneng@kylinos.cn> wrote:
>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>  drivers/gpu/drm/radeon/atombios.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
> index bd5dc09e860f..6ccc9f31689f 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -3599,7 +3599,7 @@ typedef struct  _ATOM_LCD_RTS_RECORD
>    UCHAR     ucRTSValue;
>  }ATOM_LCD_RTS_RECORD;
>
> -//!! If the record below exits, it shoud always be the first record for easy use in command table!!!
> +//!! If the record below exits, it should always be the first record for easy use in command table!!!
>  // The record below is only used when LVDS_Info is present. From ATOM_LVDS_INFO_V12, use ucLCDPanel_SpecialHandlingCap instead.
>  typedef struct  _ATOM_LCD_MODE_CONTROL_CAP
>  {
> @@ -3823,7 +3823,7 @@ typedef struct _ATOM_DPCD_INFO
>  // Note1: This table is filled by SetBiosReservationStartInFB in CoreCommSubs.asm
>  //        at running time.
>  // note2: From RV770, the memory is more than 32bit addressable, so we will change
> -//        ucTableFormatRevision=1,ucTableContentRevision=4, the strcuture remains
> +//        ucTableFormatRevision=1,ucTableContentRevision=4, the structure remains
>  //        exactly same as 1.1 and 1.2 (1.3 is never in use), but ulStartAddrUsedByFirmware
>  //        (in offset to start of memory address) is KB aligned instead of byte aligend.
>  /***********************************************************************************/
> @@ -3858,7 +3858,7 @@ typedef struct _ATOM_VRAM_USAGE_BY_FIRMWARE
>    ATOM_FIRMWARE_VRAM_RESERVE_INFO      asFirmwareVramReserveInfo[ATOM_MAX_FIRMWARE_VRAM_USAGE_INFO];
>  }ATOM_VRAM_USAGE_BY_FIRMWARE;
>
> -// change verion to 1.5, when allow driver to allocate the vram area for command table access.
> +// change version to 1.5, when allow driver to allocate the vram area for command table access.
>  typedef struct _ATOM_FIRMWARE_VRAM_RESERVE_INFO_V1_5
>  {
>    ULONG   ulStartAddrUsedByFirmware;
> --
> 2.25.1
>
