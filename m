Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603B95AFC1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E32210E20A;
	Thu, 22 Aug 2024 07:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ikr7apfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C179A10E20A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724313531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jUybrWTE5okN/tSwZAgJJj5/xXajxUS+9zQLDl0RiUU=;
 b=Ikr7apfDh7APnTuD7S3sd1VBqHOsNJ+LU03p+lTuD+TBszVlf1iI6IoQkSrr56WqhLXBge
 N3V/Muwd3HuwDwUqDDAn/cBHMu0S4lYWep/qyGQtWU8vTOAdoiPfTbaon4stiDHRBO0tBS
 jVJVPfxsGHiRVnpFpiNeUCAHBQW3DDU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-5KH_ZUlmOLC0DUP22-I-yQ-1; Thu,
 22 Aug 2024 03:58:49 -0400
X-MC-Unique: 5KH_ZUlmOLC0DUP22-I-yQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 807E01954B1C; Thu, 22 Aug 2024 07:58:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D113219560AA; Thu, 22 Aug 2024 07:58:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 763C918011E8; Thu, 22 Aug 2024 09:58:45 +0200 (CEST)
Date: Thu, 22 Aug 2024 09:58:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: udmabuf: Add myself as co-maintainer for
 udmabuf driver
Message-ID: <yauljw2ua5sviftosyehsop4gnxo2sinq7b3b2nzq6dq3hdgfb@o4rgn4uo3bjw>
References: <20240822045806.3563883-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20240822045806.3563883-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

On Wed, Aug 21, 2024 at 09:58:06PM GMT, Vivek Kasireddy wrote:
> I would like to help maintain the udmabuf driver, in light of the
> recent changes that converted the driver to use folios instead
> of pages. Furthermore, I also contribute to Qemu's virtio-gpu
> module (and UI modules), that are primary users of udmabuf driver.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

