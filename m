Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D209517031C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D706EAAA;
	Wed, 26 Feb 2020 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C5B6EAAA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnasr+0rE0dEdHSLYKM5f3BRLZUNrnEtB/3uj+8qJCo=;
 b=Bbkgag7i/Jl3VpMKp1GR/8FtyBQMSM5xgzGfKijuOCGkZ+iN1Xiamk0BR6MaaBcyRAiT/j
 xVyQeF9EoZDcx0bDEGm9xdtavIaGDyG5ho7jVUGe1hBFP0VenmOcEKXqmEj/m5lolr6pd9
 nvEp8lWxHiQLRrhQnwJdW9h2cFlY+AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-JycgiPSjNCCr9PFex95_sA-1; Wed, 26 Feb 2020 10:50:44 -0500
X-MC-Unique: JycgiPSjNCCr9PFex95_sA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88E6E18A8CAE;
 Wed, 26 Feb 2020 15:50:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A0598FC07;
 Wed, 26 Feb 2020 15:50:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 39D949AA2; Wed, 26 Feb 2020 16:50:41 +0100 (CET)
Date: Wed, 26 Feb 2020 16:50:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guillaume Gardet <Guillaume.Gardet@arm.com>
Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Message-ID: <20200226155041.nz5gcdqmfezxh5uj@sirius.home.kraxel.org>
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
 <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
 <CAAfnVBnsXW7sdOp=b6gxSczntBOa5O9JUaxMHqUE_CKN9kQe9Q@mail.gmail.com>
 <VI1PR0802MB2237E9434683CE980CA7163B83EC0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <20200226064553.nesmadr3p5nerdjm@sirius.home.kraxel.org>
 <VI1PR0802MB2237ADEAD23FE50C9604656383EA0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR0802MB2237ADEAD23FE50C9604656383EA0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

> > ... into 5.6-rc3 fixes the corruption for me.
> 
> I tried those 2 patches on top of kernel 5.6-rc3 and they indeed fix the problem.
> 
> I applied them on top of 5.5.6 and they also fix the problem!
> Could we get those 2 patches applied to stable 5.5, please?

Series just re-posted.  Reviews welcome.  With some luck this makes
5.6-rc4, 5.6-rc5 otherwise, and should hit stable shortly thereafter,

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
