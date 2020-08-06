Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D623E3AD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 23:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076C16E91E;
	Thu,  6 Aug 2020 21:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C56E91E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 21:58:08 +0000 (UTC)
Received: from mail-io1-f53.google.com ([209.85.166.53]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MHoZS-1jyngO0PFm-00Evsz for <dri-devel@lists.freedesktop.org>; Thu, 06
 Aug 2020 23:58:06 +0200
Received: by mail-io1-f53.google.com with SMTP id v6so35925730iow.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 14:58:05 -0700 (PDT)
X-Gm-Message-State: AOAM532PmMMEItalWAOcPzHL9eW0RMyDfjW2ljWpkLS28T0NsxNNb6ew
 8vlzLW8LjZ/RG0uOvwekyGL6SWCfqQxev9tCpn8=
X-Google-Smtp-Source: ABdhPJxgZbzUezUsGBZmsJqABgfct0c0RuS1c93rT/QNCas4jRck1zkiTI9WMDo0l2MxpsdfxgH1+JL7NncTMPc4G48=
X-Received: by 2002:a37:385:: with SMTP id 127mr10191416qkd.3.1596751084212;
 Thu, 06 Aug 2020 14:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200806181932.2253-1-krzk@kernel.org>
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 6 Aug 2020 23:57:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=KXyeb=fZNkHBJ0wUT1fr0TSS5wX=wuXz9y3kSkLQQQ@mail.gmail.com>
Message-ID: <CAK8P3a2=KXyeb=fZNkHBJ0wUT1fr0TSS5wX=wuXz9y3kSkLQQQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/41] spi / fbdev / cpufreq / usb / mmc / hwmon / ARM:
 Prepare for multiplatform S3C
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:ojnrxcBDWuahkG32awLXbg1UhBwQLGPXMAPGRREA2UBE+6fcg14
 GD8WCVhCgIANC5sGcyc+SBfdNZnzJWmpJc5cGrFcbAYtl+acnjPpBwjSwzJnwjTh3DmiNLr
 G8hmjn3XkGvECiFBU43E91BY3eEzKnuzfKDzlbPnROJOOm2w6adRXzhiu9TOeHoNepprGaW
 kLMutDfCldL97sxeRt/PQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3qasnTit1JA=:/Gw+OhPeLfW+QmRETZ0i4h
 HMn7Fvn5gT1P9CUlF1fn/8gcEDTqlY+6EnwfN6rnpDHOHS8/9OP0MMHZRG1BjchXTpnEvaiuM
 f4Amkla6oFJryVtp0HzVT2yj9qNwMJhw4/oWTGo5nTWu8rrydPBKvuekkTmvtEZ9qv4IgLnWB
 VeH8a4r9F0aFwDXxbpwQ42ghTpVl+YzIgog7DQ/kcQ/RfuM0Gf3YDQHv1krj1A+xcGsNwslyV
 qZDpNOnlwe7BJvQy5ydIbhJZKEXQv+DGrWEgtW5hzk5dQA8xeq+d77mNnwNVuUz4bv/aEsslM
 KEWj22XkNF2EmflQBbjY+Qvc7P7uLDTmLpBtNvNQLCMFVYpy3+TSU60w6AhqbJYmMXv//qUQn
 uEybnV/YDQ/7W46S3yYeK+8EQnMXgxPD7rSeavmbKnsaDS2OUbAjEGYKxBA9Qq64tVOVMCVtD
 h7EMpJGl9xfAcre6VMYZKWzwYNxOFgAkQdojP7KHahXBroUVBUJoK8VLSFtgRb0uXuzxl7CDN
 quucyB1h2qMjYaGYB+Ca7hthVwQ6u1zZ6EEcHbVRGbniFLwG/OXMvg4jVjYWH0NhB4emz+toc
 5uba9d2N1Y72tzoGAkRQxzpiNpGO/T/Y0s5+RfPgDZxqby/mWfcynjq4QoCRjlSyGvBGciitT
 tNE7kzj8O03h9PpfpYzfzqWBHSQpzNGZ4cK/aUOEw5d59BWCnAbkCVuMuZxFjCEgH8IR1kSH4
 WqmxfDQIBSiB1a36uF9v8jbDqvbzgze98IJRxDwT96kBY0cX3B9pSLGK8XYIsdwVmCO9yf3HI
 hbtR0SuSKc2+vei+arARdcSJJFdYY80sXXzfgEqwDey1qh5umUmjVlxeUs2jEZgsFjQdjvIy1
 7tbR2l6O4mv8ogEc4qgHT7FN2Dobq6GPj4TOw+jiCf5Ok697bMpUP83vWKlVrrAA7N41qwz22
 1PRDOTCJSDiBK8YVJCD67MkV5MICX9NfvcFGQoFuR+IO98RIcvD5c
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Russell King <linux@armlinux.org.uk>, linux-spi <linux-spi@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Andi Shyti <andi@etezian.org>,
 Jason Cooper <jason@lakedaemon.net>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc <linux-mmc@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Ben Dooks <ben-linux@fluff.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 6, 2020 at 8:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
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

Thanks a lot for picking up my old branch!

All your additional changes look fine to me, feel free to add

Acked-by: Arnd Bergmann <arnd@arndb.de>

to the patches you added on top my original series.

     Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
