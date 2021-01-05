Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CE2EB0C0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 18:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E548979E;
	Tue,  5 Jan 2021 17:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6768979E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 17:00:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id k10so188517wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 09:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7rC/3bBxHEIoV+vCWk7wHGZGDIhbhtvFgEsPrKfdLoY=;
 b=J23xSN2JqA21K46f+HWxbO6OEoY3F1Po9Esyvv0QB6Ml0s68NnOQDztvTA8Y7GdZfh
 l90P2Had/nDyz4oZBL5e5a/09kJZRWfJVargGDvMhAaBa6MFCA5qIYbZXaP2LrX7sHzh
 HcQJ7o9Do1uaiSYBj2N2arYazzGf8FFBPIa3ObEeFuJm6Y1MDMCv/7W4dbmcb4ZYirqx
 O7DBDGveC5GHWL0qY9icUfND5DPzEhK0I0En3M3DV0qSlngXbR0VaCnrtivb6YgOFcRr
 d7dlwkMUYPIKnlDDiFnGMetroPsoSVxjACiBn+K8awZThBgJdRIXfdH1Ci2zMMPwoHiM
 NeLg==
X-Gm-Message-State: AOAM530bRqOe5TeTEsTTYmtKIL+jZ56mSgwAhA8vlA5jdrThv6KAQ91R
 ABoYh2fzQEZ3d1TrfIbgcp4=
X-Google-Smtp-Source: ABdhPJxdVH4thBYworKTK5cQ7fRcnmHTI41liWkhfpAJUMLfKGjI41wNdUX5PAVtai0yLCgciW3qMw==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr53095wmk.139.1609866036070;
 Tue, 05 Jan 2021 09:00:36 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id b127sm119430wmc.45.2021.01.05.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:00:35 -0800 (PST)
Date: Tue, 5 Jan 2021 18:00:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v12 1/5] memory: tegra124-emc: Make driver modular
Message-ID: <20210105170033.GA20651@kozik-lap>
References: <20201228154920.18846-1-digetx@gmail.com>
 <20201228154920.18846-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228154920.18846-2-digetx@gmail.com>
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

On Mon, Dec 28, 2020 at 06:49:16PM +0300, Dmitry Osipenko wrote:
> Add modularization support to the Tegra124 EMC driver, which now can be
> compiled as a loadable kernel module.
> 
> Note that EMC clock must be registered at clk-init time, otherwise PLLM
> will be disabled as unused clock at boot time if EMC driver is compiled
> as a module. Hence add a prepare/complete callbacks. similarly to what is
> done for the Tegra20/30 EMC drivers.
> 
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/Kconfig            |  3 ++
>  drivers/clk/tegra/Makefile           |  2 +-
>  drivers/clk/tegra/clk-tegra124-emc.c | 41 ++++++++++++++++++++++++----
>  drivers/clk/tegra/clk-tegra124.c     | 26 ++++++++++++++++--
>  drivers/clk/tegra/clk.h              | 18 ++++++++----
>  drivers/memory/tegra/Kconfig         |  3 +-
>  drivers/memory/tegra/tegra124-emc.c  | 31 ++++++++++++++-------
>  include/linux/clk/tegra.h            |  8 ++++++
>  include/soc/tegra/emc.h              | 16 -----------
>  9 files changed, 106 insertions(+), 42 deletions(-)
>  delete mode 100644 include/soc/tegra/emc.h

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
