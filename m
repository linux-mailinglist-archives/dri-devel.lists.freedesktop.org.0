Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5D5A0D72
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 12:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0710E173;
	Thu, 25 Aug 2022 10:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F19110E173
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661421605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Tq1zsr7zrYFwkPaHdBsH4WoR9jozHjv6oFZQItNY9s=;
 b=djaKINIVNdrVrLvinpJfQHIgwHTb3kVI4YeonpFMCwK1qlGEzIMyP5g75RGlI8toH2lPSq
 VC8yVygN9AkLB9iuWpBs2eKdt8NjLAs/NqWbFQa8vsHKe8vqi5N/uzT4Vb+RluHr3+p8Au
 CpUMqCUNjfQgk+fdSA9qxJ5bKKYGhkI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-tsHqy3GhMD25JslMfibTwA-1; Thu, 25 Aug 2022 06:00:00 -0400
X-MC-Unique: tsHqy3GhMD25JslMfibTwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD991C068C0;
 Thu, 25 Aug 2022 09:59:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCF62166B26;
 Thu, 25 Aug 2022 09:59:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E2D651800082; Thu, 25 Aug 2022 11:59:57 +0200 (CEST)
Date: Thu, 25 Aug 2022 11:59:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix same-context optimization
Message-ID: <20220825095957.jjwx7inatburplox@sirius.home.kraxel.org>
References: <20220812224001.2806463-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812224001.2806463-1-robdclark@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Lingfeng Yang <lfy@google.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 12, 2022 at 03:40:00PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When VIRTGPU_EXECBUF_RING_IDX is used, we should be considering the
> timeline that the EB if running on rather than the global driver fence
> context.
> 
> Fixes: 85c83ea915ed ("drm/virtio: implement context init: allocate an array of fence contexts")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Pushed to drm-misc-next.

thanks,
  Gerd

