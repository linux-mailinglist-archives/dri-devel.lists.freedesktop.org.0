Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C374799126
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED50410E952;
	Fri,  8 Sep 2023 20:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E188B10E952
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:45:48 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Rj7Rc3Ch0z9t74;
 Fri,  8 Sep 2023 20:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1694205948; bh=h1TWJdGJ9ASx08PyZZIFjCeXM50aEyi5tVxjQAo3lGI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ELCqhZrkXLfDwUcMLzlzeWlU0aaN2zvpp9Ac7LBWk7STYDWMmAcByZ5PqQ4v7RSA8
 im1/5hLJdn5iVfN6xcVO73KQUN7vHIVD6lzuSOYGbbuoMopoX+n6u1kSB3dI20RfIA
 5LGH9OOUSsRvz8761ndiNd4U2Jwm9IJTN2yd19DU=
X-Riseup-User-ID: 76C808A5AD22C7481D8113EBDB2523E94D0004C5ADD5B03B1E1896DD3A06C1C7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rj7RX4zYMzJnCB;
 Fri,  8 Sep 2023 20:45:44 +0000 (UTC)
Message-ID: <95380f26-a772-3723-5715-e5c4f2d6d1cc@riseup.net>
Date: Fri, 8 Sep 2023 17:45:46 -0300
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

Hi Arthur,

On 9/1/23 15:05, Arthur Grillo wrote:
> When CONFIG_DEBUG_FS is not set -Wunused-function warnings appear,
> make the static function inline to suppress that.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309012114.T8Vlfaf8-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202309012131.FeakBzEj-lkp@intel.com/
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Applied to drm-misc/drm-misc-next!

Thanks!
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
