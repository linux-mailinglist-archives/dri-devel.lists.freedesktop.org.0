Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333952A28B0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 12:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33ED6E4B3;
	Mon,  2 Nov 2020 11:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9356E4AE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604315120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r+Q0QGef/Chloit35akJAvp2UK5y4+Yr2p6vISWEuwM=;
 b=KmdpoaMA3qrMTYgJb8OA+o3caxIKNDOXL0hY3rAy7v1CiaRC100RgNI6EO6nZjlmATGi3Z
 5yc89pZHScjAKW/d70AAuruEPyHCwhS1RhWKrnBcNAJT9ZHZ0Kb3LEXgkH1ndFRDQrB6Uv
 3mgtUUC4ZIZqq+zDd6MdHZlBakKYJDw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-lHIAsAQuP6SwvBh1mk0sRA-1; Mon, 02 Nov 2020 06:05:18 -0500
X-MC-Unique: lHIAsAQuP6SwvBh1mk0sRA-1
Received: by mail-wm1-f69.google.com with SMTP id o81so686585wma.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 03:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r+Q0QGef/Chloit35akJAvp2UK5y4+Yr2p6vISWEuwM=;
 b=cxYQW3SYXDLEeWiW1fTnwsX1tDBWEvER269+kxOE31bP4MwoABefbHoLvwFbcJOIH8
 99dpjzXd0S0qJ1//kz+FBgmP+GIOUnahDhZU62NB3+H49CDe0RVL8rCs8vUM9sNdkmt0
 iVG+bwVUoIxb1Sk21aA26yWJfUv6xBWHIok54d4be1AXQUzGQPvaVW5o+5l1aKfReKeI
 Es/EL+D3tsPfS+AGsEXfJ6nMIZOyXfYG6GcojtJJeviW/XVE1x9sIbNQSShrVxD4JohX
 GvMPfSaLRG+52mlNN28X6CexQiWnDO0VzRbnnnyMLhvCRog0jiyjRS8+4FpRfrAlB0d6
 h/qg==
X-Gm-Message-State: AOAM533xkFKjAzKH9kLvvbuyxxpnv5gEAuTGr1neHzxLfC/DLT01HtG7
 6s0gawERCnXuSrEBmdvqvjh0WXf4eNZAeFy/KCmtkDL3w0dpFF+6sa5O5nAhNluaSKs7zFS8Awu
 9mCaJMJFZgfe2CevdEQKe4YOLYRC1
X-Received: by 2002:a1c:4054:: with SMTP id n81mr12021238wma.48.1604315117026; 
 Mon, 02 Nov 2020 03:05:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmEIqLJMyDiiIjNpv7lb80eabtXHYd5HB0MoVHivQmdUJd1PBVcw8MORSBRsifC7fHtfm/vg==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr12021212wma.48.1604315116864; 
 Mon, 02 Nov 2020 03:05:16 -0800 (PST)
Received: from redhat.com (bzq-79-181-134-187.red.bezeqint.net.
 [79.181.134.187])
 by smtp.gmail.com with ESMTPSA id y4sm21531180wrp.74.2020.11.02.03.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:05:16 -0800 (PST)
Date: Mon, 2 Nov 2020 06:05:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102060422-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
 <20201102102711.GA28511@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20201102102711.GA28511@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Joerg Roedel <jroedel@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian K??nig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 10:27:11AM +0000, Christoph Hellwig wrote:
> On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -5,6 +5,9 @@
> > >  #include <linux/dma-direction.h>
> > >  #include <linux/init.h>
> > >  #include <linux/types.h>
> > > +#ifndef CONFIG_SWIOTLB
> > > +#include <linux/limits.h>
> > > +#endif
> 
> No conditional includes please.  And the proper fix for the reported
> issue is to stop poking into swiotlb internals in random drivers..

Meaning?

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
