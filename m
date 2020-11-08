Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A0E2AAA4A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 10:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1548B6E09F;
	Sun,  8 Nov 2020 09:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AA96E09F;
 Sun,  8 Nov 2020 09:25:36 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07A0022202;
 Sun,  8 Nov 2020 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604827536;
 bh=0Re+BH04OjvQtiodOP0PAVO/kqbxE/PMUbtENeeHUCU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T8aftoYJoOfJoY2D59wtyqCFPrcSPDuCqBe6z9Y88z18itxLZYrLQQoUiySYprX/w
 CeltL21788RGxrGqCPGHjUWJsuUW/aiyLgkfQF5xQteJWVIw4gGxwp93kbsT47/9ed
 KFVVrs14i0T/haKa/knwEHH/Xo7Crf9KJaPhdmXY=
Received: by mail-lj1-f174.google.com with SMTP id m16so6336973ljo.6;
 Sun, 08 Nov 2020 01:25:35 -0800 (PST)
X-Gm-Message-State: AOAM532Yqlkt5bVJ7nyoW1dQiotvMJeoA6v1HEIKTKFzQ5UEioeT4+xM
 otb1zsiTOcFE7GNRKoFfZU7ntD5dq1KxL8c4Ng0=
X-Google-Smtp-Source: ABdhPJyddR8brDR4uTwLcrWRTsQ0eYz6SRGBrDUoAv5c7VKMt2AwiBlznvTTelNyXgQ/X1oyJ30XbCrkOlR4o4w9iyo=
X-Received: by 2002:a2e:b536:: with SMTP id z22mr4077018ljm.177.1604827534166; 
 Sun, 08 Nov 2020 01:25:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604646059.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1604646059.git.viresh.kumar@linaro.org>
From: Ilia Lin <ilia.lin@kernel.org>
Date: Sun, 8 Nov 2020 11:25:22 +0200
X-Gmail-Original-Message-ID: <CA+5LGR0UwGUeXPw3Jbd7=VkY7fY_rKV_YjLpWV4GbHnvP23Ejg@mail.gmail.com>
Message-ID: <CA+5LGR0UwGUeXPw3Jbd7=VkY7fY_rKV_YjLpWV4GbHnvP23Ejg@mail.gmail.com>
Subject: Re: [PATCH 0/7] opp: Allow dev_pm_opp_put_*() APIs to accept NULL
 opp_table
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, digetx@gmail.com,
 linux-samsung-soc@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Ilia Lin <ilia.lin@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-media@vger.kernel.org,
 "open list:QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096" <linux-pm@vger.kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Gross <agross@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Ilia Lin <ilia.lin@kernel.org>


On Fri, Nov 6, 2020 at 9:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hello,
>
> This patchset updates the dev_pm_opp_put_*() helpers to accept a NULL
> pointer for the OPP table, in order to allow the callers to drop the
> unnecessary checks they had to carry.
>
> All these must get merged upstream through the OPP tree as there is a
> hard dependency on the first patch here. Thanks.
>
> Viresh Kumar (7):
>   opp: Allow dev_pm_opp_put_*() APIs to accept NULL opp_table
>   cpufreq: dt: dev_pm_opp_put_regulators() accepts NULL argument
>   cpufreq: qcom-cpufreq-nvmem: dev_pm_opp_put_*() accepts NULL argument
>   devfreq: exynos: dev_pm_opp_put_*() accepts NULL argument
>   drm/lima: dev_pm_opp_put_*() accepts NULL argument
>   drm/panfrost: dev_pm_opp_put_*() accepts NULL argument
>   media: venus: dev_pm_opp_put_*() accepts NULL argument
>
>  drivers/cpufreq/cpufreq-dt.c                   |  6 ++----
>  drivers/cpufreq/qcom-cpufreq-nvmem.c           | 15 ++++++---------
>  drivers/devfreq/exynos-bus.c                   | 12 ++++--------
>  drivers/gpu/drm/lima/lima_devfreq.c            | 13 ++++---------
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c    |  6 ++----
>  drivers/media/platform/qcom/venus/pm_helpers.c |  3 +--
>  drivers/opp/core.c                             | 18 ++++++++++++++++++
>  7 files changed, 37 insertions(+), 36 deletions(-)
>
> --
> 2.25.0.rc1.19.g042ed3e048af
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
