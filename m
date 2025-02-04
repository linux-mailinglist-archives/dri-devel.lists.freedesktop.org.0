Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C3A27969
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF4A10E370;
	Tue,  4 Feb 2025 18:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="ZIcFteER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1516 seconds by postgrey-1.36 at gabe;
 Tue, 04 Feb 2025 18:11:47 UTC
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F2810E370
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=YTF+w0WkN8/brmYU7JARPGRsoEigeKQVOQIogVMPd9c=; b=ZIcFteERixfmdRSY5Z4iDkGbg2
 KtzSuoJglZUpDIdX9WUr+OzYgHzCDHvfzWmD5B2wbaZdQLL4hjxDiE2tZ0KiT/jVXeXMTxANKn3/x
 d0Nx/pTfJ7ZrqlGTc+TxdYdfm+Nei9804mQ1esonpDXGRzTOVnZ082KASKqTdwP6LgKg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:38586
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1tfN04-0007MX-Go; Tue, 04 Feb 2025 12:46:17 -0500
Date: Tue, 4 Feb 2025 12:46:15 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: neil.armstrong@linaro.org
Cc: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <20250204124615.4d7a308633a15fc17b2215cb@hugovil.com>
In-Reply-To: <16bd6bc2-8f10-4b99-9903-6e9f0f8778d8@linaro.org>
References: <20240927135306.857617-1-hugo@hugovil.com>
 <f9b0cc53-00ae-4390-9ff9-1dac0c0804ba@linaro.org>
 <20240930110537.dbbd51824c2bb68506e2f678@hugovil.com>
 <16bd6bc2-8f10-4b99-9903-6e9f0f8778d8@linaro.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH] drm: panel: jd9365da-h3: fix reset signal polarity
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

On Mon, 30 Sep 2024 18:24:44 +0200
neil.armstrong@linaro.org wrote:

> On 30/09/2024 17:05, Hugo Villeneuve wrote:
> > On Mon, 30 Sep 2024 16:38:14 +0200
> > Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > 
> >> Hi,
> >>
> >> On 27/09/2024 15:53, Hugo Villeneuve wrote:
> >>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>
> >>> In jadard_prepare() a reset pulse is generated with the following
> >>> statements (delays ommited for clarity):
> >>>
> >>>       gpiod_set_value(jadard->reset, 1); --> Deassert reset
> >>>       gpiod_set_value(jadard->reset, 0); --> Assert reset for 10ms
> >>>       gpiod_set_value(jadard->reset, 1); --> Deassert reset
> >>>
> >>> However, specifying second argument of "0" to gpiod_set_value() means to
> >>> deassert the GPIO, and "1" means to assert it. If the reset signal is
> >>> defined as GPIO_ACTIVE_LOW in the DTS, the above statements will
> >>> incorrectly generate the reset pulse (inverted) and leave it asserted
> >>> (LOW) at the end of jadard_prepare().
> >>
> >> Did you check the polarity in DTS of _all_ users of this driver ?
> > 
> > Hi Neil,
> > I confirmed that no in-tree DTS is referencing this driver. I did a
> > search of all the compatible strings defined in the
> > "jadard,jd9365da-h3.yaml" file. I also did the same on Debian code
> > search.
> 
> 
> OK then:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Hi Neil,
it seems this patch was never applied/picked-up?

Hugo.


> 
> > 
> > Hugo.
> > 
> > 
> >>
> >> Neil
> >>
> >>>
> >>> Fix reset behavior by inverting gpiod_set_value() second argument
> >>> in jadard_prepare(). Also modify second argument to devm_gpiod_get()
> >>> in jadard_dsi_probe() to assert the reset when probing.
> >>>
> >>> Do not modify it in jadard_unprepare() as it is already properly
> >>> asserted with "1", which seems to be the intended behavior.
> >>>
> >>> Fixes: 6b818c533dd8 ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
> >>> Cc: <stable@vger.kernel.org>
> >>> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>> ---
> >>>    drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 8 ++++----
> >>>    1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> index 44897e5218a69..6fec99cf4d935 100644
> >>> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> >>> @@ -110,13 +110,13 @@ static int jadard_prepare(struct drm_panel *panel)
> >>>    	if (jadard->desc->lp11_to_reset_delay_ms)
> >>>    		msleep(jadard->desc->lp11_to_reset_delay_ms);
> >>>    
> >>> -	gpiod_set_value(jadard->reset, 1);
> >>> +	gpiod_set_value(jadard->reset, 0);
> >>>    	msleep(5);
> >>>    
> >>> -	gpiod_set_value(jadard->reset, 0);
> >>> +	gpiod_set_value(jadard->reset, 1);
> >>>    	msleep(10);
> >>>    
> >>> -	gpiod_set_value(jadard->reset, 1);
> >>> +	gpiod_set_value(jadard->reset, 0);
> >>>    	msleep(130);
> >>>    
> >>>    	ret = jadard->desc->init(jadard);
> >>> @@ -1131,7 +1131,7 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
> >>>    	dsi->format = desc->format;
> >>>    	dsi->lanes = desc->lanes;
> >>>    
> >>> -	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >>> +	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> >>>    	if (IS_ERR(jadard->reset)) {
> >>>    		DRM_DEV_ERROR(&dsi->dev, "failed to get our reset GPIO\n");
> >>>    		return PTR_ERR(jadard->reset);
> >>>
> >>> base-commit: 18ba6034468e7949a9e2c2cf28e2e123b4fe7a50
> >>
> >>
> > 
> > 
> 
> 


-- 
Hugo Villeneuve
