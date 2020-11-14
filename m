Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B82B2E0C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A676E92D;
	Sat, 14 Nov 2020 15:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C56D6E92D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:37:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o15so13626597wru.6
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U4GcyUn4reH1qm14U6D1eRhiaxWlGAP1uylSgn09bAE=;
 b=p60KuKT0oBwfmQqj6JosipRpodgaEN3k9elInNFFnNnwVczvckt5TBxP+av40ZtCig
 WdM8i/pM6NpV4fQSkAMe+wgwuyKn15/dI92lvW977VYEzbGhowOQpyFfdQDAUbWD+ZU+
 +xibK6f/ZYFRXbDlRATWktamGRS2IaWzbf3mvl4X3BUN5OoWd91UIRulbobsqUQzYhIQ
 IS9j+Yu9gnmzJA/HdfGYRS+bfo7YTWlgjVXF9Hbk8WFR/Mx+VTfS4xPrBuZUY6wwLT7r
 TMrG5ZIyZp0DvIGCPKP5s1nkZMqdNCUEFOqDJIf9OJRBXsBnhcfc1hEpdMMP/nfjJSo5
 2roA==
X-Gm-Message-State: AOAM5319koT6fm/IRl1dbzXa+Sx+b0mxIckil0zjMg5TVTrflSnoxVzL
 Jgm62Z+g/7Wx+kTq4CYxTOg=
X-Google-Smtp-Source: ABdhPJw0mkO/QYUuAF08ih8ZearlCSBP/PG2yE8LFV+wCVkmqDw3ltyDZtGgD02ccVTSEWvcip2lhg==
X-Received: by 2002:adf:82cc:: with SMTP id 70mr9939588wrc.74.1605368242190;
 Sat, 14 Nov 2020 07:37:22 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id a18sm13182992wmm.22.2020.11.14.07.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:37:21 -0800 (PST)
Date: Sat, 14 Nov 2020 16:37:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 02/26] memory: tegra20-emc: Use dev_pm_opp_set_clkname()
Message-ID: <20201114153719.GB4106@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-3-digetx@gmail.com>
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

On Wed, Nov 11, 2020 at 04:14:32AM +0300, Dmitry Osipenko wrote:
> The dev_pm_opp_get_opp_table() shouldn't be used by drivers, use
> dev_pm_opp_set_clkname() instead.
> 
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
