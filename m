Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B079C41628
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 20:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406710E085;
	Fri,  7 Nov 2025 19:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="knlbwKss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4413710E085
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=B2YvgcCMt5tmIfe2GmRK2C3L8OlLTXrg19Buak8KA50=; b=knlbwKssPG5AATNsNp46rCIOBr
 /cn57zM9ph+2/4AuASu1k2Y1pz6EI7j6/hIkaRskLp50DvDDA6x/YalQTU+dpT/ygCfZ1m9jR80or
 eSIo/zZOzM11sLzGFGIekkfQJQQlYYONIpZcxhq9B35HPHj6EIQ1Me/LInMG/wY5V4b8=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:59072
 helo=debian-lenovo) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vHRoN-0003uW-Ne; Fri, 07 Nov 2025 14:07:52 -0500
Date: Fri, 7 Nov 2025 14:07:50 -0500
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
Message-Id: <20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
In-Reply-To: <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
 <20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
 <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.8 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
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

On Fri, 7 Nov 2025 18:36:24 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for your review.
> 
> On Fri, Nov 7, 2025 11:31 AM, Hugo Villeneuve wrote:
> > > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > > +				    params->pl5_intin > PLL5_INTIN_MAX)
> >
> > Your patch comments indicate that you removed +1 and -1 for kernel test robot issue, but I do not understand why.
> >
> > pl5_intin is still defined as u8 (max 255), and therefore the result of "params->pl5_intin > PLL5_INTIN_MAX" will always be false because PLL5_INTIN_MAX is 320.
> >
> > It seems to me that pl5_intin type should be modified to account for its maximum value (u16?), and this should probably goes into a separate patch (with a Fixed: tag), that can be backported (if necessary).
> 
> You are totally right!
> INTIN is a 12-bit register value.
> It's a bug.
> 
> Good catch.
> 
> I'll make that a separate patch so I can CC stable.

You can add the "Fixes" tag (not "Fixed" as I incorrectly stated):

    Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")

This is the commit that added the pl5_intin field.

Original Kernel test robot message also suggested adding:

    Reported-by: kernel test robot <lkp@intel.com>

(See https://lore.kernel.org/oe-kbuild-all/202510240111.DvVTqUEp-lkp@intel.com/)

Hugo.

> Chris
> 
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>
