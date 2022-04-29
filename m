Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC9515054
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 18:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B49010E4E2;
	Fri, 29 Apr 2022 16:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D0710E4E2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 16:06:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0525488;
 Fri, 29 Apr 2022 18:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651248360;
 bh=0RL9QR/lg4QgwVXQ0WCQpVV20+G95q/DPnnE8KGBCMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRLfm+gMYZzMazDhBgWQRhXpPR44OGky98gxrrKzIiLWAzRgZbyDWeHi3IzhpgrW9
 DgIbwgzfkGJhchsUsH2YDwJKvtQNNkAT+sKXECrofVBHbTMWVXatQtyD3L7gIlcgOu
 vACjEFpsHrchvBiLx4yj55u8Aa0kj/MZoNT5/Xy4=
Date: Fri, 29 Apr 2022 19:05:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmwM5/oikfRt2ExQ@pendragon.ideasonboard.com>
References: <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
 <20220427143410.bectqumq62qmlv5x@houat>
 <CAMty3ZDk-M3hW97_GY4-z=f+cKs1Sg4Jbq5L7L4zHgXURhFuZA@mail.gmail.com>
 <YmsSdmOEpSz4okt2@pendragon.ideasonboard.com>
 <20220429154645.47tsii47vjxqklca@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220429154645.47tsii47vjxqklca@houat>
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Apr 29, 2022 at 05:46:45PM +0200, Maxime Ripard wrote:
> On Fri, Apr 29, 2022 at 01:17:26AM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 28, 2022 at 02:09:42PM +0530, Jagan Teki wrote:
> > > On Wed, Apr 27, 2022 at 8:04 PM Maxime Ripard wrote:
> > > > On Tue, Apr 26, 2022 at 01:40:31PM +0530, Jagan Teki wrote:
> > > > > On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski wrote:
> > > > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > > > > + Linus
> > > > > > > > > + Marek
> > > > > > > > > + Laurent
> > > > > > > > > + Robert
> > > > > > > > >
> > > > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > > > >
> > > > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > > > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > > > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > > > > > > was a panel or bridge.
> > > > > > > > > >
> > > > > > > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > > > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > > > > > >
> > > > > > > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > > > > > > a reference to the panel.
> > > > > > > > > >
> > > > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > > > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > > > > > > panel in the trivial case as well.
> > > > > > > > >
> > > > > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > > > > > > succeed in those use cases as well?
> > > > > > > >
> > > > > > > > I guess we could create a new helper for those, like
> > > > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > > > >
> > > > > > > Oh wow I feel stupid for not thinking about that.
> > > > > > >
> > > > > > > Yeah I agree that it seems like the best option.
> > > > > >
> > > > > > Should I prepare a patch with such a new helper?
> > > > > >
> > > > > > The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> > > > > > case and add one for the child node case, maybe:
> > > > > > drm_of_find_child_panel_or_bridge.
> > > > > >
> > > > > > I really don't have a clear idea of which driver would need to be switched
> > > > > > over though. Could someone (Jagan?) let me know where it would be needed?
> > > > >
> > > > > sun6i_mipi_dsi
> > > >
> > > > It doesn't look like sun6i_mipi_dsi is using devm_drm_of_get_bridge at all?
> > > 
> > > Correct, patch for this on the mailing list.
> > 
> > I've lost track of how we're solving the fallout of this for v5.18. I
> > have received a report that the original commit (80253168dbfd) also
> > broke the rcar-du driver. Could you please provide a git branch (based
> > on drm-fixes or drm-misc-fixes) with any patch that you plan to get
> > merged in v5.18, to let me test them locally ?
> 
> Was that report about 5.18 or drm-misc-next? It appears that all the
> drivers conversions are in drm-misc-next.

v5.18-rc2. I've double-checked, and it has been bisected to commit
67bae5f28c89, which is a fix of the commit this patch reverts
(80253168dbfd).

-- 
Regards,

Laurent Pinchart
