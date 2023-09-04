Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60053791EDF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 23:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0069610E2A4;
	Mon,  4 Sep 2023 21:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0112A10E41F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 21:09:24 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Rfh8g6lsMzDqDx;
 Mon,  4 Sep 2023 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693861764; bh=rC5mzBz1eIp9iAikOLl0SNEgeyeJvZBofi1hx7Ht8Xg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sJrT65RQs3jM+EFArU4lJH0yUQHBRRXx84PsVsmXgnElb6OlDJgEzAuBSAJHdtse4
 tq7MSPXX4lySBtzmfHR841R//tp3P5YLe5FVDUCKDw5X6aeT5L29O6tuWwJMzN4YWE
 P4Mz3ap6sEkH9CTfIS3XnzQrbDauvp8tJxZyMMjw=
X-Riseup-User-ID: 5248EFA8B71512A4301BE177B580034F60ECB2FA86EB0AB9B790A9018150663D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Rfh8P3Sh7zFrx8;
 Mon,  4 Sep 2023 21:09:09 +0000 (UTC)
Message-ID: <7d17f8bf-7cfe-d11d-1dfc-4032c6437188@riseup.net>
Date: Mon, 4 Sep 2023 18:09:09 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/debugfs: Add inline to drm_debugfs_dev_init() to
 suppres -Wunused-function
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
References: <20230901-debugfs-fix-unused-function-warning-v1-1-161dd0902975@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230901-debugfs-fix-unused-function-warning-v1-1-161dd0902975@riseup.net>
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
Cc: tales.aparecida@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, andrealmeid@riseup.net,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/23 15:05, Arthur Grillo wrote:
> When CONFIG_DEBUG_FS is not set -Wunused-function warnings appear,
> make the static function inline to suppress that.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309012114.T8Vlfaf8-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309012131.FeakBzEj-lkp@intel.com/
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra

> ---
>   include/drm/drm_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 9850fe73b739..e2640dc64e08 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -584,7 +584,7 @@ static inline bool drm_firmware_drivers_only(void)
>   #if defined(CONFIG_DEBUG_FS)
>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
>   #else
> -static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
> +static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>   {
>   }
>   #endif
> 
> ---
> base-commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6
> change-id: 20230901-debugfs-fix-unused-function-warning-9ebbecbd6a5a
> 
> Best regards,
