Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722B632E81
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 22:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB3010E1A9;
	Mon, 21 Nov 2022 21:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794C710E0B4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669065054; x=1700601054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o2x50bRB3reXFjn/ZB4Z7o1631ShVsoXyfcXP2+9YoY=;
 b=oCy7VPir9dcFemDHuXu4qMDogrhBvtMh/u1gG1StqF1NFyhjOSLykeS8
 f7ZmjvhYYmBKxLUIAq91mRd67VjRQs21AbiZTBwRTwRLESLXN7WyKyNPC
 5AfBMv/1vkbDVzTGfYQUjD04LR8fJAAuzGSWUzIyn7JiUwem1/cia6pB3
 PwlVN2DArxVaGcdMaGo3d73bT8n3+MiuC9B+IQSk06qFAR/Pim3LrVN2H
 yoL4U5SldMafSK7OkhWfiWiF2NLmcA03jP2Tg9J4z56tXO4e8n7PzoLCk
 +OJ+KPdUgTMJRDfFoFQT8NDYo+eQzH9pmkLewJhIvsIZtUDy7h7p5JlAs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="294052797"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="294052797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 13:10:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635311547"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="635311547"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com)
 ([10.237.72.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 13:10:49 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 91FAF20195;
 Mon, 21 Nov 2022 23:10:46 +0200 (EET)
Date: Mon, 21 Nov 2022 21:10:46 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: Use new video interface bus type
 macros in examples
Message-ID: <Y3vpVtWFJLXnWu07@paasikivi.fi.intel.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
 <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
 <YtLVRclLA4Jkk5i2@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtLVRclLA4Jkk5i2@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, Jul 16, 2022 at 06:12:05PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Sat, Jul 16, 2022 at 12:28:45PM +0300, Sakari Ailus wrote:
> > On Thu, Jun 16, 2022 at 01:14:06AM +0300, Laurent Pinchart wrote:
> > > Now that a header exists with macros for the media interface bus-type
> > > values, replace hardcoding numerical constants with the corresponding
> > > macros in the DT binding examples.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v2:
> > > 
> > > - Go back to PARALLEL
> > > 
> > > Changes since v1:
> > > 
> > > - Rename PARALLEL to BT601
> > > ---
> > >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 1 +
> > >  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ++-
> > >  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml  | 3 ++-
> > >  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml          | 3 ++-
> > >  Documentation/devicetree/bindings/media/microchip,xisc.yaml   | 3 ++-
> > >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 +++-
> > >  6 files changed, 12 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 35a48515836e..b0e5585f93e2 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -118,6 +118,7 @@ additionalProperties: false
> > >  examples:
> > >    - |
> > >      #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/media/video-interfaces.h>
> > >  
> > >      i2c0 {
> > >          #address-cells = <1>;
> > 
> > The definition doesn't seem to be used here. Is there a need to include
> > this?
> 
> There was, but the change that added bus-type to this binding got
> reverted in commit 979452fbc430 ("dt-bindings: drm/bridge: anx7625:
> Revert DPI support") and I forgot to drop the header when rebasing.
> 
> > I could drop this chunk while applying. There's just one trivial change
> > elsewhere in this patch to make.
> 
> Please do :-)

Applied with the following diff:

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 7fa7a667c764a..4590186c4a0b8 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -133,7 +133,6 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/media/video-interfaces.h>
 
     i2c0 {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 285c6075950ad..e80fcdf280f0b 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -92,7 +92,7 @@ examples:
     #include <dt-bindings/clock/stm32mp1-clks.h>
     #include <dt-bindings/media/video-interfaces.h>
     #include <dt-bindings/reset/stm32mp1-resets.h>
-    #
+
     dcmi: dcmi@4c006000 {
         compatible = "st,stm32-dcmi";
         reg = <0x4c006000 0x400>;

It seems that there's also bus-type 7 that corresponds to MIPI DPI. Could
you add a macro for this one as well? :-) In particular it's used by
Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml .

-- 
Kind regards,

Sakari Ailus
