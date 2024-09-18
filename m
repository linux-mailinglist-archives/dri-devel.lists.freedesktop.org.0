Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9B97BD4A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE5310E5B5;
	Wed, 18 Sep 2024 13:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="akTmxwdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C7610E5B5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:48:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A8041C0013;
 Wed, 18 Sep 2024 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726667282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvpWoQXAYtUPd9EY76fswMQOKLOSqERrVd3F2SkMjkI=;
 b=akTmxwdMuiZEErfM02jtFIUMh43UIxfDd11v7OJBJbewtnqjma2PuaxZayXGLiL8Nwg1DL
 sRNwb+9s9u+p5usq/rRgrWoQDX6+8fhTMMElzqjSPO9g9kbG/gt3zBTApwP5TYtnPyhykM
 KvJFqRYOfdtQf360fz+Hw2P0hQSLWxE1GhEDAdKWi2+1whnHz1GEHmSLW7EVp/ArGRDuEo
 jZaaPldqSu/kmvuqygI3/V3l52VfQe1pvwmMeG/IKrjqnfn5oaOSVPpjX09B1Chk+xvsQF
 b6Z1dwTcU6EV8ZGO2GiQNjASjNjEWC2rIoKTlOs5tfrKzcE+EvT1irnws9rygA==
Date: Wed, 18 Sep 2024 15:47:59 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/4] drm/vkms: Switch all vkms object to DRM managed
 objects
Message-ID: <ZuraD0t6KZTGTFng@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
 <20240917160242.2959-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917160242.2959-1-jose.exposito89@gmail.com>
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

Le 17/09/24 - 18:02, José Expósito a écrit :
> Hi Louis,
> 
> Thanks for making this change even more atomic.
> 
> > To simplify the memory managment this series replace all manual drm 
> > object managment by drm-managed one. This way the VKMS code don't have to 
> > manage it directly and the DRM core will handle the object destruction.
> > 
> > No functional changes are intended in this series. This series depends on 
> > [1] (for writeback connector) and [2] (for cleaning code).
> > 
> > PATCH 1/4: Migrate connector managment to drmm
> > PATCH 2/4: Migrate encoder managment to drmm
> > PATCH 3/4: Migrate connector management to drm
> > PATCH 4/4: Migrate writeback connector management to drm
> > 
> > [1]: https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/
> > [2]: https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The 4 patches:
> Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks!
Louis Chauvet
 
> > ---
> > Changes in v3:
> > - As suggested by Maxime, split the managed and the dynamic allocation 
> >   parts in different series
> > - To reduce the diff in this series, extract the "remove crtc index" part, 
> >   see https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> > - Link to v2: https://lore.kernel.org/r/20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com
> > 
> > Changes in v2:
> > - Applied comments from José
> > - Extract the rename vkms_output -> vkms_crtc to avoid useless changes in 
> >   the last commit
> > - Extract the rename to_vkms_crtc_state to
> >   drm_crtc_state_to_vkms_crtc_state to avoid useless changes in last 
> >   commit
> > - Extract the drm_mode_crtc_set_gamma_size result check in its own commit
> > - Rebased on drm-misc/drm-misc-next
> > - Link to v1: https://lore.kernel.org/r/20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com> 
