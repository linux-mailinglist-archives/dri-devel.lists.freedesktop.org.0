Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90BFAC644C
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 10:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568F410E59C;
	Wed, 28 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XQBmtfRd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dvJt6W9e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XQBmtfRd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dvJt6W9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FD310E5B1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:23:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5358A21D18;
 Wed, 28 May 2025 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748420622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IsYeUMzNWf+c4bLmoKUOHp5YpWvtC7v74oJ9jXBtnHM=;
 b=XQBmtfRd9f0BD+wpJmfsDg89bjVUFtWxyB8+k37xabISALbh+H9l1F8nnknU7GJur2Ir6r
 Kmlkb+phPU6vHmBUvrOzKLyPdCDiqZ5OX7tAinz1caXlC0ZC8KfcFq7XHirFV3R3ifXNaY
 lyqWj/ehrK8c6iCWlXr1VU2Q1LKJ/G4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748420622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IsYeUMzNWf+c4bLmoKUOHp5YpWvtC7v74oJ9jXBtnHM=;
 b=dvJt6W9eqTR5Rd+KiuP01H+RwKo8jKPYSaFQcOmtWsSoyOZPFSM4P/6LbT/SZoQfSnPT4b
 VftOkM9jdhB63YBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748420622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IsYeUMzNWf+c4bLmoKUOHp5YpWvtC7v74oJ9jXBtnHM=;
 b=XQBmtfRd9f0BD+wpJmfsDg89bjVUFtWxyB8+k37xabISALbh+H9l1F8nnknU7GJur2Ir6r
 Kmlkb+phPU6vHmBUvrOzKLyPdCDiqZ5OX7tAinz1caXlC0ZC8KfcFq7XHirFV3R3ifXNaY
 lyqWj/ehrK8c6iCWlXr1VU2Q1LKJ/G4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748420622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IsYeUMzNWf+c4bLmoKUOHp5YpWvtC7v74oJ9jXBtnHM=;
 b=dvJt6W9eqTR5Rd+KiuP01H+RwKo8jKPYSaFQcOmtWsSoyOZPFSM4P/6LbT/SZoQfSnPT4b
 VftOkM9jdhB63YBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC0DA136E0;
 Wed, 28 May 2025 08:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pmh/MA3INmgxVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 28 May 2025 08:23:41 +0000
Message-ID: <1926848a-9334-4c15-a076-a93ef29c80d6@suse.de>
Date: Wed, 28 May 2025 10:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/25] drm/dumb-buffers: Fix and improve buffer-size
 calculation
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
References: <20250311155120.442633-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[20]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_NONE(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
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

ping

I'm still looking for more reviews; especially patches 1 and 2.

Best regards
Thomas

Am 11.03.25 um 16:47 schrieb Thomas Zimmermann:
> Dumb-buffer pitch and size is specified by width, height, bits-per-pixel
> plus various hardware-specific alignments. The calculation of these
> values is inconsistent and duplicated among drivers. The results for
> formats with bpp < 8 are sometimes incorrect.
>
> This series fixes this for most drivers. Default scanline pitch and
> buffer size are now calculated with the existing 4CC helpers. There is
> a new helper drm_mode_size_dumb() that calculates scanline pitch and
> buffer size according to driver requirements.
>
> The series fixes the common GEM implementations for DMA, SHMEM and
> VRAM. It further changes most implementations of dumb_create to use
> the new helper. A small number of drivers has more complicated
> calculations and will be updated by a later patches.
>
> v4:
> - improve UAPI documentation
> - document bpp special cases
> - use drm_warn_once()
> - add TODO lists
> - armada: fix pitch alignment
> v3:
> - document UAPI semantics
> - fall back to bpp-based allocation for unknown color modes
> - cleanups
> v2:
> - rewrite series
> - convert many individual drivers besides the shared GEM helpers
>
> Thomas Zimmermann (25):
>    drm/dumb-buffers: Sanitize output on errors
>    drm/dumb-buffers: Provide helper to set pitch and size
>    drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/renesas/rcar-du: Compute dumb-buffer sizes with
>      drm_mode_size_dumb()
>    drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
>
>   Documentation/gpu/todo.rst                    |  28 +++
>   drivers/gpu/drm/armada/armada_gem.c           |  16 +-
>   drivers/gpu/drm/drm_dumb_buffers.c            | 172 ++++++++++++++++--
>   drivers/gpu/drm/drm_gem_dma_helper.c          |   7 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c        |  16 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  89 +++------
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       |   8 +-
>   drivers/gpu/drm/gma500/gem.c                  |  21 +--
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  25 ++-
>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  29 ++-
>   drivers/gpu/drm/loongson/lsdc_gem.c           |  29 +--
>   drivers/gpu/drm/mediatek/mtk_gem.c            |  13 +-
>   drivers/gpu/drm/msm/msm_gem.c                 |  27 ++-
>   drivers/gpu/drm/nouveau/nouveau_display.c     |   7 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c            |  15 +-
>   drivers/gpu/drm/qxl/qxl_dumb.c                |  17 +-
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   7 +-
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   7 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  12 +-
>   drivers/gpu/drm/tegra/gem.c                   |   8 +-
>   drivers/gpu/drm/virtio/virtgpu_gem.c          |  11 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  21 +--
>   drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
>   drivers/gpu/drm/xen/xen_drm_front.c           |   7 +-
>   drivers/gpu/drm/xlnx/zynqmp_kms.c             |   7 +-
>   include/drm/drm_dumb_buffers.h                |  14 ++
>   include/drm/drm_gem_vram_helper.h             |   6 -
>   include/uapi/drm/drm_mode.h                   |  50 ++++-
>   28 files changed, 449 insertions(+), 228 deletions(-)
>   create mode 100644 include/drm/drm_dumb_buffers.h
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

