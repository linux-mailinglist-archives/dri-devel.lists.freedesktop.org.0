Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEA3DF682
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 22:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F31589FC0;
	Tue,  3 Aug 2021 20:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A64989FC0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 20:41:10 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2ab8d59d-f49b-11eb-8d1a-0050568cd888;
 Tue, 03 Aug 2021 20:41:23 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 33845194B23;
 Tue,  3 Aug 2021 22:41:30 +0200 (CEST)
Date: Tue, 3 Aug 2021 22:41:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Linus W <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] eDP: Support probing eDP panels dynamically
 instead of hardcoding
Message-ID: <YQmp3mGpLW+ELxAC@ravnborg.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730212625.3071831-1-dianders@chromium.org>
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

On Fri, Jul 30, 2021 at 02:26:19PM -0700, Douglas Anderson wrote:
> The goal of this patch series is to move away from hardcoding exact
> eDP panels in device tree files. As discussed in the various patches
> in this series (I'm not repeating everything here), most eDP panels
> are 99% probable and we can get that last 1% by allowing two "power
> up" delays to be specified in the device tree file and then using the
> panel ID (found in the EDID) to look up additional power sequencing
> delays for the panel.

Have you considered a new driver for edp panels?
panel-edp.c?

There will be some duplicate code from pnale-simple - but the same can
be said by the other panel drivers too.
In the end I think it is better to separate them so we end up with two
less complex panel drivers rather than one do-it-all panel driver.

I have not looked in detail how this would look like, but my first
impression is that we should split it out.

	Sam
