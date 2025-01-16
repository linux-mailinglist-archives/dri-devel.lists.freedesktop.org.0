Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A9A13E59
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACC710E9B7;
	Thu, 16 Jan 2025 15:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtTaPVly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FD510E9B7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:55:02 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38a88ba968aso1069032f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737042841; x=1737647641; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y6d0AIUCANmrxg6EkzbtG7EaPw/qbwR7hp+uthpgvFE=;
 b=WtTaPVlyTZL1uvWQmpnH9eyj2VT2reN7/hBkrr71jODm0Hfc8Py4HP+2LZIQJpAxj4
 iLIggQmQ2ZQhFJKmKxjQuP3fmu958nCfN8DjF4/m9CKPd5YH4I3EwgrtOtkZPtYkn6b6
 /ol7jUuwcfw13fEwC7Wn0+TK3JATL3c43uDxzkek4tMSpnNbj2z1B/VIhRbHKpXCHiuQ
 EsLTfCIG3HbbCTMkdPwc41S1XF7o56+gHbPunGSHklK+fJiC2WK/bJ3ta5fLj5p0bQL4
 OverFDb6gIM/xz8pScjhBI+AocyHFEhgvDql/+33yUB2qfHlnzTiTYMx0Mx0S6NiByyG
 i+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042841; x=1737647641;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y6d0AIUCANmrxg6EkzbtG7EaPw/qbwR7hp+uthpgvFE=;
 b=qta+VT2A6G7Yz9wFclMnGKszbqIpmzMJOKif2rL1iWirqXMPeKZMvB/TdQmSBTYBCJ
 1WfhOVyyZyYkkbobDZQEravJoaUXLBdTXnu6kECnc4BeiOSWqnWZnaoVslFMu1WnBqRi
 zYn+PFq2yFydbzw7Ujf1ak4ZycHmFjPcw3luEBKXQ4JCZp8sMK7neqmY3t1lyoinCnsa
 N3Lz/mD9XIuuGLpo3qnvh5u/TT+ncLiVWwYv0H2l9Sp3BvDZcjsCSZu4N7rmr9MJLouM
 wJG0gvQEMfundfBShW3LMRcAld8TdLPfJaqad/r0m9M7OJkTBFvm0lCTbMI6muDIjupl
 xzyQ==
X-Gm-Message-State: AOJu0YzwYetu+FyAN7jODkUizW9gxZbG7TEzW3OorztIEWwFt+GeBvY5
 NcMhuWP/93TrKSksOwgwdUikNgU/Rlt3FScmHbm3lBm3agOR14NY
X-Gm-Gg: ASbGncuOqXde8p8qKYTtttntqs7SGYBvdLGn7sKfQ651T1wpuwILtC6/fi6eb0Ry8w+
 Zcjne8SOCp3i7dijfahfFAcjU91YHVzkmP5cVTm4iie1O/cR8wh1VyAPJkA0DKTtQTX6VXTm0OB
 H2sidHU1sbokQ+kuMnaEiqP6RKn+SjaWIfy8GKxrpM6K9ufEoVx6RTHQQJ7+0LfZ1eYCOZgrYvH
 DLHYeGV89y40xFDpNiE3idSH2WnSFOKglKYfU26C++/HQRtUF/ojio=
X-Google-Smtp-Source: AGHT+IGriCgwafyapYW3f3+L6LKps1+fxUAv0OQOzclfLTVqCL+rQ8MW9tc6ovrRSNXOXuy1lO/Niw==
X-Received: by 2002:a05:6000:18a4:b0:38a:9fdb:7307 with SMTP id
 ffacd0b85a97d-38a9fdb750amr21326769f8f.43.1737042840763; 
 Thu, 16 Jan 2025 07:54:00 -0800 (PST)
Received: from fedora ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32755f0sm186116f8f.76.2025.01.16.07.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:54:00 -0800 (PST)
Date: Thu, 16 Jan 2025 16:53:57 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v7 7/7] drm/vkms: Switch to managed for writeback connector
Message-ID: <Z4krlfWDSAC3X54g@fedora>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
 <20250113-google-vkms-managed-v7-7-4f81d1893e0b@bootlin.com>
 <Z4VJY03TZlgzn3ib@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4VJY03TZlgzn3ib@louis-chauvet-laptop>
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

On Mon, Jan 13, 2025 at 06:12:03PM +0100, Louis Chauvet wrote:
> On 13/01/25 - 18:09, Louis Chauvet wrote:
> > The current VKMS driver uses non-managed function to create
> > writeback connectors. It is not an issue yet, but in order
> > to support multiple devices easily, convert this code to
> > use drm and device managed helpers.
> > 
> > Reviewed-by: José Expósito <jose.exposito89@gmail.com>
> 
> Hi,
> 
> Sorry José, I forgot to remove your Reviewed-by, the changes made here are 
> not trivials. Can I keep it or do you have any comments ?

Hi Louis,

No problem, feel free to keep it. I had a look to v8 and its looking
great, sending a few review-by to that version.

I'll try to rebase my branch and run all the automated tests I have
been writen just in case they catch a bug.

Best wishes,
Jose
 
> Sorry,
> Louis Chauvet
> 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h       |  3 ++-
> >  drivers/gpu/drm/vkms/vkms_output.c    |  2 +-
> >  drivers/gpu/drm/vkms/vkms_writeback.c | 21 +++++++++++++--------
> >  3 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 00541eff3d1b0aa4b374fb94c8fe34932df31509..46ac36aebb27ce8d9018224735007c1b3fe7d0a5 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -179,6 +179,7 @@ struct vkms_output {
> >  	struct drm_encoder encoder;
> >  	struct drm_connector connector;
> >  	struct drm_writeback_connector wb_connector;
> > +	struct drm_encoder wb_encoder;
> >  	struct hrtimer vblank_hrtimer;
> >  	ktime_t period_ns;
> >  	struct workqueue_struct *composer_workq;
> > @@ -275,6 +276,6 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
> >  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
> >  
> >  /* Writeback */
> > -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> > +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc);
> >  
> >  #endif /* _VKMS_DRV_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index ab9affa75b66ce9f00fe025052439405206144ec..de817e2794860f9071a71b3631460691e0d73a85 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -95,7 +95,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  	}
> >  
> >  	if (vkmsdev->config->writeback) {
> > -		writeback = vkms_enable_writeback_connector(vkmsdev);
> > +		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> >  		if (writeback)
> >  			DRM_ERROR("Failed to init writeback connector\n");
> >  	}
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index 79918b44fedd7ae2451d1d530fc6d5aabf2d99a3..981975c2b0a0c75e4a3aceca2a965f5876ae0a8f 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -24,7 +24,6 @@ static const u32 vkms_wb_formats[] = {
> >  
> >  static const struct drm_connector_funcs vkms_wb_connector_funcs = {
> >  	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >  	.reset = drm_atomic_helper_connector_reset,
> >  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > @@ -163,16 +162,22 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
> >  	.atomic_check = vkms_wb_atomic_check,
> >  };
> >  
> > -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> > +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc)
> >  {
> >  	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> > +	int ret;
> > +
> > +	ret = drmm_encoder_init(&vkmsdev->drm, &vkmsdev->output.wb_encoder,
> > +				NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
> > +	if (ret)
> > +		return ret;
> > +	vkmsdev->output.wb_encoder.possible_crtcs |= drm_crtc_mask(crtc);
> >  
> >  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
> >  
> > -	return drm_writeback_connector_init(&vkmsdev->drm, wb,
> > -					    &vkms_wb_connector_funcs,
> > -					    NULL,
> > -					    vkms_wb_formats,
> > -					    ARRAY_SIZE(vkms_wb_formats),
> > -					    1);
> > +	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
> > +					     &vkms_wb_connector_funcs,
> > +					     &vkmsdev->output.wb_encoder,
> > +					     vkms_wb_formats,
> > +					     ARRAY_SIZE(vkms_wb_formats));
> >  }
> > 
> > -- 
> > 2.47.1
> > 
