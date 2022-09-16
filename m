Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B465BB1B0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 19:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA53F10E95B;
	Fri, 16 Sep 2022 17:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC8A10E08D;
 Fri, 16 Sep 2022 17:38:07 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1279948d93dso53016763fac.10; 
 Fri, 16 Sep 2022 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=+tOYOkayPE4pw1wpaTs3OyuvsxQN/lMZTTuwRcuB/UM=;
 b=dUNEW4All3BK3BtFtJJXok1xM0KU4WHsTRTiUFxe1BmKBGzW5E82wFpfsIBqSg9kBY
 WDQtTmoy9BXGPxNUzhY9z3DevrMrSBNl95fNjxNPziFl+2/GS+6jdo2Rceh53ppbETOK
 c0sWewfiir5HIA4t4ZoaiNC3p4GVj5uo42P/34BTLJwv5HlvzezbQQKLwf0OFkoTBlvY
 bH/7l0m+VoWqBUaaKZoVG7gg2/fR55T3N+qim3QrhZB+qt/aoGaBNgIp7ZWAGTkwuyK4
 DFRdUkA9iuTKlRCH/2KVBA4OwsyT6koD8dx6FudsY6ztBy4rpqvyZ8fkaUBXZ+zYH4Zc
 9APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=+tOYOkayPE4pw1wpaTs3OyuvsxQN/lMZTTuwRcuB/UM=;
 b=Lq9y2/otG8+mxT0821SY7w5MsRjSx1A7Z+tbhYZXMORqip7eNFt62L/GLqf2hL/uZi
 cwNqxF64TnRL/BHTVu7Nei4IIt3R4b2wIgzThcb/PQclGJrWi8WBCcZb0pC30uJT5zQd
 od7EbJ0lJDudl1ezZUN32PpVrtMZs6x+0VjXzvRLK7NZ9cWp1p9LqLHTP/XZRJrEqv/T
 5HhDamB8jzQYoK9zLubRd9alZsEJ0i0l92jdM3U/6oKvRSeiwAu7LRL3ajv/P30OdjfW
 LrlhN9Ai8LfrZZ+ykn5z3n8JHjpniL1cafvpJ0N0WbjSVBkKvyaRfCsKh6ttD7OGOYLq
 TS5w==
X-Gm-Message-State: ACgBeo0dOTSFuitQySkzhkes4qry3pRR6t34mSNIV4vwaapt1i2y7f4d
 rJHFKTNAU0SnvM3F+rB1xyvW0GF1o2NsF5smOuY=
X-Google-Smtp-Source: AA6agR4XZ+diowcGzmlPTzRkgMo5c6tMGbE9Ldj4j+lFCVh+86EkjMWDMfDFz6T/5HIOj2IeSnAMF1+HIosI4ZRwgNA=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr9725833oae.46.1663349886474; Fri, 16 Sep
 2022 10:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Sep 2022 13:37:55 -0400
Message-ID: <CADnq5_MrYpHO406KstV1CPq1HfQOLaV9bEZ=AtOq=i+0RNx0Tg@mail.gmail.com>
Subject: Re: [PATCH -next 1/6] drm/amd/display: clean up some inconsistent
 indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.

Thanks,

Alex

On Wed, Sep 14, 2022 at 9:58 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> clean up some inconsistent indentings
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2177
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index 4e3356d12147..8dfe639b6508 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -1051,10 +1051,10 @@ static bool CalculatePrefetchSchedule(
>                 bytes_pp = myPipe->BytePerPixelY + myPipe->BytePerPixelC;
>         /*rev 99*/
>         prefetch_bw_pr = dml_min(1, bytes_pp * myPipe->PixelClock / (double) myPipe->DPPPerPlane);
> -    max_Tsw = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime;
> +       max_Tsw = dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime;
>         prefetch_sw_bytes = PrefetchSourceLinesY * swath_width_luma_ub * myPipe->BytePerPixelY + PrefetchSourceLinesC * swath_width_chroma_ub * myPipe->BytePerPixelC;
>         prefetch_bw_oto = dml_max(bytes_pp * myPipe->PixelClock / myPipe->DPPPerPlane, prefetch_sw_bytes / (dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) * LineTime));
> -    prefetch_bw_oto = dml_max(prefetch_bw_pr, prefetch_sw_bytes / max_Tsw);
> +       prefetch_bw_oto = dml_max(prefetch_bw_pr, prefetch_sw_bytes / max_Tsw);
>
>         min_Lsw = dml_max(1, dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre);
>         Lsw_oto = dml_ceil(4 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1) / 4;
> --
> 2.20.1.7.g153144c
>
