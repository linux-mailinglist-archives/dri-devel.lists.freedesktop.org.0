Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7BA29D0B5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9C6E107;
	Wed, 28 Oct 2020 15:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7406E107
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:29:47 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k3so4583198otp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nlJqqXXAH1t+pt7s0ccAWf7pcAID62bNuJtmD6PRncE=;
 b=Ar3qfeizdfwqN5Z+odnm2xKBxhiwoyCvFxPo4ZaAYH+ScbgjCsW77toMLTCmf/aN0l
 7wB+Quw8hVr9G5b3l7Y4/jiNVwpbbrfYbs4Od5oBWtelKKRXW6cEOIm1tzdP5bBQB/FN
 JUDqbCHd3gZGzdtzhEMJkzTJ2fYeRnrKCdixcXXpdaRFnvOMnh9a/EBoNrKM4XDax5oO
 iBKPEvNXWKHx2herCHYMXFAwGMAWxneiWa9e5DBKzzn/pU0kbQ/lMocszlcerhCoyMNX
 kGaoDeKYndqf5WUWSlGJ00/ue4mLIFmzhmomww/syq8bkTtP+d3VZ3fNJsM2CK3qKh/t
 E5NQ==
X-Gm-Message-State: AOAM5327XgRyRHVdbX/CsnD14KyxD/Ygua/oiKTjGG5SfptSnLa85ZsP
 j5ttuRtC9MoEJ/eJD4j1nA==
X-Google-Smtp-Source: ABdhPJy5UQJsgQmDLtE/+RjvN2Lhxh8sG17+hq4U7TOgu5yrnYqg9JmwYnTRx0VJDOZqz6UR5e+hJA==
X-Received: by 2002:a9d:172f:: with SMTP id i47mr5804523ota.74.1603898986343; 
 Wed, 28 Oct 2020 08:29:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h6sm2714750oia.51.2020.10.28.08.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:29:45 -0700 (PDT)
Received: (nullmailer pid 4059166 invoked by uid 1000);
 Wed, 28 Oct 2020 15:29:44 -0000
Date: Wed, 28 Oct 2020 10:29:44 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 11/52] dt-bindings: memory: tegra30: emc: Document OPP
 table and voltage regulator
Message-ID: <20201028152944.GA4059076@bogus>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-12-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Oct 2020 01:16:54 +0300, Dmitry Osipenko wrote:
> Document new OPP table and voltage regulator properties which are needed
> for supporting dynamic voltage-frequency scaling of the memory controller.
> Some boards may have a fixed core voltage regulator, hence it's optional
> because frequency scaling still may be desired.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra30-emc.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
