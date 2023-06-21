Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290E737C8C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9A10E3E8;
	Wed, 21 Jun 2023 07:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5878E10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687334241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7HTmOa2A1R44TEuczs4wdI2fVqvdbq/sEU4yXPclC74=;
 b=PWwJ/YyolKLC5t0h8zlkjYpMZqOLH3rUInlNFTqiXzckmei4kuy0ZptgaZETUOKI9EmpkM
 lnXkwwDrAavfyBZanBVF2jdan3+SQyJJV/c74be6nfUJuR0VdhrNvij7qd1mmX4gGKrBTq
 9sRF+Na40n3C2r8ssgMoNegQsIIfO4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-dMAjkMmkOrOgmjnFM4vjaw-1; Wed, 21 Jun 2023 03:57:17 -0400
X-MC-Unique: dMAjkMmkOrOgmjnFM4vjaw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D2E6800CA5;
 Wed, 21 Jun 2023 07:57:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3501B492C13;
 Wed, 21 Jun 2023 07:57:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CFE341800381; Wed, 21 Jun 2023 09:57:14 +0200 (CEST)
Date: Wed, 21 Jun 2023 09:57:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/virtgpu: Replace dev_private by helper function
Message-ID: <brjzelisopxjpqhy7shhkm6azyhwpyhw4vqurglfhouvtk2whf@ewnboldp64dy>
References: <20230620103343.910-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20230620103343.910-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 airlied@redhat.com, gurchetansingh@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 12:33:28PM +0200, Thomas Zimmermann wrote:
> Dereference struct drm_device.dev_private in the helper function
> do_virtio_gpu_device(). The dev_private field is deprecated and
> drivers are advised not ot use it. Encapsulating it in a helper
> function will help with a later removal. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

