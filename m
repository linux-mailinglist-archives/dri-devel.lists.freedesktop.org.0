Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4191F2A3F37
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499706E09F;
	Tue,  3 Nov 2020 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90026E09F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:45:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 44B9D1F45357;
 Tue,  3 Nov 2020 08:45:46 +0000 (GMT)
Date: Tue, 3 Nov 2020 09:45:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Fix a deadlock between the shrinker and
 madvise path
Message-ID: <20201103094543.69e5fd45@collabora.com>
In-Reply-To: <12019a24-239e-6d51-316c-b5438e5af892@arm.com>
References: <20201101174016.839110-1-boris.brezillon@collabora.com>
 <12019a24-239e-6d51-316c-b5438e5af892@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org,
 Christian Hewitt <christianshewitt@gmail.com>, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Nov 2020 08:42:49 +0000
Steven Price <steven.price@arm.com> wrote:

> On 01/11/2020 17:40, Boris Brezillon wrote:
> > panfrost_ioctl_madvise() and panfrost_gem_purge() acquire the mappings
> > and shmem locks in different orders, thus leading to a potential
> > the mappings lock first.
> > 
> > Fixes: bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> > Cc: <stable@vger.kernel.org>
> > Cc: Christian Hewitt <christianshewitt@gmail.com>
> > Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Queued to drm-misc-fixes.

Thanks,

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
