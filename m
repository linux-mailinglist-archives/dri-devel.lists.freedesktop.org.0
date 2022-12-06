Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DCA644845
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 16:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0B10E087;
	Tue,  6 Dec 2022 15:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586410E087
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 15:45:09 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g7so24338515lfv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=;
 b=Kx8saFYoHs97DPlt7rrWo2mlAeMwmhdrZXHcU6ApGZvCEcPzi+fsL29ZykBAdUog/p
 4RhjCcy+vvcGMq5PQyQA7TSNYry9E+K3FGHTw8SpdUT4WGFAOtEqVhtysayPFRJlxqOs
 dPbdVzjGH4w7YTBIKP69tRClDuUpWxwP60LHj5r3/rtPtf31XDHArnKPYS4DhO00wKRn
 +7e5S05nSpyz6sFoVtz9C7uRJj0P8kFprLbiwFBfFO/INtdatDSMEBGkPsmco4XMgMtN
 x+QVEirO8ZUBFE4h1OAclT2O5ukRBq1bzdNO5EQ3j1uDU63bACCnKe6NYtqG9+khx8Ld
 xIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNf0oPz1+3JYITF+uARI5oqprCns7og7GMeWkwgQOfc=;
 b=jh+20AV8IXcfo3OJkarlcsfurPgBp6iVKtIK0xSIoo0+kjzh+eUcYSITpHo0GG9okK
 lSQ52EgCDImR7dk2DraFNR+keD174LeLayjUwmRqyBQbzz+FJVwBU2HqGTdpZPLsq6hZ
 jVDbKTBB19IdCgazVQYSbkvOSg+/XH52gOw6JZ/d8gn6SPnhFGoRQ1zt5DeC9CufLElx
 QXwnMPRZiezxRfdJctBeQ7qiW7JdFLLprYXP5y6MUw8XUBAmdk9527rpPMKk8sujBwO7
 vLUoPZDJAGf/KqtYcd0nsmZS7HAV/IaNqAwxTP9kBtv1vUL4Arwp9Og7Vz4f+gJLYLca
 7M7g==
X-Gm-Message-State: ANoB5pm0xeX2NrrsD/MudlDq90Pyi8iySe3kq/w8u5rwY2bPrS3vxNrQ
 doJ3AocXtTxzabse5Idl1HFyVg==
X-Google-Smtp-Source: AA0mqf5Jh+Dt9wCImCiy9pkyTRtPnrr1eJHFTxSsl5fLdur/tl5B+TujlU7R0CiZRMeh4aFTfnhVGA==
X-Received: by 2002:ac2:4e0a:0:b0:4a2:2aab:5460 with SMTP id
 e10-20020ac24e0a000000b004a22aab5460mr22854399lfr.62.1670341507919; 
 Tue, 06 Dec 2022 07:45:07 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v5-20020ac258e5000000b00492ea54beeasm2518454lfo.306.2022.12.06.07.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:45:07 -0800 (PST)
Message-ID: <d17bef48-0804-3ccc-a14e-9043ae615573@linaro.org>
Date: Tue, 6 Dec 2022 16:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
 <20221206020046.11333-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206020046.11333-3-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2022 03:00, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

