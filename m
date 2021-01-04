Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665B2E9209
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969E389E59;
	Mon,  4 Jan 2021 08:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4F89B95
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:33:41 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id lj6so9589629pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QTXH4ZBabQXPlZIujQgKbnRJD3TC6IE68x9pqFmtBcY=;
 b=phkZiroMjb2C8up3DUYIfoVF7kCXntKeedQ4qiwCI2pD9K7VSJidQcWn23Gd36gRLu
 /fWMAiXKOorzKGEcjKxgRVN69jmsgCswRLd1PZHJk2DO3LA7ti3Q1douYtKd7/7hD7kq
 gcTuSPuDvuz9zV5Zlw+xtChK4dRUnNdcroRf7ZCeJguS/gqE6p5/O4ufMsDKo5VLRviX
 Uh23VTBAvWR/YeCE+EP7fpoAj/MUUaaecGERL8h5TkFysk5tH8zVhxlSGE3eSfTqz/tP
 VGyt/7c6LbkOdrgf+A/oTrrpiKQcBJZhRojOMrajKCCk0d9mtZve3Kkj+Z6i6yEtP6DC
 V4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QTXH4ZBabQXPlZIujQgKbnRJD3TC6IE68x9pqFmtBcY=;
 b=kZnyGQzHdKdeNhJEuu2ZLm+t4B1Y67so1/hgGyPRS6/y9TRiD9hqCncGzoYmeJnHJq
 ePfWvsfnqkNJJEPp2a1MNI/dhXrRILPOGYmBqd9nS+0O3zAFaf4MWzFBMXGg6NHb9nYc
 Qhga/qxzwSIA7J+BRsqH+j7kbyL5OddiigAXd5YW6rkqWAZlkHnmkE6GJiByVa9m3hzt
 KWZ8EroVtLPdTflv0RLN7yiYkFrzGWDEc5lqdDcVrxKvNCn8ZUT8FWkeqMug8hcXz2q2
 GkF+XpXWI/pdcXHW+MkP2FfPKooc6iO20mCWfPr9XU6fLViM1dTYU14/bVaj1XWiph0m
 +Vwg==
X-Gm-Message-State: AOAM531vKm+ljtS4Nd/1lZohdzrG4sJWZhpqMghjR0IJlWOryUKjTuwS
 zXMK8mpJZo+cqpuQP27q6wcY4A==
X-Google-Smtp-Source: ABdhPJyjI2QljyiTHpicHkoa93QDvCtchRU1S1nSROelwSY5UUcsp+hu6LfLrqtbg1mOM7IFq7YKxg==
X-Received: by 2002:a17:90a:6a48:: with SMTP id
 d8mr27589269pjm.130.1609745621425; 
 Sun, 03 Jan 2021 23:33:41 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id a31sm59966345pgb.93.2021.01.03.23.33.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:33:40 -0800 (PST)
Date: Mon, 4 Jan 2021 13:03:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 00/31] Introduce devm_pm_opp_* API
Message-ID: <20210104073338.bbswxbewuxpj4ad2@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
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
> Hi,
> 
> This patchset add devm_pm_opp_set_clkname, devm_pm_opp_put_clkname,
> devm_pm_opp_set_regulators, devm_pm_opp_put_regulators,
> devm_pm_opp_set_supported_hw, devm_pm_opp_of_add_table and
> devm_pm_opp_register_notifier.

Please also mention next time to all the maintainers that you need
their Acks for their patches and that all these patches should get
merged via the OPP tree.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
