Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AC2B2E19
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3201C6E935;
	Sat, 14 Nov 2020 15:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164F6E935
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:38:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p8so13640213wrx.5
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bGIWjARNGCjg4NP+VD6dyg4ApWY+eQPPEpsbecbmVBo=;
 b=Ao97t4bWlmUFE+uVtvtziGa8yohujBMRwXajGRb2EaYLRSnfEUs6aTq4gATJieydGD
 5xYRdROugKp7kFycZzQZJPmdW0wMIAvZSDhHovbxsJbLRMSAORmZRbOQEzySU/A+moBT
 02Vt7HmmZaPqB9lKxLCwmjOYiCJRd/UR72IJkV0jGQWqLdAXytQzgtdp+2Iv4tr2dnCc
 x26lnQ62vOS0sya/FrESCNwtczSu4fgOPFPYSfxH+VOWtYLnfb8GEjIfvjjE1CCtZS5K
 6271Q1Ct0iLKxCxtAK8Jy38ntaHfnw6G15/5+I54PepnJ1+v4JiYwo3whu3XMmeZgYWk
 rFLw==
X-Gm-Message-State: AOAM533CQ/V0HGkFg0DnbOpYbxDF1f+z6l372+LRhVEF2en4seEKzjE7
 TDh47xmi2/yz4DEbENpySxg=
X-Google-Smtp-Source: ABdhPJxJvYknJaUlxNiibFWrUy4cuh3/wj0hltEkjtmzWA6PtzjOdXhNljLDhmNynimSgflk1aBKLg==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr9950928wru.405.1605368330328; 
 Sat, 14 Nov 2020 07:38:50 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id y10sm15568325wru.94.2020.11.14.07.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:38:49 -0800 (PST)
Date: Sat, 14 Nov 2020 16:38:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 04/26] memory: tegra20-emc: Add devfreq support
Message-ID: <20201114153847.GE4106@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-5-digetx@gmail.com>
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:14:34AM +0300, Dmitry Osipenko wrote:
> Add devfreq support to the Tegra20 EMC driver. Memory utilization
> statistics will be periodically polled from the memory controller and
> appropriate minimum clock rate will be selected by the devfreq governor.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  3 +-
>  drivers/memory/tegra/tegra20-emc.c | 90 ++++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
