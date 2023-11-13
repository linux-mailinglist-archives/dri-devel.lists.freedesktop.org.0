Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05A7EA030
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 16:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0410E3B8;
	Mon, 13 Nov 2023 15:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 63221 seconds by postgrey-1.36 at gabe;
 Mon, 13 Nov 2023 15:39:24 UTC
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ac])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBBD10E3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 15:39:23 +0000 (UTC)
Message-ID: <0d13ccb6-ca5e-4bfd-bfd8-60afcf10be16@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699889961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YclMo1QyIhuAO5K4+R6Re4o3SZn8+z6+mcibJmkzoqc=;
 b=NLz4uHR7nkTYAI3tD146i6IteaPZ1lk5AmdikA5ZGtoru4Qx5om61q4qT8ZiKcwtyzdxzM
 pyCZyQUft+yRIsakYZwfRjAHw8bxI9Eo8DIy9ZE6Tvx+hMRDJwiu69r9ongRXjurV71rqM
 14luW5Y7FZ3ZCwAcgilEL5ZLD2s0kso=
Date: Mon, 13 Nov 2023 23:39:12 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/loongson: Add platform dependency
To: Jean Delvare <jdelvare@suse.de>, dri-devel@lists.freedesktop.org
References: <20231113125508.4dc755e8@endymion.delvare>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231113125508.4dc755e8@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, thanks for the patch.


On 2023/11/13 19:55, Jean Delvare wrote:
> Only offer the Loongson DRM driver as an option on platforms where
> it makes sense.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> Changes since v1:
> * Use the architecture dependencies suggested by Sui Jingfeng.
>
>   drivers/gpu/drm/loongson/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> --- linux-6.6.orig/drivers/gpu/drm/loongson/Kconfig
> +++ linux-6.6/drivers/gpu/drm/loongson/Kconfig
> @@ -3,6 +3,7 @@
>   config DRM_LOONGSON
>   	tristate "DRM support for Loongson Graphics"
>   	depends on DRM && PCI && MMU
> +	depends on LOONGARCH || MIPS || COMPILE_TEST
>   	select DRM_KMS_HELPER
>   	select DRM_TTM
>   	select I2C
>
>
