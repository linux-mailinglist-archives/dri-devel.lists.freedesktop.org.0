Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B029A768
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2126EB38;
	Tue, 27 Oct 2020 09:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164C6EB38
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:10:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id t20so611502edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=80MoAHpRIeqlhSgipeCIrI2Ose88TsV9gGfciJMAXKc=;
 b=b1wzsFUq7Mp/A6stAsLF8XWAD07PkMQVSYf49Yvz6AyQaNYVIyd7UwVQzZteaYxYiy
 zFIjq+Kw1qwOZ4n8X/8ru/ZYRKsK5Wmq/0zt2OXId5iFv5Qlvnt2AGG9xOXVjOWxILRq
 Re9vjDTVJwCvYJOvgufw49+Ugkj54cqC0rK2d7bTMK/yJb1Wo+F5qSNPvNhg6qTzu8GE
 lO5OziYMA5kBObz1DYdKvfAMxEkTpMCm9BfOqGp5DuQGjNzp/Jmu8Gl/jAo4EFMGQoDR
 TegDfHfhsCUJF575v06OxkHB4o2iFyxrI1rdnXAdl4JBpy35+14Mi83pKmbKATqzBclf
 UkzQ==
X-Gm-Message-State: AOAM530rouve9X9geIgdTqPbd12uNHV+HQvKTNoPMJ3W6P+wjvEllakr
 wyL4DUHxKRhBFgHoEB07lcFwt9E2aKGI7Efd
X-Google-Smtp-Source: ABdhPJw03tfNHJKHN+5zfYTStAM0PG5LZVKh+f4qwv2zvA3WLkTvXoFxO2psRHm1gjX9/9IivEvJ5g==
X-Received: by 2002:aa7:cac2:: with SMTP id l2mr1176678edt.141.1603789846609; 
 Tue, 27 Oct 2020 02:10:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id dn20sm671769ejc.63.2020.10.27.02.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:10:45 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:10:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 20/52] ARM: tegra: Correct EMC registers size in
 Tegra20 device-tree
Message-ID: <20201027091043.GJ4244@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-21-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-21-digetx@gmail.com>
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

On Mon, Oct 26, 2020 at 01:17:03AM +0300, Dmitry Osipenko wrote:
> The Tegra20 EMC registers size should be twice bigger. This patch fixes
> the size.

Don't use "This patch" (this appears here). Better to use:
"Fix the size of ..." or just "The size should be twice bigger" as it is
obvious that you fix it.

https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L151

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
