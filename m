Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161037CCDC5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 22:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F21E10E328;
	Tue, 17 Oct 2023 20:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F210E328
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 20:19:03 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-57b5ef5b947so4009022eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 13:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697573943; x=1698178743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6YKzXb6RpcvAIE2KNseI2JNeCjjBedEHxdHH0ygsVs=;
 b=E6kmPMWVEI5zs2uNMkFd4jeBNe7c/teFAs8ZAETl13GWJ350ZzsuW94yWhCPWq01Gf
 elK4q3bao9BU0yzlzw3ek8SglMp+SthWUYile3Vow7nI6oZn9lRDSRVA9nOp+yUjah22
 DkCdpCLHst+XJiprX/iOfzbuDU9sDslFKCZbEOeCblyhp8ubjUmEI3zDfr7pl0gHWMhM
 VTZMQzJTBlfu7/Ujkn/IU6SPe//o2mdMTUX1+1N8JSrDJpCHIyH5Qqy60D+Z2dPQa/jF
 QD5GVwMIak0cTkxsbRQzP2zM1KO3McGahQbIpFBMMZeNMhw0f6L5/wNgt5eOMTWNpM9u
 V45g==
X-Gm-Message-State: AOJu0Yz+8Ohl1zcbABNVitRzMOilviGU70CM6WzZKHjle2Ir2/T1aG8Y
 AkUWzAhckDI8tmyBcfTcVg==
X-Google-Smtp-Source: AGHT+IGvqa31RZJ8r/SrafiLvgLLHO+b84rMNqNQHLDYchD24kgtHpxnm526SRtBWsxbafS8D89ukQ==
X-Received: by 2002:a4a:db86:0:b0:57e:1618:e700 with SMTP id
 s6-20020a4adb86000000b0057e1618e700mr3406874oou.7.1697573943076; 
 Tue, 17 Oct 2023 13:19:03 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f7-20020a4aeb07000000b0057bcbc23738sm372285ooj.17.2023.10.17.13.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 13:19:02 -0700 (PDT)
Received: (nullmailer pid 2681966 invoked by uid 1000);
 Tue, 17 Oct 2023 20:19:01 -0000
Date: Tue, 17 Oct 2023 15:19:01 -0500
From: Rob Herring <robh@kernel.org>
To: Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: display: mediatek: ovl: Modify
 rules for MT8195/MT8188
Message-ID: <169757394073.2681910.919376164260775888.robh@kernel.org>
References: <20231017064717.21616-1-shawn.sung@mediatek.com>
 <20231017064717.21616-4-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017064717.21616-4-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 17 Oct 2023 14:47:09 +0800, Hsiao Chien Sung wrote:
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,ovl.yaml      | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

