Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B8A54F7A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6712C10E839;
	Thu,  6 Mar 2025 15:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HOlQr4y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22310E839
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:48:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so557834f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741276109; x=1741880909; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMlvZVmGmfe9jET5j6AVC1Iu+TuVwvxBrNk+geFYLL4=;
 b=HOlQr4y5gyifAjkATvoFRufspudpOQWq58jSy99Ti2XSr8ddpV6LM/fHrbPsNcMQIY
 LDjaPjkTteDU6/KzEWHGrT8Xdq+En629UO3P+78bLk3gXSQKGqWVP4Jdvss3F0JV/Rw7
 TIYubn3zXkBR/gRAkQf29m5AvQctkkLnkmYxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741276109; x=1741880909;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMlvZVmGmfe9jET5j6AVC1Iu+TuVwvxBrNk+geFYLL4=;
 b=jAgX5588ZTYvqh8lZueSBUCyytAp0ODPG/npmlornWN/RqOQqpB+wFdzGJeamdzMZt
 vIazdSQfTjgTgy6j3HOeNGT3W8qYsLVr44kXtp1KsCDZCOUlFbEFxYgTxv2orlttbc8G
 /KgAUx5G9UU3y6C0W5frFrqaBXiwr4tB4eF+qkKIzbaW24XJrajmA2thjefeVrBb+ahp
 EktQFrxUw+LukH/aEkCJP0Chua3MBiw8WIGCjCZ6wZyi0phjEiuxlxEvitZ8Vs/0QnG8
 6+jNA5qD072f2/RU15x09g8uzC45CRrmK6cEzwjltm8rV8SKYVAgSMGt6dep0U+JV200
 W64g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2PMoEWXlxStu3J2asFtuIyfwxFGmgPZcEE1k+V3R1sypLigpmpVpUjv/s1zKgO3VR4DQS7U7SnhQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0sD2uRg0LjlSv14xxKjqc3zFsY4INk6C/xM/8WY8TKAKSuzgd
 aeAhGhiM1dmNt+5x9tcmmolKlI/OcpZtaFGg1ijKIksxni+WgjsAUD4W7w0E+n4=
X-Gm-Gg: ASbGncuQCEVVP8jGr4zztMbwVahWBcbDLW4EmYlWVrfZLR5RoPmQb3kGskmGw9T3UVM
 nj5nhxYlCCisNS1XM6b94txVW4L8OVgBHCo3j23m+IWpEKq2T52Lq4spqtn2Kb7rBfo5sGWBVOU
 GetqRij4S47KQEq39C6XfLVdSKu3oPGiUcjpJx96mAPKZvgLxUxF62nRw+w10X68TzC4sNqfPvY
 pU18opn5JkEgJTOMaE9MH6vDvPpYadzGmCDKXisWHY4x+ZkcmTkOnILaJzuIKR/D8UiiO6XU8xD
 cLGB/AaZVz01YF4ufWOAUkwWxs221LLGurAOrwYykWz6USuIYAW/y+Br
X-Google-Smtp-Source: AGHT+IFtOXpx6jiep5HwmWGtbHwDrBT4bMHCGPI0ael0tguvlAKpS/nUPea89z2t6vc5g9hpe7v3ew==
X-Received: by 2002:a05:6000:18a8:b0:38a:4184:14ec with SMTP id
 ffacd0b85a97d-391296d3cefmr3990555f8f.1.1741276107354; 
 Thu, 06 Mar 2025 07:48:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c10437dsm2433714f8f.99.2025.03.06.07.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 07:48:26 -0800 (PST)
Date: Thu, 6 Mar 2025 16:48:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 14/16] drm/bridge: tc358768: Stop disabling when
 failing to enable
Message-ID: <Z8nDyNVQ5p007Mw6@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-14-aacf461d2157@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-bridge-connector-v5-14-aacf461d2157@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 04, 2025 at 12:10:57PM +0100, Maxime Ripard wrote:
> The tc358768 bridge driver, if enabling it fails, tries to disable it.
> This is pretty uncommon in bridge drivers, and also stands in the way
> for further reworks.
> 
> Worse, since pre_enable and enable aren't expected to fail, disable and
> post_disable might be called twice: once to handle the failure, and once
> to actually disable the bridge.
> 
> Since post_disable uses regulators and clocks, this would lead to enable
> count imbalances.
> 
> In order to prevent that imbalance, and to allow further reworks, let's
> drop the calls to disable and post_disable, but keep the warning to let
> users know about what's going on.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Yeah proper way to clear these would be like any other link failure:
- Launch async worker to do a bridge reset with the fancy new helper.
- Set the link-status attribute if you can't automatically fix it and let
  userspace sort out the mess.

Maybe we need to improve the docs a bit more?
-Sima

> ---
>  drivers/gpu/drm/bridge/tc358768.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6b65ba8aed86012bc0f464bd5ee44325dae677c6 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -1075,15 +1075,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>  	val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
>  	val |= TC358768_DSI_CONTROL_DIS_MODE; /* DSI mode */
>  	tc358768_write(priv, TC358768_DSI_CONFW, val);
>  
>  	ret = tc358768_clear_error(priv);
> -	if (ret) {
> +	if (ret)
>  		dev_err(dev, "Bridge pre_enable failed: %d\n", ret);
> -		tc358768_bridge_disable(bridge);
> -		tc358768_bridge_post_disable(bridge);
> -	}
>  }
>  
>  static void tc358768_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
> @@ -1099,15 +1096,12 @@ static void tc358768_bridge_enable(struct drm_bridge *bridge)
>  
>  	/* set PP_en */
>  	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(6), BIT(6));
>  
>  	ret = tc358768_clear_error(priv);
> -	if (ret) {
> +	if (ret)
>  		dev_err(priv->dev, "Bridge enable failed: %d\n", ret);
> -		tc358768_bridge_disable(bridge);
> -		tc358768_bridge_post_disable(bridge);
> -	}
>  }
>  
>  #define MAX_INPUT_SEL_FORMATS	1
>  
>  static u32 *
> 
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
