Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F97177046
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 08:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10526E9BC;
	Tue,  3 Mar 2020 07:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957A6E9B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583221499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mZNI7OB9pujFZtT0qHWqCSTajySprDebfuDMSgqcxM=;
 b=A8ElU2HA+AiZWZo3e/g5/Gj+uwnbozvhHAP2YSHhr902SHOnVylr1Hr69fKImWx/4GeoYa
 78xod9n21BbanKTxzVFdey40DQvUFHRZ83ARKvTkznJC9PhS66wm8X4LOcaa43c8DC5rjm
 CWCl82HRYdJ3LqxofjLkyjfVp0DtEHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-FUQ2a2MiNXWrzsPMcbY3HQ-1; Tue, 03 Mar 2020 02:44:55 -0500
X-MC-Unique: FUQ2a2MiNXWrzsPMcbY3HQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81EDB800D53;
 Tue,  3 Mar 2020 07:44:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32F6773861;
 Tue,  3 Mar 2020 07:44:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 88C3217449; Tue,  3 Mar 2020 08:44:53 +0100 (CET)
Date: Tue, 3 Mar 2020 08:44:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/51] drm/qxl: Use drmm_add_final_kfree
Message-ID: <20200303074453.x2lmro2mc5fsddgb@sirius.home.kraxel.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-8-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:25:47PM +0100, Daniel Vetter wrote:
> With this we can drop the final kfree from the release function.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 2 --
>  drivers/gpu/drm/qxl/qxl_kms.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 4fda3f9b29f4..09102e2efabc 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -144,8 +144,6 @@ static void qxl_drm_release(struct drm_device *dev)
>  	 */
>  	qxl_modeset_fini(qdev);
>  	qxl_device_fini(qdev);
> -	dev->dev_private = NULL;
> -	kfree(qdev);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> index 70b20ee4741a..09d7b5f6d172 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -27,6 +27,7 @@
>  #include <linux/pci.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "qxl_drv.h"
> @@ -121,6 +122,7 @@ int qxl_device_init(struct qxl_device *qdev,
>  	qdev->ddev.pdev = pdev;
>  	pci_set_drvdata(pdev, &qdev->ddev);
>  	qdev->ddev.dev_private = qdev;
> +	drmm_add_final_kfree(&qdev->ddev, qdev);
>  
>  	mutex_init(&qdev->gem.mutex);
>  	mutex_init(&qdev->update_area_mutex);
> -- 
> 2.24.1
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
