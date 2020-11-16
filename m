Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577112B3E2B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 08:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4330C89D00;
	Mon, 16 Nov 2020 07:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D136689D00
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605513415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vIAOmfvFNMPmf8CjkNMglbCHByAHwkTLNsLVL8lU0U=;
 b=DRQnlKDBFZaXwXzpp4bJBVt5LaWHzuc+bK6papWGz/B+Ajci2NHO3U598WJfMJkrI+0lbS
 WShYcq4Y2kGDPCQvkCMdeVX3L29fBPHWr7dNBWVMQ0dv1MxEs/xTUmR3NJixeBHEiA0BMA
 IUz4Jm5gvUnN3CBJebKSZEXNk4LxQAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-ilGDvEEHN3WJ_8GVhbQS1Q-1; Mon, 16 Nov 2020 02:56:48 -0500
X-MC-Unique: ilGDvEEHN3WJ_8GVhbQS1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A7945F9C0;
 Mon, 16 Nov 2020 07:56:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1D035B4CC;
 Mon, 16 Nov 2020 07:56:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C017916E31; Mon, 16 Nov 2020 08:56:44 +0100 (CET)
Date: Mon, 16 Nov 2020 08:56:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] drm/virtio: Make virtgpu_dmabuf_ops with static
 keyword
Message-ID: <20201116075644.2kubdpmlowbevo3p@sirius.home.kraxel.org>
References: <1605338173-22100-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605338173-22100-1-git-send-email-zou_wei@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 14, 2020 at 03:16:13PM +0800, Zou Wei wrote:
> Fix the following sparse warning:
> 
> ./virtgpu_prime.c:46:33: warning: symbol 'virtgpu_dmabuf_ops' was not declared. Should it be static?

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
