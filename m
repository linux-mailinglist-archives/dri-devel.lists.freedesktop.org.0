Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9D1B3A8B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 10:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CE16E375;
	Wed, 22 Apr 2020 08:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3996E370
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 08:49:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x17so644590wrt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VAkwYH5sNSEh8qmcTpFiukZBRUUgBymqA9LRCH0eLZ8=;
 b=FoDnzcixZTYxw7/SWMOripNwt3xjQ3RtNofHprRXRwaqWGlEOcT85Fd4A04qgfiK7p
 ZeyQnK7r6wHwJ+bR1e3arPvblA+RDmmBEONKxufJ/Wrzzk/u3YL3BKlh1xL57GV0EgNC
 VIRNHm1p2hXfWWlnQb/F7IMB5oa7ITdgbJj6pjorSr7AWKdw6sXUzPwh7ELpfrwK58SV
 XkD05vsZk/yYrMu33hDVB0Pv2eCFJ7rexox4rUM7LSBobFVl1nn9ba6BqZe27zlhGPX8
 K7J8OzyfTSfB5jJYYY+TrRBcDmLPXf04wH12mYb6Rm9ciilLYcCreN4cjzKQDXEsxux6
 6/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VAkwYH5sNSEh8qmcTpFiukZBRUUgBymqA9LRCH0eLZ8=;
 b=GCI3wpEaAKmX5IrEliVYCW9ue3jTEuN/qSO8zyTAE+2vzAE/8l5gbiO3AzZKp6L7ZW
 Lpq4sNNyScVjzawRTjoAOOyGDk6OyHNPwIN4I+8pspUN2jJq5F/uQ/n1eP7II2aGSIms
 4olt5Dg4iRKGJseyiDH5fHKvrBCpQaFmeGPxt9K5WfyYAwjBriM7NYIUsbHe+aU6SY9C
 3HchmXEirpO4rIfhk3yAWCzaKcGKjIkwCL+z9b8xQukuQ8aXnsc+RoCZ83Wj72bvLoAi
 pvPLzqh7nEXJQgvUnvtLDS034t3WX0RKo+sqjA9YaW+qfoJkh3rQHQQITUWlto2HsAI7
 UlxA==
X-Gm-Message-State: AGi0PuauCn/M+DdNdni0YQPFiM3F0uP1dc0Idbi27pVQ5obBULaI2Pfw
 JY3wN6/LiXgGzIT2vKVA4ZQKUg==
X-Google-Smtp-Source: APiQypK2uN0BHRAsrtI/nG1z7SN0x6m/TQ8d/ZoCVrxhzoALBWRlY25Sa9qHj+HJctvDKK3VQSDlUg==
X-Received: by 2002:adf:b1c9:: with SMTP id r9mr17797817wra.271.1587545377924; 
 Wed, 22 Apr 2020 01:49:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id p16sm7090901wro.21.2020.04.22.01.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 01:49:37 -0700 (PDT)
Date: Wed, 22 Apr 2020 09:49:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200422084934.ajh6yzs5mkzzvop4@holly.lan>
References: <cover.1587523702.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1587523702.git.gurus@codeaurora.org>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Kamil Debski <kamil@wypas.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Atish Patra <atish.patra@wdc.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Lee Jones <lee.jones@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 intel-gfx@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-hwmon@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Fontana <rfontana@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:57:12PM -0700, Guru Das Srinagesh wrote:
> [REQUEST]
> 
> Would it be possible for the patches that have already received Acked-by's in
> this series to be accepted and applied to the tree? I lost an Acked-by (in
> intel-panel.c) because it had a merge conflict with a new change that came in
> after I rebased to tip. I wasn't sure earlier about accepting single patches as
> opposed to the entire series en masse, but this event has got me thinking.

Has there been a positive maintainer review of patch 11 at any point in
the thread (most of the people you are asking to commit patches have
not been able to see the discussion about the actual feature these
patches are preparing for)?


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
