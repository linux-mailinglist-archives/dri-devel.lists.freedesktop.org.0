Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF53B46CB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 17:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB4C6EDF2;
	Fri, 25 Jun 2021 15:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE116EDF2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 15:40:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C79BA1F4478F;
 Fri, 25 Jun 2021 16:40:36 +0100 (BST)
Date: Fri, 25 Jun 2021 17:40:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 05/15] drm/panfrost: Expose exception types to userspace
Message-ID: <20210625174033.01a7ed74@collabora.com>
In-Reply-To: <cb7e886d-d59c-6086-7c5c-0070869087b1@arm.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-6-boris.brezillon@collabora.com>
 <YNXdMK//ENHdQKUN@maud> <20210625162101.3047172f@collabora.com>
 <cb7e886d-d59c-6086-7c5c-0070869087b1@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Jun 2021 16:32:27 +0100
Steven Price <steven.price@arm.com> wrote:

> On 25/06/2021 15:21, Boris Brezillon wrote:
> > On Fri, 25 Jun 2021 09:42:08 -0400
> > Alyssa Rosenzweig <alyssa@collabora.com> wrote:
> >   
> >> I'm not convinced. Right now most of our UABI is pleasantly
> >> GPU-agnostic. With this suddenly there's divergence between Midgard and
> >> Bifrost uABI.  
> > 
> > Hm, I don't see why. I mean the exception types seem to be the same,
> > there are just some that are not used on Midgard and some that are no
> > used on Bifrost. Are there any collisions I didn't notice?  
> 
> I think the real question is: why are we exporting them if user space
> doesn't want them ;) Should this be in an internal header file at least
> until someone actually requests they be available to user space?

Alright, I'll move it to panfrost_device.h (or panfrost_regs.h) then.
