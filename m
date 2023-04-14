Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A26E1E4A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE78C10EC7F;
	Fri, 14 Apr 2023 08:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6F10EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:30:33 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id C0BAA20B6F;
 Fri, 14 Apr 2023 10:30:28 +0200 (CEST)
Date: Fri, 14 Apr 2023 10:30:22 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <ZDkPHo83drEOHsAN@francesco-nb.int.toradex.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
 <ZCXENFdTY6g2rb0i@francesco-nb.int.toradex.com>
 <655cfc4b-a414-47e1-f676-b11e410da32f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655cfc4b-a414-47e1-f676-b11e410da32f@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>, Yuti Amonkar <yamonkar@cadence.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Devarsh Thakkar <devarsht@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Aradhya,

On Fri, Apr 14, 2023 at 01:19:38PM +0530, Aradhya Bhatia wrote:
> On 30-Mar-23 22:47, Francesco Dolcini wrote:
> > Hello,
> > chiming in in this *old* email thread.
> > 
> > Adding in copy a few more *@ti.com people recently involved in other tidss
> > changes [1]
> > 
> > 
> > [1] https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/
> > 
> > 
> > On Fri, Dec 04, 2020 at 11:50:30AM +0100, Boris Brezillon wrote:
> >> On Tue, 1 Dec 2020 17:48:28 +0530
> >> Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> >>
> >>> Remove the old code to iterate over the bridge chain, as this is
> >>> already done by the framework.
> >>> The bridge state should have the negotiated bus format and flags.
> >>> Use these from the bridge's state.
> >>> If the bridge does not support format negotiation, error out
> >>> and fail.
> >>
> >> That'd be even better if you implement the bridge interface instead of
> >> the encoder one so we can get rid of the encoder_{helper}_funcs and use
> >> drm_simple_encoder_init().
> > 
> > Did anything happened on this old discussion? I was working on a very
> > similar change and after a while I realized about this thread.
> > 
> Nikhil has moved on from TI.
> 
> I will be taking up this patch series and implement the changes
> requested.
Great!

What I was working on is really about having the media bus format taken
from the closest bridge, this is really required for proper functionality
when the display is connected through a bridge.

This [1] is what I was working on before realizing about this specific
patch here, in case you want to have a look.

Please keep me in CC, I can test/review patches.

Francesco

[1] https://github.com/dolcini/linux/commit/150b1390bd4122a77c873d87bf506024f9775755

