Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D7248060
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 10:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA185899F3;
	Tue, 18 Aug 2020 08:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9543899F3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597738719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dRKeFFqhITYnbSXGtGade9POSVRhcb2cZ46sEJUQ0Ng=;
 b=KJAD2gTEx8NGH9dwEirydn2XGp6SmMkmG3Wc3nv7POSiToEG0tGMs8NkkEbfdqkY3PX5bh
 JqC54miZTqgV+rD4HPBx9ByjrAYZ7SpT1P0v/9u6mx7LXhlt3B0Cbh0JiifBIAzbZjASCR
 Kzy6dIYOXACcGzPvjqW/ZJbnjnpj/Qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-GHy6lS7XOGuVZPVnFtKbbQ-1; Tue, 18 Aug 2020 04:18:34 -0400
X-MC-Unique: GHy6lS7XOGuVZPVnFtKbbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 993EA425CC;
 Tue, 18 Aug 2020 08:18:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A383E2CFC6;
 Tue, 18 Aug 2020 08:18:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 875B111AB5; Tue, 18 Aug 2020 10:18:30 +0200 (CEST)
Date: Tue, 18 Aug 2020 10:18:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [Virtual ppce500] virtio_gpu virtio0: swiotlb buffer is full
Message-ID: <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
 <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
 <9805f81d-651d-d1a3-fd05-fb224a8c2031@xenosoft.de>
 <3162da18-462c-72b4-f8f0-eef896c6b162@xenosoft.de>
 <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 daniel.vetter@ffwll.ch, Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 11:19:58AM +0200, Christian Zigotzky wrote:
> Hello
> 
> I compiled the RC1 of kernel 5.9 today. Unfortunately the issue with the
> VirtIO-GPU (see below) still exists. Therefore we still need the patch (see
> below) for using the VirtIO-GPU in a virtual e5500 PPC64 QEMU machine.

It is fixed in drm-misc-next (commit 51c3b0cc32d2e17581fce5b487ee95bbe9e8270a).

Will cherry-pick into drm-misc-fixes once the branch is 5.9-based, which
in turn should bring it to 5.9-rc2 or -rc3.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
