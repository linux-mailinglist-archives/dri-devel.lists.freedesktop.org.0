Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FFBABDFD9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B7D10E54D;
	Tue, 20 May 2025 16:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="mvgfASeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47E10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=1OufIotovlGigTD54p6pedoorrnKdSpkh4Mjpalhh4g=; b=mvgfASeI45nbGYtbnnUaLztGk0
 W+/GxzFbNlwMJePCaijepUyL3qa23y3/x09svByhJ9zhKdjKxJ95M/ZEbSeM86cfwBTyyre9C+Z9s
 LBHeoDwjgFIA0MBPlqgZX6AZyoTaj17kzUYOicT+JeT78L5wuHoaiZ011+XzyczGewkQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:60204
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uHPQA-0005Tt-BI; Tue, 20 May 2025 12:02:26 -0400
Date: Tue, 20 May 2025 12:02:25 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Message-Id: <20250520120225.fe7983a91ad1452b734d42fa@hugovil.com>
In-Reply-To: <20250520-lens-dizziness-4d098c031b10@spud>
References: <20250520151112.3278569-1-hugo@hugovil.com>
 <20250520-fidelity-mooned-5d4262d0a7ef@spud>
 <20250520-lens-dizziness-4d098c031b10@spud>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.8 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
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

On Tue, 20 May 2025 17:00:11 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Tue, May 20, 2025 at 04:58:12PM +0100, Conor Dooley wrote:
> > On Tue, May 20, 2025 at 11:11:12AM -0400, Hugo Villeneuve wrote:
> > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > 
> > > Allow to inherit valid properties from the dsi-controller. This fixes the
> > > following warning when adding a panel property:
> > > 
> > > rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
> > >     match any of the regexes: 'pinctrl-[0-9]+'
> > >     from schema $id:
> > >         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> > > 
> > > Also add a panel property to the example.
> > 
> > I don't think adding the example should be in the same patch as a fix.
> 
> Or am I misunderstanding, and this is a new type of usage, rather than a
> fix?

Hi Conor,
it is more like a new type of usage.

-- 
Hugo Villeneuve
