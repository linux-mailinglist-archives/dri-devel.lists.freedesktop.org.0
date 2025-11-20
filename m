Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E5C75182
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1795710E777;
	Thu, 20 Nov 2025 15:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="bYupM6gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1714D10E777
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=F5kUcCCA3MnU06v/xhs6ElwS8RfrplKyFjcTm1nO0v4=; b=bYupM6gzzW9+NphKdhGS+z+ZJw
 fK+dOqOh0/PKpHF0ridnKt3jZ0Tm8l6jEgiHLzstvWlyI9o/65BB5FAVm2ubMbR/j0gAPCnw02kwq
 rK84VhNVaWAhksu3+kZOyzWJO/fdZL5olY4xc2ob+Uy24+ZMeEAgSuXxKmyoDWr3sH8I=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:48600
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vM6rf-0005hZ-MY; Thu, 20 Nov 2025 10:46:34 -0500
Date: Thu, 20 Nov 2025 10:46:31 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20251120104631.b60230d06055a2611ed67760@hugovil.com>
In-Reply-To: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
 <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -0.7 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
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

Hi Geert,

On Thu, 20 Nov 2025 16:18:49 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hugo,
> 
> On Thu, 20 Nov 2025 at 15:47, Hugo Villeneuve <hugo@hugovil.com> wrote:
> > On Tue, 18 Nov 2025 21:27:43 -0500
> > Chris Brandt <chris.brandt@renesas.com> wrote:
> > > Convert the limited MIPI clock calculations to a full range of settings
> > > based on math including H/W limitation validation.
> > > Since the required DSI division setting must be specified from external
> > > sources before calculations, expose a new API to set it.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> > > --- a/include/linux/clk/renesas.h
> > > +++ b/include/linux/clk/renesas.h
> > > @@ -16,6 +16,11 @@ struct device;
> > >  struct device_node;
> > >  struct generic_pm_domain;
> > >
> > > +enum {
> > > +     PLL5_TARGET_DPI,
> > > +     PLL5_TARGET_DSI
> > > +};
> > > +
> > >  void cpg_mstp_add_clk_domain(struct device_node *np);
> > >  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
> > >  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> > > @@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
> > >  #define cpg_mssr_attach_dev  NULL
> > >  #define cpg_mssr_detach_dev  NULL
> > >  #endif
> > > +
> > > +#ifdef CONFIG_CLK_RZG2L
> > > +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> > > +#else
> > > +static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
> >
> > Maybe use:
> >
> > #define rzg2l_cpg_dsi_div_set_divider(...) do { } while (0)
> 
> I assume you are saying this in the context of the kernel test robot's
> report?

Yes, but it was not to fix the warning.
The report simply made me realize it was an inline function, and I was
not sure if it was the right way to define an empty function/macro,
especially in a header file.

> Static inline functions offer more safety. Just s/u8/u8 divider/ should
> fix the W=1 issue.

Agreed.

Thank you for the infos.

-- 
Hugo Villeneuve
