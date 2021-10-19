Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E84433F5E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 21:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF1E6E1ED;
	Tue, 19 Oct 2021 19:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E126E1ED
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 19:39:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 474a6ca1-3114-11ec-ac3c-0050568cd888;
 Tue, 19 Oct 2021 19:39:30 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D49D1194B3C;
 Tue, 19 Oct 2021 21:39:25 +0200 (CEST)
Date: Tue, 19 Oct 2021 21:39:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <YW8e43/rG7l5uraH@ravnborg.org>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
 <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
 <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
 <20211014074110.ym6mzugde2m5ak22@gilmour>
 <YWo6U1juhMsHnQYU@pendragon.ideasonboard.com>
 <20211018152013.e3kmbm2lszb652gi@gilmour>
 <YW2zhFX9krzbHlpL@pendragon.ideasonboard.com>
 <20211019073728.7a3rmp3fz62rxh6w@gilmour>
 <YW6f8U2BC/6WQoVx@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW6f8U2BC/6WQoVx@pendragon.ideasonboard.com>
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

> > > 
> > > That will not help validating that new DTs are compliant with the last
> > > version of the bindings.
> > > 
> > > We have one tool, and two needs. The tool should be extended to cover
> > > both, but today it can only support one. Which of these two is the most
> > > important:
> > > 
> > > - Documentating old behaviour, to helper driver authors on other
> > >   operating systems implement backward compatibility without having to
> > >   look at the history ?
> > > 
> > > - Validating all new device trees to ensure they implement the latest
> > >   recommended version of the bindings ?
> > > 
> > > I think the second one is much more frequent, and is also where most of
> > > the issues will arise.
> > 
> > I understand the drive for the latter, but we shouldn't be dropping the
> > former in the process, which has been what we've been doing for the last
> > decade or so.
> 
> That point is debatable :-) I've repeatedly asked during review of DT
> bindings for new properties to be made required, based on the above
> rationale. This is the first time I see a push back.
> 
> I believe we need to address both of the above problems. In the very
> short term, we have to pick which of the two we care about most, as we
> can't have both yet. I have made my personal preference clear, but I'll
> apply the official decision in further reviews. Maybe Rob could share
> his point of view ?

The bindings are there to make sure the device trees are OK, and the
bindings shall do their best to make sure the device trees are as
correct as possible.

This will break existing device trees when we realise something is
not correct in bindings files.

In such a case the ideal workflow would be to:
1) Fix the device tree files so they match the new and more correct
bindings
2) Update the bindings with the latest fixes

As we have different trees for device trees and for bindings this is a
bit difficult at the moment. But the above would be the ideal ways of
working IMO.

Compare this to updating a header file in the kernel that results in new
warnings/errors. The ways of working here is to fix the warnings/errors
before adding the change to the header file. (For example when adding a
must-check attribute).

My take - but then I seldom checks the device tree files as keeping the
bindings free of errors was the challenge in the past. Rob does a
fantastic jobs to keep the kernel error free here and I assume focus may
change to device trees soon.

	Sam
