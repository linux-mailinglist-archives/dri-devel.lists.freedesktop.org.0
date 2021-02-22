Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF53221A2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 22:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170C86E213;
	Mon, 22 Feb 2021 21:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DEB6E0F0;
 Mon, 22 Feb 2021 21:41:40 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 18so15581565oiz.7;
 Mon, 22 Feb 2021 13:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gFU4xCY1lmnRTtgwAHd72b7gU2GJilKA5WuHpwi22SA=;
 b=N1FTYldZeoOzK0vtgLm7rTW/SrZeksU0UMK+hNfUjrGwLWkzgnrjW+J8221K8R/qAk
 P1RtcqMpFdUPPWRZ1qGzfLb/fllFVkWpv456DO/kEO7ByFRVthMhw4nErdSm5g1kGQ6J
 xtj7++SXbvzz+akwgRWz0RXcQqbESbDoza4lLvwf/fr+dbRpw22RXPQIcBtS34oD06YZ
 q4iNK4WJJJvHtuuHqmj+aTFS6Xr/D5QqaDXaZLV4w+RcaxLOIMnnnOE9c8YBHle77u7x
 7rz43vrISGWowpXNo0iAUQQSjESNwXYiCtdThfJInG6LQNIz+CsfS/WjKmDU6NkRnER7
 hS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFU4xCY1lmnRTtgwAHd72b7gU2GJilKA5WuHpwi22SA=;
 b=PEIKs7n9fXZBVenEvezn60RD3r62xfiCdBB9eiNavAmHgsjBLUHbDl+U4va2qafpAu
 Y8+9ijdI3qMKU8ORWRrmCW2tosRRE79x9P+nQgB9GLSNmPi6TgexKPIdTre2/KyIFMal
 jm311O0Os+A5rZBop+gLXfa5NtPyapFg4/hkM5q1VPFA5Exgydy2ql5d1ze0zoZuXtER
 b+jeY5yEgQE5V/yCnMcdFVTQ1fJieChlf9bK1G7MLIsmprITcy5v6/Qnd9GP1lmoV0Y6
 mEZMCfTQLLoRZT2CsBs8fCgmz8lPl3vftz1yF2dRLWsR0hpJnWC0hnPPLCOjSpkfVLEg
 F8aQ==
X-Gm-Message-State: AOAM533XLbQjVmyYzGw5m7BxEJ0KIMl53Zo+HB2CBVgO2Gq5eMUEHH+4
 ZrNlFR8fo/2U1SHqLfASeMLmKg2llGm2MA4UFL8=
X-Google-Smtp-Source: ABdhPJw32ZEogvCTmpB15sh+Ll3hSPvV8Sc5iPF1lqUkxoZjhcorelbZg6kdvkFnrG3d+38kCN+sLXkRallvCqbxDB0=
X-Received: by 2002:aca:fccb:: with SMTP id a194mr7835630oii.5.1614030099987; 
 Mon, 22 Feb 2021 13:41:39 -0800 (PST)
MIME-Version: 1.0
References: <1613805352-12397-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1613805352-12397-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Feb 2021 16:41:28 -0500
Message-ID: <CADnq5_OdQ8ZAV+sMFEbNJeoBXca5i87-T8_rSpzqiK-D=2Kz+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display/dc/core/dc_link_ddc: Remove unnecessary
 conversion to bool
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Feb 20, 2021 at 2:16 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c:544:34-39: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> index c5936e0..45a59cf 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> @@ -541,7 +541,7 @@ bool dal_ddc_service_query_ddc_data(
>                         /* should not set mot (middle of transaction) to 0
>                          * if there are pending read payloads
>                          */
> -                       payload.mot = read_size == 0 ? false : true;
> +                       payload.mot = !(read_size == 0);
>                         payload.length = write_size;
>                         payload.data = write_buf;
>
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
