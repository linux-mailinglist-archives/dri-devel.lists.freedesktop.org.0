Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4C1B6E61
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 08:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814FC6EA6C;
	Fri, 24 Apr 2020 06:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC876EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 06:45:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j1so9390208wrt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/5EA8JeRrfnBN/0CmhL4oF38pY+Q3bFW76pYDktcYRw=;
 b=qaQCGMbhx8IDtzfWMP5CF/r8O9LbhiUitChvAw/zVhGUUivyqv2bxkBE/bfelVQqli
 rXSz6aa4D5EX0GOw2I9J3tyKgfhlgS2vNz1y9W20o7KblT7NrV6yCUkoPgwX8Ecd20M6
 0Q6Ez7OKeodE6A89xu8rFs/J31VJ/HkgcFFymO4Xt3EKKXjIxTJX2Tk1EaVAISp1u2OL
 IX5sCJbjDAS8/EykFdYFoDqSGqyePkzGwnZHDCES0/z4ZdgDN5wDL0LNciszIrTFgiAg
 il1oRZcQc2R+C9PCfYSRp0ubEqrs0Tayi0JweMScifN57VNRBGAyvykFw0++KSYFL3md
 uhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/5EA8JeRrfnBN/0CmhL4oF38pY+Q3bFW76pYDktcYRw=;
 b=j4/1tc/g9HY2649L56QPXOz8k0Ts5xo2EpakFOLxIGyq/O4mJAaAe/4lewt6O0LT89
 Rq/+sPc/D+BsuMZEOx24U3bMq/PuYQxJmWGv0ZXkGGLAnpKq1NcDRSLO1vJOx74NWkS7
 UgECKYAKbEk3cJO2ybAfoTgpotWasZUnUNLiDI6S5vQsRSUe+yD09nXHNbDy3bVKs+vZ
 j1F4jzar/xRYRv4KEytMI+B8EfUskbGgIfnf4V/051ClBi5qhFYWlvBU7UkBSIex27Ai
 mW7vpmFatS7ECDgmbwoVdsxYP46Lhh8dR16moZcNA6yZV9QZyL4cUToxnKoUXMHgx0u3
 8P3A==
X-Gm-Message-State: AGi0PuavGe5sHSVvGGumGwGlc+Upy0yWPiCifG8tKp7PIIA32VINEwWs
 tcJL9o1iVMpafTsDZnMUOZH/AQ==
X-Google-Smtp-Source: APiQypJKO9ZTEVxhHxuzk3DXA0gtm+wb8f+2rdl3cAcDpSyLV+FcCC5MuNqHtUpSdtqw4blucZ+P3g==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr9781916wrr.247.1587710727165; 
 Thu, 23 Apr 2020 23:45:27 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id r2sm1570946wmg.2.2020.04.23.23.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 23:45:26 -0700 (PDT)
Date: Fri, 24 Apr 2020 07:45:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200424064524.GK3612@dell>
References: <cover.1587523702.git.gurus@codeaurora.org>
 <20200423114857.GG3612@dell> <20200423215306.GA8670@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423215306.GA8670@codeaurora.org>
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
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMyBBcHIgMjAyMCwgR3VydSBEYXMgU3JpbmFnZXNoIHdyb3RlOgoKPiBPbiBUaHUs
IEFwciAyMywgMjAyMCBhdCAxMjo0ODo1N1BNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBX
aGF0J3MgdGhlIG1lcmdlIHBsYW4gZm9yIHRoaXMgc2V0Pwo+IAo+IEknbSBub3Qgc3VyZSB3aGF0
IHlvdSBtZWFuLiBNeSBhc3N1bXB0aW9uIGlzIHRoYXQgZmlyc3QgYWxsIHRoZSBwYXRjaGVzCj4g
bmVlZCB0byBnZXQgYW4gQWNrZWQtYnkgYW5kIG9ubHkgdGhlbiB3aWxsIHRoZSBzZXJpZXMgZ2V0
IGFwcGxpZWQgYnkKPiBUaGllcnJ5Li4uIENvdWxkIFRoaWVycnkgb3IgVXdlIHdlaWdoIGluIG9u
IHRoaXMgcG9pbnQgcGxlYXNlPwoKWWVzLCB0aGF0IGlzIHRoZSBtZXJnZSBwbGFuLiA6KQoKV2hv
ZXZlciB0YWtlcyB0aGlzIHdpbGwgaGF2ZSB0byBvZmZlciBvdXQgYW4gaW1tdXRhYmxlIFBSLgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
