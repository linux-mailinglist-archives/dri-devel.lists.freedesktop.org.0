Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57E511220
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E96510E245;
	Wed, 27 Apr 2022 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B275D10EC19
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 09:20:44 +0000 (UTC)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id E70FC3C04C0;
 Tue, 26 Apr 2022 11:20:41 +0200 (CEST)
Received: from lxhi-065 (10.72.94.34) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 26 Apr
 2022 11:20:41 +0200
Date: Tue, 26 Apr 2022 11:20:36 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 14/21] v4l: vsp1: Change VSP1 LIF linebuffer FIFO
Message-ID: <20220426092036.GA14417@lxhi-065>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1464624020-27709-15-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20220421161259.GA2660@lxhi-065>
 <YmGHTgrKf6MZ28P3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YmGHTgrKf6MZ28P3@pendragon.ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.34]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Mailman-Approved-At: Wed, 27 Apr 2022 07:12:23 +0000
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
Cc: architt@codeaurora.org, Takashi Saito <takashi.saitou.ry@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, kuninori.morimoto.gx@renesas.com,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michael Rodin <mrodin@de.adit-jv.com>,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org, vz@mleia.com,
 linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Do, Apr 21, 2022 at 07:33:18 +0300, Laurent Pinchart wrote:
> On Thu, Apr 21, 2022 at 06:12:59PM +0200, Eugeniu Rosca wrote:
> > Since the meat of the Renesas patch [1]
> > is basically a printk in the interrupt context and an array storing
> > the total number of underruns occurred since startup, would you be
> > willing to review the refactored version of this patch on LKML?
> > 
> > In that case, we'll definitely invest some time to upstream it.
> 
> Absolutely ! I'm all for helping debugging.

Thanks for the quick reply. I have submitted a proposal at [*] and
I look forward to any thoughts/criticism/counter-proposals. TIA.

[*] https://lore.kernel.org/linux-renesas-soc/1650962227-14281-1-git-send-email-erosca@de.adit-jv.com

Best Regards,
Eugeniu
