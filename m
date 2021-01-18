Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13832FA1C9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 14:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FCF6E1E8;
	Mon, 18 Jan 2021 13:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FED6E1E8;
 Mon, 18 Jan 2021 13:38:24 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23629054-1500050 for multiple; Mon, 18 Jan 2021 13:38:11 +0000
MIME-Version: 1.0
In-Reply-To: <20210118131420.15874-4-tzimmermann@suse.de>
References: <20210118131420.15874-1-tzimmermann@suse.de>
 <20210118131420.15874-4-tzimmermann@suse.de>
Subject: Re: [PATCH v4 3/6] drm/i915/gt: Remove references to struct
 drm_device.pdev
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 sroland@vmware.com, zackr@vmware.com
Date: Mon, 18 Jan 2021 13:38:10 +0000
Message-ID: <161097709046.27171.15246982051954461820@build.alporthouse.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Thomas Zimmermann (2021-01-18 13:14:17)
> Using struct drm_device.pdev is deprecated. Convert i915 to struct
> drm_device.dev. No functional changes.

This needs to be before or in the previous patch, as that patch removed
assignment of i915->drm.pdev.

Or the removal of the assignment moved to the end as a separate patch.
That makes more sense.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
