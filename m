Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AA461376
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 12:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7206F432;
	Mon, 29 Nov 2021 11:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCCC6F432
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638184156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=payZobcAbuOFhyTy0cEqqey/fkvOe0B/18KOXrq0QIE=;
 b=fbI8Kxl+HnM6hh7hFAtqH7zOqxUDh3ndxV3x3dNUVb9zXxDlZ618ZzROUz/6dATEhTOcqg
 vvx0dnLxJei1ar5wFF5ToNQCOvkmCl8vCAFF1XdSLQAcXbnrrio6W7BP/JvyGK7WJQUsIz
 ns+BGUnfdPJ560P4K18JJJbDTGGiJwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-d-83Gk5tMbWgyUc-1jrUBw-1; Mon, 29 Nov 2021 06:09:13 -0500
X-MC-Unique: d-83Gk5tMbWgyUc-1jrUBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04FD81CCB4;
 Mon, 29 Nov 2021 11:09:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19FA067842;
 Mon, 29 Nov 2021 11:09:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B033180079D; Mon, 29 Nov 2021 12:09:10 +0100 (CET)
Date: Mon, 29 Nov 2021 12:09:10 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/2] virtgpu dummy events
Message-ID: <20211129110910.mwniqvsllzalza6j@sirius.home.kraxel.org>
References: <20211122232210.602-1-gurchetansingh@google.com>
 <YaCJy9uoZJ0J3eNN@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <YaCJy9uoZJ0J3eNN@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> On the series:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I'm assuming someone from Google can push this to drm-misc-fixes for you?

Thanks, pushed.

take care,
  Gerd

