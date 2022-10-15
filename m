Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BAF5FFAEB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 17:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C3210E4E7;
	Sat, 15 Oct 2022 15:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D92110E4E7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 15:19:20 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id h24so5089621qta.7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lnInENwLybwBq+BGW9XxaGeEpI0F9YvSORSJTCPbgo=;
 b=tH2d2Fg2+rkIGI3g30tLYVACKy0d5S84UFuNYvLPX2jB7j1OU1s7hRZuvtaYaThLl+
 DVRX+YUAGvtLKD3k1P+nvbXARq1pZqxR+3jcthoC732WsTyygYmvBpNy0ogD83ytNN0o
 mct2GWnXik+WHSCVd8mXSryojXZ4tKde5eRzbSxYGRCMd7WGBsjihW5p/VfdA6h+QYSo
 4mvukBY/TajIL/LhoFP9fMi6Dxy7BP/AxIYoRIhBV1JvAf8GJMMLT3OPKk7DEsj8dD5r
 SgnimZMd+cNj6EcFymL/976s/bkyjFlv7uaNDY8zdHzGGO+rwOvEKXUZSXKZRSP79Gu/
 Do2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lnInENwLybwBq+BGW9XxaGeEpI0F9YvSORSJTCPbgo=;
 b=Z/PzuG2/jDN6ijugD5ihxtCE1sUBwNj3TArXuzDXJBBhI/7wL5PN9s6ovldVXxv3nf
 laHgc/LtUXAHr8Lv25Wctbdoc9HZkyRkN8NASWE5Y031ZWSv74czAa1LDuJbwVbysP8Q
 hetYdR5tytW7l/fLElErdljvhDjhjqj27mAStyqgXqR8wKwqeym46znvcwP8qE7KJFCo
 RA1W35tOuF2hIz18G47nVAjLXCh1UAHI8+3liHKGKot9oRX8b6wMn/VRcgkdrD2/K35t
 A0cOMMxVxtSHzNbtmEyHy5DiSXGk4ShDcgFrk/Phf6n+RMinz46U9rKPnHC4K5j9j8Ar
 ZE1A==
X-Gm-Message-State: ACrzQf1a/yXcBBxjF04jczqCNqJ2IZd3pIIiiSLn5qg3iH74xXPqyuJI
 UiAnkr2cSsmG//9wTifpjfpC2A==
X-Google-Smtp-Source: AMsMyM7SK8HhtjT3RcbC18eK6Wx6yTJR3yAlueJ7R3Fy7tkuEa2py8ydKmqXp8AC0za/7RsOMMmaNw==
X-Received: by 2002:a05:622a:13ce:b0:39c:c82a:4584 with SMTP id
 p14-20020a05622a13ce00b0039cc82a4584mr2279261qtk.150.1665847159474; 
 Sat, 15 Oct 2022 08:19:19 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08?
 ([2601:42:0:3450:9477:c2f0:ddea:ea08])
 by smtp.gmail.com with ESMTPSA id
 fz25-20020a05622a5a9900b00399ad646794sm4165768qtb.41.2022.10.15.08.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Oct 2022 08:19:18 -0700 (PDT)
Message-ID: <608e194f-3137-ceb7-f9e9-155010ce1afa@linaro.org>
Date: Sat, 15 Oct 2022 11:19:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Nandhini Srikandan <nandhini.srikandan@intel.com>,
 Rashmi A <rashmi.a@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Sumit Gupta <sumitg@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>
References: <20221014205104.2822159-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/10/2022 16:51, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
> 
> A meta-schema check for this is pending, so hopefully the last time to
> fix these.
> 
> Fix the indentation in intel,phy-thunderbay-emmc while we're here.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

