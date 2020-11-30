Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470C52C995D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467DC6E513;
	Tue,  1 Dec 2020 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBBD6E440
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:48:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x22so17647787wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 01:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UUC9TeaDt9H+HkNFYhBbM/UEMd5LTexKU46ek/gKx0k=;
 b=wIoujYJEt5nZ0wsrvBh+wUJgyeXGVojtiXDhiHQCR0m2n4rALbTqmBtA4zr922Kww2
 Th+Sn76q0ClBBBC4rnRvIh1bXxaASAf6qEkP1OH3ORCMT/iHmP/Z2pxfx66AYpDRq7lJ
 vyYQI1+8wigLwmXb13FiUbYMWhvoxT6IHnVes8K1wI9h5apsga8cTaqMr9zghwcuhGbk
 D+M7gcRJ1Cs39p4tKHCHRbgnRjKdT9Eedsk3Iu3pRQMPTwjfAFISZJ3XX6jYtbiQTGmJ
 Vq4k6yArWHzjhX34r7FYauHJa4iG1HSHREoZJlePp9oHDse75uovr7i6gKS992Mkz5q2
 9TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UUC9TeaDt9H+HkNFYhBbM/UEMd5LTexKU46ek/gKx0k=;
 b=spSgmUX4PwHuVTl+LKrGEObcbU8kge2h0y/b5Y+3yHlnGPG1Dve2ZsCZq4ysNNWaLi
 7581TKJfxxA7GhBjHZcIIwJeQTLD++sD030UYigzo7kwyxIbNbGtXGNorc+g0xpOabhi
 p3mIvrlyDYT9MyGjOa4x2yitiGmRGqbzkhEHY9rX947cItXxuxVu5dZh17rmuOyI0mzW
 DdSo4F9y2HZiPUawqsFugzvicLMTD0giLS9DvophQxShzUM8/5B3QmlkHB6zOKU578y0
 4C4WKWZRh11VQN/OzCrJNZDfd7reO8k1J12vYaAH4/v5DuHaV4aNrZKHm4ukmhfEqaft
 S1ow==
X-Gm-Message-State: AOAM5310sVOOW6QNJiHA3sGKFKyqxim+xYinQuIDNb1ZQggmB9ZNxCSz
 DlTggfrxEfJpdu09jr2Ro+gLJ2sfzKeJRg==
X-Google-Smtp-Source: ABdhPJzpbS2D5PSEImmJ9SGWzBH48Cl4LQCF8ul7eaXWpe+pFOLqtlp/EKVVXKRrSnCPVR8kmE4f2w==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr22293158wmj.76.1606729701414; 
 Mon, 30 Nov 2020 01:48:21 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id s13sm6274987wmj.28.2020.11.30.01.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:48:20 -0800 (PST)
Subject: Re: [PATCH v10 01/19] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-2-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <46b3bab7-1c2c-2f50-6e41-f411e532357b@linaro.org>
Date: Mon, 30 Nov 2020 11:48:18 +0200
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-2-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.11.20 2:27, Dmitry Osipenko wrote:
> Document opp-supported-hw property, which is not strictly necessary to
> have on Tegra20, but it's very convenient to have because all other SoC
> core devices will use hardware versioning, and thus, it's good to maintain
> the consistency.

Hi Dmitry,

I believe Krzysztof is waiting for Ack on the binding before merging
this patch (and the rest), but unfortunately it was not sent to the
DT mailing list for review.

Thanks,
Georgi

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   .../bindings/memory-controllers/nvidia,tegra20-emc.txt      | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> index 67ac8d1297da..fe99ce1013bd 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> @@ -16,6 +16,12 @@ Properties:
>   - #interconnect-cells : Should be 0.
>   - operating-points-v2: See ../bindings/opp/opp.txt for details.
>   
> +For each opp entry in 'operating-points-v2' table:
> +- opp-supported-hw: One bitfield indicating SoC process ID mask
> +
> +	A bitwise AND is performed against this value and if any bit
> +	matches, the OPP gets enabled.
> +
>   Optional properties:
>   - core-supply: Phandle of voltage regulator of the SoC "core" power domain.
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
