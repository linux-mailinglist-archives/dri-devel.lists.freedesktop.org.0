Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05743CD73
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 17:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA26E8BC;
	Wed, 27 Oct 2021 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6E46E8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:24:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0042e807-373a-11ec-ac3c-0050568cd888;
 Wed, 27 Oct 2021 15:24:39 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CB102194B79;
 Wed, 27 Oct 2021 17:24:21 +0200 (CEST)
Date: Wed, 27 Oct 2021 17:24:20 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 5/6] drm/probe-helper: use
 drm_kms_helper_connector_hotplug_event
Message-ID: <YXlvJIF12cwk8rFo@ravnborg.org>
References: <20211018084707.32253-1-contact@emersion.fr>
 <20211018084707.32253-6-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018084707.32253-6-contact@emersion.fr>
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

Hi Simon,

On Mon, Oct 18, 2021 at 08:47:30AM +0000, Simon Ser wrote:
> If an hotplug event only updates a single connector, use
> drm_kms_helper_connector_hotplug_event instead of
> drm_kms_helper_hotplug_event.
> 
> Changes in v4:
> - Simplify loop logic (Ville, Sam)
> - Update drm_connector_helper_hpd_irq_event (Maxime)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime@cerno.tech>

Thanks, I like this better.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Maybe I am late and this was already applied...

	Sam
