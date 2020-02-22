Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7316A1F2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16A16E221;
	Mon, 24 Feb 2020 09:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 567 seconds by postgrey-1.36 at gabe;
 Sat, 22 Feb 2020 03:51:48 UTC
Received: from gentwo.org (gentwo.org [3.19.106.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BB26E43B;
 Sat, 22 Feb 2020 03:51:48 +0000 (UTC)
Received: by gentwo.org (Postfix, from userid 1002)
 id 3DAF53F75F; Sat, 22 Feb 2020 03:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by gentwo.org (Postfix) with ESMTP id 3B4B93F624;
 Sat, 22 Feb 2020 03:42:19 +0000 (UTC)
Date: Sat, 22 Feb 2020 03:42:19 +0000 (UTC)
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@www.lameter.com
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 01/52] mm/sl[uo]b: export __kmalloc_track(_node)_caller
In-Reply-To: <20200219102122.1607365-2-daniel.vetter@ffwll.ch>
Message-ID: <alpine.DEB.2.21.2002220341310.2000@www.lameter.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-2-daniel.vetter@ffwll.ch>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020, Daniel Vetter wrote:

> slab does this already, and I want to use this in a memory allocation
> tracker in drm for stuff that's tied to the lifetime of a drm_device,
> not the underlying struct device. Kinda like devres, but for drm.


Would be better to export it without underscores.

But ok.

Acked-by: Christoph Lameter <cl@linux.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
