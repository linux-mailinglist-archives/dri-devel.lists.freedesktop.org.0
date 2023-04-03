Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4906D4D6A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C482010E51B;
	Mon,  3 Apr 2023 16:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E065D10E51E;
 Mon,  3 Apr 2023 16:21:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35BA76211C;
 Mon,  3 Apr 2023 16:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF45C433EF;
 Mon,  3 Apr 2023 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680538864;
 bh=i2Oz7DQi/g/2tldSSt8VII9IwwJ5AoZtoEq5C3Lbu2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SP0ZkypPTMOPAXytpcdYAnDwP2eVA88IYdfUg/PFKBO2W0Iz7DnJ1Qz5+/RgjlcDs
 ED4jglqlQJsdicClebvoHuvKpFwN986kP1G8WrcoGznB3jk1np4w1mJsUAp5aeSIj+
 iRQOl58ZqboCOoh6cw4P+WNT3LuD7NvOsouLXow8JMMbPa67jz6njID3KzUMUHh5q6
 EIvAynoRbMR5L/NndRWEd6u6CcyXOsbQPMhJPK8bl5ZvK4NDvjeKHupgrEhCMnBovE
 jePKl7FwsUdmkx1zT8mbiRr7t3wIn6W5M9lL3dg5fuoz2iwdnxeU03gVD29RiBGKCF
 Qwzw2I7IS0JOg==
Date: Mon, 3 Apr 2023 17:20:59 +0100
From: Lee Jones <lee@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 01/19] drm/i915/i915_scatterlist: Fix kerneldoc
 formatting issue - missing '@'
Message-ID: <20230403162059.GC8371@google.com>
References: <20230331092607.700644-1-lee@kernel.org>
 <20230331092607.700644-2-lee@kernel.org> <87jzyt0yil.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzyt0yil.fsf@intel.com>
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Apr 2023, Jani Nikula wrote:

> On Fri, 31 Mar 2023, Lee Jones <lee@kernel.org> wrote:
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/gpu/drm/i915/i915_scatterlist.c:62: warning: Function parameter or member 'size' not described in 'i915_refct_sgt_init'
> >
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
>
> Thanks for the patches!
>
> Applied all but one of the drm/i915 patches to drm-intel-next or
> drm-intel-gt-next depending on the area. There were a couple of issues
> that I fixed while applying. There was a conflict with patch 5/19
> against drm-intel-gt-next so I left that one out.

Thanks Jani.  I'll rebase and see what's left.

--
Lee Jones [李琼斯]
