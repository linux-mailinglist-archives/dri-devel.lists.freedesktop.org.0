Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D748E671
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E046D10EA25;
	Fri, 14 Jan 2022 08:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABEF10E37E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:07:05 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 6EBBF5895B6; Thu, 13 Jan 2022 16:07:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from localhost (unknown [88.147.173.226])
 by air.basealt.ru (Postfix) with ESMTPSA id AD1BE58942B;
 Thu, 13 Jan 2022 16:07:00 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:06:56 +0400
From: Alexey Sheplyakov <asheplyakov@basealt.ru>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
Message-ID: <YeBOILezGENJ47oU@asheplyakov-rocket>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru>
 <YcSDgIwrmHZ/BC2n@maud>
 <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
 <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com>
 <YdxwFCfWYtLd1Qqb@maud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdxwFCfWYtLd1Qqb@maud>
X-Mailman-Approved-At: Fri, 14 Jan 2022 08:27:12 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alyssa,

On Mon, Jan 10, 2022 at 12:42:44PM -0500, Alyssa Rosenzweig wrote:
> > Whether it's worth the effort depends on whether anyone really cares
> > about getting the full performance out of this particular GPU.
> > 
> > At this stage I think the main UABI change would be to add the opposite
> > flag to kbase, (e.g. "PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU"[1]) to
> > opt-in to allowing the job to run across all cores.
> > 
> > The second change would be to allow compute jobs to be run on the second
> > core group, so another flag: PANFROST_RUN_ON_SECOND_CORE_GROUP.
> > 
> > But clearly there's little point adding such flags until someone steps
> > up to do the Mesa work.
> 
> I worry about the maintainence burden (both Mesa and kernel) of adding
> UABI only used by a piece of hardware none of us own, and only useful

To solve the "no hardware" problem we can send you (or any interested
panfrost hacker) a BE-M1000 based board (for free). BE-M1000 is 8 core
armv8 (Cortex A53) SoC with Mali T628 GPU. Plese email me for the further
details (preferably off the list) if you are interested.

Best regards,
   Alexey
