Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F779B1926
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 17:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05CD10E043;
	Sat, 26 Oct 2024 15:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="VSqE5Ycd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1866010E043
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 15:34:04 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XbNwq4BL5z9vrF;
 Sat, 26 Oct 2024 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729956843; bh=oOBasN7BWJEgqL8ZPbJwa1VW+Hv1/eaT3xvnT7fCnGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VSqE5YcdMsiyEjz+oJlmqNn+z89x5X3qpLzGJgjWMGJdpVIS9IbPLXniv0JJNdF1X
 nsTJ4+vOiObFWbDFV/C1LX4NEqC3vKhFSWW0LOcflY2nXbOnHmQ0FlQotRzq8wtlMI
 xyE350QXUWZMRWng3QGrK46dv/nKqaOMyi/wjchY=
X-Riseup-User-ID: 5911B0460AB3700CEAFD7CA77B70E7072B5738275509B3E16B72FA4711D960AF
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4XbNwV3mwNzJsb2;
 Sat, 26 Oct 2024 15:33:46 +0000 (UTC)
Message-ID: <04289755-6794-4337-aa91-bf4a7754c090@riseup.net>
Date: Sat, 26 Oct 2024 12:33:44 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] drm/vkms: Switch all vkms object to DRM managed
 objects
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Louis,

How do you feel about adding the patch [1] to this series? This will
avoid issues when reviewing and pushing the series?

[1] 
https://lore.kernel.org/all/20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com/

Best Regards,
- Maíra

On 10/10/24 14:39, Louis Chauvet wrote:
> To simplify the memory managment this series replace all manual drm
> object managment by drm-managed one. This way the VKMS code don't have to
> manage it directly and the DRM core will handle the object destruction.
> 
> No functional changes are intended in this series. This series depends on
> [2] (for some code cleanup, which conflict with this series).
> 
> PATCH 1/5: Migrate connector managment to drmm
> PATCH 2/5: Migrate encoder managment to drmm
> PATCH 3/5: Migrate connector management to drm
> PATCH 4/5: Introduce drmm_writeback helpers
> PATCH 5/5: Migrate writeback connector management to drm
> 
> [2]:https://lore.kernel.org/all/20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com/
> 
> For the drmm_writeback helpers, you can find some discussions here [3].
> 
> [3]:https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Changes in v4:
> - No changes for the managed part
> - Add the patch to introduce drmm_writeback helpers
> - Link to v3: https://lore.kernel.org/r/20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com
> 
> Changes in v3:
> - As suggested by Maxime, split the managed and the dynamic allocation
>    parts in different series
> - To reduce the diff in this series, extract the "remove crtc index" part,
>    see https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> - Link to v2: https://lore.kernel.org/r/20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com
> 
> Changes in v2:
> - Applied comments from José
> - Extract the rename vkms_output -> vkms_crtc to avoid useless changes in
>    the last commit
> - Extract the rename to_vkms_crtc_state to
>    drm_crtc_state_to_vkms_crtc_state to avoid useless changes in last
>    commit
> - Extract the drm_mode_crtc_set_gamma_size result check in its own commit
> - Rebased on drm-misc/drm-misc-next
> - Link to v1: https://lore.kernel.org/r/20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com
> 
> ---
> Louis Chauvet (5):
>        drm/vkms: Switch to managed for connector
>        drm/vkms: Switch to managed for encoder
>        drm/vkms: Switch to managed for crtc
>        drm: writeback: Introduce drm managed helpers
>        drm/vkms: Switch to managed for writeback connector
> 
>   drivers/gpu/drm/drm_connector.c       |   4 +
>   drivers/gpu/drm/drm_writeback.c       | 224 +++++++++++++++++++++++++++++-----
>   drivers/gpu/drm/vkms/vkms_crtc.c      |  14 +++
>   drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
>   drivers/gpu/drm/vkms/vkms_output.c    |  31 ++---
>   drivers/gpu/drm/vkms/vkms_writeback.c |  13 +-
>   include/drm/drm_writeback.h           |  10 ++
>   7 files changed, 238 insertions(+), 67 deletions(-)
> ---
> base-commit: 33c255312660653cf54f8019896b5dca28e3c580
> change-id: 20240521-google-vkms-managed-4aec99461a77
> prerequisite-message-id: <20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com>
> prerequisite-patch-id: 920c23497fc5bd2fdf1dded06ce198c227ea0ef9
> 
> Best regards,

