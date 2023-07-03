Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC518745609
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 09:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2413210E0AA;
	Mon,  3 Jul 2023 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F57A10E0AA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 07:27:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-314172bb818so4737158f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688369241; x=1690961241;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LaUDv41Lj6tPc3twKgmm241mL8xwyuuOB3cCpuAbnX0=;
 b=fenFtApQJ0cftWkW8XYw2UOOv1LrXDXfi5NsQLHKNAti/6N0iFwUcMnE0SDhQNqYj4
 Wsx+FhM6fWWAIbhYDXtsSZ49QT1VvlVxweU4ghPVNLNT1HTwmcCS/c+wma755PIO0pB0
 M0bKVPWYwyE8BWqg0SSK0URjuXPFVuEbDBJ1VWlD6ZQ42nYHoO5iD5jfh5i6hui2HNMD
 Ab1gofrDP9asVKVNYy2YaAUJXqsXqy0vuMy4D0mCZXfYXs9TK0WsDzu7IUcPoKLRpkM/
 Eoh/IFRUAmcFU71lIw/cuBRAy6n2hdyzCxRA7S35USaVUPvhaWgL0jteE64EnY+P2rjK
 ezMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688369241; x=1690961241;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LaUDv41Lj6tPc3twKgmm241mL8xwyuuOB3cCpuAbnX0=;
 b=mCtqaMZq0q1ly5BQzQWpesuHaoFn9a3aLkdmZGBrveKLdj71T4YMm4mUjCs0lPK36q
 vwOpF2ROV+XhQkzq1BIcOqjBNUj5+abrFMhsQxGL/ffzMOKa9qS1W5VoxpO6458e0JmD
 LnP6wKR5js3fKJsWdycUCuiCFLoplboi+rnq+F52znCmJJrREi1nGeUmqpHYpJ/mu/Pz
 2vCvyxE01amKBmoDeMES7XfKhXlnepcu8wrOUWV+IKiQyUEFbkk2IBtAoppsU+PJTjLb
 Csv02XqlBSWklb05ytlDn01O4JBBAnEkNIrIBL48Lw74tRlFJDjRznWEV/rqJcaRtvSH
 4fDQ==
X-Gm-Message-State: ABy/qLZAVQQODL6jkJ8c+WhjuLyJJ9x4Yn1sAdERofvO40sFUS8cYmNj
 WavTbIxUuKP2gy+JsM1WOQMSQA==
X-Google-Smtp-Source: APBJJlHI9l4nvz7Mnm87EpJGvN/Ti6mfwOzeLttV/cahaXDlIFnX5Nd+cT8L9zCiM3xy/Y8Hj3CR0w==
X-Received: by 2002:adf:e64e:0:b0:314:3856:8d99 with SMTP id
 b14-20020adfe64e000000b0031438568d99mr1306949wrn.44.1688369241039; 
 Mon, 03 Jul 2023 00:27:21 -0700 (PDT)
Received: from [192.168.7.21] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d6611000000b003140fff4f75sm12402411wru.17.2023.07.03.00.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 00:27:20 -0700 (PDT)
Message-ID: <27b5e807-72e2-4709-de4b-90e025516fd5@linaro.org>
Date: Mon, 3 Jul 2023 09:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Drain command transfer FIFO
 before transfer
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20230615201511.565923-1-marex@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <20230615201511.565923-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2023 22:15, Marek Vasut wrote:
> Wait until the command transfer FIFO is empty before loading in the next
> command. The previous behavior where the code waited until command transfer
> FIFO was not full suffered from transfer corruption, where the last command
> in the FIFO could be overwritten in case the FIFO indicates not full, but
> also does not have enough space to store another transfer yet.
> 

I think you should add a Fixes tag since it solves a bug.

Neil

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 043b8109e64aa..9b7a00bafeaaa 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1009,7 +1009,7 @@ static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
>   	do {
>   		u32 reg = samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
>   
> -		if (!(reg & DSIM_SFR_HEADER_FULL))
> +		if (reg & DSIM_SFR_HEADER_EMPTY)
>   			return 0;
>   
>   		if (!cond_resched())

