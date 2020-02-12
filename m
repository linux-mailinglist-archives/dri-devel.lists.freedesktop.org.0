Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEE15A75A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 12:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C42B6EA32;
	Wed, 12 Feb 2020 11:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D336EA32
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581505584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iuv4+XY3mAib9ib8Jr3OOx7rmFC4KHE+VYtgYPKyZ8A=;
 b=c/g62A05LIzHCDg+4L5/nnImI2r+/JO9CuLXaw0bZMh0gzAzM9bkGXX12YULMrgANFlE7m
 xJox8/kh2TOR3vja87+bukoL40Kw6XzLsgzHIgcNj6AO8dophl4hXFsuPmBiqjaIm1Hmka
 RqqkgFG+7kmLZ+aAx3tzkebqW/lExsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-CfpHosZnNRq_s9fikiWT_g-1; Wed, 12 Feb 2020 06:06:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E72B13E5;
 Wed, 12 Feb 2020 11:06:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB2060BF4;
 Wed, 12 Feb 2020 11:06:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 269039D6B; Wed, 12 Feb 2020 12:06:20 +0100 (CET)
Date: Wed, 12 Feb 2020 12:06:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 3/4] drm/virtio: track whether or not a context has been
 initiated
Message-ID: <20200212110620.ldeihestuccvxudu@sirius.home.kraxel.org>
References: <20200211235635.488-1-gurchetansingh@chromium.org>
 <20200211235635.488-4-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200211235635.488-4-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CfpHosZnNRq_s9fikiWT_g-1
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -270,7 +270,9 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>  		return id;
>  	}
>  
> +
>  	vfpriv->ctx_id = id;

checkpatch warning here:

-:52: CHECK:LINE_SPACING: Please don't use multiple blank lines
#52: FILE: drivers/gpu/drm/virtio/virtgpu_kms.c:276:

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
