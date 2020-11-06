Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E751C2A9C50
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302456EACD;
	Fri,  6 Nov 2020 18:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC896EACD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:34:15 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k9so2256837edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gggth8N856NOPikPqWnt6Bbjz++xWNk4Uqw0X6wMS00=;
 b=ANPNWKmnw8Vb8Z83t+qeZ6NZSGtqNkhePLf6k+AwZHPS64Q9h1FxIik6LFdW0phewL
 KIxNzIog2P/XlOzAiDWv4+eLdBn/b/F6zAs+P2OuiS4/4Gf4M8U+80mjvRg6jnZJEwyw
 kFagKo36uGMWrcdIAfWHhQt1tMRKIwKF6liVBS8253c15+9suZAMiEyVSU6aFore1Pm8
 KXXgh+lvtkZU8xWwXTE2anWIOf+Kyj5SWuPZElGGGMbcIXvNmroQAhyFMg+aRctrrxnS
 ITstBp6fzAwWgMyyofDcdbw9GayZfIMzvlqndUg7+4dIb5uDUtd5U8NJd1B/cYRC2mIv
 mISA==
X-Gm-Message-State: AOAM532S+2woapZVROjWCKRApe+S7wQiKMzPQhah9DFToBTPxi+c64kx
 JRpCOVZJ/rOccq2nbmSmCmA=
X-Google-Smtp-Source: ABdhPJxtnzFCJVuS3gP9PJPBWtXKcv9g6kJif9bUF3VhgPoftWE9c4k48AfsDv7kZIaSYT1XuyHcfg==
X-Received: by 2002:aa7:d607:: with SMTP id c7mr554602edr.70.1604687653933;
 Fri, 06 Nov 2020 10:34:13 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id e13sm1639605edc.9.2020.11.06.10.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:34:12 -0800 (PST)
Date: Fri, 6 Nov 2020 19:34:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 13/47] dt-bindings: memory: tegra124: emc: Document
 new interconnect property
Message-ID: <20201106183411.GM65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-14-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 07:48:49PM +0300, Dmitry Osipenko wrote:
> External memory controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns
> External Memory Controller into interconnect provider.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra124-emc.yaml    | 6 ++++++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
