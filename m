Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A22E35D4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65E489AC9;
	Mon, 28 Dec 2020 10:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C234489A14
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 06:22:57 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id x12so5166063plr.10
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 22:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bBQaI4eroTRmm0x4+2Q+qEFawwLNxWB2aEwv9ebwMhs=;
 b=cPdP7kkh/2GQAzg0cOAkSgg+4Z/Q6YFPDrT8cPEIWgPQcde3qUGxURpjfO6E1bHDX5
 X3avIcaIwpZe0l5RjuLs76tegwm2PWF2nIR/3NFqEyoyL7mMQKM38y/oXu8UPBoXDCBe
 owAlPnx2QEhE97fGYccJS79yI+KQx2U4UXdsmGweTOUwrLsDu9pmHU4Huwoutx9pTsoP
 8diXqSx2xAX1gQQbPKkftl20krrAxVSUChxQV7zKgsn7WSoMJGr4Sq7KmuEZCIbsqfdm
 KKxISWBxSfoIxY6pIT71NfdMH7ym7iMSKRQNzxwpLFNAeRNw43wKsq5DXii3GeV4pWs7
 Va4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bBQaI4eroTRmm0x4+2Q+qEFawwLNxWB2aEwv9ebwMhs=;
 b=BoobfninCc5qNul97AA4mydACC4auc+cytapD2+XGXliamw23WDUA8C+sRSAw0MC9u
 y6MJUZzbVkJhsDjewGJVuZ3auEPFH1JJGHEemATIST2KM41+7PoVay8WyE5dbp1vbzGY
 ZXJLTmBj1WAiEINpq95SdJQooEzqLP4HIm232SpvMywF5Cwvp4yuTRtS9hg5c4KBffWC
 Otl73aKkpG1nygLmEv1aV+UTKuzTKw1KwcBkgtzBBo7BTBwSBR75LicsqA2win9MemwO
 zXWDhJQU+wNEwMc4ZsApeNt3q5yA6vceCIz2eWfGPfOl5M1F7BFy2rVhKZrgzm2+JEpa
 OVEw==
X-Gm-Message-State: AOAM533I7gLhsb+zEzRJPvTzh1SOtHefTkYslC4Ycapjc9+zCU0/5hI8
 R93RQqEg1OEqWfuP7k4KpM99HA==
X-Google-Smtp-Source: ABdhPJz34QQgPHpCVQubAmFzTB4NyEMYwCvkashDNlLU+9Me4PGHkK6SRqtiBSWyGNrVtvJ0I4RJeA==
X-Received: by 2002:a17:902:7291:b029:dc:c69:e985 with SMTP id
 d17-20020a1709027291b02900dc0c69e985mr20695263pll.33.1609136577345; 
 Sun, 27 Dec 2020 22:22:57 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id q70sm13313850pja.39.2020.12.27.22.22.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Dec 2020 22:22:56 -0800 (PST)
Date: Mon, 28 Dec 2020 11:52:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201228062254.ui727ka2ftijov4m@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
 <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
 <20201224064339.zngidobhstnlu2a3@vireshk-i7>
 <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-12-20, 16:00, Dmitry Osipenko wrote:
> In a device driver I want to set PD to the lowest performance state by
> removing the performance vote when dev_pm_opp_set_rate(dev, 0) is
> invoked by the driver.
> 
> The OPP core already does this, but if OPP levels don't start from 0 in
> a device-tree for PD, then it currently doesn't work since there is a
> need to get a rounded-up performance state because
> dev_pm_opp_set_voltage() takes OPP entry for the argument (patches 9 and
> 28).
> 
> The PD powering off and performance-changes are separate from each other
> in the GENPD core. The GENPD core automatically turns off domain when
> all devices within the domain are suspended by system-suspend or RPM.
> 
> The performance state of a power domain is controlled solely by a device
> driver. GENPD core only aggregates the performance requests, it doesn't
> change the performance state of a domain by itself when device is
> suspended or resumed, IIUC this is intentional. And I want to put domain
> into lowest performance state when device is suspended.

Right, so if you really want to just drop the performance vote, then with a
value of 0 for the performance state the call will reach to your genpd's
callback ->set_performance_state(). Just as dev_pm_opp_set_rate() accepts the
frequency to be 0, I would expect dev_pm_opp_set_rate() to accept opp argument
as NULL and in that case set voltage to 0 and do regulator_disable() as well.
Won't that work better than going for the lowest voltage ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
