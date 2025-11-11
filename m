Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C87C4F6BA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 19:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785510E645;
	Tue, 11 Nov 2025 18:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="FXkiVCwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFDD10E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 18:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=5qHmqOBWb1/TiqiYTrvztJmoHn0qb/fqgcYA800FKLA=; b=FXkiVCwzP8RiTKU36J1kGVZ/iz
 Xv1eMG612RumMXTA+CGCwjahkE8SV++l9fZA76RTpuJ93/XUmygM+W6sXLWgsqBB0Bo2yOtZWju5c
 /URepvfHcStwG4YqkEM2UaJ+JSkCI+wXRC2361YU6y1FCdKcziu6OPJaJfXp+ZaEOg7I=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:36212
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vIt0x-0008Sl-Oj; Tue, 11 Nov 2025 13:22:49 -0500
Date: Tue, 11 Nov 2025 13:22:46 -0500
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
Message-Id: <20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
In-Reply-To: <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
 <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
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
Subject: Re: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
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

On Tue, 11 Nov 2025 17:48:53 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for testing.
> 
> On Tue, Nov 11, 2025 12:02 PM, Hugo Villeneuve wrote:
> > I just tested your patchset on kernel 6.17.7, and my display no longer works.
> >
> > Also tested on torvalds/master tree commit 4427259cc7f7, with similar
> > results:
> >
> >     rzg2l-cpg 11010000.clock-controller: hsclk out of range
> 
> I'm pretty sure you are using 4 lanes, and a 24-bit panel, but what is the vclk of your display?
> 
> I want to check out the math.
> 
> Thank you,
> Chris

Hi Chris,
I still don't know on which tree you based your patchset, just to be
sure that I am not missing anything.

Should it work on 6.17.7 stable tree or torvalds/master tree?

Hugo.

-- 
Hugo Villeneuve
