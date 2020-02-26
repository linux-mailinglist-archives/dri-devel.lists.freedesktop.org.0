Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39316F82F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 07:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D946E10F;
	Wed, 26 Feb 2020 06:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726326E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582699566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T03SIUbpS7NRdjWTBgkQpJHVriQtwa+oIU9FAAGd75I=;
 b=Fr7O9u+n6iE6JD+7o57BYEhtGKHrJ+f7vaz6PmbfoXyHNom2+CD9OHZU6BO7IAEICAypNk
 fd2cBEhUL9few4CB3AuDugkbbCd9cmaFmvMFEO/JqqfxRYHXdcUK4wL25itMp3T0h18Io4
 H5otSQ1vCNSu50qYCOHSq1qzYt5ZUMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-bR9xxToUNpudubTv4OF2Mg-1; Wed, 26 Feb 2020 01:45:56 -0500
X-MC-Unique: bR9xxToUNpudubTv4OF2Mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8BE88017DF;
 Wed, 26 Feb 2020 06:45:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7065D5D9CD;
 Wed, 26 Feb 2020 06:45:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91F8817506; Wed, 26 Feb 2020 07:45:53 +0100 (CET)
Date: Wed, 26 Feb 2020 07:45:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guillaume Gardet <Guillaume.Gardet@arm.com>
Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Message-ID: <20200226064553.nesmadr3p5nerdjm@sirius.home.kraxel.org>
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
 <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
 <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
 <VI1PR0802MB2237E9434683CE980CA7163B83EC0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR0802MB2237E9434683CE980CA7163B83EC0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > Perhaps try the entire series?
> > 
> > https://patchwork.kernel.org/cover/11300619/

Latest version is at:
   https://git.kraxel.org/cgit/linux/log/?h=drm-virtio-no-wc

> Applied entire series on top of 5.5.6, but still the same problem.

Can you double-check?  Cherry-picking the shmem + virtio patches ...

  694c824491f1 drm/shmem: add support for per object caching flags.
  3f4d10f853fb drm/virtio: fix mmap page attributes

... into 5.6-rc3 fixes the corruption for me.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
