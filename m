Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF702A9D5F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B4E6EAB3;
	Fri,  6 Nov 2020 19:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6A56EAB3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:05:51 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b9so2331842edu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MXPmT1NGSQgsd3xirj8ip4/fNyUlJygAvFJgBo8pUw=;
 b=mRFYHKJ5oinKbAnM99p65d6XK6wM26jfZh0zZJd0CjqcDIySFMdhnlSG1vJ/bAtZTo
 PyqPyvSbnD1gizhnsQAfVsP+4pOIWvZNzTl2jT3hrPdNMJviGGnH8pIX5vffLddfa4rI
 m8VjfM8jWcjsto28P3e6lwZ/F9YnIfHDUQ7E9y8+Uap+Mt2/ldC5vviM3Jtg7r4dePC6
 YJji602l7IRWsEe0IAJ/ktxA3goPIOH5QfmC5WMSFG0i/6ZTJiMJTA4c1MRioJXQlwKP
 SWz2MIvstZVne4FjuuAEY2NTTY6q4vmlj8FBtk0hErmgfgnLLokLAPHOrcrRuQqwbjx6
 QgZQ==
X-Gm-Message-State: AOAM533mvoweUPOqL2YNpZPkdaC8Psd7rsVquFFsSygGmPg6hlcyPTAY
 yXIcH6H3lnUnJvjlDAbVVJ4=
X-Google-Smtp-Source: ABdhPJz69R2gdRFIosU2NLTVPnddKtDP+M+uLghaYEtmdn2y8rrTOtAPAwVEj93zlI+Mhji4/oFSTQ==
X-Received: by 2002:aa7:da81:: with SMTP id q1mr3541263eds.14.1604689549687;
 Fri, 06 Nov 2020 11:05:49 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id h23sm1542924ejf.120.2020.11.06.11.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:05:48 -0800 (PST)
Date: Fri, 6 Nov 2020 20:05:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 31/47] memory: tegra: Add missing latency allowness
 entry for Page Table Cache
Message-ID: <20201106190546.GW65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-32-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-32-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:07PM +0300, Dmitry Osipenko wrote:
> Add missing PTC memory client latency allowness entry to the Tegra MC
> drivers.
> 
> This prevents erroneous clearing of MC_INTSTATUS 0x0 register during
> of the LA programming in tegra_mc_setup_latency_allowance() due to the
> missing entry. Note that this patch doesn't fix any known problems.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra114.c | 6 ++++++
>  drivers/memory/tegra/tegra124.c | 6 ++++++
>  drivers/memory/tegra/tegra30.c  | 6 ++++++
>  3 files changed, 18 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
