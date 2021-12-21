Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA89047C96B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 23:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF810E1E2;
	Tue, 21 Dec 2021 22:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1675710E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 22:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1640127328; bh=Z3XgLHjAf088z/zfmUp4THy27dkMGAzwhF+T7mi3USY=;
 h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=nChWFmlgVb8u3xuzYDY1dvsH4bvAjxs1zwdAtj2UwULtwqoGz2GW7VmmbtFiHipyX
 +hS62Q1+HHF5U9SAOAnd2J7pK/VuL42kyQNXCJEFJGsrQEcU66AhxxbkL8pX5Zwd+w
 LB7b1HBCZiaXOt609KuO9wUGkyUmpqaKVSHlb4DM=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Tue, 21 Dec 2021 23:55:28 +0100 (CET)
X-EA-Auth: 50xHEfD6a45Ok/sI0eIZ65w53xITxc7GoonMu+iHpYSDDO0bez/eu3pWH9ffZYiVCwd3/766v0U8Lz1VzOD6+4xlI1GXFAbV
Date: Tue, 21 Dec 2021 23:55:26 +0100
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, 0day robot <lkp@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2] drm: fix error found in some cases after the patch
 d1af5cd86997
Message-ID: <YcJbXva93zJJBGbE@gineta.localdomain>
References: <YaC7zXW119tlzfVh@gineta.localdomain>
 <20211128142015.GB5295@xsang-OptiPlex-9020>
 <YaUpsaP7hng6zpFh@gineta.localdomain>
 <YaXi803g7iv9MxWR@phenom.ffwll.local>
 <YaiVfZWNyMkG8uED@gineta.localdomain>
 <YaiXEARd8z2C463h@gineta.localdomain>
 <YcBKbn/9oqD2taCk@phenom.ffwll.local>
 <YcC5Qxnj8PvqnS6f@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcC5Qxnj8PvqnS6f@phenom.ffwll.local>
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

On Mon, Dec 20, 2021 at 06:11:31PM +0100, Daniel Vetter wrote:
> On Mon, Dec 20, 2021 at 10:18:38AM +0100, Daniel Vetter wrote:
> > On Thu, Dec 02, 2021 at 10:51:12AM +0100, Claudio Suarez wrote:
> > > The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> > > calls in drm core, files drm_a*.c") fails when the drm_device
> > > cannot be found in the parameter plane_state->crtc.
> > > Fix it using plane_state->plane.
> > > 
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core, files drm_a*.c")
> 
> My scrip complained about the fixes line, so I fixed it. I guess you've
> used the sha1 from your tree, not from upstream?

Yes, my bad, sorry. Thanks for the advice.

> Please always use
> upstream sha1 when referencing commits.
> 
> Anyway patches are now pushed.

Thank you!

Best regards.
Claudio Suarez.



