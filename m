Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B643C3DF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C032F6E573;
	Wed, 27 Oct 2021 07:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EA96E573
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 07:29:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE546596;
 Wed, 27 Oct 2021 09:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635319747;
 bh=L3CMcbS3fGWaQu9xZukxn3KKXNQfGZlAosDA6YC9Ms4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5ora38kEU71meETND8yPFJih1WbBB8fiOgrvI/uLb+DXcOJH7+JTqhstqJ/cqZJY
 5vQgjFEF/pN7iNLZ+F9WjAL7Kx3Yk74CU31jTi0WPLWMsWmm2yTpWUMc5a9lob8Oku
 xZ2rMO+Xl80TxkPq3ClFTF1hDWG5YfpFkjUjwV5o=
Date: Wed, 27 Oct 2021 10:28:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc
 supply bindings
Message-ID: <YXj/q3apPR8qTliU@pendragon.ideasonboard.com>
References: <20211012064843.298104-4-alexander.stein@ew.tq-group.com>
 <20211013074722.7y7ug3eri4euknza@gilmour>
 <YWao69+QEK8Fhi/x@pendragon.ideasonboard.com>
 <20211014074110.ym6mzugde2m5ak22@gilmour>
 <YWo6U1juhMsHnQYU@pendragon.ideasonboard.com>
 <20211018152013.e3kmbm2lszb652gi@gilmour>
 <YW2zhFX9krzbHlpL@pendragon.ideasonboard.com>
 <20211019073728.7a3rmp3fz62rxh6w@gilmour>
 <YW6f8U2BC/6WQoVx@pendragon.ideasonboard.com>
 <YW8e43/rG7l5uraH@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YW8e43/rG7l5uraH@ravnborg.org>
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

Hi Rob,

Could you please share your opinion on this ?

On Tue, Oct 19, 2021 at 09:39:15PM +0200, Sam Ravnborg wrote:
> > > > 
> > > > That will not help validating that new DTs are compliant with the last
> > > > version of the bindings.
> > > > 
> > > > We have one tool, and two needs. The tool should be extended to cover
> > > > both, but today it can only support one. Which of these two is the most
> > > > important:
> > > > 
> > > > - Documentating old behaviour, to helper driver authors on other
> > > >   operating systems implement backward compatibility without having to
> > > >   look at the history ?
> > > > 
> > > > - Validating all new device trees to ensure they implement the latest
> > > >   recommended version of the bindings ?
> > > > 
> > > > I think the second one is much more frequent, and is also where most of
> > > > the issues will arise.
> > > 
> > > I understand the drive for the latter, but we shouldn't be dropping the
> > > former in the process, which has been what we've been doing for the last
> > > decade or so.
> > 
> > That point is debatable :-) I've repeatedly asked during review of DT
> > bindings for new properties to be made required, based on the above
> > rationale. This is the first time I see a push back.
> > 
> > I believe we need to address both of the above problems. In the very
> > short term, we have to pick which of the two we care about most, as we
> > can't have both yet. I have made my personal preference clear, but I'll
> > apply the official decision in further reviews. Maybe Rob could share
> > his point of view ?
> 
> The bindings are there to make sure the device trees are OK, and the
> bindings shall do their best to make sure the device trees are as
> correct as possible.
> 
> This will break existing device trees when we realise something is
> not correct in bindings files.
> 
> In such a case the ideal workflow would be to:
> 1) Fix the device tree files so they match the new and more correct
> bindings
> 2) Update the bindings with the latest fixes
> 
> As we have different trees for device trees and for bindings this is a
> bit difficult at the moment. But the above would be the ideal ways of
> working IMO.
> 
> Compare this to updating a header file in the kernel that results in new
> warnings/errors. The ways of working here is to fix the warnings/errors
> before adding the change to the header file. (For example when adding a
> must-check attribute).
> 
> My take - but then I seldom checks the device tree files as keeping the
> bindings free of errors was the challenge in the past. Rob does a
> fantastic jobs to keep the kernel error free here and I assume focus may
> change to device trees soon.

-- 
Regards,

Laurent Pinchart
