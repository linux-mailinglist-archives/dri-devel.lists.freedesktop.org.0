Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AD3EF794
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 03:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40246E2E1;
	Wed, 18 Aug 2021 01:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B0F6E2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 01:37:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id r9so1092346lfn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oqxDNn5HuSgDYxtU1DC9Dd6JFHUoPgcSzl8BngM0suw=;
 b=tH07Ag8eiBTNGPOIyiICGem/XAlGbrx9wzA1AYXo5k0KS9zDRDkRtCVqSG5jFzW2VO
 GjAu9tNgXKNtwAzjnF/jHaAKn3t9S2/BI/ubLCao4tYBfnPsNCQfKpg5NbRkjXPFfl89
 o2AFA8APp2Hb5BZhl84unBgpnMCH8jZKxkejm1GjOdyNjXG4drZ4cuhx3rMCgcFD6NUP
 PbFOcLMGACtfUZ2JeTEXxuvnXov1sCN/Toqiy/qwb8+yrYekuN1OEWngV0f+9HB2mVTI
 IJdr97jZuur2MRVfVSk2iXaYSGLsNIixSiM5hkfvafyYXNZKmo6LxpEEX8DqogXnEx3D
 VoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oqxDNn5HuSgDYxtU1DC9Dd6JFHUoPgcSzl8BngM0suw=;
 b=UU/acs6tlomN2HpjCcuetasEdnrkDhyzVKtHcbNy1OHAULZasOUcx3kL5DmJE+FRzd
 SrgLYd6+PCXl1jqSnoT+fDD6OAHWtMpT7Hgd/mi2dJgMpj+Qfjl+Mliwjk3boNr7Gth1
 BnjEx/eRFqFi+pJhI6GfXDHyYjlrEvOtJiskfuTtK3wiLNdpcHO67aCbURmf1oX/zAi4
 AmTU72csEVfzmeBwXHcn5zvfEXJVSunK/yCE6IiKBhAZ2koUATwnN1OLmITtF/Luoctj
 2DfijTujuUKBwzgp0jGVMZCnmrNyAElOfBLWaIq8XdfWPPCMDI+vkM6bZG3CaKPO7lZB
 hEyg==
X-Gm-Message-State: AOAM533SW4mQ7zUEHmJ5Q5xKECcemmp5BviAcbXTvNnJAfDeLvdGLCYV
 PoIjKoxKUKczZB0YIGwdZTw=
X-Google-Smtp-Source: ABdhPJzO8yX4UrQj2zwLBNG/ezqRBlNp4JuMFF5+U48En2dYUq2KE3FpodsT/MFV5XUcHXk+BK/l0g==
X-Received: by 2002:a05:6512:3441:: with SMTP id
 j1mr4537443lfr.388.1629250645475; 
 Tue, 17 Aug 2021 18:37:25 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d25sm409518lja.31.2021.08.17.18.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 18:37:24 -0700 (PDT)
Subject: Re: [PATCH v8 09/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-10-digetx@gmail.com>
 <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fa9a1fb7-8a87-de1a-e40a-fdc4f4d05d57@gmail.com>
Date: Wed, 18 Aug 2021 04:37:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRxfWJJ6+1GgVs33@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

18.08.2021 04:16, Rob Herring пишет:
> On Tue, Aug 17, 2021 at 04:27:29AM +0300, Dmitry Osipenko wrote:
>> Memory Client should be blocked before hardware reset is asserted in order
>> to prevent memory corruption and hanging of memory controller.
>>
>> Document Memory Client resets of Host1x, GR2D and GR3D hardware units.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 62861a8fb5c6..07a08653798b 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -18,6 +18,7 @@ Required properties:
>>  - resets: Must contain an entry for each entry in reset-names.
>>    See ../reset/reset.txt for details.
>>  - reset-names: Must include the following entries:
>> +  - mc
>>    - host1x
> 
> New entries should be at the end. Order matters.

Indeed, order matters. In this case it matters by the hardware because
memory reset must be asserted before the controller's reset. We rely on
it in the code of the GENPD driver. Hence it's the intended order in
this patch.
