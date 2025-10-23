Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F7FC02D69
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 20:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E2110E93E;
	Thu, 23 Oct 2025 18:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="sJER2zOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C278310E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=hp7eKwrDarat7QwcY0nOsXfbV1YjGxT6oUWa1Um1LpU=; b=sJER2zOZ0yLztePoPq6DmjtvQY
 cgJv0yQDGWa5T+FEHtqwqN/E095GpntVgfPCLBQ1Pzu7m9RBnLNTcSS2TVjqrClA3ypwE1XaAEPCH
 z/WKb4WrkYF5Ahb+Pdjh1MksWYD1UIeRDuj7WQegXqUc6J6f9Cv9TZY0bJK50rMz/ReA=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:58996
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vBzel-0000Bk-AG; Thu, 23 Oct 2025 14:03:23 -0400
Date: Thu, 23 Oct 2025 14:03:22 -0400
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
Message-Id: <20251023140322.a4d6777f37dcb8177480538f@hugovil.com>
In-Reply-To: <OS3PR01MB8319C5F67878677D380EC53D8AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251022214906.eaf123bd740ac9e396a65570@hugovil.com>
 <OS3PR01MB8319C5F67878677D380EC53D8AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.6 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
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

On Thu, 23 Oct 2025 16:47:17 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Wed, Oct 22, 2025 9:49 PM, Hugo Villeneuve wrote:
> 
> > > +	for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> > > +	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> >
> > I think it would be easier to read/understand like this:
> >     params->pl5_postdiv1 <= PLL5_POSTDIV_MAX;
> >
> > > +	     params->pl5_postdiv1++) {
> > > +		for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> > > +		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> >
> > Ditto
> 
> OK. I can agree with that.

If you do that, you can also probably put this if() on as single line
to improve readability:

    if (foutvco_rate <= PLL5_FOUTVCO_MIN ||
 foutvco_rate >= PLL5_FOUTVCO_MAX)

> 
> 
> > > +				params->pl5_fracin = div_u64(((u64)
> > > +						     (foutvco_rate * params->pl5_refdiv) %
> > > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > > +
> > > +				params->pl5_fracin = div_u64((u64)
> > > +						     ((foutvco_rate * params->pl5_refdiv) %
> > > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> >
> > Remove second identical block?
> 
> Wow! How did that get in there????
> 
> Thanks !
> 
> I'll wait a little to see if there are any other comments, then I'll send V4
> 
> 
> Chris
> 


-- 
Hugo Villeneuve
