Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F9482E68
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 07:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86D089EB7;
	Mon,  3 Jan 2022 06:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6B689EF7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641190303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZWdqglEJRBMyWOswue91QGGug+foo23E07h4yycLxk=;
 b=LJt80vniwxiBNJUma8fdKWkmrB4qaH+g66DlwDXr0l8RxVYQZLJ0YbN4eXdhYvmSm2C+F3
 RPkHCXZa18gkayucj0foUdQMtUHpsqHQIjwo5WxARHPlt7ikxNaWaPOtjXP8IKC1M7M9fM
 UVE30ZiW/p7Yex8lsb8r9ALKya6jkWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-jznnFRq4Ox2x6SNXuNadWw-1; Mon, 03 Jan 2022 01:11:36 -0500
X-MC-Unique: jznnFRq4Ox2x6SNXuNadWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB1321006AA9;
 Mon,  3 Jan 2022 06:11:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F497B9DB;
 Mon,  3 Jan 2022 06:11:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C52A6180039F; Mon,  3 Jan 2022 07:11:27 +0100 (CET)
Date: Mon, 3 Jan 2022 07:11:27 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC 26/32] drm: handle HAS_IOPORT dependencies
Message-ID: <20220103061127.jrnsfuxbxk2ywmtg@sirius.home.kraxel.org>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-27-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-27-schnelle@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Dave Airlie <airlied@redhat.com>,
 Nick Hu <nickhu@andestech.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 27, 2021 at 05:43:11PM +0100, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them. There is also a direct and hard coded use in
> cirrus.c which according to the comment is only necessary during resume.
> Let's just skip this as for example s390 which doesn't have I/O port
> support also doesen't support suspend/resume.

>  config DRM_BOCHS
>  	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
>  	depends on DRM && PCI && MMU
> +	depends on HAS_IOPORT
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
>  	select DRM_TTM

On devices with an mmio bar the driver works just fine without inb/outb,
see bochs->mmio checks in bochs.c

take care,
  Gerd

