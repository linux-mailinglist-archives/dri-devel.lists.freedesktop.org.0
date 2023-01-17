Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28F66E3D8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ACB10E1A6;
	Tue, 17 Jan 2023 16:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EEB10E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:41:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6026E61454;
 Tue, 17 Jan 2023 16:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8E3C433EF;
 Tue, 17 Jan 2023 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673973717;
 bh=CBQge2tglo1PExJ2uEmEVHTzZHTr+x6bkDHCfczwo6s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uoozzgvpm4ScjhKs8jGarJGREeMAR3gqJqAw0/eaaDYmksoed+UuRC7Yu03YmCG88
 V1MIDiTfboKXqlJyBJBFL2J7iFEyt7LY976ySiAaCtfRjo6TchH7IQtvz+M9+QEm6q
 7COSHo0dPrdF5NXCln2JvctTyvV8VnUkM8jMhtSts4rzCHHWB+xvbe7W5S9pXSKtyT
 u+aZ76VPP9eLBrExU/8JlIWmxl1NFRL/T6MdXFSJcnL1IOMYRzX/CtSBzW3wXWm8rQ
 DbfqdYSNc6Kr7NuGhmlaSwn7pBGzoQFzd4mdvTI1u/+ODSKsLOeyqcPFgHSRonQq1H
 uKPbFT36iGkTw==
Date: Tue, 17 Jan 2023 17:41:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Message-ID: <20230117174152.21bb1484@coco.lan>
In-Reply-To: <Y8ak0SD1YLUZt0Pz@pendragon.ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6m2AqlDdmcgCk8F@pendragon.ideasonboard.com>
 <479e1dca-8d9c-cc75-75d9-3148ccc54f68@ideasonboard.com>
 <Y8ak0SD1YLUZt0Pz@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Tue, 17 Jan 2023 15:38:25 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Tomi,
> 
> (CC'ing Mauro and Hans)
> 
> On Tue, Jan 10, 2023 at 04:25:37PM +0200, Tomi Valkeinen wrote:
> > On 26/12/2022 16:56, Laurent Pinchart wrote:  
> > > Hi Tomi,
> > > 
> > > (CC'ing Daniel and Dave)
> > > 
> > > On Wed, Dec 21, 2022 at 11:24:41AM +0200, Tomi Valkeinen wrote:  
> > >> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >>
> > >> Hi,
> > >>
> > >> These add new pixel formats for Renesas V3U and V4H SoCs.
> > >>
> > >> As the display pipeline is split between DRM and V4L2 components, this
> > >> series touches both subsystems. I'm sending all these together to
> > >> simplify review. If needed, I can later split this to V4L2 and DRM
> > >> parts, of which the V4L2 part needs to be merged first.  
> > > 
> > > As the changes on the DRM side are small and shouldn't conflict with
> > > anything else queued for v6.3, it would be easier to merge the whole
> > > series through the media tree. Daniel, Dave, would you be OK with that ?
> > > If so, could you please ack patches 6/7 and 7/7 ?  
> > 
> > Note that these patches depend on the two DRM driver patches in "[PATCH 
> > v5 0/7] Renesas V4H DSI & DP output support", which are not very small 
> > (but still not big).  
> 
> Good point. I'm thus leaning more towards merging this through the DRM
> tree then. Mauro, can we get your ack on the V4L2 part of this series ?
> We'll create a stable branch based on v6.2-rc1 in case it also need to
> be merged in the media tree due to last minute conflicts (I'm mainly
> thinking about the new formats).

Feel free to merge the V4L2 patches via DRM tree with my ack:

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Hans, as there won't be a pull request through the media tree, if you
> want to review the new formats, now would be a good time.
> 
> > I don't think there's a compile-time dependency between the DRM and V4L2 
> > parts, but there's a functional side dependency, so it would be nice to 
> > merge these via a single tree. I can't say if DRM or V4L2 tree is 
> > easier, but I don't expect conflicts either way.  
> 



Thanks,
Mauro
