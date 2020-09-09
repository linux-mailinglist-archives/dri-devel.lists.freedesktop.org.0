Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E62627F8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21216E9E9;
	Wed,  9 Sep 2020 07:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7BD6E9E9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599635149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g8/0vcnTChs+13WocVKg+Fs0vK6K7H+xhfabW76D+Zs=;
 b=V4Qd7OqNoVqsi66Vf16WnCpYEm0jB1vGtTcarCfljI/ECpJBeDeLv2cdaff6QRB4F4435m
 TZdvo5TRov0aO8wF+uoTt86Gdh/q8K1OqLgbD0VkES/ZLp+RO2yeglCvgxkIm9nvQsgY7A
 PZMNBkYNvAraWuzNLL3XUk6Oj2wY/3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-kQRe8GZWOneZFWAFvORj5Q-1; Wed, 09 Sep 2020 03:05:47 -0400
X-MC-Unique: kQRe8GZWOneZFWAFvORj5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A86618BA280;
 Wed,  9 Sep 2020 07:05:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE0EA805CF;
 Wed,  9 Sep 2020 07:05:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 94A739ACF; Wed,  9 Sep 2020 09:05:42 +0200 (CEST)
Date: Wed, 9 Sep 2020 09:05:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v2 10/23] virtio-gpu api: host visible feature
Message-ID: <20200909070542.e37mfkz6qqfv3ghs@sirius.home.kraxel.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-11-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200902210847.2689-11-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: virtio-dev@lists.oasis-open.org, sebastien.boeuf@intel.com,
 vgoyal@redhat.com, dri-devel@lists.freedesktop.org, mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +enum virtio_gpu_shm_id {
> +	VIRTIO_GPU_SHM_ID_UNDEFINED = 0,
> +	VIRTIO_GPU_SHM_ID_HOST_VISIBLE = 1
> +};

I think this is also not in the virtio spec update.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
