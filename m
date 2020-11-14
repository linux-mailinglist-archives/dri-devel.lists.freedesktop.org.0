Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046362B2E28
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85A6E937;
	Sat, 14 Nov 2020 15:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972BA6E937
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:41:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b6so13645981wrt.4
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M/dyPhuPN1ylbbCL1nqjLjRIL2BGGv8TuzcmItQtAuY=;
 b=a01tLTyv4y899HVN/RBPCrVM5xoGjSYZKHdlPqqpdWRmRj0HGhqF+GvlupAS3Npjn3
 bQaJlQFV0eU9A+yMbj+btc164UoU03T+0TWd3pYt5TzOxrQCyPWUujhKcE4Vi+igvjJr
 0mbpjYoUk7bdoj3VUlm8Hq/ftOq9YCfyuFSTI7FV5melGz/7ylOU0UzgUDfKd16lOLNE
 TZ60iYpLcTlU0UE9xr4UnpbDIV13k2IKy0VAQ+4BRicZxQ9EWsCPZ40BnTR1twak9TrI
 uJgrys4OS8Q1b/yBfK9AV/T7+bXhW8y8ZN3FpyZlUcYD1n1GdtVpnvSvRaZa11lW+8V1
 iPpw==
X-Gm-Message-State: AOAM532pkgjpwiF+BF0+GfhmcMVqOFsCdUIeCqHu866jd8S1ulVeC17n
 Q/atCJu9xTm8L+pDDGuPGYs=
X-Google-Smtp-Source: ABdhPJxMdLC6s1dYf9/3LViJKERBHe9LMFojMg41WquQy+ijj5ielzyRoKNOocoUGVSnkHUHHT/eZg==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr9985338wrn.212.1605368496352; 
 Sat, 14 Nov 2020 07:41:36 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id h62sm15335452wrh.82.2020.11.14.07.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:41:34 -0800 (PST)
Date: Sat, 14 Nov 2020 16:41:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 07/26] memory: tegra30-emc: Make driver modular
Message-ID: <20201114154133.GA14208@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-8-digetx@gmail.com>
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

On Wed, Nov 11, 2020 at 04:14:37AM +0300, Dmitry Osipenko wrote:
> Add modularization support to the Tegra30 EMC driver, which now can be
> compiled as a loadable kernel module.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  2 +-
>  drivers/memory/tegra/mc.c          |  3 +++
>  drivers/memory/tegra/tegra30-emc.c | 17 ++++++++++++-----

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
