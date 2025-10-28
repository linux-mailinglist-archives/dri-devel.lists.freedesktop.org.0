Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152BAC15DCE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4310E60C;
	Tue, 28 Oct 2025 16:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="fPj5EOYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40D310E609
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=gUxO3OCubEL9Sjt5gkPFOkwMBhxTru23W0eezKORWHQ=; b=fPj5EOYC4H0HqHm84A0425XlMn
 mSlCSBPXDfUCte7mC76USZvm1S6cDxl12Sjma355Omo0NJz6w8DTBURl6hnBH8S+hHXiwOe4xYSuh
 M25F0senEHEmXjz2ULRp36b6IAnVNvSvkXplX/v+344CHeoIeyDedIeVyPuQnAd9WMUI=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:58918
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vDmie-0002fG-JD; Tue, 28 Oct 2025 12:38:49 -0400
Date: Tue, 28 Oct 2025 12:38:48 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
In-Reply-To: <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
 <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -3.2 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
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

Hi Chris,

On Tue, 28 Oct 2025 16:17:51 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you again for the review.
> :)
> 
> 
> On Thu, Oct 23, 2025 2:32 PM, Hugo Villeneuve wrote:
> > > +			if ((b + 1) << a == dsi_div_ab) {
> > > +				priv->mux_dsi_div_params.dsi_div_a = a;
> > > +				priv->mux_dsi_div_params.dsi_div_b = b;
> > > +
> > > +				goto calc_pll_clk;
> > > +			}
> > > +		}
> > > +	}
> >
> > If we arrive at this point, it seems that these values:
> >     priv->mux_dsi_div_params.dsi_div_a
> >     priv->mux_dsi_div_params.dsi_div_b
> >
> > were not initialised by the previous loop. Is this expected? If yes, maybe a comment would help?

So are the uninitialised values valid at all?

> 
> Actually, I think I want to print out a warning.
> 
> dev_warn(priv->dev, "Failed to calculate DIV_DSI A,B\n");
> 
> I could not find a monitor that would cause this, but it's possible.
> So to be kind to the users, I will print out a message so if something does not work, at least
> they will have an idea what is wrong.

So is it ok to continue in this case?

If yes, then maybe your message could specify: "Failed to calculate
DIV_DSI A,B, using defaults\n" ?


> 
> > > +calc_pll_clk:
> > > +	/*
> > > +	 * Below conditions must be set for PLL5 parameters:
> > > +	 * - REFDIV must be between 1 and 2.
> >
> > I am assuming this means PLL5_POSTDIV_MIN and PLL5_POSTDIV_MAX? If these macros change, then that mean you would also need to change your comment, not very practical and error-prone. I would suggest to remove this comment altogether.
> 
> "REFDIV" is the term used in the hardware manual to reference the signal.
> 
> > > +	 * - POSTDIV1/2 must be between 1 and 7.
> > > +	 * - INTIN must be between 20 and 320.
> > > +	 * - FOUTVCO must be between 800MHz and 3000MHz.
> >
> > Same here.
> 
> While I doubt the hardware design will change, your point is valid that I'm not giving the reader
> any more info than they could get from the code.
> 
> Kind of like the classic source code comment:
> 
>     value = 5;   /* Set value to 5 */
> 
> I'll remove it.

Ok :)


> 
> > +	/* Set defaults since valid clock was not found */
> > +	params->pl5_intin = PLL5_INTIN_DEF;
> > +	params->pl5_fracin = PLL5_FRACIN_DEF;
> > +	params->pl5_refdiv = PLL5_REFDIV_DEF;
> > +	params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
> > +	params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
> 
> I'm going to print out a warning here too.
> 
> dev_warn(priv->dev, "Failed to calculate exact PLL5 settings\n");

Similar to my comment above, would it be a good idea to add something
like "Failed to calculate exact PLL5 settings, using defaults\n" ?

> 
> 
> > > -	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> > > -						 params->pl5_postdiv1 * params->pl5_postdiv2);
> > > +
> > > +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> >
> > Similar suggestion for hardcoded values in comments, maybe replace "above 1.5GHz" with "too high"...
> 
> This one I'm OK with because that's the design specification of the hardware IP that's used in all the devices.
> If for some reason they re-design the hardware in future devices, something going to have to change and
> the driver will need to be updated. So we'll deal with it at that point.
> 
> Cheers
> 
> Chris
> 


-- 
Hugo Villeneuve
