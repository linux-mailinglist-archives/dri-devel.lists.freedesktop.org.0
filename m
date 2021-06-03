Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A38399CC9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E826F44F;
	Thu,  3 Jun 2021 08:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED376F44C;
 Thu,  3 Jun 2021 08:41:17 +0000 (UTC)
IronPort-SDR: 064dET+kJvi4P0usM5dGtZGAf4FP74Ny6Xwglt2QUKUY6v/Ifz0S+E8zJ4xMfLiyIU0Y3tt4ny
 /ibLAIj5Gy8Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="204026966"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="204026966"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:41:12 -0700
IronPort-SDR: DBiwALqy6WN0lm7fKOoYBI2/5BEsOpN1PnbQgKmSsQHzLpZCuhBUn8jTpmH5YBwglBlqPvY20H
 pjjSBtSsnE2w==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480142969"
Received: from sleader-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.200])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:41:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "i915: use io_mapping_map_user"
In-Reply-To: <CAKMK7uFS_X8z3CkGejpqYbje4p30u4KAyQrs0=G5b04fCk0szQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210527185145.458021-1-matthew.auld@intel.com>
 <CAM0jSHOOB7=SLC+cgmXn4pWets+BJzdk=R+7LVzE+Aje2_FW5Q@mail.gmail.com>
 <CAKMK7uE1yrh-_+shOR5EuLZQaQyckDHNA8uhgwAx6-pLQaHifA@mail.gmail.com>
 <CAM0jSHOy7R13m27pC+bZHr2S9wGQjT2CmWxVWfu8d58zM9=Gbw@mail.gmail.com>
 <CAKMK7uFS_X8z3CkGejpqYbje4p30u4KAyQrs0=G5b04fCk0szQ@mail.gmail.com>
Date: Thu, 03 Jun 2021 11:41:03 +0300
Message-ID: <87im2vpcgw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Jun 2021, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Adding Jani and Rodrigo since drm-intel-fixes is on them.

Just sent the fixes pull request with this for v5.13-rc5:

https://lore.kernel.org/r/87lf7rpcmp.fsf@intel.com


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
