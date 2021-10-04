Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFDC4207F0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 11:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0066E97F;
	Mon,  4 Oct 2021 09:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3643C6E97F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 09:11:32 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c29so3542463pfp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YnXBnzRi4479wrP+sOZpLMZLpiMj5aSP2rgmOi0KU+Y=;
 b=yHS0nO7iFlQxxeohVMKV6PWXnBayEsi9lK8tSdjyStFeIxmYN5rIMZxWjWE8H9QfQ7
 AvniVHR4oVvflXPr7rVbf8sVCWvLQiAfD2PqZZOaMZZagxylmkSlHyBj920ay6skehmA
 lwPjTUVi6b1oJKkZT0ky+bzsrvrsH1XTsPU+7POECpWl2AWydruKqWVrUMQtVvyTgJNZ
 9cA08qnu4tcOpHZUG2y+ws6DGVRR6nnOd2Q7S631komf0wGsVpsnKC0k2yEC97ewcBee
 Rlj7VnjufTy6C0syx9iS4lMwwcQ6JWoSgRGxLLVZ4yopWw1R7D8NUTmmgynLt2Yuhptl
 CQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YnXBnzRi4479wrP+sOZpLMZLpiMj5aSP2rgmOi0KU+Y=;
 b=oUwzqtBcWJUZfJ0uqowe46FMenKoGFTJ6FH4f6g2w02HKxvesQ1urpTzcfXMdflMfT
 SgRVHB9QSQxWfrll9s8YIk19VaulIpPwcDOJ0CKN1NkO5knUQi1fbP0NmlGoJfDvxBhL
 U9QBKSpYP5ZDLOhgP/Ebr6ROhlLlv2aEBSV8bpn6M9FNIH96mN0WP9T/JMCC3qpxzc2o
 ZO/K73Z8JuaElQvTGrJ10tO+QvdG651o3eYolPgVCpXusl1NAajjzz6DcxhodQbMM2mP
 Jj21hFiJoso9M2WYGOirZKcLs7CUH9sc41W8apD9WHUF1TyIXjrTFvLkUVbq5ZDLH12F
 b1qw==
X-Gm-Message-State: AOAM533WiF1SWHhHHeopcXWwSHP4SGPTHnELCx27WB70yG5/Mj6dplXw
 DmPMaNPkUmnx1QnwMW1Ear7Q9g==
X-Google-Smtp-Source: ABdhPJxO8fMguXUXH6Qb+6kH1fEGOWCwG/KzlAh+unxySsrzptYsUWr9XN2Vqt7ITaHGghNVJjw0VA==
X-Received: by 2002:a05:6a00:16cb:b0:44b:bd38:e068 with SMTP id
 l11-20020a056a0016cb00b0044bbd38e068mr25041257pfc.34.1633338691658; 
 Mon, 04 Oct 2021 02:11:31 -0700 (PDT)
Received: from localhost ([122.171.247.18])
 by smtp.gmail.com with ESMTPSA id p48sm13584576pfw.160.2021.10.04.02.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:11:30 -0700 (PDT)
Date: Mon, 4 Oct 2021 14:41:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v13 00/35] NVIDIA Tegra power management patches for 5.16
Message-ID: <20211004091129.fhlfhsddzk5fakuj@vireshk-i7>
References: <20210926224058.1252-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27-09-21, 01:40, Dmitry Osipenko wrote:
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
> 
> All patches in this series are interdependent and should go via Tegra tree.

So you don't need any OPP changes anymore ? I just came back from
vacation, don't know what you guys discussed in between :)

-- 
viresh
