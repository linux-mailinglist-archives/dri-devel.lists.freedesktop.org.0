Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17DAC1478
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3D10E1E2;
	Thu, 22 May 2025 19:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="JqTEvhUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB68110E2CE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=frzJT8TDmbXbrl93CAqw5BX6Dez3V1DpAl1yjjO3Oxk=; b=JqTEvhUBq8f/oi1ZnB+V3xcL+b
 f3TcxATAKxx5ZqkdY+a8KHzrnCupe6F6WQ34T/SP3ftYh3q2UQgxgRK8bs/sIas7rrE9siwgTDjuS
 Dpbo9V1v/P+s+Pmb5Vk1Qm2AXQbKaLSzyrvsAi9KJV2aGFUPCuiu/G7R2Wjrzm92GTpc=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33532
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uIBMS-0000FR-VD; Thu, 22 May 2025 15:13:49 -0400
Date: Thu, 22 May 2025 15:13:48 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Chris Brandt
 <Chris.Brandt@renesas.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Message-Id: <20250522151348.856a75a66cd87d8794500dc4@hugovil.com>
In-Reply-To: <TY3PR01MB113464412C75E0AC1928A4FBA8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
 <TY3PR01MB113464412C75E0AC1928A4FBA8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
 *      blocklist *      [URIs: hugovil.com]
 *  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
 *      blocklist *      [URIs: hugovil.com]
 * -0.8 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-1.6 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 URIBL_CSS,URIBL_CSS_A autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
 command support
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

On Thu, 22 May 2025 18:40:29 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Hugo,
> 
> Thanks for the patch.
> 
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 22 May 2025 15:39
> > Subject: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
> > 
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Hello,
> > this patch series add support for sending MIPI DSI command packets to the Renesas RZ/G2L MIPI DSI
> > driver.
> > 
> > Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD panels using the jd9365da
> > and st7703 drivers.
> > 
> > Tested short and long writes.
> > 
> > Tested read of 1 byte, 2 bytes and long reads.
> 
> I see tested-by tag for patch[1] and this patch series is conflict with that patch.

Hi Biju,
there is no conflict per se for the moment, as these are two separate
submissions. Chris's patch is not part of this submission.

I tested patch[1] by rebasing my series on top of Chris patch.

> Can this patch series work without patch[1]? If yes, no issue.

Yes it can.


> Otherwise, you need to rebase your patch on top of [1] to avoid merge conflict.

Eventually, if Chris's patch is accepted before my series, I
will rebase and resubmit then. Right now, it seems I cannot do it,
because submitting my serie based on an "not yet accepted" patch will
result in the kernel test robot complaining (and rightly so). Unless
there is a mean to specify that my serie depends on other
unapplied patch...

Ideally, it should have been easier if I could have integrated Chris's
patch into my serie, but he preferred to send his patch alone since
he felt that it could be accepted more rapidly like this.

Hugo.


> [1] https://lore.kernel.org/all/20250521210335.3149065-1-chris.brandt@renesas.com/
> 
> Cheers,
> Biju
> 
> > 
> > Thank you.
> > 
> > Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com
> > 
> > Changes for V3:
> > - No code change, resending after fixing mail server config resulting in
> >   only cover letter being sent
> > 
> > Changes for V2:
> > - Change commit message prefix to "drm: renesas: rz-du: "
> > - Reorder variables in rzg2l_mipi_dsi_read_response()
> > - Remove unused macros
> > - Add missing bitfield include (kernel test robot)
> > 
> > Hugo Villeneuve (2):
> >   drm: renesas: rz-du: Implement MIPI DSI host transfers
> >   drm: renesas: rz-du: Set DCS maximum return packet size
> > 
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
> >  2 files changed, 240 insertions(+)
> > 
> > 
> > base-commit: c4f8ac095fc91084108ec21117eb9c1fff64725d
> > --
> > 2.39.5
> 
> 


-- 
Hugo Villeneuve
