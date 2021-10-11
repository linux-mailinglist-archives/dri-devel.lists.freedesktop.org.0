Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1442898F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 11:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934E16E452;
	Mon, 11 Oct 2021 09:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A486B6E452
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633943999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUZhr1weIZB5Mgjnu+H1Acau2hOu5RQNiImQsCT566c=;
 b=NlBxMb+/cuRu5DSDMsf+QT2uxN3oN5AQPGjawXcZ5wtcl5Agq91D0l+QdofjvSCu/A9UFL
 A+MagpBkMBiIfBIg22888B+0M4U99cHS3piS1ci8l1zwVzmMa+v9ZdT4k6UzS0bswe5o61
 TdPxeEZ3FOVb8genx2x6JhO2y+d+K8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-7pgL72FvMBiUe_PGPZMK2Q-1; Mon, 11 Oct 2021 05:19:56 -0400
X-MC-Unique: 7pgL72FvMBiUe_PGPZMK2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C4F8801A92;
 Mon, 11 Oct 2021 09:19:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4CB4180;
 Mon, 11 Oct 2021 09:19:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EB6018009D4; Mon, 11 Oct 2021 11:19:51 +0200 (CEST)
Date: Mon, 11 Oct 2021 11:19:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: fix the missed drm_gem_object_put() in
 virtio_gpu_user_framebuffer_create()
Message-ID: <20211011091951.3ncpolbsiavke6rr@sirius.home.kraxel.org>
References: <1633770560-11658-1-git-send-email-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633770560-11658-1-git-send-email-jingxiangfeng@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Sat, Oct 09, 2021 at 05:09:20PM +0800, Jing Xiangfeng wrote:
> virtio_gpu_user_framebuffer_create() misses to call drm_gem_object_put()
> in an error path. Add the missed function call to fix it.

Pushed to drm-misc-next.

thanks,
  Gerd

