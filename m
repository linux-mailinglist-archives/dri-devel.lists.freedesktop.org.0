Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CA34EFE26
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 05:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C0D10E093;
	Sat,  2 Apr 2022 03:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2C310E093
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 03:19:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3BE92E4;
 Sat,  2 Apr 2022 05:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648869594;
 bh=4zp1Gj103TcKmZzWzc8uz1vshlZ8498Aw6Uu2ezDuLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZEv/g9MI0BZj/QmElPbbQV1npdC9nfCKdfG08oyO1PNynODg7LILUFB54uN5O1tS6
 bBlvSBtevONCyoeHlB4JXfd5SrdokvgwTfnuBPxuyv3vX2kPDEcdJxrDXZuGtUn+YS
 bkK9g0wn9OPByAr/Vx23biRvh06PvXAzrceEDP+M=
Date: Sat, 2 Apr 2022 06:19:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH 2/3] drm/modes: Make width-mm/height-mm mandatory in
 of_get_drm_panel_display_mode()
Message-ID: <YkfAtkOtaWksnrlH@pendragon.ideasonboard.com>
References: <20220401163755.302548-1-marex@denx.de>
 <20220401163755.302548-2-marex@denx.de>
 <YkdImJRIRkaqeGDl@pendragon.ideasonboard.com>
 <efaa195a-bbdc-ca24-eccc-271995dfd27f@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <efaa195a-bbdc-ca24-eccc-271995dfd27f@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 10:36:24PM +0200, Marek Vasut wrote:
> On 4/1/22 20:46, Laurent Pinchart wrote:
> > On Fri, Apr 01, 2022 at 06:37:54PM +0200, Marek Vasut wrote:
> >> Make the width-mm/height-mm panel properties mandatory in
> >> of_get_drm_panel_display_mode(), print error message and
> >> return -ve in case these DT properties are not present.
> >> This is needed to correctly report panel dimensions.
> > 
> > Can we guarantee this won't cause a regression ?
> 
> For the upstream DTs, I think we can.
> For downstream DTs, we cannot know.

Are there users of this function whose DT bindings don't require the
width-mm and height-mm properties ?

-- 
Regards,

Laurent Pinchart
