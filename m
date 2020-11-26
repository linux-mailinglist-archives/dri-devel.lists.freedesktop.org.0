Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67EC2C5AC6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 18:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3C46E993;
	Thu, 26 Nov 2020 17:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF2B6E993
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 17:39:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p22so2838675wmg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 09:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cjXv/ScxbZ0BiPP6MPGhGSZjdPE+o5XCx97qivgu68s=;
 b=BlCgAdFPILms8OaO0heqH5iThc43uum2uniDT1YgkJJVgar+Ecn/s5PY+iqOgqBM6h
 sjfSjSOLEZYG50DoKRcfe4elokiehEpr74LeXeEG5YyELtS5c50EohANmUYd+4U8sKnP
 kFBW3/58fEuXyqXtnnXYYN2u2nDszMSMpYkqxW3SDmDJI6rjq7ZqAewhmhStO5dzghx8
 +RXcBKuI0fXjpmyz7/I7dYRuevauMdRlQDxhHx7375LRvEII+l0f2CHOtC5+93XGzX0b
 YfDEOaLa4TL1OJYl/U/SaCAp+jZnqiT+/zlfbJFl6QOm91bKo/7WFoGQnOHTH647Qzjw
 52rQ==
X-Gm-Message-State: AOAM530QbUqoeIP/P+h7UpcxvM7tRlaLNLhfQClyvvME4AM/jcjZHlW+
 OSZ7WK1hfMMWMuw6cnRtZhw=
X-Google-Smtp-Source: ABdhPJym9BuTs4VMvKws9pdTIceCeRsKsxs2y5eVHiwUU6Em5mTTgU03rlmfFANSNsZ3NxhF5CkhzQ==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr4694548wmc.186.1606412364616; 
 Thu, 26 Nov 2020 09:39:24 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id w21sm9198231wmi.29.2020.11.26.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:39:23 -0800 (PST)
Date: Thu, 26 Nov 2020 18:39:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 17/47] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <20201126173922.GA7048@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-18-digetx@gmail.com> <X7/lLaZJNp+Vfczk@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7/lLaZJNp+Vfczk@ulmo>
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
 Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 26, 2020 at 06:26:05PM +0100, Thierry Reding wrote:
> On Wed, Nov 04, 2020 at 07:48:53PM +0300, Dmitry Osipenko wrote:
> > Each memory client has unique hardware ID, add these IDs.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> 
> Is there any chance you could drop these dt-bindings include patches
> (17, 18 and 19) so that I can pick them up into the Tegra tree? The
> device tree changes that I was going to pick up depend on this and
> fail to build if applied as-is.
> 
> I was looking at your linux-mem-ctrl tree and had initially thought I
> could just pull in one of the branches to get these dependencies, but it
> looks like the dt-bindings patches are on the for-v5.11/tegra-mc branch,
> which the ARM SoC maintainers wouldn't like to see me pull in for a
> dependency on device tree changes.

Partially you answered here. :) Since you should not pull my branch into
a DT branch, you also should not put these include/dt-bindings patches
there.  SoC guys will complain about this as well.

These patches are also needed for the driver, so if you take them, I
would need them back in a pull request. SoC folks could spot it as well
and point that such merge should not happen.

> If this is all fixed at this point, I'll just have to push back the
> device tree changes to v5.12, or perhaps see if the ARM SoC maintainers
> are willing to take a late pull request that's based on v5.11-rc1.

Yeah, that's a known problem. I asked about this Arnd and Olof in the
past and got reply with two solutions:
1. Apply current version of patch without defines, just hard-coded
   numbers. After merging to Linus, replace the numbers with defines.

2. Wait with DTS till dependencies reach Linus.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
