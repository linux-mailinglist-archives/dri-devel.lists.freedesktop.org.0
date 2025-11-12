Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A6CC54BD8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 23:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EE010E084;
	Wed, 12 Nov 2025 22:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="ZFEtY/YR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EC810E084
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=rsmMeMMiuH0Pq/mWdMLj2Zy/6l7vJ2cJn1NWyyr+Rzk=; b=ZFEtY/YRQMTfQLCzXadjnLD7TO
 2M2LgqSqxcVminMlQGegPw3zmk6z3pn6uYyrnnJKDbrXrF7ZJg2e1t+bBpYkk6dLGAD2zrPV1Mfej
 sYsiOSvmhGy/BJqgkYWXlDew4+OqI1ukcZOFbriKuhsjt8HiN5YFdRd8bG5mYza/hs8M=;
Received: from [70.80.174.168] (port=39896 helo=pettiford)
 by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vJJef-0003jx-K0; Wed, 12 Nov 2025 17:49:34 -0500
Date: Wed, 12 Nov 2025 17:49:32 -0500
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
Message-Id: <20251112174932.c1ae526d6cda33d1e3856a95@hugovil.com>
In-Reply-To: <OS3PR01MB8319A5873CD10A7D86F0094E8ACCA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
 <OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
 <TYCPR01MB83273CEE6D5B665179456A2A8ACFA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251111220347.167dba316bea7effb6e0f849@hugovil.com>
 <OS3PR01MB8319A5873CD10A7D86F0094E8ACCA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
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

On Wed, 12 Nov 2025 19:06:35 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Tue, Nov 11, 2025 10:04 PM, Hugo Villeneuve wrote:
> > You still haven't provided the base-commit. There is a ton of branches in renesas-devel.git, so it is not easy to determine the branch/commit you used for your patchset.
> > By providing base-commit, you will save everyone a lot of trouble.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
> master branch
> base-commit: dd30a345f284e0d9b1755e3538f8257cf4deb79f
> 
> 
> > I tried to apply your patches on branch renesas-geert/master, using base-commit: 211ddde0823f
> 
> That is what I have been using. I just updated this morning to v6.18-rc5
> 
> 
> > The problem seems to be that dsi_div_ab_desired is not properly initialized, because the number of lanes is uninitialized (0) at this time, and therefore
> > rzg2l_cpg_dsi_div_set_divider() gets called with its first parameter as zero.
> 
> Hmmm.
> There are 2 ways to set the number of lanes: Device Tree or hard coded in the panel driver.
>
> What I do not understand is that by the time rzg2l_mipi_dsi_host_attach() is called, the number of lanes should have already been set.

Let me know if there is something specific you wantme to test for this.

> 
> On your system, where is the number of lanes defined? In the panel driver when it is probed?

For all my panels, it is set in the device three like this:

...
	port@1 {
		dsi0_out: endpoint {
			data-lanes = <1 2 3 4>;
			remote-endpoint = <&panel_in>;
		};
	};
...


> I am testing with 3 different systems, and I have not seen this issue.

I have 3 different panels, all using different druivers/IC, but I
tested only one (ilitek-ili9881c driver).

> 
> > Like I said, it also happens on 6.17.7 stable tree. If I remove your patches, everything is fine.
> 
> Things are hard coded in the existing driver.
> They work for you today because you are using the same number of lanes as the Renesas eval board.
> I'm trying to fix support for lanes = 3,2,1
> 
> 
> Thank you,
> Chris
> 


-- 
Hugo Villeneuve
