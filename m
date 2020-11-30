Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E82C8015
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F401D89E32;
	Mon, 30 Nov 2020 08:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BF589E32
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:36:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e25so4594358wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 00:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hGLe4cToDIvo4HB3a/5ZfuG6qTk6bfRGM4GcipNY+6Q=;
 b=I78Fskb9m8cvj2c1of3Aiy9XRpXDZG5AVjZO7oeIC+URwmk6pjwZwW3S6haq5FWdtj
 7/FkN3dRur5yVHVepNEiblf8KjpFhtfzQF6scMpGN9iYeZ8aO73XuIBPoh6Sw5YGIi0h
 adgFGXQD6ThThRNjDD7V81iLn7HtOdy4Pu7dVEX1z0sYpOlIUO5M9Omi0wxxtiWQrkkA
 bXc6kwPGWYGh+AOfiff1KA7+G+f2tGduGKKQyajQuD5Lg0pzigOeH6N3+9lp7trl1CJW
 qsBw9ZgSnpJLWBQ6ovUKSQErQfSsFozGqG8bMyUBJcqvVABv5Zx+rG8PtuvnijWhUNKq
 AWzw==
X-Gm-Message-State: AOAM532Df7GFl7tvz/4WsNRPhBbxuE+CuwcoFRHwBSYIZ3oi81p/ud0J
 vCzdgJFvi+zzmP54QeVP1KQ=
X-Google-Smtp-Source: ABdhPJyIIikaJAewDDxbe7eDP7AKT83BXDJQ2y9y2Mtw+U8S4nGzCPJAQAG2vZ+ozkayNtJFvTW3gQ==
X-Received: by 2002:a05:600c:58e:: with SMTP id
 o14mr22175684wmd.47.1606725408530; 
 Mon, 30 Nov 2020 00:36:48 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id r1sm26179377wra.97.2020.11.30.00.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 00:36:47 -0800 (PST)
Date: Mon, 30 Nov 2020 09:36:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v10 00/19] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Message-ID: <20201130083646.GA6711@kozik-lap>
References: <CGME20201123003254epcas1p1763e1ce693d7cb8e2f20d521e701ad5f@epcas1p1.samsung.com>
 <20201123002723.28463-1-digetx@gmail.com>
 <d12880ba-6780-cfee-7667-3723fcad9f3a@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d12880ba-6780-cfee-7667-3723fcad9f3a@samsung.com>
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
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 05:44:39PM +0900, Chanwoo Choi wrote:
> Hi Dmitry,
> 
> The v5.10-rc6 was released from linus git tree.
> Generally, I will send the pull-quest about devfreq to linux-pm.git maintainer
> after releasing the v5.1-rc7 for the integration test on linux-pm.git.
> 
> The icc patches in this patch have not yet merged. If these patches
> are not merged before v5.10-rc7, Maybe, I'll apply the devfreq patches
> for v5.12-rc1.

None of the patches here are going to be merged to Linus' in the current
cycle. They will only go to the next so if there is dependency,
everything will be broken and non-bisectable.

However no such dependencies or merging requirements were mention in the
cover letter.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
