Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E340BF42
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 07:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3CD6E8CB;
	Wed, 15 Sep 2021 05:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC236E8CB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 05:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631682984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=08Q/3Dez8Cxv+IoqS5yPGC//qlFF92wE0Jo6uZyZHlo=;
 b=ifPnQ/2ifS1Y+x3o5CfNoo+rKKWwfN3Zwt93LaX+BvEZxXjJss0KlpTOgafTrbqNrrn3ob
 Nv/SNY+ceKluVHnS47shuz7/40SDPlHOvSeu+ZSR0J73OSJoVYUuTim2Pfa1krwsP0oYZ0
 io1ef/reQhMyJZGe2Nv0wI4ZjWTXeJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-aq4vKuecN96mZDlz38ZchA-1; Wed, 15 Sep 2021 01:16:22 -0400
X-MC-Unique: aq4vKuecN96mZDlz38ZchA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 776021084681;
 Wed, 15 Sep 2021 05:16:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3725F10016FE;
 Wed, 15 Sep 2021 05:16:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EAC018003BF; Wed, 15 Sep 2021 07:16:15 +0200 (CEST)
Date: Wed, 15 Sep 2021 07:16:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [RFC v1 4/6] drm/virtio: Probe and implement
 VIRTIO_GPU_F_RELEASE_FENCE feature
Message-ID: <20210915051614.wgdk2su5p6k2pb3b@sirius.home.kraxel.org>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
 <20210913233529.3194401-5-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210913233529.3194401-5-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -60,6 +60,8 @@
>   */
>  #define VIRTIO_GPU_F_RESOURCE_BLOB       3
>  
> +#define VIRTIO_GPU_F_RELEASE_FENCE	 4
> +
>  enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_UNDEFINED = 0,

Where is the virtio-spec update for that?

thanks,
  Gerd

