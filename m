Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F72A9D9A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4A16EAA8;
	Fri,  6 Nov 2020 19:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B21F6EAA8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:10:38 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id cq7so2148256edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqirjaMt4D6SKqcnUi2BGgbSRPE0IdYDv6GFpHhWUvI=;
 b=gtaOWpACuJxs2t9m4MzBjmZ4X6JOxun4+xcTeXD6U03GiMrPqjukSVSXfHlSxLGcTm
 fwxc2BpDFN0CztB4dTCGx9Q94AZatwGqFR8R+xum6/De3ybVhijmktyHSgY5hplPd8H0
 zmRSdCVRuC3I82piDrQnckBSuGr5d9R+1oZq8eBgozhWQOnwLEiWF3ubWNdYa1DtmeU2
 oO09a5//GOx6+zyVdXXGJV8M10yyN38iQnNMHPF390DqPA3ZeQxIyxgTEhTzjHcvX8/O
 9spEpgh1eN9/DP/Y3BzuKswh+LHQwIuUZFDYx+wsj/dz+0U9oDjbHd9rdNrtz/0oYHSw
 47sw==
X-Gm-Message-State: AOAM531MpfxeVD43so/mQxaw7HwQCn931l5hnapohKvKpcRJ+3S4ZF5Z
 va1t7NwFpzuXB+T5zQqJhLg=
X-Google-Smtp-Source: ABdhPJxxua5gAL0oui3IMgo8hZd9sh5JMCTalWVuc/s/2mSaFDEPMiMOSp49pEiaN9sG5rNOJidI+Q==
X-Received: by 2002:a05:6402:22c6:: with SMTP id
 dm6mr3612186edb.139.1604689837124; 
 Fri, 06 Nov 2020 11:10:37 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id l12sm1666653edt.46.2020.11.06.11.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:10:35 -0800 (PST)
Date: Fri, 6 Nov 2020 20:10:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 35/47] memory: tegra20: Support interconnect framework
Message-ID: <20201106191033.GA65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-36-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-36-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:11PM +0300, Dmitry Osipenko wrote:
> Now Internal and External Memory Controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |   3 +-
>  drivers/memory/tegra/tegra20-emc.c | 310 ++++++++++++++++++++++++++++-
>  drivers/memory/tegra/tegra20.c     |  77 +++++++
>  3 files changed, 386 insertions(+), 4 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
