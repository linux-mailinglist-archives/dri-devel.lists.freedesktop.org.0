Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549932E91F8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5617389E8C;
	Mon,  4 Jan 2021 08:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185689B60
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:30:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id t8so15968619pfg.8
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7x+ya3WlDYOlVbzunORT/RgtZi0Bw4k+NgmHAp25z4c=;
 b=WK0hoec2dEzKke+5KHU9JJOZX6GvW3D8DZ/jbKYdzXUAhDpyeTNlQuW/r2gOIuxxzz
 FGTPuLxLDK3piKlDdhjpxwPB2AfzjEDnu0aaCENgjCdUfQ0/xMGKvzQMD7KsBaJEmWRF
 gvw9A0Mwnq/9ilJVR401IyxPTbullL2eD9n84L3t2H3KjXqRKJQ/Bpa7Mm8m9PX8qTzD
 KC8oR20XP3SXsXHtcMIjmh6GdfDaoTqtRuouS9gkf/uEsP06ecifEAfU29rfpoMT6xym
 K9fiCTuvtMIb9me9wnluF4yzaW1ZY4WsHSK4ven/vl9LD05j/3tR1dkak46f5OClKtJT
 5EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7x+ya3WlDYOlVbzunORT/RgtZi0Bw4k+NgmHAp25z4c=;
 b=IqOlEhb58WlXwgoKCzBkcvo4eLokDp8uEFok5Q7/NkT9Maoc/5IFmobMDqE/W2NmnN
 rxKT0eogAPdVIIXAVr0IxPLF04x1JS6kajID+sAwwXIQ8rZFLm8JIJ+cf7HskWB25vGd
 zNMeYYmwq1JknGsA4gliRYEUyLgtgvrEfnBi1NQbNwkYIJ/6KIE5Ip5DxFm/O/QTtYBL
 HwNJu7ttveclXaxYXSJTRsbR28WvqmuwlcHMeTW4RZqCL+kdkAFeQNTkiWCGUR/MwQho
 tua79M31IZ8RxkiupLRU6BNGCoUXTCkJEgf9pP8EsDVyfEmft3+kULBjq9bwrRFLNUq8
 /Lqg==
X-Gm-Message-State: AOAM532IT0hwfTZvo5E48ilzsqP9GF5Tqzp2wEhJ73klon7HsSJkmOWx
 6OPALwFwxOlRq+rGDDCpNv6NUA==
X-Google-Smtp-Source: ABdhPJw8EZ4eSCzESWNyniO8jgscATypf3SyqMk99sQMoYX+wFrC0dRQGUi39G/8m/OrT7kMrwuZRA==
X-Received: by 2002:a63:5805:: with SMTP id m5mr42352866pgb.352.1609745446550; 
 Sun, 03 Jan 2021 23:30:46 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id dw16sm19867854pjb.35.2021.01.03.23.30.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:30:45 -0800 (PST)
Date: Mon, 4 Jan 2021 13:00:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 01/31] opp: Add devres wrapper for dev_pm_opp_set_clkname
 and dev_pm_opp_put_clkname
Message-ID: <20210104073044.pqrkprqsh3qetgwe@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-2-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: nm@ti.com, ulf.hansson@linaro.org, gustavoars@kernel.org,
 jirislaby@kernel.org, airlied@linux.ie, linux-mmc@vger.kernel.org,
 stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 bjorn.andersson@linaro.org, natechancellor@gmail.com, thierry.reding@gmail.com,
 tongtiangen@huawei.com, groeck@chromium.org, marijn.suijten@somainline.org,
 digetx@gmail.com, steven.price@arm.com, mka@chromium.org,
 chandanu@codeaurora.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jonathan@marek.ca, harigovi@codeaurora.org,
 adrian.hunter@intel.com, vireshk@kernel.org, linux-pm@vger.kernel.org,
 kyungmin.park@samsung.com, krzk@kernel.org, jonathanh@nvidia.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, linux-imx@nxp.com,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, broonie@kernel.org, rikard.falkeborn@gmail.com,
 kalyan_t@codeaurora.org, linux-tegra@vger.kernel.org, varar@codeaurora.org,
 mchehab@kernel.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org, akashast@codeaurora.org, rnayak@codeaurora.org,
 parashar@codeaurora.org, tomeu.vizoso@collabora.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, rjw@rjwysocki.net,
 agross@kernel.org, linux-kernel@vger.kernel.org, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, shawnguo@kernel.org, georgi.djakov@linaro.org,
 lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-01-21, 16:54, Yangtao Li wrote:
> +/**
> + * devm_pm_opp_put_clkname() - Releases resources blocked for clk.
> + * @dev: Device for which we do this operation.
> + * @opp_table: OPP table returned from devm_pm_opp_set_clkname().
> + */
> +void devm_pm_opp_put_clkname(struct device *dev, struct opp_table *opp_table)
> +{
> +	devm_release_action(dev, devm_pm_opp_clkname_release, opp_table);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_opp_put_clkname);

We shouldn't be needing changes like this, please drop them for all
patches.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
