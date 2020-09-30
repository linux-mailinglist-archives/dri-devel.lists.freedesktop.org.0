Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE9727E7AA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F986E09A;
	Wed, 30 Sep 2020 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EB56E09A;
 Wed, 30 Sep 2020 11:31:48 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22578792-1500050 for multiple; Wed, 30 Sep 2020 12:31:09 +0100
MIME-Version: 1.0
In-Reply-To: <daa8ad15-052b-54f0-f776-98df24fa4885@embeddedor.com>
References: <20200910102120.GA9481@embeddedor>
 <daa8ad15-052b-54f0-f776-98df24fa4885@embeddedor.com>
Subject: Re: [Intel-gfx] [PATCH][next] drm/i915: Fix inconsistent IS_ERR and
 PTR_ERR
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Gustavo A. R. Silva <gustavo@embeddedor.com>, Gustavo A. R. Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Hellström <thomas.hellstrom@intel.com>
Date: Wed, 30 Sep 2020 12:31:14 +0100
Message-ID: <160146547425.23784.12133181032638673409@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Gustavo A. R. Silva (2020-09-25 16:35:12)
> Hi all,
> 
> Friendly ping: who can take this?

We had picked up the same patch from Dan Carpenter, thanks.

commit 68ba71e3ae6dd86a23486655e33c5f8c9bd90777
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Sep 11 10:52:43 2020 +0300

    drm/i915: Fix an error code i915_gem_object_copy_blt()

-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
