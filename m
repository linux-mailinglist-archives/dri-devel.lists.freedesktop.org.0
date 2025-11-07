Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6BC41CF5
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 23:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBF288784;
	Fri,  7 Nov 2025 22:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="ss4tOySy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211F910EB84
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 22:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=ejqnzNy1MR3xZWody3z1Z69iQK4Hdog9D10YgXVvqnI=; b=ss4tOySyrC6RCFQjWwP3jQYDIT
 e5WhveWukcjNtPuK5/KWf7kB0EW7tXE73ZEv1b7RjahjbJndPGTrGyJOodkhdLlaqrYegePCCqIOu
 swLGsGsYSjSMZeM0EsZjBey0A8yHJncKsKgyFgurNDopqVBxsFcrHlUsx6p9rdkmh81U=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:52518
 helo=debian-lenovo) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vHUmY-0005my-II; Fri, 07 Nov 2025 17:18:11 -0500
Date: Fri, 7 Nov 2025 17:18:09 -0500
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
Message-Id: <20251107171809.6033526ffe5e57ec72bd4f96@hugovil.com>
In-Reply-To: <OS3PR01MB8319E496A32EDBF5719BAB478AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
 <20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
 <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
 <OS3PR01MB8319E496A32EDBF5719BAB478AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
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

On Fri, 7 Nov 2025 21:07:00 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> On Fri, Nov 7, 2025 2:08 PM, Hugo Villeneuve wrote:
> > You can add the "Fixes" tag (not "Fixed" as I incorrectly stated):
> >
> >     Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> 
> Thanks for looking it up.
> 
> I'll also add you with a Reported-by
> 
> I'll see if there are any other comments, then I'll resubmit the patch series by adding this new patch at the beginning.

I didn't see an answer to my question/comment about comparison with "<=" and ">=" ?

> If nothing else, this review was good because it forced me to go back and review internally what the hardware manual
> says as compared to the driver that we have been using for the last couple years.

Good.

-- 
Hugo Villeneuve <hugo@hugovil.com>
