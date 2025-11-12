Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A7C50622
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 04:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A110E682;
	Wed, 12 Nov 2025 03:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="gYClqDGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B2F10E682
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 03:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=5lSwLzZQT/fBgy/dXhuzFFX7j1XTem5wGVTqkObg5PM=; b=gYClqDGGsm1KsnKo3VWI59wIU5
 +Lgbpgb6y8jExfP00oHHfVCR8pplvn9KGsnzr+qjIqapBwDepn6fiQNznPXi6Y2XfGUWZpbFQaQpW
 bHA2lubNjqYcIg7ReB4z0JPn21F5yQM0VGKREcLo2Dz2pqS7rY2pc+sA3rXU+z0hirSU=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:38042
 helo=pettiford) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vJ19A-0006Fs-OV; Tue, 11 Nov 2025 22:03:50 -0500
Date: Tue, 11 Nov 2025 22:03:47 -0500
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
Message-Id: <20251111220347.167dba316bea7effb6e0f849@hugovil.com>
In-Reply-To: <TYCPR01MB83273CEE6D5B665179456A2A8ACFA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
 <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
 <TYCPR01MB83273CEE6D5B665179456A2A8ACFA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
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

Hi Chris,

On Tue, 11 Nov 2025 19:39:25 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Tue, Nov 11, 2025 1:23 PM, Hugo Villeneuve wrote:
> > I still don't know on which tree you based your patchset, just to be sure that I am not missing anything.
> >
> > Should it work on 6.17.7 stable tree or torvalds/master tree?
> 
> I am using 
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
> 
> I have been testing with v6-18-rc2   (I have not pulled in the latest yet)
> 
> Chris

You still haven't provided the base-commit. There is a ton of branches in
renesas-devel.git, so it is not easy to determine the branch/commit you used for your patchset.
By providing base-commit, you will save everyone a lot of trouble.

I tried to apply your patches on branch renesas-geert/master,
using base-commit: 211ddde0823f

I am using 4 lanes and a 24-bit panel, and a clock of 59MHz.

Here is the relevant logs (I added some custom debug messages):

[    1.508000] rzg2l_cpg_dsi_div_set_divider(): dsi->lanes = 0
[    1.508183] rzg2l_cpg_dsi_div_set_divider(): divider = 0
[    1.513538] rzg2l_cpg_dsi_div_set_divider(): target  = 1
...
[    1.641377] [drm] cmdline forces connector DSI-1 panel_orientation to 3
[    1.649264] [drm] Initialized rzg2l-du 1.0.0 for 10890000.display on minor 1
[    1.656353] rzg2l-du 10890000.display: [drm] Device 10890000.display probed
[    1.680646] rzg2l-du 10890000.display: [drm] fb0: rzg2l-dudrmfb frame buffer device
[    1.688840] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): rate = 59000000
[    1.701034] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): dsi_div_ab_desired = 0
[    1.701042] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): hsclk = 0
[    1.714490] rzg2l-cpg 11010000.clock-controller: hsclk out of range
[    1.714501] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): rate = 59000000
[    1.729171] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): dsi_div_ab_desired = 0
[    1.729178] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): hsclk = 0
[    1.729184] rzg2l-cpg 11010000.clock-controller: hsclk out of range
[    1.729190] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): rate = 59000000
[    1.729196] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): dsi_div_ab_desired = 0
[    1.729201] rzg2l-cpg 11010000.clock-controller: rzg2l_cpg_get_foutpostdiv_rate(): hsclk = 0
...

The problem seems to be that dsi_div_ab_desired is not properly initialized,
because the number of lanes is uninitialized (0) at this time, and therefore
rzg2l_cpg_dsi_div_set_divider() gets called with its first parameter as zero.

Like I said, it also happens on 6.17.7 stable tree. If I remove your patches, everything is fine.

Hugo.
