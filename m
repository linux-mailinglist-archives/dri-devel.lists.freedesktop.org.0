Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A923F497D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 13:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57625898AA;
	Mon, 23 Aug 2021 11:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DA9898AA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 11:15:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="204278603"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="204278603"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 04:15:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="492663109"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 04:15:22 -0700
Message-ID: <3ad5188659ce362087db1980880ac47af60e639f.camel@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 daniel.vetter@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 23 Aug 2021 13:15:20 +0200
In-Reply-To: <eebf6fc4-c299-6aa7-f91c-16029c5c3444@gmail.com>
References: <20210728130552.2074-1-christian.koenig@amd.com>
 <eebf6fc4-c299-6aa7-f91c-16029c5c3444@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-08-23 at 13:05 +0200, Christian König wrote:
> Adding Thomas on CC as well.
> 
> Just a gentle ping. I think the patch set makes sense now.
> 
> Regards,
> Christian.
> 
> Am 28.07.21 um 15:05 schrieb Christian König:
> > Doing this in vmw_ttm_destroy() is to late.
> > 
> > It turned out that this is not a good idea at all because it leaves
> > pointers
> > to freed up system memory pages in the GART tables of the drivers.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> > 

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


