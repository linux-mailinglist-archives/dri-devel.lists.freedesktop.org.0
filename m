Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBD1997CB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 15:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81426E82C;
	Tue, 31 Mar 2020 13:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED16E82D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 13:48:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f6so2721286wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=laYdX8SYLKwokEzwLodIvxGl4rv4+SIsd0vubo9f6sU=;
 b=KAsoI0+ee6qrMG/GK3qGzIOQZiFmb1UlAzTF+vx4sKRB7hV4NdcmkyMjXegZ+Wf+GW
 jNe+DPxQDMBJhFQYPxHvEg8FvLATvx/AJQpTnOBjGkLXaZvApbMCDur7nkBjXbSh4OQu
 ZwfpVLsnQEB232+mKzbPYABGmSnSg/GeoW/SUvP31zJepNBCZs8mQeOmoBLg9/YQg2Ub
 5WI7kL5wnPiuthj808OT5+SYqJQX6cL6xkYHq7DYcEbk9n36sAyXn55ItE2/T/R03iuF
 P83esGL//YfzvdyRkeyo4e4qPxiIiZxfWICDAk7damLOOrqmr0/mwql2n5+KyDFEGq0V
 r0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=laYdX8SYLKwokEzwLodIvxGl4rv4+SIsd0vubo9f6sU=;
 b=rxrMiAnPXgw/dXZ0U22pQ26DNO+YV9f1X9H/T5N0zqIOTu4mzfXcMwiI7QowkBfFWX
 4RnEi3OkswapTsae2U1mmTS9preS9dr4PBSoxAT+UeYG2Wgc84B1WeVXZVSiqqPcxysa
 gHlng5PVtjLtJC+jQXBda2EpIqH76QkluKpvW0ysvaMOu+B+Uib1lT4lRBi7qL1NEzSU
 JFfBr8qMGVHMVq1q6AVT3NWO+MgTsWU7tg0F8rsBwiCoFNJhjjMwwCGNcvaNiUe6Gvjo
 s3HrQp0vc0vV/gdCxiEVPzp/cN8SmrpPCbKZlh+t/FRUO3i/mdS3qxz3ARRcuNtLtDo+
 YR+w==
X-Gm-Message-State: ANhLgQ0YIVg+VCw9nwldbOw0IVRYlWKTnGlRj+3zA60G8Dhrcua3v3+A
 W5O0uqnTYm6liTpF2NEJIa8kxA==
X-Google-Smtp-Source: ADFU+vtWlastqoLteS210RbEXN0iDWNiyv+TlLVc7yqALe7NaemPCdM/9rCwUXyGtP+jZ7EGnESSKA==
X-Received: by 2002:a1c:7d88:: with SMTP id y130mr3774026wmc.5.1585662489028; 
 Tue, 31 Mar 2020 06:48:09 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u16sm27335524wro.23.2020.03.31.06.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 06:48:08 -0700 (PDT)
Date: Tue, 31 Mar 2020 14:48:04 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v10 00/12] Convert PWM period and duty cycle to u64
Message-ID: <20200331134804.xxrjaestztcazalc@holly.lan>
References: <cover.1584650604.git.gurus@codeaurora.org>
 <20200321114703.GB4672@kadam>
 <20200330191506.GA29534@codeaurora.org>
 <20200330202636.njjo4savgzf3g6yx@holly.lan>
 <20200330210012.GA27611@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330210012.GA27611@codeaurora.org>
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
 David Airlie <airlied@linux.ie>, "Wesley W. Terpstra" <wesley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>, Kamil Debski <kamil@wypas.org>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Axel Lin <axel.lin@ingics.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexander Shiyan <shc_work@mail.ru>,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Mukesh Ojha <mojha@codeaurora.org>, Gerald Baeza <gerald.baeza@st.com>,
 intel-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Ding Xiang <dingxiang@cmss.chinamobile.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-hwmon@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Anson Huang <Anson.Huang@nxp.com>,
 Richard Fontana <rfontana@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 02:00:12PM -0700, Guru Das Srinagesh wrote:
> On Mon, Mar 30, 2020 at 09:26:36PM +0100, Daniel Thompson wrote:
> > On Mon, Mar 30, 2020 at 12:15:07PM -0700, Guru Das Srinagesh wrote:
> > > On Sat, Mar 21, 2020 at 02:47:03PM +0300, Dan Carpenter wrote:
> > > > This is a giant CC list.
> > > 
> > > Yes, this is because I received feedback [1] on an earlier patchset
> > > directing me to add the reviewers of patches to the cover letter as
> > > well so that they get some context for the patch.
> > > ...
> > > [1] https://www.spinics.net/lists/linux-pwm/msg11735.html
> > 
> > Strictly speaking I only asked for backlight maintainers to be Cc:ed.
> > I was fairly careful to be specific since I'm aware there are a variety
> > of differing habits when putting together the Cc: list for covering
> > letters.
> > 
> > With the original patch header the purpose of the patch I was Cc:ed on
> > was impossible to determine without the covering letter.
> 
> I suspect this might be the case for all the other reviewers as well -
> that they also would appreciate context for the specific patch they are
> being added to review.
> 
> I wasn't entirely sure what the convention was, so I applied your
> suggestion to all the files. How do you suggest I handle this in my next
> patchset? I fully agree that such a large CC list does look really
> ungainly.

IHMO there should not be a mechanical convention. Instead your goal
needs to be how to make it as easy as possible to review your patches.

Think about it this way: Each person in the To: of a patch (and maybe
also Cc: depending on how you construct things) is a person you are
asking to review and comment on the patch. If that person will find it
easier to review the patch if they are included in the cover letter then
either they should be included or you should improve the patch
description of the patch itself (sometimes both).

Either way it is about optimizing the patchset for readability. More
people read them than write them.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
