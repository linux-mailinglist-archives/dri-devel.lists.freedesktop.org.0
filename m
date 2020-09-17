Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823926D7E6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 11:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7F06E108;
	Thu, 17 Sep 2020 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FED46E108
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600335737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iS5Mu46s/6coPGf+33gk9z/5ILfLobD5qxbpXdLow+E=;
 b=DfZACW43JiKJgE6p3Vc71nRjg7D4H5vkTFVjlwVQPaE2U+vHFKxzjycxv3mgR8MosBxBYd
 pZQPzRHf374jiBwLLjAmcVImqZXY2fGyJwSI9p6X/zQ40IrBQTjseZvAGaKdUfBY3BcAux
 Gr9EC4Y7DSRwHikgiefhS9A7JWMV6Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-BTnv9vcCO6mPK-m7iMr2JA-1; Thu, 17 Sep 2020 05:42:15 -0400
X-MC-Unique: BTnv9vcCO6mPK-m7iMr2JA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BF008064BA;
 Thu, 17 Sep 2020 09:42:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31CA47839F;
 Thu, 17 Sep 2020 09:42:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5191A9D5A; Thu, 17 Sep 2020 11:42:13 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:42:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v3 12/19] drm/virtio: implement blob resources: implement
 vram object
Message-ID: <20200917094213.33b5b7woesgstyxz@sirius.home.kraxel.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
 <20200917000838.735-12-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200917000838.735-12-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +	if (resp_type == VIRTIO_GPU_RESP_OK_MAP_INFO) {
> +		vram->map_info = resp->map_info;
> +		vram->map_state = STATE_OK;
> +	} else {
> +		vram->map_state = STATE_ERR;
> +	}

Ah, found it, here. ok.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
