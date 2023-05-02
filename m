Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18FE6F491F
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 19:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692C010E14C;
	Tue,  2 May 2023 17:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7493110E090;
 Tue,  2 May 2023 17:25:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2E1A6117D;
 Tue,  2 May 2023 17:25:34 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id C79EEC433D2;
 Tue,  2 May 2023 17:25:32 +0000 (UTC)
Date: Tue, 2 May 2023 13:25:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 02/14] drm/xe: Introduce the dev_coredump
 infrastructure.
Message-ID: <ZFFHiLBs9CsADc9q@rdvivi-mobl4>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-3-rodrigo.vivi@intel.com>
 <878re72mn1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878re72mn1.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 10:55:14AM +0300, Jani Nikula wrote:
> On Wed, 26 Apr 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > +	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");
> 
> Drive-by comment, could use %d and xe->drm.primary->index instead of

yeap, I wondered about that. I guess I will just add this for now, but
then work on all driver to stop using the drm.primary directly or update
the documentation that states the drivers shouldn't use that directly.

> <n>.
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
