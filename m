Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3512E91F6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143C989CB5;
	Mon,  4 Jan 2021 08:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4521A892E0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 07:30:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id g3so14100691plp.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jan 2021 23:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0t5BFoNfCkknbg9Gdfco98fDaInDYPXgN3k5AAnXZzo=;
 b=rzg4DbiwiKrMuaiMfr759ux4SEDoL1Vr9OAHwaaNfZcMNcU8EWYgeGFze7JnOoOWTn
 /jniZYDFfeiS2RbqPKuMC6PSqhrYneqeqIshefFgLpSxsaURGC6jqu4KfDCZOcvINjja
 sY0FYgq2LYD66HwUIPobDZK16A2fRR0Lfg5LUtM6iYlG6G/jN7Kr5o4VqB+d/VL1mTJa
 K7xAKvdzTPT0T8ri8f4zmfaZQ0OCq/ECkmbV+Pdhn1+anfC2ki0qWbsNjyZz5gU1JLlv
 cG0rUJWbVk/+nAf2xXb4IpYwHgU1hC9LZiLzomisGCIa+boFxA567vjzpn9i9Bw5LPMi
 QQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0t5BFoNfCkknbg9Gdfco98fDaInDYPXgN3k5AAnXZzo=;
 b=BjESG4X3j271ADhakTIhWfTSJjB4xE5qmev+Q0BF9Poty0JK6qr5tUNFwVoyMxHdxP
 Np8yjQ/ZOflpjOYFbsdoU/zw5vbfn4ozA4V7HJONmkG9Oipkcc8Z168RnE7+W0G+MDNj
 SDYNRRTDBD8qWVKeAZOSdQrqT8bvAiCnW5AGHC53fJHDGZiGbBAO6eOn6PDBE5pGQmev
 GAkTdeN3uJHINOmBpA5ZJz/sZgy45U2iZGcGoyHaapbPRjGgj7kr10i5tBjCKA9YXf/O
 BIEup1W0o0eGVsrKyiwYT5vFt0gdEYd/woNBGCSolfiuOkWsL9r63cVdDeQDJ6/vAl+A
 b/MQ==
X-Gm-Message-State: AOAM530eYZjOgqkamkSRLBvPuPMgDY0rrDGxb9uTX3MIKtKpEI4SULg5
 /ID5Blz4KQUPeCQuO6lXvYA8uA==
X-Google-Smtp-Source: ABdhPJzizEfwxxFAdfGobekyn+UNS6a0sd2O/TTd5ud8jGQA0K4MRZ+iCwg+4Fg+cnMfI+GJ3lFQhw==
X-Received: by 2002:a17:90a:b110:: with SMTP id
 z16mr28243007pjq.167.1609745405787; 
 Sun, 03 Jan 2021 23:30:05 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id nm6sm19739846pjb.25.2021.01.03.23.30.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jan 2021 23:30:05 -0800 (PST)
Date: Mon, 4 Jan 2021 13:00:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 26/31] PM / devfreq: tegra30: convert to use
 devm_pm_opp_* API
Message-ID: <20210104073003.5kx73zita7laxpmx@vireshk-i7>
References: <20210103035445.23696-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210103035445.23696-1-tiny.windzz@gmail.com>
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

On 03-01-21, 03:54, Yangtao Li wrote:
> Use devm_pm_opp_* API to simplify code, and remove opp_table
> from tegra_devfreq.

Patches starting this one didn't appear in the same thread and it is a
nightmare to apply these now. Please send everything properly next
time.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
