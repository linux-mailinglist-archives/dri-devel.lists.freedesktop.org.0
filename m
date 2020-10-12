Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F028C91C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F5E6E8A0;
	Tue, 13 Oct 2020 07:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB096E439
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 12:07:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e23so9946505wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 05:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyLQqnsPp2QoVdD4Le8oIZ3NiV3JMjhazdAHbl+D9wU=;
 b=ekcRy/FNerrYq8mtZClP73dij3+euY9uxtnkcEGlMlV8MZqFJ2h2HlCRPN7vUpmD+E
 E3EaWddH3zQ5nNyp0FYQrcx3YrR9+HFIzMqwRQNz2j2t2MciWm3Q13tYSlL1u7M9xMSW
 /baaGrFZEiYjDOWq7ANLWzMqDORmEK6+SVqOlO7SDgGlFdUeP5xRztTpvHEp1wAdjAKO
 gkhjI3bbztIsQnnhJL/LcdQzZqfokPcKc8sTB/1egrWEA/y+FtRQZB9cHB8rqOT5t/yp
 txfGLiAcCcb2YklH61lAcf65+RJDa7P8NqcBfPPTFEfaXHED2Bo6//ktag1HY8LIUmYE
 42uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyLQqnsPp2QoVdD4Le8oIZ3NiV3JMjhazdAHbl+D9wU=;
 b=n7d8xxzshIeQHzFUDzxtXUxlikzM3wvJ8v6kBUmuLrjZzO9qGQbdsYQTuESBi1hUIR
 0NFI0UwpCV6qb+vhwnVUJNOJ75PwwjJHsrYrkwToXUOmkDK39clBUONzUi10wC3ie91c
 67lAVmiDW4nzsOp1HCX7j7Ok7I/gIlmMGhHQqgtY83PkL2vKdeyZJWhLlN5YS/F1+g8R
 UwHkFAKDpHyxvtbkEQ3jjWi1YqnwvU/xJTtwT5ElMVrKhOGR+IynAm8Hsyc165Qanby4
 S6VHdGF7YhpTjzpf/yeMg9AqKX9SSTcvCZu3g9n+JFyK2bzxsvqMFw0/jybESPV7isBF
 XhPw==
X-Gm-Message-State: AOAM533jN9k/2HwI0c9y83lThCudPtVxRPE14kVU2wfLW8YS+Zc11SKu
 rT+Gay4Xw9lq2OPLcTtV6Q4=
X-Google-Smtp-Source: ABdhPJwUfj7Av4Hl9jD8LHoYMEWgeUV0AjRwanMiqDbt+5CmZuFGRVLDSBGWKu5ymbYpQDPIw0414w==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr6322560wml.92.1602504461204; 
 Mon, 12 Oct 2020 05:07:41 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id q4sm24238151wru.65.2020.10.12.05.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:07:40 -0700 (PDT)
Date: Mon, 12 Oct 2020 17:07:30 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 1/2] Revert "drm/mediatek: dsi: Fix scrolling of
 panel with small hfp or hbp"
Message-ID: <20201012170730.582d4b96@a-VirtualBox>
In-Reply-To: <20201010070910.11294-2-jitao.shi@mediatek.com>
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
 <20201010070910.11294-2-jitao.shi@mediatek.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao,

On Sat, 10 Oct 2020 15:09:09 +0800
Jitao Shi <jitao.shi@mediatek.com> wrote:

> This reverts commit 35bf948f1edbf507f6e57e0879fa6ea36d2d2930.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c index 80b7a082e874..16fd99dcdacf
> 100644 --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -466,13 +466,14 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) horizontal_sync_active_byte = (vm->hsync_len *
> dsi_tmp_buf_bpp - 10); 
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -		horizontal_backporch_byte = vm->hback_porch *
> dsi_tmp_buf_bpp;
> +		horizontal_backporch_byte =
> +			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
>  	else
> -		horizontal_backporch_byte = (vm->hback_porch +
> vm->hsync_len) *
> -					    dsi_tmp_buf_bpp;
> +		horizontal_backporch_byte = ((vm->hback_porch +
> vm->hsync_len) *
> +			dsi_tmp_buf_bpp - 10);
>  
>  	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> -			  timing->da_hs_zero + timing->da_hs_exit;
> +			  timing->da_hs_zero + timing->da_hs_exit +
> 3; 
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
>  		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >

Reviewed-by: Bilal Wasim <bilal.wasim@imgtec.com>
Tested-by: Bilal Wasim <bilal.wasim@imgtec.com>

Thanks,
Bilal
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
