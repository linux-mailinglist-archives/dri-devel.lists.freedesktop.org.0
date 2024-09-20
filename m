Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80797D79E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B764410E843;
	Fri, 20 Sep 2024 15:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IrUjOr6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCC210E843
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:43:11 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f758f84dfbso17998751fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726846989; x=1727451789; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nB6QDO4zFJh38Jmp3QKlaNX1/zC3u5zuIlycDTEz+hU=;
 b=IrUjOr6KYjj9wpTG2gcaQuGylxCjI06N9Az33MC8wYOUysbGG76TJH9tQzM5hl1hGQ
 KJ6tSAg9ycHFRMExMJI99JUD9cEF3gASNHjgcFa9iqRyENSKxjiOxS7FImn+25Fu4N92
 Hkn/kdcp34V2AL/WCt8kojX7ZxurWsVd6JEqhnNMOPIsCmgEmvSY68bLJGv7+px9ssEk
 ZXQGiV91dB7WgxUHD4NRny+GQT77LSkhE84m722dcXnIenBg92qUXUY9pavF2e7jyDII
 6GJxa9KCaTxiTqY5M7vwRyyCnfjlTojVSjHOpj7VvFOEHm2vab6nBwCi4B+LOL0FC2Lp
 5O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726846989; x=1727451789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nB6QDO4zFJh38Jmp3QKlaNX1/zC3u5zuIlycDTEz+hU=;
 b=kkrXXm56SVr7hl18a9D0b1LbMWttLFOWf4aDty2ivXfCwAmN6RyXSlVNYzQSHiT/tr
 3quYWGq8jnP2ugZKSTE3s0VsXXn4rF82s162COWZ9gan4oiwrmTrpSwDPydl/u9Y1q2O
 8IcXovKDkn2XL62wKEIl5RWqlqKoj88yMBnw54hD2PReAE+iHrQPInZCoS6JmGWGNOPd
 XxpJUaBXafX2KcmdC0+VNK2brjocFZ92cAWD+/bwLLfST93XqkLfHPeib0OOHsHX+Vnh
 Klj2ueafG8QpVWcZAz69KWTCQ9bdTFPVTVCzVtM+CqDes7M17WZfM+U7viEX13jlsurH
 K9yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvuPuPjqJ+wtNkARMGgvunhqlbQ6pnVc6YUcVwSayqjc0Ru51RfPwPkDMNv7CVrhjdzDMg7tU3XL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKbdJd3E5tZWFsYmD166Z6FfpWezlPUsl8/D3hJCuQij3nQNX+
 QN5YhSFI7wzw41fLqBfiuxDKhZXEwg3HAi03yo+eBGhtOiuhWaXI0M+lSMB3DQM=
X-Google-Smtp-Source: AGHT+IGt3hzdLsraJIT7tPBdDR6V1G5Ibrb5NQ3oA1x+M+iY3xwn3oDKwJwRd7XJaET4QHzdhZythw==
X-Received: by 2002:a05:651c:212a:b0:2ef:2c91:502a with SMTP id
 38308e7fff4ca-2f7cb301268mr22401391fa.3.1726846988985; 
 Fri, 20 Sep 2024 08:43:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1e04sm19290631fa.28.2024.09.20.08.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 08:43:07 -0700 (PDT)
Date: Fri, 20 Sep 2024 18:43:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Microchip AC69T88A LVDS
 Display panel
Message-ID: <zognzunciriytm3uvoolxjsvu43v3m2lnctsz5swusnmm3aj2z@ag7zkncccdmf>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
 <20240919091548.430285-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919091548.430285-2-manikandan.m@microchip.com>
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

On Thu, Sep 19, 2024 at 02:45:48PM GMT, Manikandan Muralidharan wrote:
> Add support for Microchip AC69T88A 5 inch TFT LCD 800x480
> Display module with LVDS interface.The panel uses the Sitronix
> ST7262 800x480 Display driver

AC69T88A seems to be a module name, rather than a panel name. What is
the actual panel name present on this module?

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> changes in v2:
> - replace microchip,ac69t88a-lvds-panel with
> microchip,ac69t88a
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

-- 
With best wishes
Dmitry
