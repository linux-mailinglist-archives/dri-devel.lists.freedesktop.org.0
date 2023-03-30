Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0080E6D0C84
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 19:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC9F10EF49;
	Thu, 30 Mar 2023 17:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD2110EF2D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:17:47 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 61DD720378;
 Thu, 30 Mar 2023 19:17:45 +0200 (CEST)
Date: Thu, 30 Mar 2023 19:17:40 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <ZCXENFdTY6g2rb0i@francesco-nb.int.toradex.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204115030.04509092@collabora.com>
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
 Aradhya Bhatia <a-bhatia1@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Devarsh Thakkar <devarsht@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
chiming in in this *old* email thread.

Adding in copy a few more *@ti.com people recently involved in other tidss
changes [1]


[1] https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/


On Fri, Dec 04, 2020 at 11:50:30AM +0100, Boris Brezillon wrote:
> On Tue, 1 Dec 2020 17:48:28 +0530
> Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> 
> > Remove the old code to iterate over the bridge chain, as this is
> > already done by the framework.
> > The bridge state should have the negotiated bus format and flags.
> > Use these from the bridge's state.
> > If the bridge does not support format negotiation, error out
> > and fail.
> 
> That'd be even better if you implement the bridge interface instead of
> the encoder one so we can get rid of the encoder_{helper}_funcs and use
> drm_simple_encoder_init().

Did anything happened on this old discussion? I was working on a very
similar change and after a while I realized about this thread.

Thanks,
Francesco

