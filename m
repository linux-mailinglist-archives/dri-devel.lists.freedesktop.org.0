Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE0737A49C
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 12:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CEE6E0F7;
	Tue, 11 May 2021 10:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529FE6E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gb9OqnBSROpE+LrGltIFkbllhq0XROQ7BgYhBNTINHU=;
 b=i1JO4mZnwDgJxLQLuNsUN4UZjOc8uLNW227qU0N+42Lfp2D9DIie+8zfF+NcmyJJlf6Mlu
 eTausSnwrIH4Dg0RO927p5WaJAgX0dLZ5efmPXAxKocx9py6Hrt/yn4mawFEqDpStEsN6s
 pBCjUxYQVMYvRq4T+ydh0qzPdiojb7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-EAHXQNOXPqefrdkVsReAHw-1; Tue, 11 May 2021 06:30:01 -0400
X-MC-Unique: EAHXQNOXPqefrdkVsReAHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806851922960;
 Tue, 11 May 2021 10:30:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4910A1037F24;
 Tue, 11 May 2021 10:30:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A6A341800876; Tue, 11 May 2021 12:29:58 +0200 (CEST)
Date: Tue, 11 May 2021 12:29:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Message-ID: <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210511083610.367541-1-vivek.kasireddy@intel.com>
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

On Tue, May 11, 2021 at 01:36:08AM -0700, Vivek Kasireddy wrote:
> This feature enables the Guest to wait until a flush has been
> performed on a buffer it has submitted to the Host.

This needs a virtio-spec update documenting the new feature.

> +	VIRTIO_GPU_CMD_WAIT_FLUSH,

Why a new command?

If I understand it correctly you want wait until
VIRTIO_GPU_CMD_RESOURCE_FLUSH is done.  We could
extend the VIRTIO_GPU_CMD_RESOURCE_FLUSH command
for that instead.

take care,
  Gerd

