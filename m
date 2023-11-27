Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3A7F9C7B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 10:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943E10E13A;
	Mon, 27 Nov 2023 09:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542410E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:17:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c6b30aca06so48174761fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 01:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701076649; x=1701681449;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=bEIoGh5O/BzqSyDdvmfvLEUiDH4K1xP/uQvVNiufgcU=;
 b=ge/jqEpCgc8JTYid++Bc50clGtFy0i61mR7xLTBdTcWg6S6GqWYQu1TF4q/gwmt5/g
 +jrvMimH4FIhtNFCs2MbQbZo2NP0gyQ2pKke/BS8P0PBe8qepK7LCjlyExh2IfHZHzEE
 q+KIasfwdSui1E+z06APWLGc9d9NUwjaHqC+eYWq29tkvce2t9QJ6kMnCyO9F5pjuhbo
 HEFCuSocDw6W9hyKY7gl85sXiA0fPzr3uIelSrWHJK31taM/P4RGDBwK7QimL3hpj6lH
 hRq1HWWvTaLRabKM/OqxcD6UMXGHSLEk/254D+8QM4L79D6Qlz4IgGprpTxKv5WVr1jW
 pAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701076649; x=1701681449;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEIoGh5O/BzqSyDdvmfvLEUiDH4K1xP/uQvVNiufgcU=;
 b=aq8xN855f2NwyeW3cO1IUeS+2/sLjWpVR4P1cIhHySZg7JR4y/Q2dcUwlS8gqEUJyv
 dxVWHQb57OodnMiwWFIyv+YbhfWgCPewoOTx+Wint/6CI56apS+8NZl/yYkdei8LQ1i1
 wK513KlnSqkp18hnzP4B1eQzCl+OUsruX/2+OU5nxu/DSnFdWXdhwNeYw/xk2siNKOoO
 a5gXo47eBSIS0tQaddu4WX4UfVMHb9B+VtvAIub6YJ1FRs4IMmTYKajELyDxFWBBnh0o
 XPmInmMUKGJ91NbMCJGB6whfiCsjhrFGnRVG6S7vRgljtYhqmNjSttRQHKZkvcQww6ke
 tsEg==
X-Gm-Message-State: AOJu0YzGxbokTfJY9aDLsPB7LBlNxefhyrQ4YjRdkVN2Jgoc/b1krRsa
 yt4AMQndIXHAMQP1iCILIvHI4A==
X-Google-Smtp-Source: AGHT+IGy/JmtaB1RId0/b5RlEgolNkKFgTxdlq7MWzbR6GDUGon0doGnidwbBevghTckT6+7ygTSrA==
X-Received: by 2002:a2e:8387:0:b0:2c8:8745:8f0b with SMTP id
 x7-20020a2e8387000000b002c887458f0bmr6234114ljg.47.1701076648575; 
 Mon, 27 Nov 2023 01:17:28 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:fd31:fff0:e26c:d593])
 by smtp.gmail.com with ESMTPSA id
 dm16-20020a0560000bd000b0032d09f7a713sm11439739wrb.18.2023.11.27.01.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 01:17:28 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
 <1jbkbjdxk8.fsf@starbuckisacylon.baylibre.com>
 <b23ddc3b-d995-4cd6-91f2-3efa59d345a5@linaro.org>
 <1j34wvdtux.fsf@starbuckisacylon.baylibre.com>
 <41a1246e-c885-460a-8208-16844e95e1ae@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 08/12] clk: meson: g12a: make VCLK2 and ENCL clock
 path configurable by CCF
Date: Mon, 27 Nov 2023 09:38:28 +0100
In-reply-to: <41a1246e-c885-460a-8208-16844e95e1ae@linaro.org>
Message-ID: <1jjzq3zhaw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>> 
>>>
>>> I suspect mipi_dsi_pxclk_div was added to achieve fractional vclk/bitclk ratios,
>>> since it doesn't exist on AXG. Not sure we would ever need it... and none
>>> of the other upstream DSI drivers supports such setups.
>>>
>>> The main reasons I set only mipi_dsi_pxclk in DT is because :
>>> 1) the DSI controller requires a bitclk to respond, pclk is not enough
>>> 2) GP0 is disabled with an invalid config at cold boot, thus we cannot
>>> rely on a default/safe rate on an initial prepare_enable().
>>> This permits setting initial valid state for the DSI controller, while
>>> the actual bitclk and vclk are calculated dynamically with panel/bridge
>>> runtime parameters.
>> Nothing against setting rate in DT when it is static. Setting it then
>> overriding it is not easy to follow.
>
> Yup, would be simpler to only have parenting set in DT, since it must
> stay static, I'm fine trying to move rate setup to code.
>
>> To work around GP0 not being set, assuming you want to keep rate
>> propagation as it is, you could call clk_set_rate() on cts_encl (possibly w/o
>> enabling it) to force a setup on gp0 then clk_prepare_enable() on
>> pxclk. You'd get a your safe rate on GP0 and the clock you need on pxclk.
>> It is a bit hackish. Might be better to claim gp0 in your driver to
>> manage it directly, cutting rate propagation above it to control each
>> branch of the subtree as you need. It seems you need to have control over
>> that anyway and it would be clear GP0 is expected to belong to DSI.
>
> Controlling the PLL from the DSI controller seems violating too much layers,
> DSI controller driver is not feed directly by the PLL so it's a non-sense
> regarding DT properties.

Not sure what you mean by this. You have shown in your the commit
message that the DSI clocks make significant subtree. I don't see a
problem if you need to manage the root of that subtree. I'd be great if
you didn't need to, but it is what it is ...

>
> Setting a safe clock from the DSI controller probe is an idea, but again I
> don't know which value I should use...

You mentionned that the problem comes DSI bridges that needs to change
at runtime. I don't know much about those TBH, but is there
anyway you can come up with a static GP0 rate that would then be able to
divide to serve all the rates bridge would need in your use case ?

GP0 can go a lot higher than ~100MHz and there are dividers unused in the
tree it seems.

I suppose there is a finite number of required rate for each use case ?
If there are not too many and there is a common divider that allows a
common rate GP0 can do, it would solve your problem. It's a lot of if
but It is worth checking.

This is how audio works and DT assigned rate is a good match in this case.

>
> I'll review the clk parenting flags and try to hack something.
>
> Thanks,
> Neil
>
>
