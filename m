Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AA3BA2EB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 17:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901656E0CB;
	Fri,  2 Jul 2021 15:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F376E0CB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 15:49:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1676A1F40F8F;
 Fri,  2 Jul 2021 16:49:13 +0100 (BST)
Date: Fri, 2 Jul 2021 17:49:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add the ability to create submit
 queues
Message-ID: <20210702174910.43dc8067@collabora.com>
In-Reply-To: <57a75ce3-f0aa-7f49-bda8-5ec500281f92@arm.com>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-5-boris.brezillon@collabora.com>
 <57a75ce3-f0aa-7f49-bda8-5ec500281f92@arm.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Jul 2021 16:05:30 +0100
Steven Price <steven.price@arm.com> wrote:

> On 02/07/2021 15:32, Boris Brezillon wrote:
> > Needed to keep VkQueues isolated from each other.
> > 
> > v3:
> > * Limit the number of submitqueue per context to 16
> > * Fix a deadlock
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> 16 ought to be enough for anyone ;)
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Oops, forgot to change the submitqueue_get() prototype. Will address
that in v4.
