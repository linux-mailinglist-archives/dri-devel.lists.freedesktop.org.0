Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC8BA7F5AD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFF010E5E7;
	Tue,  8 Apr 2025 07:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E9nqgCVi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fc+rOtNR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EbOOEp/X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9XvxjXgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8D10E5E2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:09:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E05D721185;
 Tue,  8 Apr 2025 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744096160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qcYfPtObY4jh9a6cHQvRsmyN2GB/2/EyepTsdOdigSY=;
 b=E9nqgCVizC8D11EpAMrOUIfRJ8t+u/yoovk3BP4qSGLMC15KXEENlT6en2S7N5QDIV+5Xq
 +xg1r3Wymxp46FydsIgToYQU1i3oBzaYOdmX0iFWr5xvjBB196TD9pTYBXqIXFcsPFKsPu
 sEstyUkZJ/CkpgwoDY+GJ1s9WTU/Rjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744096160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qcYfPtObY4jh9a6cHQvRsmyN2GB/2/EyepTsdOdigSY=;
 b=fc+rOtNRwgYFY/LzFrV25eAZg26XHGnT9A11NebaUsPV0JcgPA1AS8BBC6zD8y2BPASJW1
 c+uWDppVac8RMIAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744096159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qcYfPtObY4jh9a6cHQvRsmyN2GB/2/EyepTsdOdigSY=;
 b=EbOOEp/XIStnfEp1OpfGOzY1tiNTR7eVjZMYawRezrTvjYzvUlT+1ZZ8LLyn0Y7CUS6z0V
 jVmL0Pxu3TuEKMe5FHsYZ9Anh9Pxd0D3tqAOAjLBdWFsN1SBRduBvh6jKsPopGsg2/CZY9
 bQcKrZrvM5YVhcsZEW/iU9FCcz05IFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744096159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qcYfPtObY4jh9a6cHQvRsmyN2GB/2/EyepTsdOdigSY=;
 b=9XvxjXgw2A23RHPCpw1ZCEd6KYbRF0yeo8/+DsOVeKZFfcU1sUeOKwwFgXJvcV+xvr9fXN
 L1DdxePbVHpWAmAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B98B13691;
 Tue,  8 Apr 2025 07:09:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e4XMEJ7L9GeCNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 07:09:18 +0000
Message-ID: <cb61c4e3-3f23-4b36-8128-5fca46405e61@suse.de>
Date: Tue, 8 Apr 2025 09:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] PCI: add CONFIG_MMU dependency
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Saurav Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>,
 Manish Rangankar <mrangankar@marvell.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Lijo Lazar <lijo.lazar@amd.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, kvm@vger.kernel.org
References: <20250407104025.3421624-1-arnd@kernel.org>
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
In-Reply-To: <20250407104025.3421624-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[renesas,netdev]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[arndb.de,oss.qualcomm.com,quicinc.com,kernel.org,sakamocchi.jp,linux.intel.com,gmail.com,ffwll.ch,amd.com,redhat.com,linaro.org,hisilicon.com,google.com,loongson.cn,broadcom.com,intel.com,lunn.ch,davemloft.net,marvell.com,HansenPartnership.com,oracle.com,glider.be,weissschuh.net,linux.ibm.com,vger.kernel.org,lists.freedesktop.org,lists.sourceforge.net,lists.linux.dev];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_GT_50(0.00)[65];
 R_RATELIMIT(0.00)[to_ip_from(RLq3cifbxyhc6qbbynzfc6amns)]
X-Spam-Flag: NO
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



Am 07.04.25 um 12:38 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> It turns out that there are no platforms that have PCI but don't have an MMU,
> so adding a Kconfig dependency on CONFIG_PCI simplifies build testing kernels
> for those platforms a lot, and avoids a lot of inadvertent build regressions.
>
> Add a dependency for CONFIG_PCI and remove all the ones for PCI specific
> device drivers that are currently marked not having it.
>
> Link: https://lore.kernel.org/lkml/a41f1b20-a76c-43d8-8c36-f12744327a54@app.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For gpu/drm/

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/accel/qaic/Kconfig              | 1 -
>   drivers/firewire/Kconfig                | 2 +-
>   drivers/gpu/drm/Kconfig                 | 2 +-
>   drivers/gpu/drm/amd/amdgpu/Kconfig      | 3 +--
>   drivers/gpu/drm/ast/Kconfig             | 2 +-
>   drivers/gpu/drm/gma500/Kconfig          | 2 +-
>   drivers/gpu/drm/hisilicon/hibmc/Kconfig | 1 -
>   drivers/gpu/drm/loongson/Kconfig        | 2 +-
>   drivers/gpu/drm/mgag200/Kconfig         | 2 +-
>   drivers/gpu/drm/nouveau/Kconfig         | 3 +--
>   drivers/gpu/drm/qxl/Kconfig             | 2 +-
>   drivers/gpu/drm/radeon/Kconfig          | 2 +-
>   drivers/gpu/drm/tiny/Kconfig            | 2 +-
>   drivers/gpu/drm/vmwgfx/Kconfig          | 2 +-
>   drivers/gpu/drm/xe/Kconfig              | 2 +-
>   drivers/net/ethernet/broadcom/Kconfig   | 1 -
>   drivers/pci/Kconfig                     | 1 +
>   drivers/pci/pci.c                       | 4 ++--
>   drivers/scsi/bnx2fc/Kconfig             | 1 -
>   drivers/scsi/bnx2i/Kconfig              | 1 -
>   drivers/vfio/pci/Kconfig                | 2 +-
>   21 files changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
> index a9f866230058..5e405a19c157 100644
> --- a/drivers/accel/qaic/Kconfig
> +++ b/drivers/accel/qaic/Kconfig
> @@ -8,7 +8,6 @@ config DRM_ACCEL_QAIC
>   	depends on DRM_ACCEL
>   	depends on PCI && HAS_IOMEM
>   	depends on MHI_BUS
> -	depends on MMU
>   	select CRC32
>   	help
>   	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
> diff --git a/drivers/firewire/Kconfig b/drivers/firewire/Kconfig
> index 905c82e26ce7..a5f5e250223a 100644
> --- a/drivers/firewire/Kconfig
> +++ b/drivers/firewire/Kconfig
> @@ -83,7 +83,7 @@ config FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST
>   
>   config FIREWIRE_OHCI
>   	tristate "OHCI-1394 controllers"
> -	depends on PCI && FIREWIRE && MMU
> +	depends on PCI && FIREWIRE
>   	help
>   	  Enable this driver if you have a FireWire controller based
>   	  on the OHCI specification.  For all practical purposes, this
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2cba2b6ebe1c..6e95d204597e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -462,7 +462,7 @@ source "drivers/gpu/drm/imagination/Kconfig"
>   
>   config DRM_HYPERV
>   	tristate "DRM Support for Hyper-V synthetic video device"
> -	depends on DRM && PCI && MMU && HYPERV
> +	depends on DRM && PCI && HYPERV
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 1a11cab741ac..058e3b3ad520 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -2,7 +2,7 @@
>   
>   config DRM_AMDGPU
>   	tristate "AMD GPU"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	depends on !UML
>   	select FW_LOADER
>   	select DRM_CLIENT
> @@ -68,7 +68,6 @@ config DRM_AMDGPU_CIK
>   config DRM_AMDGPU_USERPTR
>   	bool "Always enable userptr write support"
>   	depends on DRM_AMDGPU
> -	depends on MMU
>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
>   	help
> diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig
> index da0663542e8a..242fbccdf844 100644
> --- a/drivers/gpu/drm/ast/Kconfig
> +++ b/drivers/gpu/drm/ast/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_AST
>   	tristate "AST server chips"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	select DRM_CLIENT_SELECTION
>   	select DRM_GEM_SHMEM_HELPER
>   	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index aa2ea128aa2f..a2acaa699dd5 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_GMA500
>   	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> -	depends on DRM && PCI && X86 && MMU && HAS_IOPORT
> +	depends on DRM && PCI && X86 && HAS_IOPORT
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
>   	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> index 98d77d74999d..d1f3f5793f34 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -2,7 +2,6 @@
>   config DRM_HISI_HIBMC
>   	tristate "DRM Support for Hisilicon Hibmc"
>   	depends on DRM && PCI
> -	depends on MMU
>   	select DRM_CLIENT_SELECTION
>   	select DRM_DISPLAY_HELPER
>   	select DRM_DISPLAY_DP_HELPER
> diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
> index 552edfec7afb..d739d51cf54c 100644
> --- a/drivers/gpu/drm/loongson/Kconfig
> +++ b/drivers/gpu/drm/loongson/Kconfig
> @@ -2,7 +2,7 @@
>   
>   config DRM_LOONGSON
>   	tristate "DRM support for Loongson Graphics"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	depends on LOONGARCH || MIPS || COMPILE_TEST
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
> index 412dcbea0e2d..a962ae564a75 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_MGAG200
>   	tristate "Matrox G200"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	select DRM_CLIENT_SELECTION
>   	select DRM_GEM_SHMEM_HELPER
>   	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 7b3e979c51ec..d1587639ebb0 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_NOUVEAU
>   	tristate "Nouveau (NVIDIA) cards"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	select IOMMU_API
>   	select FW_LOADER
>   	select FW_CACHE if PM_SLEEP
> @@ -94,7 +94,6 @@ config DRM_NOUVEAU_SVM
>   	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
>   	depends on DEVICE_PRIVATE
>   	depends on DRM_NOUVEAU
> -	depends on MMU
>   	depends on STAGING
>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
> diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
> index 69427eb8bed2..d8f24bcae34b 100644
> --- a/drivers/gpu/drm/qxl/Kconfig
> +++ b/drivers/gpu/drm/qxl/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_QXL
>   	tristate "QXL virtual GPU"
> -	depends on DRM && PCI && MMU && HAS_IOPORT
> +	depends on DRM && PCI && HAS_IOPORT
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
>   	select DRM_TTM
> diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
> index f51bace9555d..c479f0c0dd5c 100644
> --- a/drivers/gpu/drm/radeon/Kconfig
> +++ b/drivers/gpu/drm/radeon/Kconfig
> @@ -2,7 +2,7 @@
>   
>   config DRM_RADEON
>   	tristate "ATI Radeon"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	depends on AGP || !AGP
>   	select FW_LOADER
>   	select DRM_CLIENT_SELECTION
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 54c84c9801c1..6ca12fe7f57a 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -37,7 +37,7 @@ config DRM_BOCHS
>   
>   config DRM_CIRRUS_QEMU
>   	tristate "Cirrus driver for QEMU emulated device"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
> index 6c3c2922ae8b..aab646b91ca9 100644
> --- a/drivers/gpu/drm/vmwgfx/Kconfig
> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   config DRM_VMWGFX
>   	tristate "DRM driver for VMware Virtual GPU"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI
>   	depends on (X86 && HYPERVISOR_GUEST) || ARM64
>   	select DRM_CLIENT_SELECTION
>   	select DRM_TTM
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 5c2f459a2925..2dec62737ff6 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_XE
>   	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
> +	depends on DRM && PCI && (m || (y && KUNIT=y))
>   	select INTERVAL_TREE
>   	# we need shmfs for the swappable backing store, and in particular
>   	# the shmem_readpage() which depends upon tmpfs
> diff --git a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/Kconfig
> index eeec8bf17cf4..aa43984a05cf 100644
> --- a/drivers/net/ethernet/broadcom/Kconfig
> +++ b/drivers/net/ethernet/broadcom/Kconfig
> @@ -96,7 +96,6 @@ config BNX2
>   config CNIC
>   	tristate "QLogic CNIC support"
>   	depends on PCI && (IPV6 || IPV6=n)
> -	depends on MMU
>   	select BNX2
>   	select UIO
>   	help
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index da28295b4aac..9c0e4aaf4e8c 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -21,6 +21,7 @@ config GENERIC_PCI_IOMAP
>   menuconfig PCI
>   	bool "PCI support"
>   	depends on HAVE_PCI
> +	depends on MMU
>   	help
>   	  This option enables support for the PCI local bus, including
>   	  support for PCI-X and the foundations for PCI Express support.
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24..60a20a0ac41f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4257,7 +4257,7 @@ unsigned long __weak pci_address_to_pio(phys_addr_t address)
>   #ifndef pci_remap_iospace
>   int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
>   {
> -#if defined(PCI_IOBASE) && defined(CONFIG_MMU)
> +#if defined(PCI_IOBASE)
>   	unsigned long vaddr = (unsigned long)PCI_IOBASE + res->start;
>   
>   	if (!(res->flags & IORESOURCE_IO))
> @@ -4290,7 +4290,7 @@ EXPORT_SYMBOL(pci_remap_iospace);
>    */
>   void pci_unmap_iospace(struct resource *res)
>   {
> -#if defined(PCI_IOBASE) && defined(CONFIG_MMU)
> +#if defined(PCI_IOBASE)
>   	unsigned long vaddr = (unsigned long)PCI_IOBASE + res->start;
>   
>   	vunmap_range(vaddr, vaddr + resource_size(res));
> diff --git a/drivers/scsi/bnx2fc/Kconfig b/drivers/scsi/bnx2fc/Kconfig
> index ecdc0f0f4f4e..3cf7e08df809 100644
> --- a/drivers/scsi/bnx2fc/Kconfig
> +++ b/drivers/scsi/bnx2fc/Kconfig
> @@ -5,7 +5,6 @@ config SCSI_BNX2X_FCOE
>   	depends on (IPV6 || IPV6=n)
>   	depends on LIBFC
>   	depends on LIBFCOE
> -	depends on MMU
>   	select NETDEVICES
>   	select ETHERNET
>   	select NET_VENDOR_BROADCOM
> diff --git a/drivers/scsi/bnx2i/Kconfig b/drivers/scsi/bnx2i/Kconfig
> index 0cc06c2ce0b8..75ace2302fed 100644
> --- a/drivers/scsi/bnx2i/Kconfig
> +++ b/drivers/scsi/bnx2i/Kconfig
> @@ -4,7 +4,6 @@ config SCSI_BNX2_ISCSI
>   	depends on NET
>   	depends on PCI
>   	depends on (IPV6 || IPV6=n)
> -	depends on MMU
>   	select SCSI_ISCSI_ATTRS
>   	select NETDEVICES
>   	select ETHERNET
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index c3bcb6911c53..2b0172f54665 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   menu "VFIO support for PCI devices"
> -	depends on PCI && MMU
> +	depends on PCI
>   
>   config VFIO_PCI_CORE
>   	tristate

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

