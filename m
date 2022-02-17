Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C54B9B53
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A17810EB4D;
	Thu, 17 Feb 2022 08:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBA510EB4D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:43:08 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id k25so5421737ejp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IxAqI07yw/RNtyVS6JIMaXpsffDUL/C6yQlcRg0URz4=;
 b=WTpzBBIHi5ldRaPXMT4VC+xH5lP++eBMKr/IQdA23gUiLChoaVXOW/v3hjWFPATDeI
 mhUtJLxSvkIwGBmfrcBafiIHqE9+ZbWIuP4rVsPTbYx817TRNmU72sTzDQEPVbo2vueG
 NcE/+lW+veUn+vluVVWlhDHROLq+/6/KDGeRvJOHZKJQlNIciqVaX5RNedLGtB7XYpni
 K+H/R4Cukah1/XzbYEeNTmd0kdL2BMHYjlfrsBYwpR2vUYL3l7j52AnHcCM3JATkovp7
 /haEik7IvtvIRJaQU0cXd/LuqOg8+8jXhfCFnldw//NupPWjtVipY2wWc41qRUSGY0of
 p9CA==
X-Gm-Message-State: AOAM531myFelDO80YH1NeVEyetwgikquDwQ/r41E6J8OxbnxiPGuK9Xe
 J3aAWeh0LpXYOW4p/7sKGG8=
X-Google-Smtp-Source: ABdhPJz1JKK35XckyAQsD3r5VBtAh9SirVsICqcP9TUKLaKx2lNl05HnpKC+PF3FVcGYT6qHknUJUg==
X-Received: by 2002:a17:906:bf1:b0:6cd:186:9ffa with SMTP id
 z17-20020a1709060bf100b006cd01869ffamr1482647ejg.506.1645087386473; 
 Thu, 17 Feb 2022 00:43:06 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.googlemail.com with ESMTPSA id z8sm917438ejc.151.2022.02.17.00.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 00:43:05 -0800 (PST)
Message-ID: <cdad7f26-dd4f-4120-c88a-b1cbbb9a56d7@kernel.org>
Date: Thu, 17 Feb 2022 09:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 3/3] MAINTAINERS: add maintainers for DRM LSDC driver
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 Li Yi <liyi@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>
References: <20220216181712.1493400-1-15330273260@189.cn>
 <20220216181712.1493400-4-15330273260@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220216181712.1493400-4-15330273260@189.cn>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/02/2022 19:17, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
> 
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..3f5e13a6358b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6453,6 +6453,15 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/lima/
>  F:	include/uapi/drm/lima_drm.h
>  
> +DRM DRIVERS FOR LOONGSON
> +M:	Sui Jingfeng <suijingfeng@loongson.cn>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +W:	https://www.loongson.cn/
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/lsdc/
> +F:	Documentation/devicetree/bindings/display/loongson/
> +

Did you run checkpatch?


Best regards,
Krzysztof
