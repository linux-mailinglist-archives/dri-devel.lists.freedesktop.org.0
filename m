Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420777919A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D325910E363;
	Mon,  4 Sep 2023 14:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B7610E363
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:28:42 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so2057610a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693837721; x=1694442521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8iuZC33D0pi0SebavXErWmT+pulYIQNcxBHdRQcQik8=;
 b=dFkLVGPlSk8cxFpNY0VgwyhNvwAGIiMAVWtDyBK+1fGQnHjx9BFYWqf1BczBrTGuSF
 xnQdy/ACgW8L/bnbvX9kpC211iG/E0kyDs62Gw+u8RPtT6BMt+V0VjhxrfEp0ERODSLO
 15zyTFqhypfBpF7X1CI1G/Wi5kMmZfC9Ds4cvALWX5imbG0RCD4wG4iyZSb2EkV/3Olf
 ojU7UEseTj5aqsEhPyATr5W2GO+1IOO+BsNjWwVm9l0XTOjdsC296FjXKtGeW1eVeDZ0
 32kYD+P2nAyFKdrLQtVUCNvI7jwpEZVt8texvKzto6STBAQU8DQutaggGhRVLTB/VCUK
 IBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693837721; x=1694442521;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8iuZC33D0pi0SebavXErWmT+pulYIQNcxBHdRQcQik8=;
 b=CVmlGY1WeHoHU26lOkTuAV16wFIYijEvER3kwbqrTcV6fWVwHg/5qPZMDSaqKd5Q7u
 InfY/0+mJdaYFOfeIyeg//Ktoc41fI82SeBpQt9Nz+XA8mCwM4glcPP0aGMiORFSyJCn
 VhCebDHBBNRGojCuhO5L5z7EeSt4FKuHWmct+fJHB4ioVbq6LvaFFBaoHo5yjOeTv5+W
 /jjM4zpBUUJX2s4QQxnN1HMrB1TZ1grL3OocO6XSmzAgg664qcYq+1w6DTfmJpU0/Xc/
 lpW40ih6/tbCVRmQFGfMIAjXme8aooG5m4DE323aic9j4+Wi4U+znHAyjT09/MGTYZXl
 1Z4Q==
X-Gm-Message-State: AOJu0YzoN88nVsvbfKSjBr3TrsavR0/aRCEkKujJFEg0aBOwRf2aAlTS
 05uFquXP1xrok/F4I5oU0t0=
X-Google-Smtp-Source: AGHT+IFskoTClGeTBvqu3n1vQK3DtrW+gFUuQJHiyBXfyIZHMy7jeXQO/PenDGkfjW4bANcjhDq1CQ==
X-Received: by 2002:aa7:d407:0:b0:52a:3ee9:a786 with SMTP id
 z7-20020aa7d407000000b0052a3ee9a786mr6642621edq.26.1693837720880; 
 Mon, 04 Sep 2023 07:28:40 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:e0a4:c719:5e8d:3b55?
 ([2a02:908:8b3:1840:e0a4:c719:5e8d:3b55])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056402148b00b00529fa63ef6fsm5930777edv.57.2023.09.04.07.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 07:28:40 -0700 (PDT)
Message-ID: <53ee3d14-05f4-981f-26d2-ef9ef6b3a61b@gmail.com>
Date: Mon, 4 Sep 2023 16:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] drm/bridge: samsung-dsim: calculate porches in Hz
To: Michael Tretter <m.tretter@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-5-b39716db6b7a@pengutronix.de>
Content-Language: en-US
From: Maxim Schwalm <maxim.schwalm@gmail.com>
In-Reply-To: <20230818-samsung-dsim-v1-5-b39716db6b7a@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 28.08.23 17:59, Michael Tretter wrote:
> Calculating the byte_clk in kHz is imprecise for a hs_clock of 55687500
> Hz, which may be used with a pixel clock of 74.25 MHz with mode
> 1920x1080-30.
> 
> Fix the calculation by using HZ instead of kHZ.
> 
> This requires to change the type to u64 to prevent overflows of the
> integer type.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 459be953be55..eb7aca2b9ab7 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -973,10 +973,12 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
>  	u32 reg;
>  
>  	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
> -		int hfp = DIV_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk_khz, m->clock);
> -		int hbp = DIV_ROUND_UP((m->htotal - m->hsync_end) * byte_clk_khz, m->clock);
> -		int hsa = DIV_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk_khz, m->clock);
> +		u64 byte_clk = dsi->hs_clock / 8;
> +		u64 pix_clk = m->clock * 1000;
> +
> +		int hfp = DIV64_U64_ROUND_UP((m->hsync_start - m->hdisplay) * byte_clk, pix_clk);
> +		int hbp = DIV64_U64_ROUND_UP((m->htotal - m->hsync_end) * byte_clk, pix_clk);
> +		int hsa = DIV64_U64_ROUND_UP((m->hsync_end - m->hsync_start) * byte_clk, pix_clk);

Wouldn't it make sense to use the videomode structure here?

>  
>  		/* remove packet overhead when possible */
>  		hfp = max(hfp - 6, 0);
> 

Best regards,
Maxim
