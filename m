Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D481961318
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 17:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA99810E359;
	Tue, 27 Aug 2024 15:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gqHSbRZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2E610E359
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 15:42:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAA1AFF80A;
 Tue, 27 Aug 2024 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724773361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+RzhyD4pAb8rc1lSUeRwv5lvL+vcNuJMOqKPxo1GRU=;
 b=gqHSbRZrur+CEvmPouhBDiWol//XNNdwjg4HH9fOMmrAuHToqUAUcILWmx9xVdm0eY9v5r
 6FaQ0vHwIOXa8mryM2hiJ3Yy706o3W7rfP5r0OOY8H4f24WVv32aTCpGlzZ+hnM70XLVJf
 h/9KsWxKhPpWNactdauoJ7xUCiCsMQhIj9eMBrakqEVy47nKz5rg9iC/dmSFK/GewefvET
 iy0CK6nv/TPg8JT6Nsuwh/wjIOoIHSUVAxufM1yVcrCTed9/TPSCpPwQPd/euZM3C4xgRj
 QXthGlNwOLTXg2KTly1uRv0gNZ1MOP48hMrRPieUkCW6paoToLxlzuAEWRXUow==
Date: Tue, 27 Aug 2024 17:42:38 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC 11/15] drm: writeback: Add drm_writeback_connector
 cleanup
Message-ID: <Zs3z7tx4dMBfY_DX@louis-chauvet-laptop>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
 <20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com>
 <20240827-solid-adorable-coucal-c3e0d1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827-solid-adorable-coucal-c3e0d1@houat>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 27/08/24 - 16:33, Maxime Ripard a écrit :
> Hi,
> 
> On Wed, Aug 14, 2024 at 04:36:33PM GMT, Louis Chauvet wrote:
> > Currently drm_writeback_connector are created by
> > drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> > Both of the function uses drm_connector_init and drm_encoder_init, but
> > there is no way to properly clean those structure from outside.
> > 
> > This patch introduce the new function drm_writeback_connector_cleanup to
> > allow a proper cleanup.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 10 ++++++++++
> >  include/drm/drm_writeback.h     | 11 +++++++++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > index a031c335bdb9..505a4eb40f93 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -184,6 +184,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> >  	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> >  
> >  	wb_connector->encoder.possible_crtcs = possible_crtcs;
> > +	wb_connector->managed_encoder = true;
> >  
> >  	ret = drm_encoder_init(dev, &wb_connector->encoder,
> >  			       &drm_writeback_encoder_funcs,
> > @@ -290,6 +291,15 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> >  
> > +void drm_writeback_connector_cleanup(struct drm_writeback_connector *wb_connector)
> > +{
> > +	drm_connector_cleanup(&wb_connector->base);
> > +	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> > +	if (wb_connector->managed_encoder)
> > +		drm_encoder_cleanup(&wb_connector->encoder);
> > +}
> > +EXPORT_SYMBOL(drm_writeback_connector_cleanup);
> > +
> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> >  			 struct drm_framebuffer *fb)
> >  {
> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > index 17e576c80169..e651c0c0c84c 100644
> > --- a/include/drm/drm_writeback.h
> > +++ b/include/drm/drm_writeback.h
> > @@ -35,6 +35,15 @@ struct drm_writeback_connector {
> >  	 */
> >  	struct drm_encoder encoder;
> >  
> > +	/**
> > +	 * @managed_encoder: Sets to true if @encoder was created by drm_writeback_connector_init()
> > +	 *
> > +	 * If the user used drm_writeback_connector_init_with_encoder() to create the connector,
> > +	 * @encoder is not valid and not managed by drm_writeback_connector. This fields allows
> > +	 * the drm_writeback_cleanup() function to properly destroy the encoder if needed.
> > +	 */
> > +	bool managed_encoder;
> > +
> 
> I think we should rather create drmm_writeback_connector variants,
> and make both deprecated in favor of these new functions.

Hi,

I can try to do it. If I understand correctly, you want to create two 
functions like this? 

	int drmm_writeback_connector_init([...]) {
		/* drmm and alloc as we want to let drm core to manage this 
		   encoder, no need to store it in drm_writeback_connector 
		   */
		enc = drmm_plain_encoder_alloc(...);

		return drmm_writeback_connector_init_with_encoder([...], enc);
	}

	int drmm_writeback_connector_init_with_encoder([...], enc) {
		con = drmm_connector_init([...]);

		drm_connector_attach_encoder(enc, con);

		/* Needed for pixel_formats_blob_ptr, base is already 
		   managed by drmm_connector_init. Maybe cleaning 
		   job_queue is also needed? */
		drmm_add_action_or_reset([...], &drm_writeback_connector_cleanup)
	}

Louis Chauvet
 
> Maxime


