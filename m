Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9B3B2B84
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880BE6EAA7;
	Thu, 24 Jun 2021 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBCE6EB26
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624527495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LKNUi0k8rkFRiSDNVQX2m8iBhPkrBgoksmL90oHMfl0=;
 b=Mh4LnizExgyPdUv2BfY9YPcJzYtr8E3d3a4wKRjB2U9UNYFcFsQBtI+zak0tywMkkgGBRo
 gyuzko/j1vtf6xNBi8QdAj/hzT/jxU7zWSMcQBuvu4lMurXU0apj3pxT7CzbXHjhfx9cBk
 OsaSWpM78GS32B+8svitTyUiCk4spV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-7mmqBCrJMY-1sgvizixHOg-1; Thu, 24 Jun 2021 05:38:14 -0400
X-MC-Unique: 7mmqBCrJMY-1sgvizixHOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B9EB19200C2;
 Thu, 24 Jun 2021 09:38:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDDB5D9F0;
 Thu, 24 Jun 2021 09:38:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B66D180060E; Thu, 24 Jun 2021 11:38:11 +0200 (CEST)
Date: Thu, 24 Jun 2021 11:38:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/qxl: Remove empty qxl_gem_prime_mmap()
Message-ID: <20210624093811.wv7tcpl52yy5fw2d@sirius.home.kraxel.org>
References: <20210624090500.8320-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210624090500.8320-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 11:05:00AM +0200, Thomas Zimmermann wrote:
> The function qxl_gem_prime_mmap() returns an error. The two callers
> of gem_prime_mmap are drm_fbdev_fb_mmap() and drm_gem_dmabuf_mmap(),
> which both already handle NULL-callbacks with an error code. So clear
> gem_prime_mmap in qxl and remove qxl_gem_prime_mmap().

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

