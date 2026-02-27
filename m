Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOOELqgFomkGyQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:59:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59F1BE03E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471A710E0FC;
	Fri, 27 Feb 2026 20:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com
 [198.54.127.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D687F10E0FC;
 Fri, 27 Feb 2026 20:59:16 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 4fN10M50PHz3hhTn;
 Fri, 27 Feb 2026 15:59:15 -0500 (EST)
Received: from hal-station (ip74-208-79-7.pbiaas.com [74.208.79.7])
 by mta-12.privateemail.com (Postfix) with ESMTPA;
 Fri, 27 Feb 2026 15:58:47 -0500 (EST)
Date: Fri, 27 Feb 2026 15:58:43 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
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
Message-ID: <aaIFg53tniZG5woJ@hal-station>
References: <20260220171518.711594-1-someguy@effective-light.com>
 <20260220171518.711594-2-someguy@effective-light.com>
 <c5ef0c6d-3620-4c8e-8b44-0c217897e6ed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5ef0c6d-3620-4c8e-8b44-0c217897e6ed@amd.com>
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
	FREEMAIL_CC(0.00)[lists.freedesktop.org,mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4D59F1BE03E
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:34:17AM +0100, Christian König wrote:
> > @@ -11085,8 +11087,26 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
> >  	/* Signal HW programming completion */
> >  	drm_atomic_helper_commit_hw_done(state);
> >  
> > -	if (wait_for_vblank)
> > -		drm_atomic_helper_wait_for_flip_done(dev, state);
> > +	if (wait_for_vblank &&
> > +	    drm_atomic_helper_wait_for_flip_done(dev, state)) {
> > +		mutex_lock(&dm->dc_lock);
> > +		if (dm_dmub_hw_init(adev))
> 
> From Michel's explanation that is pretty much a no-go because it potentially causes other atomic commits to react in unforeseen ways.
> 

This code would only run if the forced modeset fails, which is to say we
are already in a hung state, so I don't expect any other atomic commits
to be firing off. Also, evidently the timeout isn't a one off, so it's
almost certainly caused by hung firmware and not by a bug in the
driver's vblanking code.

> > +			drm_dev_wedged_event(dev, DRM_WEDGE_RECOVERY_REBIND |
> > +					     DRM_WEDGE_RECOVERY_BUS_RESET,
> > +					     NULL);
> 
> Please completely drop that. This here is a sledge hammer and not going to fly anywhere.
> 

I don't feel too strongly about it, though isn't the point to inform
userspace that we were unable to recover? AFAIK the prescribed methods
are mere suggestions and users can choose to ignore them if they feel
that they are too hard hitting.

> > +		mutex_unlock(&dm->dc_lock);
> > +
> > +		spin_lock_irqsave(&dev->event_lock, flags);
> > +		drm_for_each_crtc(crtc, dev) {
> 
> This should go over only the CRTCs in the atomic commit currently handled.
> 
> Have you tried sending a hotplug event for the connectors in question as Michel suggested?
> 

Sure, I can look into that. However, we would still need the firmware
reload. Otherwise, we would just be forcing a modeset twice in
succession.
