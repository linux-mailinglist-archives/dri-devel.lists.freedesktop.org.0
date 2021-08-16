Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B563ED442
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 14:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B70689E5B;
	Mon, 16 Aug 2021 12:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4E089E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629118028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aV4HtMdIfSAwHeXZIEAFxPRDtMlJ3KAoMH+0POrLK2g=;
 b=HtOL9INsBdlkNGBvAv25uf7Rt1qZo33KQ8MJcOpmo8fk2K3YSiBvcMuCx4w3R96SXPlHMm
 GhRhP1bWWcmFH9bASBg/QyFQpjFbr0z0yv5o9IlCsGWFqcQ9gaIcwLJgQTu+smaI2lzDxk
 FPWBCool11R05N0l+hTIa+h8Qq56q0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-GFiBOSYaMC2T_2mDn1EHaw-1; Mon, 16 Aug 2021 08:47:06 -0400
X-MC-Unique: GFiBOSYaMC2T_2mDn1EHaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084B21853026;
 Mon, 16 Aug 2021 12:47:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C4A6A8FC;
 Mon, 16 Aug 2021 12:47:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18F111800393; Mon, 16 Aug 2021 14:47:04 +0200 (CEST)
Date: Mon, 16 Aug 2021 14:47:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/virtio: support mapping exported vram
Message-ID: <20210816124704.zjfyj27bixxssulx@sirius.home.kraxel.org>
References: <20210813005441.608293-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210813005441.608293-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Fri, Aug 13, 2021 at 09:54:41AM +0900, David Stevens wrote:
> Implement virtgpu specific map_dma_buf callback to support mapping
> exported vram object dma-bufs. The dma-buf callback is used directly, as
> vram objects don't have backing pages and thus can't implement the
> drm_gem_object_funcs.get_sg_table callback.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>

Pushed to drm-misc-next.

thanks,
  Gerd

