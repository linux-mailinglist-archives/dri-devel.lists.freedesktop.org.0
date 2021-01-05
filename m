Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0062EB0D6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 18:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456AC895B2;
	Tue,  5 Jan 2021 17:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4331F895B2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 17:03:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id q75so217615wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 09:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n6KIIJ9J9dzDzP5DUFlGPnwQ7nEofIeMZEzRkiVgqQM=;
 b=YZpnbbP10HA9ptvfCcBQForJrCfVGkQjHc+DUyut+/OBtL/9/YR4y16lLIeZfQ/J+l
 iXwD9CwVf7Y6V019nMZz7Qzadqdtj3xkXXCPCDEmlJvA0MlRWnA5eod06j1j4uLCNScO
 Y8UDsrT5eUKYYj2rZQfXOwjYYAPvIzJHLaUsVLDTaJLN556UeUj07OnLfW5h/ejRtqBm
 oGlXv147xkII5wEBImnoWopb3g9wtvrDpFESRXU2pA4KcHuYl6C6EVlZkZ2JwF8PU89d
 heWsbRi/fmTNdKgP6+Hle9sYXFba6vrC/8GoTOfkamC9gxTATXH8Y7YmRF0iiv51v4Mb
 N+Qg==
X-Gm-Message-State: AOAM530w0HvwI3Q18QxHNYuhrq6YTITnK7kzA3Qa2Ykn/nWpGOWtTtC/
 ao9vDR+5B4zxmVjQhB3PRGQ=
X-Google-Smtp-Source: ABdhPJxIvlNTGgGlYnSrfmBt1kSEImmptJoCJfWMJoE92dAAzlqcVazWUcMl6D9BuAaEKCQtH3p/Sg==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr116341wmk.92.1609866215958;
 Tue, 05 Jan 2021 09:03:35 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id v20sm119655wml.34.2021.01.05.09.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:03:34 -0800 (PST)
Date: Tue, 5 Jan 2021 18:03:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v12 3/5] memory: tegra124: Support interconnect framework
Message-ID: <20210105170333.GC20651@kozik-lap>
References: <20201228154920.18846-1-digetx@gmail.com>
 <20201228154920.18846-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228154920.18846-4-digetx@gmail.com>
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 28, 2020 at 06:49:18PM +0300, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS.
> 
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Acked-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig        |   1 +
>  drivers/memory/tegra/tegra124-emc.c | 320 +++++++++++++++++++++++++++-
>  drivers/memory/tegra/tegra124.c     |  82 ++++++-
>  3 files changed, 391 insertions(+), 12 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
