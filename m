Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA249B2BF7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F7710E0F7;
	Mon, 28 Oct 2024 09:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bPcnx/7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB5C10E444
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:50:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCE59240003;
 Mon, 28 Oct 2024 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730109040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iXNgFaNFtSns2DCVg0GSMcGToXEA5qFu8Wsybweyro=;
 b=bPcnx/7JOcyWD7HWhAGBfrhmrpaW51G1wRUxbp/+qUXDcu54ogUEnJgrm1ZpbRuMkFfNsM
 dqfrwIZfwZVlJ4JRrpvXPAEkXVBVVDcOAi9J40UpbDAteeQnr/VgT7UJvcg/9LOUZFvzi1
 UB6kZ559PR5xrlq8xw3qqV1NFL43FdFtVXDaCXdNRT2Xjwnj0fTDdzz0dbpbulrV3PbAdJ
 XBN3cFOKAltdbJ1PQTHodJc93etM2Mh8A6alYhij88QP3/At/+dWGufRln7fn2vRJtkJBh
 ZE9CL+txdXqmzg3UdupkC/ZOqDGqUwHwmHHBMb1/CAsuUMdZ9miGSsTpilxQ4Q==
Date: Mon, 28 Oct 2024 10:50:37 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
Subject: Re: [PATCH v4 0/5] drm/vkms: Switch all vkms object to DRM managed
 objects
Message-ID: <Zx9ebTnZSGNBeTi9@fedora>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
 <04289755-6794-4337-aa91-bf4a7754c090@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04289755-6794-4337-aa91-bf4a7754c090@riseup.net>
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

On 26/10/24 - 12:33, Maíra Canal wrote:
> Hi Louis,
> 
> How do you feel about adding the patch [1] to this series? This will
> avoid issues when reviewing and pushing the series?

Ack!

Thanks,
Louis Chauvet
 
> [1] https://lore.kernel.org/all/20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com/
> 
> Best Regards,
> - Maíra
> 
> On 10/10/24 14:39, Louis Chauvet wrote:
> > To simplify the memory managment this series replace all manual drm
> > object managment by drm-managed one. This way the VKMS code don't have to
> > manage it directly and the DRM core will handle the object destruction.
> > 
> > No functional changes are intended in this series. This series depends on
> > [2] (for some code cleanup, which conflict with this series).
> > 
> > PATCH 1/5: Migrate connector managment to drmm
> > PATCH 2/5: Migrate encoder managment to drmm
> > PATCH 3/5: Migrate connector management to drm
> > PATCH 4/5: Introduce drmm_writeback helpers
> > PATCH 5/5: Migrate writeback connector management to drm
> > 
> > [2]:https://lore.kernel.org/all/20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com/
> > 
> > For the drmm_writeback helpers, you can find some discussions here [3].
> > 
> > [3]:https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > Changes in v4:
> > - No changes for the managed part
> > - Add the patch to introduce drmm_writeback helpers
> > - Link to v3: https://lore.kernel.org/r/20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com
> > 
> > Changes in v3:
> > - As suggested by Maxime, split the managed and the dynamic allocation
> >    parts in different series
> > - To reduce the diff in this series, extract the "remove crtc index" part,
> >    see https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> > - Link to v2: https://lore.kernel.org/r/20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com
> > 
> > Changes in v2:
> > - Applied comments from José
> > - Extract the rename vkms_output -> vkms_crtc to avoid useless changes in
> >    the last commit
> > - Extract the rename to_vkms_crtc_state to
> >    drm_crtc_state_to_vkms_crtc_state to avoid useless changes in last
> >    commit
> > - Extract the drm_mode_crtc_set_gamma_size result check in its own commit
> > - Rebased on drm-misc/drm-misc-next
> > - Link to v1: https://lore.kernel.org/r/20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com
> > 
> > ---
> > Louis Chauvet (5):
> >        drm/vkms: Switch to managed for connector
> >        drm/vkms: Switch to managed for encoder
> >        drm/vkms: Switch to managed for crtc
> >        drm: writeback: Introduce drm managed helpers
> >        drm/vkms: Switch to managed for writeback connector
> > 
> >   drivers/gpu/drm/drm_connector.c       |   4 +
> >   drivers/gpu/drm/drm_writeback.c       | 224 +++++++++++++++++++++++++++++-----
> >   drivers/gpu/drm/vkms/vkms_crtc.c      |  14 +++
> >   drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
> >   drivers/gpu/drm/vkms/vkms_output.c    |  31 ++---
> >   drivers/gpu/drm/vkms/vkms_writeback.c |  13 +-
> >   include/drm/drm_writeback.h           |  10 ++
> >   7 files changed, 238 insertions(+), 67 deletions(-)
> > ---
> > base-commit: 33c255312660653cf54f8019896b5dca28e3c580
> > change-id: 20240521-google-vkms-managed-4aec99461a77
> > prerequisite-message-id: <20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com>
> > prerequisite-patch-id: 920c23497fc5bd2fdf1dded06ce198c227ea0ef9
> > 
> > Best regards,
> 
