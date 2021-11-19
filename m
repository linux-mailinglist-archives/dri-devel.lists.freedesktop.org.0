Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7E457244
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 16:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13C06ED7E;
	Fri, 19 Nov 2021 15:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1536ED29
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 15:59:46 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u18so18953271wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhxuWkPI7WSwy9/xbqGbDSYuHklsrt0Nk6zcSCvllc4=;
 b=TwhyPU09oneH/AU/9GXFKzHVqir73+1g3JpQ9AFfyha+N8H0ChgooRv+GQYT1p1Th2
 I2VqA+hxBvt7DZKJEV2DX4Jy0CO/AJh0pE2xdxF1hTDo9ZsboQ5I6BnwhBXgrhNuXk9h
 0ndxoqOooybtnf4H5QOINzsLesl4fQqWHv9D1X22BcwfAfwmBAhPNVh6qe93jahCH7rB
 iFleYESeWPaUdt3sk7g4GwX5xRwmGBGn6NORWACU4HDsEl1DRDYOK8ToObXGuW6Imbuh
 cXN8LYgVYHIIzP8iR4WGYQJrlXRABNF5cajy6uUOcOR+JVTkqM3V0onTZ/+VJ3mUflTV
 h/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhxuWkPI7WSwy9/xbqGbDSYuHklsrt0Nk6zcSCvllc4=;
 b=6Unkbcn920tXkHMtMcY5nt4nZ19lriNfHJ6DON8vNXUjzlK1GSzymrgD5TeedNcDsn
 GsufqA2dWr4Sp0v08XdL0tyIN3UVkeEkirZ2VYzryfUdOQRPZtitiCLTqxC1nPv4WTGb
 ScOv+ueCSNM7yp9Sajn76hCcLvoARzT3JjDrP2z4uk81MrndLlAWHkJ7n+eWMQKAapXy
 /7daoOrpDQhY52rkUIcR1JVBrByYmv+C67K5lJsZhPK7D1tOo/S/qpziKeJHpmiQ3r0c
 F8BvqhJv7cvbH6MImOYPfzE3z3w+9G8h2KxSjOoNuPFwEZvqWx5JM8Llnz3nKjuV3P1s
 AacA==
X-Gm-Message-State: AOAM533mMS7OUIRcdRqlePKX0ge4Mabnx/rYN5dKr8JdQ6tcIov0SlFN
 P6FTyQtZ9h7cP9rgKIrnCbE=
X-Google-Smtp-Source: ABdhPJxqkheLx99/Jc54Crfq7FUPzLztWfwJvGcdI4VBHYB6zr0D2Dj4bZFCyE2taCdh/brhM7QYfg==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr8663541wry.66.1637337584924; 
 Fri, 19 Nov 2021 07:59:44 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id n184sm12038875wme.2.2021.11.19.07.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 07:59:44 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/sun4i: remove no need type conversion to bool
Date: Fri, 19 Nov 2021 16:59:43 +0100
Message-ID: <4355729.LvFx2qVVIh@kista>
In-Reply-To: <20211116021449.27503-1-bernard@vivo.com>
References: <20211116021449.27503-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bernard!

Dne torek, 16. november 2021 ob 03:14:49 CET je Bernard Zhao napisal(a):
> This change is to cleanup the code a bit.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/
sun4i/sun4i_hdmi_tmds_clk.c
> index fbf7da9d9592..25e6f85fed0b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> @@ -49,7 +49,7 @@ static unsigned long sun4i_tmds_calc_divider(unsigned long 
rate,
>  			    (rate - tmp_rate) < (rate - best_rate)) 
{
>  				best_rate = tmp_rate;
>  				best_m = m;
> -				is_double = (d == 2) ? true : 
false;
> +				is_double = (d == 2);
>  			}
>  		}
>  	}
> -- 
> 2.33.1
> 
> 


