Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B02737D26
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391010E3E9;
	Wed, 21 Jun 2023 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FAC10E3E9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:14:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51a2661614cso7330706a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687335278; x=1689927278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wFzwm0k+gSaYbrmuFD+Ct/zQgWpL6tZz+YLkGnIfg6I=;
 b=a76tJNOALkltAqWqgtPCU0wkn5mbUJV2rsmN+PBeKjidPCp+KRcctMQIsbMnOFXqL/
 XER5GsRnI7gZFjKcMcHgU3I+/zpLLnKSlHODP2Rss0DWWOHR8uYHMkkC3CCRZ7NCPX1F
 52d5DkJEg8COvAfOVtYEL/WcdEHsV5qzr9k+utruZmLC/aqazzNlQqonr6t44o+X4EtV
 Ooz+L2BbiADCJVa9bx3lCwsrppzQuF3aG/tb2G/E+2f//0aGeTmSV03uM8q6wblwg4j8
 1FZqvXCB6lTayJCICqlwWiL15Nz2wSWsYJV5VvKzuiWikRWEwTF8vaVYXzb1t24exUqF
 kjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687335278; x=1689927278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFzwm0k+gSaYbrmuFD+Ct/zQgWpL6tZz+YLkGnIfg6I=;
 b=hc5wlN5/uPnQxcF3ePBpYN210Fyizelk74Djl1FtzWrhRj3rcTGs0SVEIkkVHP3C2H
 G1h7Mk9yENLfuxaaGmyTFuRxhgbJaG9/Uk6RmtB/Wv0gErIpNjID7Ig1OAU34cEhyvY4
 KVukstXrIzreKj5XvvCa3vJ+yRJJMsDDLlLxZEzf+jQ0TNRQNiiFV4SrJ2T24Sl7SX/W
 76uY/U5kqvJvHkRCUbhdynWNIeZoI5CIhOzdEilqBLxYznIPvFXsPmZsZ1LdnoSnlALi
 GH989Z31bwS1ChPnwdMUtf5WFk5sBc9FRDwG79S1Xm4+fmVizM9PzCEhWhnj9ftN2xlV
 TEng==
X-Gm-Message-State: AC+VfDzgLXyPzkWAUPBf+Jg1sVcvCHJoBIXSxA3Tfr2wPwIyB9RPoA6o
 tYJG45V4s866k6cPfFXt2jcmMQ==
X-Google-Smtp-Source: ACHHUZ7UrcFS6J/tH2I6gNeCns11XWXlOjvCQUWbFjRheU0+56SHXKbV3CU9w/ukLC9Ee3IUJHyMhw==
X-Received: by 2002:a50:ef19:0:b0:51b:ac91:9f58 with SMTP id
 m25-20020a50ef19000000b0051bac919f58mr4448024eds.4.1687335277701; 
 Wed, 21 Jun 2023 01:14:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 q26-20020aa7cc1a000000b005184165f1fasm2230331edt.5.2023.06.21.01.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 01:14:37 -0700 (PDT)
Message-ID: <d0448caf-413e-912a-93b8-d76e976259b9@linaro.org>
Date: Wed, 21 Jun 2023 10:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXT] Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501 HDMI and DP
Content-Language: en-US
To: Sandor Yu <sandor.yu@nxp.com>, Rob Herring <robh@kernel.org>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
 <20230620154856.GB3637514-robh@kernel.org>
 <PAXPR04MB94485F6E2DC5CDDBECED425FF45DA@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB94485F6E2DC5CDDBECED425FF45DA@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2023 04:23, Sandor Yu wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - cdns,mhdp8501-dp
>>> +      - cdns,mhdp8501-hdmi
>>> +      - fsl,imx8mq-mhdp8501-dp
>>> +      - fsl,imx8mq-mhdp8501-hdmi
>>
>> Is DP vs. HDMI fixed for a particular SoC implementation or it's a board level
>> decision. In the latter case, the type of connector should determine the mode,
>> not compatible.
> DP or HDMI is bord level decision. 

Then it's a connector, not compatible.

> Because DP and HDMI have different initialize process and less functions could be reuse, so they have different drivers.

How do you organize drivers is independent of bindings.

> Please check it in patch
> [PATCH v6 3/8] drm: bridge: Cadence: Add MHDP8501 DP driver
> [PATCH v6 5/8] drm: bridge: Cadence: Add MHDP8501 HDMI driver
> 
> If use the type of connector to determine the mode, hdmi and DP driver have to combine into one driver.
> So the compatible may the better choice.

Why? Because one driver implementation tells you to do that? Bindings
are for hardware, not for driver, so whatever you have to do in drivers
is not convincing argument.

Best regards,
Krzysztof

