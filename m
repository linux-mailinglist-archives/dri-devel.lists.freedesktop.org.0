Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A02E07F9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C56E841;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B426E141
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 06:42:56 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id z21so7772064pgj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KcaYAZQ+AoDm9Jn9wokihL78HxRFsW+AhH8/h9c+1wA=;
 b=uR9O2EdLr4l+d+J8DstQgDPJiLPo1oLcBQPLe9jc2o++kue1dXZm05qdnvOIStsjzl
 LxGtFbuTHlEcESPdNBvcsJRRBnhcQ8k3qWJTtqEA9Vsn1CHhzGmqcZCHzFhyuPgQch7w
 ZkBOnZ/IbbjQIn9Vy+DguNDJMixeiercHvgjsHdWn/QJte3DEZIiQdkulmFdS91Y43F1
 vk9hBZZWmvz96CbVxWwTN4UuBDgRDzuMiUl3t0NwETYOL4uelpc2l16EUrg/gYEFZxFx
 bnyZzEsIobaE2fETZkKFj8q6rzCf48SfT+Z3B1NG0u7NFx+M3/vmtvFpKgR2lL4ATFSB
 92qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KcaYAZQ+AoDm9Jn9wokihL78HxRFsW+AhH8/h9c+1wA=;
 b=FJGOhMjKRAZeiPt26QCb0C4rS53rkKoIZQvkjg3C8w+JpcloZURbo/LpMTrqtdtqw/
 x71Uoee4+Nt84pf+ITZqpkscR92ouSwqBIN8mqCesU5ZDcQuAWAIK5aQ8X4LFEvvCohP
 DNfIxNxnkB3sDzH+lStcpQR4d3rJ2rrhCxac/CVXMRo6q6I+jku2aV3PHTZH8LGldMP9
 p2OXkl3FT1kRv6igs0u3ghADj+vZuMdq1DKeL33iArOj0mx7PJEshak+CpJU4HjPmZt6
 DPHzjcuoju9DnEMmsUnJx/NigAVlNm2Rc/WPEE2lBl3KU8bWuZw09q/v/R3s5bjjyxg/
 VsLQ==
X-Gm-Message-State: AOAM530fGzbhV64GJ4ngYhwRO02Xi++x/qyKRGa4o/ermo53Av45YykS
 oZLpBKyw6aZZds1vTtpvKGHcpQ==
X-Google-Smtp-Source: ABdhPJxBR/Z8Ma4PVg9ZbczgXmM2X91HSAXGveL8f8GmkDzgajqaFrdpkcD8mdHIemFfHzAJ0M1KFQ==
X-Received: by 2002:a62:61c5:0:b029:1a9:5a82:4227 with SMTP id
 v188-20020a6261c50000b02901a95a824227mr18914548pfb.61.1608619375827; 
 Mon, 21 Dec 2020 22:42:55 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id 198sm18893827pfw.29.2020.12.21.22.42.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 22:42:55 -0800 (PST)
Date: Tue, 22 Dec 2020 12:12:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-12-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
> levels don't start from 0 in OPP table and zero usually means a minimal
> level.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Why doesn't the exact version work for you here ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
