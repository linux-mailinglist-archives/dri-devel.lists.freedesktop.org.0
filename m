Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FD27E19E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 08:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291DB89B33;
	Wed, 30 Sep 2020 06:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB0D89B33
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 06:47:02 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601448421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oVaxQUK08KNevtS5G7RtUC0JzSlzST9KFGbcI8FUniE=;
 b=Y6wwadYY54HnkScX8oBVQVfpmOA1is2kM0ORUqJt8rOZpvEVeai+BDquPi4ky5YkTYrv7/
 J0BIWMnZeF+KSYBURHWIJC/J2vtzC/SlVuPprLuSsCvTjiD4ilPVbep3HnOxBtIVSTBx5K
 ULMeeywezd5O0g8p2X0iQWElyfufMzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-YqwxWa9BN4GtAzIpOTE7eQ-1; Wed, 30 Sep 2020 02:46:59 -0400
X-MC-Unique: YqwxWa9BN4GtAzIpOTE7eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1783B1DDFF;
 Wed, 30 Sep 2020 06:46:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D68525D9D3;
 Wed, 30 Sep 2020 06:46:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A6BB9CBC; Wed, 30 Sep 2020 08:46:57 +0200 (CEST)
Date: Wed, 30 Sep 2020 08:46:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] virtio-gpu api: fix 64/32 compat issue with blob
 implementation
Message-ID: <20200930064656.kxnpiakf74zug2ul@sirius.home.kraxel.org>
References: <20200929215333.1241-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200929215333.1241-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Alistair Delva <adelva@google.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 02:53:33PM -0700, Gurchetan Singh wrote:
> From: Alistair Delva <adelva@google.com>
> 
> We encountered this issue when booting blob with a 32-bit kernel.
> The implementation doesn't match v6 of the virtio-spec change, so fix
> this.
> 
> Fixes: ff886cbdcc44 ("virtio-gpu api: blob resources")
> Signed-off-by: Alistair Delva <adelva@google.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
