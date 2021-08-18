Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230293F0A15
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81FD6E520;
	Wed, 18 Aug 2021 17:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228EC6E520
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:16:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x27so6155559lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vgNL/YukxMg7bm55oBtvyONH8Uy1dCmXD+rKl0KJZ+4=;
 b=aWNGgcB8z2InDXr6LAdvdaoW2x8CYeUuWHd3AgCWJbOwgyDZbX1SSdtkZCd9LRZU1v
 IfB7jsJ5WNoNiPAd71m4tqa31eFIV1XWJVkfosfkA2c8iOpOAgHnxOP+Umk6tnLPaeuD
 zFTYiqQcf3UIWIFj2bsQWT3aHs/7ok0x1oWwrXbsCuJZ6+Dey8Y6WST/bdI/u6vAMVWp
 htf6YIaZFo8BnuwLljU/vOB2BDRZawuqyS/nEBvAZbttcyYj5o5xKI9Dqb+FfMPcy4Q4
 olMMp0EmD83m0Qh7UjqjOn1UF1IMJlXK3kbyDPrL8jwSvvrERW8PV9J+29gQn2e5QIgO
 hO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vgNL/YukxMg7bm55oBtvyONH8Uy1dCmXD+rKl0KJZ+4=;
 b=PWXBeY07q4v8VhyWSJyCahQmrXw6QBQZGz5d7ETuY8H9ZNzqDynhX4vLYkJ4sDYPpH
 VKN1+BCBiAT3NAN/RtKys7EevJboxfRvGxlHsouqhl8qs+L4nYCzH6zIGZjoKl1tyNCl
 AGLhxj2+QlzqOxEhrHKWJ+L4LPJu7JEcYhrcQ355roptb/Qc8pt0OONomw5e4nRJGbkU
 UgplXvYt8B9u6lnYcRNbO/n9TUfRNHt46NHzX+R4PyD3ikUEMArk5OGthcX2rzz0QNzv
 SGoumkZik3/+P/iz8mB6+UdQkIwNpcjcQj0N07DxSoCzJpnQB8nJxCCvVWCBORVUjRiG
 YVjg==
X-Gm-Message-State: AOAM530X1D7s6zqiUzeksQ3zhSOwe9vVoo0UNqVVSjw55AxmI+lB2hRN
 V4tdlqPpQH985vdDU5gqbH8=
X-Google-Smtp-Source: ABdhPJwSW+uafqBwt0YKcEZ0LBXy3yeuH6y6xXlHWB8hnmrEnK92Pi4r+On9LLiAT6Vq9yxNJiR3Yg==
X-Received: by 2002:ac2:5105:: with SMTP id q5mr305235lfb.102.1629307010475;
 Wed, 18 Aug 2021 10:16:50 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d7sm46016ljq.112.2021.08.18.10.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:16:49 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
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
 <20210817012754.8710-7-digetx@gmail.com> <YR0SSz7KMh7TwaFW@orome.fritz.box>
 <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
 <YR033zuYWWLCeYpM@orome.fritz.box>
 <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
Message-ID: <a0222ddc-e83f-98d9-c9f1-8edb0ee47c03@gmail.com>
Date: Wed, 18 Aug 2021 20:16:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
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

18.08.2021 19:57, Dmitry Osipenko пишет:
>>>> Also, I don't think the tegra- prefix is necessary here. The parent node
>>>> is already identified as Tegra via the compatible string.
>>>>
>>>> In the case of CAR, I'd imagine something like:
>>>>
>>>> 	clocks {
>>>> 		sclk {
>>>> 			operating-points-v2 = <&opp_table>;
>>>> 			power-domains = <&domain>;
>>>> 		};
>>>> 	};
>>>>
>>>> Now you've only got the bare minimum in here that you actually add. All
>>>> the other data that you used to have is simply derived from the parent.
>>> 'clocks' is already a generic keyword in DT. It's probably not okay to
>>> redefine it.
>> "clocks" is not a generic keyword. It's the name of a property and given
>> that we're talking about the clock provider here, it doesn't need a
>> clocks property of its own, so it should be fine to use that for the
>> node.
> I'm curious what Rob thinks about it. Rob, does this sound okay to you?

I assume dt-schema won't be happy with a different meaning for the 'clocks'.
