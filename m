Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80662A9D7E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310A88401;
	Fri,  6 Nov 2020 19:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0815D88401
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:07:07 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a71so2318812edf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ief/IW6YwZHxDYhLab+9E7np7Olmpv1KaYaqOLTouI=;
 b=tOpLQzWfiZHkLjDXeIp6S5knwWT5m3Sxmd6KLKce1KW8uqROvJ6cd7Q3DlT9FF/j60
 hjRmWPufjFTuF1GxUijEe9sA9quQx1Ib63DAphk0He7RL2LNmjRUU9ocYOpIJ63mFXYv
 j6xgB72Fcjoek6GxLZLW3Y6i6ZR65FnqfMq10hSNKK9j35ZqgzyUuL2srhNoUc8IyXA0
 eTWYwrkXoGC+9hos4ILLdt7MN1C9umqHxd869fM2OruoIFIzcFgDXkgoBY3kkxH8HpCw
 beCEyIukeG+Giz1gJasq9h51pvCQ4J6E+imzAcsSTiBQQamtdcCRW3PMIWnflV+q/vF7
 /8iQ==
X-Gm-Message-State: AOAM5328vzlf4vnWdDVtiL4phFaRJNwM8i1zXwoJb6KGzOL3RqaNYcU6
 Ktp7OgaWPVlasMDovjYR9kU=
X-Google-Smtp-Source: ABdhPJxr/EoTQwpT1xyVghBrRW2C5fW2U542Y7PpGvGJttCw6+sgZkXwEqUajELTWWscD2oGm9o8Pg==
X-Received: by 2002:a50:d751:: with SMTP id i17mr3543471edj.337.1604689625715; 
 Fri, 06 Nov 2020 11:07:05 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id m1sm1642893ejj.117.2020.11.06.11.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:07:04 -0800 (PST)
Date: Fri, 6 Nov 2020 20:07:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 32/47] memory: tegra-mc: Add interconnect framework
Message-ID: <20201106190702.GX65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-33-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-33-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:08PM +0300, Dmitry Osipenko wrote:
> Add common SoC-agnostic ICC framework which turns Tegra Memory Controller
> into a memory interconnection provider. This allows us to use interconnect
> API for tuning of memory configurations.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig |   1 +
>  drivers/memory/tegra/mc.c    | 100 +++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/mc.h    |  22 ++++++++
>  include/soc/tegra/mc.h       |  17 ++++++
>  4 files changed, 140 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
