Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C225CB26C36
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1BE10E8B4;
	Thu, 14 Aug 2025 16:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2465D10E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:14:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CBA11691
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:13:58 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DE6F3F738
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:14:06 -0700 (PDT)
Date: Thu, 14 Aug 2025 17:13:54 +0100
From: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
 "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>, 
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, 
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

Hi,

On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > };
> > >
> > > I still don't like that. This really doesn't belong here. If anything,
> > > the drm_connector for writeback belongs to drm_crtc.
> > 
> > Why? We already have generic HDMI field inside drm_connector. I am really
> > hoping to be able to land DP parts next to it. In theory we can have a DVI-
> > specific entry there (e.g. with the subconnector type).
> > The idea is not to limit how the drivers subclass those structures.
> > 
> > I don't see a good case why WB should deviate from that design.
> > 
> > > If the issue is that some drivers need a custom drm_connector
> > > subclass, then I'd rather turn the connector field of
> > > drm_writeback_connector into a pointer.
> > 
> > Having a pointer requires additional ops in order to get drm_connector from
> > WB code and vice versa. Having drm_connector_wb inside drm_connector
> > saves us from those ops (which don't manifest for any other kind of structure).
> > Nor will it take any more space since union will reuse space already taken up by
> > HDMI part.
> > 
> > >
> 
> Seems like this thread has died. We need to get a conclusion on the design.
> Laurent do you have any issue with the design given Dmitry's explanation as to why this
> Design is good for drm_writeback_connector.

I'm with Laurent here. The idea for drm_connector (and a lot of drm structures) are to
be used as base "classes" for extended structures. I don't know why HDMI connector ended
up inside drm_connector as not all connectors have HDMI functionality, but that's a cleanup
for another day.

drm_writeback_connector uses the 'base' drm_connector only for a few things, mostly in
__drm_writeback_connector_init() and prepare_job()/cleanup_job(). In _init() we just setup
the properties and the encoder after we disable interlacing. prepare_job()/cleanup_job()
is another workaround to be to some custom ops some drivers might want for signalling. So
we should be able to convert the 'base' drm_connector to a pointer relatively easy. We shouldn't
need to get to the drm_connector from a drm_writeback_connector() outside drm_writeback.c.

Then it looks like what we need is a __drm_writeback_connector_init_with_connector() where we
can pass a base pointer and remember it. Maybe an extra parameter to existing init functions,
or a new one that skips the encoder initialisation entirely.

Best regards,
Liviu


> 
> Regards,
> Suraj Kandpal
> 
> > > > I plan to add drm_connector_dp in a similar way, covering DP needs
> > > > (currently WIP).
> > 
> > --
> > With best wishes
> > Dmitry

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
