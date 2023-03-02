Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AC16A7BBC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 08:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BE710E384;
	Thu,  2 Mar 2023 07:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27C10E384
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 07:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677741500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F12kahWtOFJrO7q/fNj60L3hA1t3glM+0zNu7+gdaa0=;
 b=cHcLVc2u4fctOrFJIyjnkI4M/4LC5WW4KnMWY6OEN7dN5E+gKQ4oW8Lz0Pqex+2MIug3SF
 x3D73VStJEUd7ykj/XGlCRjHUzWADvKRz6TCRT+ruXcwte0SbnZYGpz5QlLvrGTsKZdRVH
 uT5J2rprWQfWX48nlf5R98djS2Ax2gA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-2pqNpCuWPLemdyy0ow3BbA-1; Thu, 02 Mar 2023 02:18:17 -0500
X-MC-Unique: 2pqNpCuWPLemdyy0ow3BbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C56485CCE0;
 Thu,  2 Mar 2023 07:18:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D747FC16028;
 Thu,  2 Mar 2023 07:18:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 650531800084; Thu,  2 Mar 2023 08:18:14 +0100 (CET)
Date: Thu, 2 Mar 2023 08:18:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5] drm/virtio: Add option to disable KMS support
Message-ID: <20230302071814.ytndjg7txdvxqzcz@sirius.home.kraxel.org>
References: <20230301185432.3010939-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301185432.3010939-1-robdclark@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +	if (vgdev->num_scanouts) {
> +		ret = virtio_gpu_modeset_init(vgdev);

The call to virtio_gpu_modeset_fini() in the unregister
code path needs this too.

Otherwise the patch looks good to me, so with that fixed:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

