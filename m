Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35044CD80A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C23112117;
	Fri,  4 Mar 2022 15:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2DE112118
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:37:22 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id l25so8137811oic.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PACe0xmx6r81EAuaFyvZQyZNTfONIujSTfg4d0qd68c=;
 b=dKnrCtVOI+hDZQlL06CinxOoZbaVVZwXGeQ5gQTS0R2IotQyUq+85ADUp2LwLsFS05
 WlYu0tha3pdl7LCf/MBYNKVLiDuYIF0Crlfvq3DtbREQHngLD+8TFefn7U0lDfl7bSXo
 S/SIKgEkWh1YoANlFL3WBs8TQgFU7YUcwqYxgzaV9iwY6byMvmr0tdhLMn6sj5aL0OJu
 B4nMaW6HyLqwBvAyNXAwPEuR6HZRaoQJDQa6PEgt0r93TbkkT5KclQrXMROW1UJcbpsT
 llVv8xoP6X4Lp4+yM5UBLC9MSsXgtr19F9/A3Nsay/TMc2a0TnFxj1ESrxtT7x+WUE4p
 px2Q==
X-Gm-Message-State: AOAM531bS2pLbJSDe6uShPdlBH86f1KE/kSpYv3v9fJUxRel6IRELYcb
 g9QUlR6xiVP8w1MAjdFZqRs2m62F2Q==
X-Google-Smtp-Source: ABdhPJyof2S988VwMuNZcB9U5XecU80emaNMSFoZxgT+mxIr6cGyJM+vro5tIuRKk2C7lcM5e49grw==
X-Received: by 2002:a05:6808:1301:b0:2d5:4226:87e4 with SMTP id
 y1-20020a056808130100b002d5422687e4mr9716207oiv.136.1646408241690; 
 Fri, 04 Mar 2022 07:37:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05680806da00b002d797266870sm2690848oih.9.2022.03.04.07.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:37:21 -0800 (PST)
Received: (nullmailer pid 3983773 invoked by uid 1000);
 Fri, 04 Mar 2022 15:37:19 -0000
Date: Fri, 4 Mar 2022 09:37:19 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek,mutex: Fix
 mediatek,gce-events type
Message-ID: <YiIyL+Vd1zWiDKbm@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Mar 2022 10:54:56 +0100, AngeloGioacchino Del Regno wrote:
> The mediatek,gce-events property needs as value an array of uint32
> corresponding to the CMDQ events to listen to, and not any phandle.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
