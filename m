Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9284AC0E2E
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADB610ED14;
	Thu, 22 May 2025 14:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="JZ42M9P2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7D110E7C5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=KNH97gaggb/2wYQaAga1tD5BDYJYpNJdDjfVqWXvc0o=; b=JZ42M9P2ChwaXIpqNCTevCVa+S
 fGDHj20jfwMfzp/idK9InSj9LDVscAQzJ8KR8nxye7d09RS+IF/+fudnNq3yffn3nRrnBbrvPkvwp
 Phj24q9hLT7r/TRJmDdTyAs5VNLFWEvmhQgAswGejGu9mOustnztVPSPSO3HqMS9IxpQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:56132
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uI70K-0006Cq-Hn; Thu, 22 May 2025 10:34:40 -0400
Date: Thu, 22 May 2025 10:34:40 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: biju.das.jz@bp.renesas.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Message-Id: <20250522103440.e13dfb99deffb934f791e3b3@hugovil.com>
In-Reply-To: <20250522140322.64667-1-hugo@hugovil.com>
References: <20250522140322.64667-1-hugo@hugovil.com>
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
Subject: Re: [PATCH v2 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
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

On Thu, 22 May 2025 10:03:20 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Hello,
> this patch series add support for sending MIPI DSI command packets to the
> Renesas RZ/G2L MIPI DSI driver.
> 
> Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD
> panels using the jd9365da and st7703 drivers.
> 
> Tested short and long writes.
> 
> Tested read of 1 byte, 2 bytes and long reads.
> 
> Thank you.
> 
> Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com
> 
> Changes for V2:
> - Change commit message prefix to "drm: renesas: rz-du: "
> - Reorder variables in rzg2l_mipi_dsi_read_response()
> - Remove unused macros
> - Add missing bitfield include (kernel test robot)
> 
> Hugo Villeneuve (2):
>   drm: renesas: rz-du: Implement MIPI DSI host transfers
>   drm: renesas: rz-du: Set DCS maximum return packet size
> 
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
>  2 files changed, 240 insertions(+)
> 
> 
> base-commit: c4f8ac095fc91084108ec21117eb9c1fff64725d
> -- 
> 2.39.5
> 
> 

I hit the same problem with my mail server, preventing patches 1/2 and
2/2 not being sent.

Fixed by modifying exim4 smtp_accept_max_per_connection option from 1
to 100.

Will resend a proper v3.

-- 
Hugo Villeneuve
