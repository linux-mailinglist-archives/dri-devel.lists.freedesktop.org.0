Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B70509785
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 08:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A146210F464;
	Thu, 21 Apr 2022 06:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39C6410F465
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 592E7811B;
 Thu, 21 Apr 2022 06:25:07 +0000 (UTC)
Date: Thu, 21 Apr 2022 09:27:57 +0300
From: Tony Lindgren <tony@atomide.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
Message-ID: <YmD5bZ8yVhRdZjdd@atomide.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <CAPDyKFpNx9xt1xwO-EKAx_qYtfcM5RUC6=Kh9NZ5o+A=H5ut6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpNx9xt1xwO-EKAx_qYtfcM5RUC6=Kh9NZ5o+A=H5ut6A@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 alsa-devel@alsa-project.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Felipe Balbi <balbi@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Ulf Hansson <ulf.hansson@linaro.org> [220419 14:12]:
> On Tue, 19 Apr 2022 at 15:37, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This is the full series for converting OMAP1 to multiplatform, rebased
> > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > means we are getting closer to completing this for all ARMv5 platforms
> > (I have patches for PXA, which is the last one remaining).
> >
> > Janusz already tested the branch separately and did the missing work
> > for the common-clk conversion after my previous approach was broken.
> >
> > The fbdev, mmc and ASoC portion of Janusz' work already went into the
> > corresponding maintainer tree, but I include them here for reference.
> > Unless there are any objections, I would add the entire series to the
> > for-next branch of the soc tree, but only send the first 36 patches early
> > in the merge window. After everything else has made it in, I would rebase
> > the last two patches and send them separately, which may or may not make
> > it in the merge window.
> 
> Sounds like a good plan to me. I usually send the MMC pull-request on
> Mondays, the first day of the merge window.

Sounds good to me. I tested the current omap1-multiplatform-5.18 branch
from mach-omap2 point of view, and things seem to work just fine for me.
I don't currently have any omap1 hardware online to test with.

For the patches, please feel free to add:

Acked-by: Tony Lindgren <tony@atomide.com>
