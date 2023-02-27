Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF26A3B50
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 07:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1099710E0F0;
	Mon, 27 Feb 2023 06:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE7310E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677479907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+UG2oWxtK4UHFvkDOIm8sJ8ImrluBqKEzcmgsSAFFPA=;
 b=G7SeUCbgL+9nhejCWp9o6RfxSh3UufrJmYqIEgObanV/u2kSAbS0WCgKhfg/dacOkyIJXW
 lv3fHvIdy5x5V5piXROReYia1edeBZURZiAsHCEsgSnUpE3/fdXDVrkfe1oZqBIbo7yv/7
 Yv4A4a2xgT73cLm8zqFopGYyDhksoM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-8ceeMC1mP9mgVdcbxYFawQ-1; Mon, 27 Feb 2023 01:38:23 -0500
X-MC-Unique: 8ceeMC1mP9mgVdcbxYFawQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E53395D605;
 Mon, 27 Feb 2023 06:38:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 134CDC15BAD;
 Mon, 27 Feb 2023 06:38:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8BCF61800393; Mon, 27 Feb 2023 07:38:21 +0100 (CET)
Date: Mon, 27 Feb 2023 07:38:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
Message-ID: <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
References: <20230224180225.2477641-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224180225.2477641-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 10:02:24AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a build option to disable modesetting support.  This is useful in
> cases where the guest only needs to use the GPU in a headless mode, or
> (such as in the CrOS usage) window surfaces are proxied to a host
> compositor.

Why make that a compile time option?  There is a config option for the
number of scanouts (aka virtual displays) a device has.  Just set that
to zero (and fix the driver to not consider that configuration an
error).

take care,
  Gerd

