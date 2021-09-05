Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE3401129
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 20:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09D8991C;
	Sun,  5 Sep 2021 18:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01D38991C
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 18:17:21 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7aef79bf-0e75-11ec-9416-0050568cd888;
 Sun, 05 Sep 2021 18:17:07 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id F3586194B5D;
 Sun,  5 Sep 2021 20:17:09 +0200 (CEST)
Date: Sun, 5 Sep 2021 20:17:16 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/16] drm/edid: Allow the querying/working with the
 panel ID from the EDID
Message-ID: <YTUJrCl7VYo9AxJM@ravnborg.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901131531.v3.3.I4a672175ba1894294d91d3dbd51da11a8239cf4a@changeid>
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

Hi Douglas,

On Wed, Sep 01, 2021 at 01:19:21PM -0700, Douglas Anderson wrote:
> EDIDs have 32-bits worth of data which is intended to be used to
> uniquely identify the make/model of a panel. This has historically
> been used only internally in the EDID processing code to identify
> quirks with panels.
> 
> We'd like to use this panel ID in panel-simple to identify which panel
> is hooked up and from that information figure out power sequence
> timings. Let's expose this information from the EDID code and also
> allow it to be accessed early, before a connector has been created.
> 
> To make matching in the panel-simple code easier, we'll return the
> panel ID as a 32-bit value. We'll provide some functions for
> converting this value back and forth to something more human readable.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
nit - two patches down this is no longer panel-simple.
