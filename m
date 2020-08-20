Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D0824C2B1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC676E977;
	Thu, 20 Aug 2020 15:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1C6E977
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:59:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f1so2531182wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AICl07wj2rdeLbaUuIr48jZgNAhD7HLePnLKN8bK9F8=;
 b=tsLxdfzxCwjLVxHgn3qI5G4hIZk9qHZpWf1J1AiCOy8Zky54N2orwqpU4C9WblVlVT
 fSSz5tZeeXEOBH10zNy+pDZjpGpEk9+3HFFWPPLrLmaPBi6prfv5igBsK9AHKlMnVa63
 0CQS1ZSIdnfE7ruNhtNX0SYyPPNPdni4KQjnHQKH1Unr0C0bwTE+PPKf2YT/Vu7PvCGx
 YZferAQDQZDcqMYrg4pqEfKtGoegMhQG2CNn56iqZtb9GdI4PNKwri8GWc14j6PkBA/H
 pcj5oyvZ0urJY2kjcLejShsqOmsw0El3oVxrRs1VfcTCkFNqNIJII/9t+mKNX0c3wJhm
 tu8Q==
X-Gm-Message-State: AOAM531+F0bYmt+KPl2xEErDDHBS8ny6Rt0z2YRH/u36f3bl/3AiAXDD
 7g9BMpcKQKkXmjnoAJd2Fgg=
X-Google-Smtp-Source: ABdhPJywyymogpnt/oOUmaLTWNdzju8F9YvcCdpX66tCuBP6i1vn7QobEV9VEvGit4tTroGXYziTeA==
X-Received: by 2002:adf:b353:: with SMTP id k19mr3772990wrd.159.1597939158768; 
 Thu, 20 Aug 2020 08:59:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id l11sm4693828wme.11.2020.08.20.08.59.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Aug 2020 08:59:18 -0700 (PDT)
Date: Thu, 20 Aug 2020 17:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Ben Dooks <ben-linux@fluff.org>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andi Shyti <andi@etezian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/41] spi / fbdev / cpufreq / usb / mmc / hwmon /
 ARM: Prepare for multiplatform S3C
Message-ID: <20200820155913.GA21395@kozik-lap>
References: <20200806181932.2253-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:
> Hi All,
> 
> Shortly
> =======
> This is a continuation of Arnd's work from 2019 [1].  The goal is to
> cleanup, merge and finally make the Samsung S3C24xx and S3C64xx
> architectures multiplatform.  The multiplatform did not happen yet
> here... just cleaning up and merging into one mach-s3c.
> 
> I intend to take it through Samsung SoC tree so all Acks are welcomed.
> 
> Changes since v1
> ================
> 1. Rebased,
> 2. Addressed comments (including mine),
> 3. Few new patches.
> 
> Please see individual changelogs (per patch).
> 
> [1] https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=185855&state=*
>

Hi All,

I applied second part of the set which finishes this step of S3C
cleanup. Thanks to Arnd for the work!

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
