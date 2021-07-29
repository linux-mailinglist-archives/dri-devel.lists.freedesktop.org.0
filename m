Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12C3DA099
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7D46E4F1;
	Thu, 29 Jul 2021 09:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CC96E4F1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627552339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fKOAnGpKCykkguJhm4Ctr4nTvt3uftRGmETp/BAArg8=;
 b=bzEv90Ifl67KVJWIYis96HxspPSD8sxKZ4cxCpH1lt3xXLn2lhvWZONkaAKxF5SjDBzazt
 V9zkQJJpzq/+OjOwLtrbzPe17/yA1UFdff0ElQ4HrctHzXhYaNae7VWFaVtse0j6hDzBPx
 RT/GCh/UMFy6nJ1d6P092rd9/7WwIcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-MiMQ5WvKN7eSP6Cy0F4HoQ-1; Thu, 29 Jul 2021 05:52:17 -0400
X-MC-Unique: MiMQ5WvKN7eSP6Cy0F4HoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A0F87D54E;
 Thu, 29 Jul 2021 09:52:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A04831007611;
 Thu, 29 Jul 2021 09:52:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EA961800382; Thu, 29 Jul 2021 11:52:15 +0200 (CEST)
Date: Thu, 29 Jul 2021 11:52:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 4/4] drm/virtio: Probe and implement
 VIRTIO_GPU_F_OUT_FENCE feature
Message-ID: <20210729095215.ojuojvherbossnhj@sirius.home.kraxel.org>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <20210729081659.2255499-5-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210729081659.2255499-5-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +	bool has_out_fence;

> +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_OUT_FENCE)) {
> +		vgdev->has_out_fence = true;
> +		vgdev->ddev->mode_config.deferred_out_fence = true;

Looks like you don't need has_out_fence, you can just use
vgdev->ddev->mode_config.deferred_out_fence instead.

take care,
  Gerd

