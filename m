Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF2341009
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 22:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431376E196;
	Thu, 18 Mar 2021 21:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from libero.it (smtp-17-i2.italiaonline.it [213.209.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C806E196
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 21:47:12 +0000 (UTC)
Received: from oxapps-33-150.iol.local ([10.101.8.196])
 by smtp-17.iol.local with ESMTPA
 id N0U1lu0o0tpGHN0U1lgazL; Thu, 18 Mar 2021 22:47:10 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1616104030; bh=zU1WLLpE0lA50jM3MsK5RrXJ+mqo3UY4TvgZN01Q8MQ=;
 h=From;
 b=OfGisVIgW3s9Cv541xGM3eph9PCdbmSzYs4cdtPtyWzWSQu2iXOS0/AjpzoFLVSBe
 mgxDfETx2VO0IYW2dxPIklejH5TIIknc4PEAXwDJIw3wtLvSoLradMbUwAMqvgevOH
 zhVCbkNOTUXSvQGM2YRWbIKzJgn8WkjYRTBpA4AkgxVw5KVfLkZOx3bChZqRASidk5
 e9L6VoFVVRAGZES0bspb2a5wLi/MA88CEbtQtn2qBYsr1jNe9TQZsOKzHoRWyqL+To
 Tsj3/TnExPjYlRpI0HsQWdbk/4QlzCPmRhhNqDB155pIL3f9yhRy4kG6M7xEq38BES
 j5HIT85uqkNPQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=6053ca5e cx=a_exe
 a=jCUSjkGoK4+H1w5URwD4kw==:117 a=UPWQtH3J-JgA:10 a=IkcTkHD0fZMA:10
 a=_gZzKa99_6AA:10 a=VwQbUJbxAAAA:8 a=Cpx6WUeuaVtrzDQEF6EA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
Date: Thu, 18 Mar 2021 22:47:09 +0100 (CET)
From: Dario Binacchi <dariobin@libero.it>
To: Tomi Valkeinen <tomba@kernel.org>, linux-kernel@vger.kernel.org,
 Jyri Sarha <jyri.sarha@iki.fi>
Message-ID: <1180006566.16525.1616104029554@mail1.libero.it>
In-Reply-To: <7df3a270-1cc4-7a71-5e55-49a0dfb2c21f@kernel.org>
References: <20210314151342.23404-1-dariobin@libero.it>
 <7df3a270-1cc4-7a71-5e55-49a0dfb2c21f@kernel.org>
Subject: Re: [PATCH] drm/tilcdc: fix LCD pixel clock setting
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev27
X-Originating-IP: 87.20.116.197
X-Originating-Client: open-xchange-appsuite
x-libjamsun: jcRFwHSewQzI0vrj1avgPo+KJzlCx/Nw
x-libjamv: bgul+MiGx2U=
X-CMAE-Envelope: MS4xfChI96gLjikM0Juy1Jf+WHh/deHymc/eQCyjleA4QKoTlWfrxIg5QYkfsG+xs/bi0NW4e0tEab4TXaUPeNCJe7TQTrsSUR1BE3x56DkGcd1KeUSSt19y
 d9OJ1Zd0x9Ygvp9JtVDs+wJHPVW+nZdsAQSfdHQFXReU53yh9FBXoT181m0lUcpiDR/C5yNcgPmiMrZdcUBohSNjNwmB9Cma2y1qOdQNHfcpXsVka4ym0Pm7
 JCd2CBw2yPvbLeAMA03ZZDaRis5ZPNQm1/Pf7SygPiJ6M4SOlBLVVUoas4RIEoeP2agFJG56r54RNAuzDrtHtyOITET4+TvHydkoZlxX4MYdrrZqEOFco8uR
 ekkIPbAw
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Il 17/03/2021 09:19 Tomi Valkeinen <tomba@kernel.org> ha scritto:
> 
>  
> On 14/03/2021 17:13, Dario Binacchi wrote:
> > As reported by TI spruh73x RM, the LCD pixel clock (LCD_PCLK) frequency
> > is obtained by dividing LCD_CLK, the LCD controller reference clock,
> > for CLKDIV:
> > 
> > LCD_PCLK = LCD_CLK / CLKDIV
> > 
> > where CLKDIV must be greater than 1.
> > 
> > Therefore LCD_CLK must be set to 'req_rate * CLKDIV' instead of req_rate
> 
> The above doesn't make sense, the code already sets LCD_CLK to 'req_rate 
> * clkdiv', not req_rate.
> 
> > and the real LCD_CLK rate must be compared with 'req_rate * CLKDIV' and
> > not with req_rate.
> 
> This is true, the code looks at the wrong value.
> 
> > Passing req_rate instead of 'req_rate * CLKDIV' to the tilcdc_pclk_diff
> > routine caused it to fail even if LCD_CLK was properly set.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > 
> > ---
> > 
> >   drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > index 30213708fc99..02f56c9a5da5 100644
> > --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > @@ -203,7 +203,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
> >   	struct drm_device *dev = crtc->dev;
> >   	struct tilcdc_drm_private *priv = dev->dev_private;
> >   	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
> > -	unsigned long clk_rate, real_rate, req_rate;
> > +	unsigned long clk_rate, real_rate, req_rate, clk_div_rate;
> >   	unsigned int clkdiv;
> >   	int ret;
> >   
> > @@ -211,10 +211,11 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
> >   
> >   	/* mode.clock is in KHz, set_rate wants parameter in Hz */
> >   	req_rate = crtc->mode.clock * 1000;
> > -
> > -	ret = clk_set_rate(priv->clk, req_rate * clkdiv);
> > +	/* LCD clock divisor input rate */
> > +	clk_div_rate = req_rate * clkdiv;
> 
> "clk_div_rate" sounds a bit odd to me. Why not lcd_fck_rate, as that's 
> the name used later? Or lcd_clk_rate. Or maybe lcd_clk_req_rate...

I prefer lcd_clk_rate.

How about adding an additional patch that changes the variable names to make 
the code more readable?

req_rate -> lcd_pclk_rate
clk_rate -> real_lcd_clk_rate

And add a comment to the function which highlights the relationship 
LCD_CLK = LCD_PCLK * CLDIV ?

> 
> > +	ret = clk_set_rate(priv->clk, clk_div_rate);
> >   	clk_rate = clk_get_rate(priv->clk);
> > -	if (ret < 0 || tilcdc_pclk_diff(req_rate, clk_rate) > 5) {
> > +	if (ret < 0 || tilcdc_pclk_diff(clk_div_rate, clk_rate) > 5) {
> >   		/*
> >   		 * If we fail to set the clock rate (some architectures don't
> >   		 * use the common clock framework yet and may not implement
> > 
> 
> I think this fix is fine, but looking at the current code, it's calling 
> tilcdc_pclk_diff(), but doesn't actually provide pixel clocks to the 
> function, but fclk.

Yes, I agree.

Thanks and regards,
Dario

> 
>   Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
