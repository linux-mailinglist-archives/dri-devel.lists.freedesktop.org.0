Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C1E64EAC7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1128710E113;
	Fri, 16 Dec 2022 11:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6117610E113
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:41:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id q6so3043187lfm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17MNm39bbqpug3RvcPpT95MRkN2EavjuIF9h7FQ+Qn8=;
 b=VHCXQboZaHQaUmlcf4ptNuIES6oqD4kY6gXjy6RCuZSKl7IBGJP1j0CIhSv/4lssnQ
 /x8eEWu56rpZiR+8cLxh68WgXJgu+DaHx7W3oL3K7HQdb9ltmmCrXIhu/WDUvg6OJ72Y
 wRymzcON01Qja7mEKdR6ykpr2noJhH9kDNDtfC9b8ANxIvMbPP8w9MaLnROmIWD+i2nA
 ZwIzv2kfIlDnAiP6a2FK2HUm63jOBbpTFAojLBEV/QBrtQPsUsZEQNsHPvacqdxpbD+b
 CFyliRO8cgw940w/eZOMLI8JJGtCLd72ct0W5fyoFnXS60kTWyvnrRYlSCoMjPcDGPi6
 Sc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17MNm39bbqpug3RvcPpT95MRkN2EavjuIF9h7FQ+Qn8=;
 b=QKXljTGeEKW4T4LUaXq87/cUBdJ95Bim4YnuOLbeX/SnM78ANpAQHyUu4+FKLq8H0D
 CqH1eyn5+u8V41OjlSP3BkV0o48L93egMU5ravwRTuZgrX4zvEpf+L+FrdfQB2f6iPJG
 cBba7DroLA+uQwY6ulRdPQaSfKDv2pX3JmgC4OtAVHlHOIxaXzt9wveqPoj7AQsKCjNr
 gr2klTSNDQqb3ue0pKQM5yf2gdg/nHdLkpI38ShWYFhwJRpENjA7z1MFRQAYkc8O+doQ
 AzcZLNJJ/i5geUdAlU/HqLuNPXi7gAEVJlIBw13WvbpwsXNU4t3GYb16sMGZRRWSoisx
 tlhw==
X-Gm-Message-State: ANoB5pmeeqKzUGORzDhbd65tzMePbrPbvrtgTyIdajWwYxL072yXOsZl
 IDQmWcoOF1eckxNOnWDVtnuGTw==
X-Google-Smtp-Source: AA0mqf6c1DPQoSUCYsU9ogB0mXF+R4gaLIaqfsP5TyLkbE0lKXJzvkHIC3TXLU+LjxkJGD27QCsmWg==
X-Received: by 2002:a05:6512:22d2:b0:4a4:68b7:e718 with SMTP id
 g18-20020a05651222d200b004a468b7e718mr11045785lfu.2.1671190881610; 
 Fri, 16 Dec 2022 03:41:21 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512358500b00498fc3d4cfdsm197067lfr.189.2022.12.16.03.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 03:41:21 -0800 (PST)
Message-ID: <e71e9254-07e3-a6d6-00db-ac42325f6138@linaro.org>
Date: Fri, 16 Dec 2022 12:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: display: imx: Describe drm binding
 for fsl,imx-lcdc
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221214115921.1845994-1-u.kleine-koenig@pengutronix.de>
 <20221214115921.1845994-2-u.kleine-koenig@pengutronix.de>
 <0f3e755f-954a-9722-6898-181170deb2c3@linaro.org>
 <20221216113832.6qvyzlrwfzrlhker@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216113832.6qvyzlrwfzrlhker@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2022 12:38, Uwe Kleine-König wrote:
> On Fri, Dec 16, 2022 at 11:41:30AM +0100, Krzysztof Kozlowski wrote:
>> On 14/12/2022 12:59, Uwe Kleine-König wrote:
>>> Modify the existing (fb-like) binding to support the drm-like binding in
>>> parallel.
>>
>> Aren't you now adding two compatibles to the same hardware, just for two
>> Linux drivers? One hardware should have one compatible, regardless of
>> Linux display implementation.
> 
> The (up to now unopposed) idea was to use the opportunity to pick a
> better name for the compatible. The hardware component is called LCDC
> and I guess fsl,imx21-fb was only picked because the linux driver is
> called imxfb. Unless I understood Rob wrong, he insisted to describe
> both variants in a single binding document only.

OK, I'll leave it then to Rob.

Best regards,
Krzysztof

