Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEED2AB2CD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD92289664;
	Mon,  9 Nov 2020 08:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D19893EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 05:35:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i7so6162871pgh.6
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 21:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IJUnC1qet5XGxBxbk2JzSrwVUK3/0sjfx2cNNTG8d4M=;
 b=LstmlGWFsa5jYxw8Vkksf7r52gSPeNdq2rFCsHGIk3c7l0AwqeEGR2gU2Hu2jp53nQ
 Y9/SJc2XbWbXfLNrk3m8dwkMzOadrr18+gXJf6HMX70IUW4vYncHLxcCR110tbXhs55a
 EQhxbUj76xTKdvrpBlPVjubbEjZl+Y5zbMCqwugKbJnzkoNSIiP+wDGvpyOw7QL37cSI
 4aW76kahFRWDdxouicRCqdqVzxB3wv8Aa83PxGUToWRNF9HLbIG9/Gni9TZvQv8NC382
 ydqorAlKhtADyq79PaRSMdNHK43d74XsaHTphlRarNe6XqB7vDtVzeq4Rj/iiWEks7Q4
 L/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IJUnC1qet5XGxBxbk2JzSrwVUK3/0sjfx2cNNTG8d4M=;
 b=L4S50fWkmGhhYBr/cX6iem2aKs4jKjvpTKrN4Fz0bMjNVGq3dQ1kyFsLKGDxDHQgZQ
 +W+zIdzdrbBWpQWqLlgK608UXwW2scrma1L0N0ClUXVLTTFDuTz+s1lp3y1+Ie4csSL7
 sVnCJHo6/wBIfvgXLL3Ho5rRhXyxEbDGnvfG7Jtb5zoyw86ZpPtuTa9X+gzN/XSXHTKa
 q/p6aXOpI72uTuyQqyqAZW5D054xe3lGG4LcSBhF+VtTqA9a326Ta9C9locHOccz/Oos
 oi9baHZTKyh5Chk3ciHyDUeYziiKDkBq6TI7/zuczZkO4Q0jLdgvibf415jZ4WruZbR5
 2EOg==
X-Gm-Message-State: AOAM533zNmAJO529LgDLsjlIIajTNQGCBlSLjrcJuRtf3F5N2Xub+G7z
 fGJPEHuhXhnNaR/V/xQfjvU+lg==
X-Google-Smtp-Source: ABdhPJyFGt53uc1RwZIWqNmOTufjNhL6TQqNB7dxd3bb+lEFg1bJQu36bKwaT5Mj2KBhPEtooXzYdQ==
X-Received: by 2002:a65:4144:: with SMTP id x4mr11299072pgp.432.1604900149527; 
 Sun, 08 Nov 2020 21:35:49 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id e10sm10531236pfl.162.2020.11.08.21.35.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Nov 2020 21:35:48 -0800 (PST)
Date: Mon, 9 Nov 2020 11:05:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 17/30] mmc: sdhci-tegra: Support OPP and core voltage
 scaling
Message-ID: <20201109053546.xupmmsx5qccn46tr@vireshk-i7>
References: <20201104234427.26477-18-digetx@gmail.com>
 <CAOh2x==sy1w7_oEV8=toC6uQnSN44wyOixbP_X0BrMsnm1AUFg@mail.gmail.com>
 <6fa54ce6-d5ae-d04f-7c77-b62c148d92b7@gmail.com>
 <20201106061513.uyys7njcqcdlah67@vireshk-i7>
 <a6926456-8bce-a438-bfaa-be334208f004@gmail.com>
 <CAEExFWsp0DWw1yO84e3vzr_YZkqkd+pyPfQQR3J2W6n3wTX4Jw@mail.gmail.com>
 <20201109050010.g47zojh6wafvwqva@vireshk-i7>
 <c584b301-e052-7f01-335d-8f9160865198@gmail.com>
 <20201109051014.oa6bt4g3ctm2hnuy@vireshk-i7>
 <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4476fed9-a356-b7f1-32ee-935343e23038@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Frank Lee <tiny.windzz@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driver-dev <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "open list:SECURE DIGITAL HO..." <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09-11-20, 08:19, Dmitry Osipenko wrote:
> Thanks, I made it in a different way by simply adding helpers to the
> pm_opp.h which use devm_add_action_or_reset(). This doesn't require to
> add new kernel symbols.

I will prefer to add it in core.c itself, and yes
devm_add_action_or_reset() looks better. But I am still not sure for
which helpers do we need the devm_*() variants, as this is only useful
for non-CPU devices. But if we have users that we can add right now,
why not.

> static inline int devm_pm_opp_of_add_table(struct device *dev)
> {
> 	int err;
> 
> 	err = dev_pm_opp_of_add_table(dev);
> 	if (err)
> 		return err;
> 
> 	err = devm_add_action_or_reset(dev, (void*)dev_pm_opp_remove_table,
> 				       dev);
> 	if (err)
> 		return err;
> 
> 	return 0;
> }

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
