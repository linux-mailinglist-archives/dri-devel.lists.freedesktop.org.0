Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA1vMwGcmGkTKAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:38:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DFE169C2D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF4910E81C;
	Fri, 20 Feb 2026 17:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274B510E81C;
 Fri, 20 Feb 2026 17:38:05 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 4fHcsS3YYPz3hhbj;
 Fri, 20 Feb 2026 12:38:04 -0500 (EST)
Received: from hal-station (unknown [23.129.64.186])
 by mta-11.privateemail.com (Postfix) with ESMTPA;
 Fri, 20 Feb 2026 12:37:33 -0500 (EST)
Date: Fri, 20 Feb 2026 12:37:28 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: dri-devel@lists.freedesktop.org
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Ivan Lipski <ivan.lipski@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] drm/amd/display: add vendor specific reset
Message-ID: <aZib2LCK0iSTzvVI@hal-station>
References: <20260220171518.711594-1-someguy@effective-light.com>
 <20260220171518.711594-2-someguy@effective-light.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220171518.711594-2-someguy@effective-light.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[effective-light.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[effective-light.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 37DFE169C2D
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:15:13PM -0500, Hamza Mahfooz wrote:
> We now have a means to respond to page flip timeouts. So, hook up
> support by trying to reload DMUB firmware if
> drm_atomic_helper_wait_for_flip_done() fails. Also, send out a wedged
> event if the firmware reload fails.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: send a wedged event instead of attempting a GPU reset.
> v3: read return value of drm_atomic_helper_wait_for_flip_done().
> v4: only send wedged event if firmware reload fails and send out "fake"
>     page flip completes.
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7c51d8d7e73c..0ae6ada22fb0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -87,6 +87,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_edid.h>
> @@ -10829,6 +10830,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	struct drm_connector_state *old_con_state = NULL, *new_con_state = NULL;
>  	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>  	int crtc_disable_count = 0;
> +	struct amdgpu_crtc *acrtc;
>  
>  	trace_amdgpu_dm_atomic_commit_tail_begin(state);
>  
> @@ -11085,8 +11087,26 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	/* Signal HW programming completion */
>  	drm_atomic_helper_commit_hw_done(state);
>  
> -	if (wait_for_vblank)
> -		drm_atomic_helper_wait_for_flip_done(dev, state);
> +	if (wait_for_vblank &&
> +	    drm_atomic_helper_wait_for_flip_done(dev, state)) {
> +		mutex_lock(&dm->dc_lock);
> +		if (dm_dmub_hw_init(adev))
> +			drm_dev_wedged_event(dev, DRM_WEDGE_RECOVERY_REBIND |
> +					     DRM_WEDGE_RECOVERY_BUS_RESET,
> +					     NULL);
> +		mutex_unlock(&dm->dc_lock);
> +
> +		spin_lock_irqsave(&dev->event_lock, flags);
> +		drm_for_each_crtc(crtc, dev) {

Whoops, sent out an older version of this patch, the following line is
here as of the latest (tested) version:

			acrtc = to_amdgpu_crtc(crtc);
> +			if (acrtc->event) {

> +				drm_crtc_send_vblank_event(crtc, acrtc->event);
> +				acrtc->event = NULL;
> +				drm_crtc_vblank_put(crtc);
> +				acrtc->pflip_status = AMDGPU_FLIP_NONE;
> +			}
> +		}
> +		spin_unlock_irqrestore(&dev->event_lock, flags);
> +	}
>  
>  	drm_atomic_helper_cleanup_planes(dev, state);
>  
> -- 
> 2.53.0
> 
