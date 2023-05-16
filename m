Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427AF704649
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901BA10E304;
	Tue, 16 May 2023 07:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721E10E304
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:26:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso68453815e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684222000; x=1686814000;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hz+au+qUB6SxKi+qykB673rTVgNMoB1frUgWHg+rsLg=;
 b=MNrp1H63iaoBI8hbDN1m3mIPv0cIdy640o+Nh2IunYwS5OkIQ1Abz9cB91TmepJ8gU
 nyC0lBHy3hhnQZu7CeIsLx1CL00K+Vzhe9nSx+I25bctVFh4nOCJdT0d9zGVMRnL+8cT
 c5mebiOmX0zt11C13KJZGR97qj7AnwojHgLQpV2jprqX5VzZo3XJYwvc5UVMO3sdoZOz
 f22qHBW0AEMIfeEN3p1Gq6ABxoKAREGIhj5+cYgKW8I3BkZcU/kwowkWAsDa9N9rzwGS
 RGJPn/zgVrq20hCdUetBEQ4sj/PdXTl98WNuR/JcxWYXGClicsRdq2PLgsITsTDbA0JK
 VrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684222000; x=1686814000;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hz+au+qUB6SxKi+qykB673rTVgNMoB1frUgWHg+rsLg=;
 b=P3udUCQ7qwXD/xP5YNwhA7YN4m56RKRfglC5IMY79ufAHMGNZclvAa4VnRLLQo2ash
 g+uNvEZ3lgddRWGXCsXkufoPFfkeaU+QC8sQmKmjiFog85Z1gylftO23QCRhnjslrfOc
 IsimNpLQBIJ9OJK5X/A6YSWB8d0koS7mhE31ngwW7csPuPQMhS2ePNyW6qeVaHXtIXUN
 AXFc5LGDhiOmUdwCMg7AdZQHmYAOQj5KrMoOO6yOg6/WtxoQTUyIAkZPqA4/oNh6K18h
 +w/lTJQFJrWqIxs61u+EBaUJ0AdS8vkG76vTg1WF9W5xkkJX7ZV5TISEVV7l0FlIcLB1
 9Drw==
X-Gm-Message-State: AC+VfDz3E6dHcTHWISa5rbFjo+1KlheY8V0aBkJUnckxlo9g9lB3tCKl
 eBaDq3HRT1eWR5ZxwzKTrgEgieorPcus8DZrCajptg==
X-Google-Smtp-Source: ACHHUZ7D+Y/jBCKwmWM3hC8D664oReRitr6GThGsoDF5GvDJXGJ0eNddIgbv6jqwlNC3vde62mMtmg==
X-Received: by 2002:adf:f990:0:b0:307:c0c4:109a with SMTP id
 f16-20020adff990000000b00307c0c4109amr13177326wrr.6.1684221999997; 
 Tue, 16 May 2023 00:26:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adfe603000000b002e5f6f8fc4fsm1499806wrm.100.2023.05.16.00.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:26:39 -0700 (PDT)
Message-ID: <6bb1586e-b141-5bbc-8206-d72a9e8d3596@linaro.org>
Date: Tue, 16 May 2023 09:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] drm/bridge: tc358768: remove unneeded semicolon
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230515184408.9421-1-francesco@dolcini.it>
Organization: Linaro Developer Services
In-Reply-To: <20230515184408.9421-1-francesco@dolcini.it>
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 20:44, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Remove unneeded stray semicolon.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202305152341.oiSjRpv6-lkp@intel.com/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>   drivers/gpu/drm/bridge/tc358768.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 03c7e82e4109..97ae3a9c90da 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -952,7 +952,7 @@ tc358768_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   	case 24:
>   		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
>   		break;
> -	};
> +	}
>   
>   	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
