Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4541B6735
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8B86EA4E;
	Thu, 23 Apr 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257796E9EF;
 Thu, 23 Apr 2020 21:53:08 +0000 (UTC)
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Apr 2020 14:53:07 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 23 Apr 2020 14:53:06 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id 707FB4C8F; Thu, 23 Apr 2020 14:53:06 -0700 (PDT)
Date: Thu, 23 Apr 2020 14:53:06 -0700
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200423215306.GA8670@codeaurora.org>
References: <cover.1587523702.git.gurus@codeaurora.org>
 <20200423114857.GG3612@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423114857.GG3612@dell>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
 linux-clk@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>,
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

On Thu, Apr 23, 2020 at 12:48:57PM +0100, Lee Jones wrote:
> What's the merge plan for this set?

I'm not sure what you mean. My assumption is that first all the patches
need to get an Acked-by and only then will the series get applied by
Thierry... Could Thierry or Uwe weigh in on this point please?

> FYI, it's better to send all patches to all parties.  That way
> maintainers and interested persons can follow the discussion and
> progress, or lack there of.

Something I noticed with adding all the various mailing lists to the CC
list for this cover letter is that it is causing this cover letter email
and all its replies to not be archived properly on spinics or lore -
it's probably getting rejected by email filters somehow. Compare with
v12 [1] where I'd pruned the list considerably as an experiment - that
got archived correctly.

Any ideas on what might be going wrong? Once I fix this I can add all
parties to all patches knowing that there would be no issues in mail
archival.

[1] https://www.spinics.net/lists/linux-pwm/msg12131.html

Thank you.

Guru Das.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
