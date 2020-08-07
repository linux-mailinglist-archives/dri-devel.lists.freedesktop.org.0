Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355F123ECBE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 13:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1326E9CD;
	Fri,  7 Aug 2020 11:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E358A6E9CD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 11:44:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f7so1405349wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 04:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N8musXdCYjKNkXhIeUBafzXyS9da0FtZxFcd8OoiZgU=;
 b=rrtztMDOsNOWsHG04yHXmGmm9z1cPTkXYAADABcQktgze+Tbdqgxtsdih+mf0KBoFT
 vOR/hxCXRsNUsDafmuND0lu+Gobugg8gEJvEVPb7itN+/nxAEuruIV7RhbfEu7JeQ0ya
 3wv6XmnWq364UbgNOncbH9Ww2pLtN5n3mvcpnE1IPw4jlLwOtoL+x3f+XlKYHmyV4U6O
 x5HCexQjVV45jlrxLg5jXz73sbQRj4fDYH8mL/tNFbwowfwPB+542IuyCfMJWLU1lpGX
 3wVwbeYrDP/CQuzMjpqdhs3dJUnLm8Aoqwg7xu0vmk/i/Z/kvctyBw6dCxdnE9SZcDte
 8OsQ==
X-Gm-Message-State: AOAM531v17yZ9clXirfL2qmmRaXEUd+oT+OsWviyaX7MDyCrpZCHKV+w
 Sy4Omnm8yoBBc6I+NenxeWs=
X-Google-Smtp-Source: ABdhPJxvn7J2DKLgtpo4L81vi7ot+MvhlFdzMe5TulnmTigW2FE/oEUvy/2eSWYpCzwErtyG5KFlaQ==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr12351441wrx.277.1596800656407; 
 Fri, 07 Aug 2020 04:44:16 -0700 (PDT)
Received: from pi3 ([194.230.155.117])
 by smtp.googlemail.com with ESMTPSA id i66sm10625022wma.35.2020.08.07.04.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 04:44:15 -0700 (PDT)
Date: Fri, 7 Aug 2020 13:44:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 00/41] spi / fbdev / cpufreq / usb / mmc / hwmon /
 ARM: Prepare for multiplatform S3C
Message-ID: <20200807114411.GA9589@pi3>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200807113330.GC5435@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807113330.GC5435@sirena.org.uk>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Russell King <linux@armlinux.org.uk>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Andi Shyti <andi@etezian.org>,
 Jason Cooper <jason@lakedaemon.net>, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-fbdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-input@vger.kernel.org, linux-clk@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 12:33:30PM +0100, Mark Brown wrote:
> On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:
> 
> > I intend to take it through Samsung SoC tree so all Acks are welcomed.
> 
> Any issue with me applying the ASoC bits and sending you a branch?  This
> seems like it might run into some of the subsystem wide cleanups we've
> got going on.

Five ASoC patches:
 - ARM: s3c24xx: move iis pinctrl config into boards
 - ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS
 - ASoC: samsung: rx1950: turn into platform driver
 - ASoC: samsung: neo1973: turn into platform driver
 - ASoC: samsung: h1940: turn into platform driver
apply cleanly on current next so I guess they could go through your tree
without problems.  Providing me a branch would be great in such case, so
please go ahead.

Thanks!

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
