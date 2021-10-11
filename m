Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537084297C5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 21:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA936E955;
	Mon, 11 Oct 2021 19:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FF26E955
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 19:51:23 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 93cf50eb-2acc-11ec-ac3c-0050568cd888;
 Mon, 11 Oct 2021 19:51:08 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DE639194B94;
 Mon, 11 Oct 2021 21:51:07 +0200 (CEST)
Date: Mon, 11 Oct 2021 21:51:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Derek Basehore <dbasehore@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH -next v2] drm/connector: fix all kernel-doc warnings
Message-ID: <YWSVthQnMJ9YFfBW@ravnborg.org>
References: <20211010224459.3603-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211010224459.3603-1-rdunlap@infradead.org>
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

Hi Randy,

On Sun, Oct 10, 2021 at 03:44:59PM -0700, Randy Dunlap wrote:
> Clean up all of the kernel-doc issues in drm_connector.c:
> 
> drivers/gpu/drm/drm_connector.c:2611: warning: Excess function parameter 'connector' description in 'drm_connector_oob_hotplug_event'
> drivers/gpu/drm/drm_connector.c:2611: warning: Function parameter or member 'connector_fwnode' not described in 'drm_connector_oob_hotplug_event'
> 
> drm_connector.c:630: warning: No description found for return value of 'drm_get_connector_status_name'
> drm_connector.c:715: warning: No description found for return value of 'drm_connector_list_iter_next'
> drm_connector.c:785: warning: No description found for return value of 'drm_get_subpixel_order_name'
> drm_connector.c:816: warning: No description found for return value of 'drm_display_info_set_bus_formats'
> drm_connector.c:1331: warning: No description found for return value of 'drm_mode_create_dvi_i_properties'
> drm_connector.c:1412: warning: No description found for return value of 'drm_connector_attach_content_type_property'
> drm_connector.c:1492: warning: No description found for return value of 'drm_mode_create_tv_margin_properties'
> drm_connector.c:1534: warning: No description found for return value of 'drm_mode_create_tv_properties'
> drm_connector.c:1627: warning: No description found for return value of 'drm_mode_create_scaling_mode_property'
> drm_connector.c:1944: warning: No description found for return value of 'drm_mode_create_suggested_offset_properties'
> 
> drm_connector.c:2315: warning: missing initial short description on line:
>  * drm_connector_set_panel_orientation_with_quirk -
> 
> [The last warning listed is probably a quirk/bug in scripts/kernel-doc.]
> 
> Fixes: 613051dac40d ("drm: locking&new iterators for connector_list")
> Fixes: 522171951761 ("drm: Extract drm_connector.[hc]")
> Fixes: b3c6c8bfe378 ("drm: document drm_display_info")
> Fixes: 50525c332b55 ("drm: content-type property for HDMI connector")
> Fixes: 6c4f52dca36f ("drm/connector: Allow creation of margin props alone")
> Fixes: 69654c632d80 ("drm/connector: Split out orientation quirk detection (v2)")
> Fixes: 72ad49682dde ("drm/connector: Add support for out-of-band hotplug notification (v3)")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Derek Basehore <dbasehore@chromium.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>

This is not an urgent fix so pushed to drm-misc-next.
I was a bit reluctant with all the fixes: tags as this will have the
commit picked up for backporting for little gain. But in the end I left
them there.

	Sam
