Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C693A5A362E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 11:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949C810EA55;
	Sat, 27 Aug 2022 09:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB20310EA55
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 09:10:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m3so4817781lfg.10
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=G6ho+wRO8rYfvijcCTYxQupUsh3eLpJX8XZ+ppvdKQY=;
 b=fGscFtXgbDHXpFk63GwbntNDE6o+7JisIwbUxbp0Vi4Qhh+TpX0+yKOnhBCFXSLUXT
 1BSF8GKYsBUskl85vBT1MPmrUqi+kvUhZCZtxqryRH7NPrWwwcSHxpmrEcwQDbgm06Vn
 ezsnVfEA5epEL0oOzkChiYCEH5BeJrRs30PWfSE7OgUPaMcsCRxtqpS/4RVN8W/IaVOr
 B3b1wnWN0Zqu4DODkrs3PHNoZkd4DKhJSgEMR6e7SmqSz1j6dOPWDdXAJtcDRbT3ksTX
 UN0ISk//PBGj60C5f9m/VidGRBRMQ4whm0RWVFK6mNnGJfTFvmoCM37wFXBhJ8nJYIoe
 ILdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=G6ho+wRO8rYfvijcCTYxQupUsh3eLpJX8XZ+ppvdKQY=;
 b=HgbggM/3xN1Dhd/zT+kNH+6vKuWwaca8ljJfiKplf1ITamf4YauMMOiLtTMm9GxDLC
 t13WL5YirIkjvswO/6UL3luPViMnetpeciW8G9JaeZcX9bCBasTDJrhz6jDnwwqzUXmn
 l7z4/VIfli5NjUE9maTyKCe8EQl+8k9d5zAa/Bc0OK1uH29Lyg/1VAJAKnpH4e71/965
 qN6Sdfp2IPLgIlexVhFv9wq6v6qy09Sj1byBOuUrfkXUnJO7+spogtw10p8GRSAsnvW5
 Q/1ecfZ6L9gKkSKABqRmfhdDQUn2gg/NF/QBH2NhrfxZ7G2ok3/C5YclCpF7bAJDLMqJ
 aPSA==
X-Gm-Message-State: ACgBeo33MlzCK0tkKnEos3JZYj5cP4F+9HDKVBSPPVwVpFYp4k0TnxEs
 Va+wPo3KaBMj85OhTzWRYwZBKA==
X-Google-Smtp-Source: AA6agR7yPBM7OjOml60pN7cFppGPfr6PFS1ZfIsZXLAMYNOZJt4DKAXhiBvAkcvR0aL1wwqcBuNhkA==
X-Received: by 2002:a05:6512:21b2:b0:492:e97d:c5ee with SMTP id
 c18-20020a05651221b200b00492e97dc5eemr3886133lft.599.1661591423284; 
 Sat, 27 Aug 2022 02:10:23 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a056512349700b00492e5219874sm606522lfr.258.2022.08.27.02.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 02:10:22 -0700 (PDT)
Message-ID: <9464bafc-1a91-ca2c-23a9-93c27d6d08c7@linaro.org>
Date: Sat, 27 Aug 2022 12:10:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
 <20220826192424.3216734-3-l.stach@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826192424.3216734-3-l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2022 22:24, Lucas Stach wrote:
> Add binding for the i.MX8MP HDMI parallel video interface block.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>

Same question - how was it tested? This is v1, right?

Rest looks good, except Laurent's comments.


Best regards,
Krzysztof
