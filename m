Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2292C315FB
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CCC10E5E8;
	Tue,  4 Nov 2025 14:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B2AD10E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:04:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F7C2C41
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:04:51 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA0B33F694
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:04:58 -0800 (PST)
Date: Tue, 4 Nov 2025 14:04:54 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
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
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, 
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>, 
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, 
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <aQoIBroBqQc3B-RD@e110455-lin.cambridge.arm.com>
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com>
 <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
 <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

On Tue, Nov 04, 2025 at 05:11:25AM +0000, Kandpal, Suraj wrote:
> > Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor
> > drm_writeback_connector structure
> > 
> > On Tue, Oct 07, 2025 at 11:15:23AM +0530, Suraj Kandpal wrote:
> > > Some drivers cannot work with the current design where the connector
> > > is embedded within the drm_writeback_connector such as Intel and some
> > > drivers that can get it working end up adding a lot of checks all
> > > around the code to check if it's a writeback conenctor or not, this is
> > > due to the limitation of inheritance in C.
> > > To solve this move the drm_writeback_connector within the
> > > drm_connector and remove the drm_connector base which was in
> > > drm_writeback_connector. Make this drm_writeback_connector a union
> > > with hdmi connector to save memory and since a connector can never be
> > > both writeback and hdmi it should serve us well.
> > > Do all other required modifications that come with these changes along
> > > with addition of new function which returns the drm_connector when
> > > drm_writeback_connector is present.
> > > Modify drivers using the drm_writeback_connector to allow them to use
> > > this connector without breaking them.
> > > The drivers modified here are amd, komeda, mali, vc4, vkms, rcar_du,
> > > msm
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > > V1 -> V2: Use &connector->writeback, make commit message imperative
> > > (Dmitry)
> > > ---
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
> > > .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
> > > .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
> > > .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
> > >  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
> > >  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
> > >  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
> > >  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
> > >  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
> > >  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
> > >  drivers/gpu/drm/drm_atomic_uapi.c             |  2 +-
> > >  drivers/gpu/drm/drm_writeback.c               | 35 ++++++----
> > 
> > For the komeda and malidp drivers, as well as for the drm_writeback.c
> > changes:
> > 
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > 
> > [snip]
> > 
> > 
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 8f34f4b8183d..1b090e6bddc1 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -1882,6 +1882,61 @@ struct drm_connector_cec {
> > >  	void *data;
> > >  };
> > >
> > > +/**
> > > + * struct drm_writeback_connector - DRM writeback connector  */
> > > +struct drm_writeback_connector {
> > > +	/**
> > > +	 * @pixel_formats_blob_ptr:
> > > +	 *
> > > +	 * DRM blob property data for the pixel formats list on writeback
> > > +	 * connectors
> > > +	 * See also drm_writeback_connector_init()
> > > +	 */
> > > +	struct drm_property_blob *pixel_formats_blob_ptr;
> > > +
> > > +	/** @job_lock: Protects job_queue */
> > > +	spinlock_t job_lock;
> > > +
> > > +	/**
> > > +	 * @job_queue:
> > > +	 *
> > > +	 * Holds a list of a connector's writeback jobs; the last item is the
> > > +	 * most recent. The first item may be either waiting for the hardware
> > > +	 * to begin writing, or currently being written.
> > > +	 *
> > > +	 * See also: drm_writeback_queue_job() and
> > > +	 * drm_writeback_signal_completion()
> > > +	 */
> > > +	struct list_head job_queue;
> > > +
> > > +	/**
> > > +	 * @fence_context:
> > > +	 *
> > > +	 * timeline context used for fence operations.
> > > +	 */
> > > +	unsigned int fence_context;
> > > +	/**
> > > +	 * @fence_lock:
> > > +	 *
> > > +	 * spinlock to protect the fences in the fence_context.
> > > +	 */
> > > +	spinlock_t fence_lock;
> > > +	/**
> > > +	 * @fence_seqno:
> > > +	 *
> > > +	 * Seqno variable used as monotonic counter for the fences
> > > +	 * created on the connector's timeline.
> > > +	 */
> > > +	unsigned long fence_seqno;
> > > +	/**
> > > +	 * @timeline_name:
> > > +	 *
> > > +	 * The name of the connector's fence timeline.
> > > +	 */
> > > +	char timeline_name[32];
> > > +};
> > > +
> > >  /**
> > >   * struct drm_connector - central DRM connector control structure
> > >   *
> > > @@ -2291,10 +2346,16 @@ struct drm_connector {
> > >  	 */
> > >  	struct llist_node free_node;
> > >
> > > -	/**
> > > -	 * @hdmi: HDMI-related variable and properties.
> > > -	 */
> > > -	struct drm_connector_hdmi hdmi;
> > > +	union {
> > 
> > This is a surprising choice. Before this patch one had to have a separate
> > writeback connector besides the HDMI connector. Going forward it looks like
> > you still need two connectors, one that uses the writeback member and one
> > that uses the hdmi one. Is that intended?
> > 
> > I was expecting that you're going to declare the writeback member next to the
> > hdmi, without overlap. If you do that, then you also don't need to move the
> > struct drm_writeback declaration from the header file and it should be enough
> > to include the drm_writeback.h file.
> 
> Hi,
> Thanks for the review
> The reason for this came from the discussion on previous patches and was suggested by Dmitry.
> The idea is that a connector can never be both an HDMI and writeback connector at the same time
> Hence we save space if we pack them together.

Hmm, but you can still have all the CEC and HDMI codecs data in that connector,
which feels strange.  Also, what's the issue with having a connector that has
both a valid HDMI state and an associated writeback at the same time (i.e.
don't use the union)? Writing back the memory the output that goes to HDMI is
valid, right?

Maybe that is not something that you considered, but with this patch (without union)
we can drop the need to have a separate connector just for writeback. We're breaking
user space compatibility, true, but it feels like a good change to be able to
attach a writeback to any connector and get its output. The drivers that don't support
that can reject the commit that attaches the writeback to the existing connector.

Best regards,
Liviu

> 
> Regards,
> Suraj Kandpal
> 
> > 
> > Best regards,
> > Liviu
> > 
> > > +		/**
> > > +		 * @hdmi: HDMI-related variable and properties.
> > > +		 */
> > > +		struct drm_connector_hdmi hdmi;
> > > +		/**
> > > +		 * @writeback: Writeback related valriables.
> > > +		 */
> > > +		struct drm_writeback_connector writeback;
> > > +	};
> > >
> > >  	/**
> > >  	 * @hdmi_audio: HDMI codec properties and non-DRM state.
> > > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > > index 958466a05e60..702141099520 100644
> > > --- a/include/drm/drm_writeback.h
> > > +++ b/include/drm/drm_writeback.h
> > > @@ -15,66 +15,6 @@
> > >  #include <drm/drm_encoder.h>
> > >  #include <linux/workqueue.h>
> > >
> > > -/**
> > > - * struct drm_writeback_connector - DRM writeback connector
> > > - */
> > > -struct drm_writeback_connector {
> > > -	/**
> > > -	 * @base: base drm_connector object
> > > -	 */
> > > -	struct drm_connector base;
> > > -
> > > -	/**
> > > -	 * @pixel_formats_blob_ptr:
> > > -	 *
> > > -	 * DRM blob property data for the pixel formats list on writeback
> > > -	 * connectors
> > > -	 * See also drm_writeback_connector_init()
> > > -	 */
> > > -	struct drm_property_blob *pixel_formats_blob_ptr;
> > > -
> > > -	/** @job_lock: Protects job_queue */
> > > -	spinlock_t job_lock;
> > > -
> > > -	/**
> > > -	 * @job_queue:
> > > -	 *
> > > -	 * Holds a list of a connector's writeback jobs; the last item is the
> > > -	 * most recent. The first item may be either waiting for the hardware
> > > -	 * to begin writing, or currently being written.
> > > -	 *
> > > -	 * See also: drm_writeback_queue_job() and
> > > -	 * drm_writeback_signal_completion()
> > > -	 */
> > > -	struct list_head job_queue;
> > > -
> > > -	/**
> > > -	 * @fence_context:
> > > -	 *
> > > -	 * timeline context used for fence operations.
> > > -	 */
> > > -	unsigned int fence_context;
> > > -	/**
> > > -	 * @fence_lock:
> > > -	 *
> > > -	 * spinlock to protect the fences in the fence_context.
> > > -	 */
> > > -	spinlock_t fence_lock;
> > > -	/**
> > > -	 * @fence_seqno:
> > > -	 *
> > > -	 * Seqno variable used as monotonic counter for the fences
> > > -	 * created on the connector's timeline.
> > > -	 */
> > > -	unsigned long fence_seqno;
> > > -	/**
> > > -	 * @timeline_name:
> > > -	 *
> > > -	 * The name of the connector's fence timeline.
> > > -	 */
> > > -	char timeline_name[32];
> > > -};
> > > -
> > >  /**
> > >   * struct drm_writeback_job - DRM writeback job
> > >   */
> > > @@ -131,10 +71,10 @@ struct drm_writeback_job {
> > >  	void *priv;
> > >  };
> > >
> > > -static inline struct drm_writeback_connector *
> > > -drm_connector_to_writeback(struct drm_connector *connector)
> > > +static inline struct drm_connector *
> > > +drm_writeback_to_connector(struct drm_writeback_connector
> > > +*wb_connector)
> > >  {
> > > -	return container_of(connector, struct drm_writeback_connector,
> > base);
> > > +	return container_of(wb_connector, struct drm_connector, writeback);
> > >  }
> > >
> > >  int drm_writeback_connector_init(struct drm_device *dev,
> > > --
> > > 2.34.1
> > >
> > 
> > --
> > ====================
> > | I would like to |
> > | fix the world,  |
> > | but they're not |
> > | giving me the   |
> >  \ source code!  /
> >   ---------------
> >     ¯\_(ツ)_/¯

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
