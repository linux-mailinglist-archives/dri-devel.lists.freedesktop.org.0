Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3256AA66
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 20:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984ED11B848;
	Thu,  7 Jul 2022 18:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0011E11B6CE;
 Thu,  7 Jul 2022 18:22:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id j22so7604322ejs.2;
 Thu, 07 Jul 2022 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6ncolguiQ+DPHRmzlhAw1z57F0HnokCJKSQgzd3UQs=;
 b=ohjqe3h1JnbCwaBEIZ2d69QR8cz52UUygEFiOvnMYGlCpXpnR1Qmj4YvAuvK0EJiWY
 4FGWd1fhgqJ8Hh/fZ0Up/Iu7IjXoofz/xMywSFCvKE8NSlPntfPXJZXlicN6Xw2E9/6l
 uFb+mi5Dacf9U9diBw77SQKNmaPSR3msiqmJY1fQA6skgYg/D7VFo/r7b52ybuRrtb1I
 fEii4Ih35R9wz1QXi0i6uzhivzSvYEXvDYNQmTAK/sOTg+IckYEmgXnTc9rTEml/aFgo
 y6NemwFJTWIUgYrRhYMmXfajWOACfbStbqrgZEYPmoeAnLoWh1oCHM4dWsKrmRJJnhxm
 9FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6ncolguiQ+DPHRmzlhAw1z57F0HnokCJKSQgzd3UQs=;
 b=CLTBI8GtZOjsr8v0A5iZFqUa3jyyBpOoMVi4L4K3qPEwODlgXbvr9J0HYLOIyTle0E
 Mb5KHUtn4P5kn/Hj4wwI/FpWVmE21+vLoMisVTH8Z7Wk6LfwkA4aNpIWoZ7voxrtUOcB
 tn02V06daY+iU2y13ICuFPnkAST3x5zBotsDZw4JJhpZkt0d/KzZHIWBCFRObA+IyROg
 fxX32A5cxhEVprvmT7d/EkRhs4hBBRfS8/X4B3o0NsXMywx0UWSzuiZEOyD3vW/qEpIN
 IAKZA/GE+0nAJmJsgqVPgfUakzTwjPQ0MKF4wBbWWqXMJE7CZMdCrfhrXJQ7gXBw8ONe
 jBRA==
X-Gm-Message-State: AJIora8d8SAmSYjbI/zeQiHaxBl+2wzwCkVBEIws74QWoW+zmNRXtq4I
 0Z7SlB06fAijqzrUWHHYymZzPSh6LF6vF8bi/Yc=
X-Google-Smtp-Source: AGRyM1vFFoUfixEhOUfl68/WDDiWcPlIS3gYGV84R38m2q33oIwZHt0dcJvwcUsnsfbSVJdNmTunjpQ6rR123O2EcU0=
X-Received: by 2002:a17:907:a40f:b0:726:a8f5:1031 with SMTP id
 sg15-20020a170907a40f00b00726a8f51031mr46947213ejc.185.1657218152576; Thu, 07
 Jul 2022 11:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220706063951.54122-1-hbut_tan@163.com>
In-Reply-To: <20220706063951.54122-1-hbut_tan@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Jul 2022 14:22:20 -0400
Message-ID: <CADnq5_NpXcua54cSeSGaG2X_afcvoGswKgSb=Gysr5gpoT0AHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsigned expression compared with
 zero
To: Zhongjun Tan <hbut_tan@163.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Zhongjun Tan <tanzhongjun@coolpad.com>,
 Dave Airlie <airlied@linux.ie>, cai.huoqing@linux.dev,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 6, 2022 at 3:41 AM Zhongjun Tan <hbut_tan@163.com> wrote:
>
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
>
> Fix unsigned expression compared with zero
>
> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> index 548cdef8a8ad..21e4af38b8c1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> @@ -244,8 +244,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
>         bool req128_c = false;
>         bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
>         bool surf_vert = (pipe_src_param->source_scan == dm_vert);
> -       unsigned int log2_swath_height_l = 0;
> -       unsigned int log2_swath_height_c = 0;
> +       int log2_swath_height_l = 0;
> +       int log2_swath_height_c = 0;

@Wentland, Harry Can you comment on the required range needed for
these integers?  Maybe it would be better to just drop the comparisons
with 0.

Alex

>         unsigned int detile_buf_size_in_bytes = mode_lib->ip.det_buffer_size_kbytes * 1024;
>
>         full_swath_bytes_packed_l = rq_param->misc.rq_l.full_swath_bytes;
> --
> 2.29.0
>
