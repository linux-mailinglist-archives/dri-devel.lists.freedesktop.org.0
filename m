Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE385B40D8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703E10EE48;
	Fri,  9 Sep 2022 20:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A80210EE48;
 Fri,  9 Sep 2022 20:44:01 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-127d10b4f19so6951216fac.9; 
 Fri, 09 Sep 2022 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GUxuNPeeQ+ibx1PJlSAFNGg7X0SdVaxQlF5DdweLpFo=;
 b=naVN2k5ytQZbAozlRF5lg+T98ZF+pQ/UbExkYjhh+GQAhysuPXJt6IjV04Wh+pNoj5
 PxaxoRjavVSCDvVfUy1K+6E7hXwCIJC+5ORqXbWgZkMUnHnUaSexE9p92hJdzNvWLHuo
 Bnk1j0IMwblRGXgIklxYDYb+ZN6wr/WbLqVxkqhJeiM8SUHVLJ+vXxPoURYosE3VFLcT
 1p2i5DgtYwBXk1iJ+ZTNd38PGyL/qdfx0gkeKmVzFJ+8KtFddSeoaHn6H06BqBrE1uOH
 6jEJBDcijgys4ABVkyfy6gOpiohG0fUkHFl9hRyckFEsJGYcuVy47LJpBvzVEUFlbr43
 MDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GUxuNPeeQ+ibx1PJlSAFNGg7X0SdVaxQlF5DdweLpFo=;
 b=GIVqZssA5b5Tb4UY3vjDTuCYjwjQp35mhARyMqQJgjwhmojHTglHmr4M3JlpTmeeH4
 Rd5wX9Kl9NNVRnBVZrsnY5GRv7qDxovGbgXBLma25oEEuoe++S+DtuuFXn6IZVvq7MMR
 ARXpnpcZiesm7vzsr7cG8ZNwrwPZ5lRobtxQGvdg4yHWUfMco86vc2OhMr1of6D2dBC7
 m1y1zxszSVwbux2it9ZWoo4tSl5NAaSYz6bzuZqSiKBuv7r6WiG/mxRD5oQqvJNsV1k3
 TuOZ4kuMGhIiVdHcwDCqTSWUWNY7QOrouPHMxFysSfVsLpTEGtLhozlU8JqFYZVOsFdK
 Yh/Q==
X-Gm-Message-State: ACgBeo1pYxch9Ff5AZvt72IVahNA7kwWtoHSBq6r0GCQ3nLBE3I5PSed
 FIUHkbbKRjJOIOO5y7yEXPYZyzt7faExE+82VAZfimcS
X-Google-Smtp-Source: AA6agR6L8wg9JJlb/kbQdMVmMf2Zk5IuD8ksk64/jtGU/IRX+6msTqj+PAoa0oPXjmLJUL6EDBaI3SlqzBqOJYptMbo=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr4800902oib.46.1662756240547; Fri, 09
 Sep 2022 13:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220901083438.105561-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220901083438.105561-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:43:49 -0400
Message-ID: <CADnq5_NAWok8spV=A6JKoRL+Cz3ACTtp8HGt5OA_c16zDOQr1A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove possible condition with no
 effect (if == else)
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

Applied.  Thanks!

Alex

On Thu, Sep 1, 2022 at 4:34 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Conditional statements have no effect to next process.So remove it.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2028
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> index e4fd540dec0f..8f1c0e12dd86 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> @@ -4663,10 +4663,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
>         } else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_uclk_fclk_and_stutter) {
>                 *MinPrefetchMode = 0;
>                 *MaxPrefetchMode = 0;
> -       } else if (AllowForPStateChangeOrStutterInVBlankFinal ==
> -                       dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
> -               *MinPrefetchMode = 0;
> -               *MaxPrefetchMode = 3;
>         } else {
>                 *MinPrefetchMode = 0;
>                 *MaxPrefetchMode = 3;
> --
> 2.20.1.7.g153144c
>
