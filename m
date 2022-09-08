Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C495B1DFB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274210EAE2;
	Thu,  8 Sep 2022 13:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2731A10EADF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:07:33 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w8so27561166lft.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=;
 b=OnaGsfvOCLtQSBc0ze/XDCrjMs3fvJ8z2lVuT/jXY3Zah6Btqr6O8o+Y/xzaDCsGFQ
 aNTn+Tad04itVfSFKUheRnqoKDIPvs74oU2qn5UXwtbVp9MdLGGK6UrfiaX6oPKzYM8L
 iYiuJO/B/2FMpIuTMicaPRvUzM4uu8CFTorze+v9/JExL4YuwKOPfuy6SmY9LzTKN3CC
 pOusfnV2vFIqyVn2EG9BhUNURJE49a21kmlxwOCnqQMWVvSI4x43iNTbzaWm6ldSo8Ko
 WQZV7wfAXQ5YPo0rxq7Unw5lA+FF7KNsezgXrt5Tt4RBUggcRZQtMFdwwyg+X23ERZoC
 FFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=;
 b=NaDWh0rkms9hQc73mCHPe1S55xvIoclGRMHgVGAoi0ETicT3/Aya3pNelPCuhViTMB
 h7Wn719IrR7zAvkP4D7OCP0DHwGjLYRuA8DyhcDgTF7w7MEi+RWAvo22r2hyaPsLo2IB
 1CD1yLOXQAnnAKVGX/dDOCb2cTv+i8TSJA6eyd+GXwG4WsKWOESA8u48mSVJay0vT+mF
 w/n89ddEtWQ15fiF49DjR/L+zp+BNli5AM0FQ7vs0gPucekRDteeQUbj+iKXLBfJzqhv
 bUsyXdlhACIA1LdRsN6C4SCtAW8rY9y25Qw1+i6eG54OpT8jXqQBZNHDA7C8bsEMd0K8
 C7hg==
X-Gm-Message-State: ACgBeo0GojLsbvA1mMNzM5G4C3OHM5Kh6MopWWhUI1EkWpSqfVgXhaMd
 V+LM1IjGLjuIiZYRseNIJIcnVQ==
X-Google-Smtp-Source: AA6agR57T3t8+MMpI2KHy8mvLQohvoJxFPM7ZK6FI697GqmZFiRdAtbnPNIFqulD/7k9bQHxePp8gA==
X-Received: by 2002:ac2:5107:0:b0:497:adac:7305 with SMTP id
 q7-20020ac25107000000b00497adac7305mr1643133lfb.32.1662642451447; 
 Thu, 08 Sep 2022 06:07:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o10-20020ac25e2a000000b004976809d6a7sm1697850lfg.283.2022.09.08.06.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:07:30 -0700 (PDT)
Message-ID: <55f76b33-fa27-d8bd-8fe2-9aaeacf2c9f9@linaro.org>
Date: Thu, 8 Sep 2022 15:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/6] dt-bindings: mediatek: modify VDOSYS0 mutex device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-4-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-4-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mutex device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
