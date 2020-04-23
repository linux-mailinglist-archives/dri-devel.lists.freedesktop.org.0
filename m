Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03D1B5800
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 11:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694BA6E486;
	Thu, 23 Apr 2020 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E945B6E486
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:20:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r26so5766217wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 02:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YlakRXlVVbSOqCFC3kOOGCPGNfzSZXjoj0rNmgz6JGM=;
 b=U1qjm/QVHI2Y9dwiNoTJmKsb9YPhRYHXTAWLYLkGIH/SzTUHXhbhd14spJ/p+AT+Kz
 1Y3UiQNE/wP3N7RTf4ky5usp+Z+mzVCP190WHmnxktH3svJLYkjaL3DnqcnYWyn+tTES
 aNp7OWzhG5ks/pe0LW9zyWINJtLQI4MlevZfR0iXD9/OAKd+w09KY8drrZYOsVUqflLD
 FUNx2smvIqNEyt9TfZ71n4B2ItG2+PhQqtMo15ebAvjQ3N8DWLA6fftKBFjKruiHCrrq
 e7dZjCRRvXZ2OBVmaDRK4zx1pLfBAUHhRG9DKAM3T4DhG5QlNb++e1QX45/61gr8REDD
 uuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YlakRXlVVbSOqCFC3kOOGCPGNfzSZXjoj0rNmgz6JGM=;
 b=gg6a4WEF+QTwWujm8exReeHUwTxLggoZOMVR3IUW27azvdcj+x/Hs7PTAa+Rdikadu
 8Mkoq9CB10ILvq1AAETPYhWk+xQ3UBE9cvYGNo33+8+fRvjaGVezStTIh6F47T1j7B+s
 pxGf6t22Wo1H7oGvLRXxS44/Jp513CCLhN56wRAzsMwfAy2oqdLUOdl/jD+Bf+DPHcaZ
 kau1rQAHaraWhuhab3smD1g3G2o9cQhYuNH2q50NMVB3ub0icBmg5lKhKJra9Hei1Ine
 E7q5ExrtGxW25WazT2ibojWo7wickH6RJ/5FwosZh1xziQDC8Nh6nO89+BlAC2fRIpPT
 eWeA==
X-Gm-Message-State: AGi0PubfulSFtk6S1Edi+UFdnTSIUkBEv8BdJmg2Xv4ldW7T3bmRariK
 xzaQo+BUFykTWOkFyosxPeOgcw==
X-Google-Smtp-Source: APiQypKxzJUFiraEGAMa9DKmpYFhbShKwe/xf4XMAY+FxNiGq6f3nSom2gJQinfqyhDKdWHVW8Vq7Q==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr3112235wmc.107.1587633637495; 
 Thu, 23 Apr 2020 02:20:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h10sm2738108wrq.33.2020.04.23.02.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 02:20:36 -0700 (PDT)
Date: Thu, 23 Apr 2020 10:20:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200423092034.2yrzbuiay66fizkx@holly.lan>
References: <cover.1587523702.git.gurus@codeaurora.org>
 <20200422084934.ajh6yzs5mkzzvop4@holly.lan>
 <20200422233755.GA11597@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422233755.GA11597@codeaurora.org>
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

On Wed, Apr 22, 2020 at 04:37:55PM -0700, Guru Das Srinagesh wrote:
> On Wed, Apr 22, 2020 at 09:49:34AM +0100, Daniel Thompson wrote:
> > On Tue, Apr 21, 2020 at 07:57:12PM -0700, Guru Das Srinagesh wrote:
> > > [REQUEST]
> > > 
> > > Would it be possible for the patches that have already received Acked-by's in
> > > this series to be accepted and applied to the tree? I lost an Acked-by (in
> > > intel-panel.c) because it had a merge conflict with a new change that came in
> > > after I rebased to tip. I wasn't sure earlier about accepting single patches as
> > > opposed to the entire series en masse, but this event has got me thinking.
> > 
> > Has there been a positive maintainer review of patch 11 at any point in
> > the thread (most of the people you are asking to commit patches have
> > not been able to see the discussion about the actual feature these
> > patches are preparing for)?
> 
> Yes. Uwe had this to say [1] about a previous patchset (v5) of patch 11
> which is essentially unchanged in this patchset save the dropping of the
> pwm_capture change.
> 
> [1] https://www.spinics.net/lists/linux-pwm/msg11536.html

Excellent. Thanks!


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
