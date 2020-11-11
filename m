Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76F2AF138
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 13:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B5189FD4;
	Wed, 11 Nov 2020 12:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB27889F8E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGXJ8V4La1S/QeUFBtdnXjusm+8Mn5insAGmUISpfHs=;
 b=F1PZsI4a6hTKkBvvX/ZppGYJoY5vAo+DeBNUieutbG+qSQl07V3bNko6OnLkEZPg2w7XmQ
 mpwv3wzSJqHa0iDkcmhY0RhqY3+1N06gCV7qw7WOgAgMPYz8cuQ8s5kgE2amRbBHl/hL8E
 8j6nrQEh5oXFpEYzf41h7FI4KITPKss=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-PXLmFSVKOFSmzDNDJOWfog-1; Wed, 11 Nov 2020 07:48:42 -0500
X-MC-Unique: PXLmFSVKOFSmzDNDJOWfog-1
Received: by mail-wm1-f71.google.com with SMTP id u207so862050wmu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 04:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zGXJ8V4La1S/QeUFBtdnXjusm+8Mn5insAGmUISpfHs=;
 b=TaUNoiLmg5oF/5qlyQZi0p+T/qDrumTJ/h4c1cLXxDp6lSCxopBdg1F1qJKoxf20mG
 AyeByNAYIOy3yuhqiTS9qZl/1G9CA4v+eykExk6eMClXdwvWdaP5KMK3t18DeEVnaQij
 KJKJsUU/IYq+ZF3kxycUHPAkWsg+bkcuSJwl6JPHE52Nff3JkMBd9BRezCRIJKFf2r0X
 2GrLOgNJGJcoyU4HOboWOpDDfQWJSsmD1ig1UmioYGKXliGrjWI0u33vFmsLTIg7icw7
 nsaTLq83bZhS7W24T0iNbFMxCmrGSID4O/qxrZhQA6N9kDSmObWzVGYblPu/7s9vumpO
 /ASg==
X-Gm-Message-State: AOAM532j4Z7Yhc5MjWq8IwDfFEgBtBynr7YzN2IAKuol2ldIK30u0ydI
 ZBulSvZtmafy+h6bghTqHaa21qwh9NFCbr97Mu6PZTyjJ4oitmWg4fx20uj/NaWzObSQuVFSf/Q
 6yy/8DleJkURPusMBbztSzHk+PGHj
X-Received: by 2002:a5d:5446:: with SMTP id w6mr20336618wrv.122.1605098921433; 
 Wed, 11 Nov 2020 04:48:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBamKw/bg5c7+XjuuJx3l1SVoJhclL/t8sfniS6v7UD+Th0hPny5TfD72A5b6eS01hmH1NbQ==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr20336594wrv.122.1605098921214; 
 Wed, 11 Nov 2020 04:48:41 -0800 (PST)
Received: from redhat.com (bzq-79-181-34-244.red.bezeqint.net. [79.181.34.244])
 by smtp.gmail.com with ESMTPSA id y11sm2305471wmj.36.2020.11.11.04.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:48:40 -0800 (PST)
Date: Wed, 11 Nov 2020 07:48:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201111074811-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <20201102051822-mutt-send-email-mst@kernel.org>
 <20201111171015.631ffd0e@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20201111171015.631ffd0e@canb.auug.org.au>
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
Cc: Joerg Roedel <jroedel@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 05:10:15PM +1100, Stephen Rothwell wrote:
> Hi Michael,
> 
> On Mon, 2 Nov 2020 05:19:06 -0500 "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > On Mon, Nov 02, 2020 at 12:43:27PM +1100, Stephen Rothwell wrote:
> > > 
> > > After merging the drm-misc tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > > 
> > > In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> > > include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> > > include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
> > >    99 |  return SIZE_MAX;
> > >       |         ^~~~~~~~
> > > include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
> > >     6 | #include <linux/init.h>
> > >   +++ |+#include <stdint.h>
> > >     7 | #include <linux/types.h>
> > > include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
> > >    99 |  return SIZE_MAX;
> > >       |         ^~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > > 
> > > but only exposed by commit
> > > 
> > >   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> > > 
> > > I applied the following fix for today:
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 2 Nov 2020 12:34:57 +1100
> > > Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> > > 
> > > Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>  
> > 
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > I guess it makes sense to pick this up for this release directly.
> > I'll merge this unless there are any objections.
> 
> Christoph is right that the include should not be conditional.  But I
> have not tested that that does not introduce some other problems.

If there's a problem it will be a build failure - I'll put
it in next for a while, this way we'll find out.

> -- 
> Cheers,
> Stephen Rothwell


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
