Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115903B1F95
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 19:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEF66E95E;
	Wed, 23 Jun 2021 17:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83BE6E95E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 17:34:23 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4851db4f-d449-11eb-a36f-0050568cd888;
 Wed, 23 Jun 2021 17:34:37 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7F98F194B41;
 Wed, 23 Jun 2021 19:34:24 +0200 (CEST)
Date: Wed, 23 Jun 2021 19:34:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/simple-helper:
 drm_gem_simple_display_pipe_prepare_fb as default
Message-ID: <YNNwmoCesWbNN/Yq@ravnborg.org>
References: <20210622165511.3169559-13-daniel.vetter@ffwll.ch>
 <20210623162456.3373469-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210623162456.3373469-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel, looks good.

On Wed, Jun 23, 2021 at 06:24:56PM +0200, Daniel Vetter wrote:
> It's tedious to review this all the time, and my audit showed that
> arcpgu actually forgot to set this.
> 
> Make this the default and stop worrying.
> 
> Again I sprinkled WARN_ON_ONCE on top to make sure we don't have
> strange combinations of hooks: cleanup_fb without prepare_fb doesn't
> make sense, and since simpler drivers are all new they better be GEM
> based drivers.
> 
> v2: Warn and bail when it's _not_ a GEM driver (Noralf)
> 
> v3: It's neither ... nor, not not (Sam)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
