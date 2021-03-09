Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04848332F0B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 20:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6772F6E938;
	Tue,  9 Mar 2021 19:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47756E938
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 19:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615318439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avJtp16vLH3ysAvGNZjvdMJS5OXrs5RoA1exdXYwigY=;
 b=aJfP9A7qSpfZBJ+KzVjqad1r8IDRuW51uZ58bCQYtjO9xP85SMiex/Uaw9HDbxANowe2N7
 TYtyRu/JUgQlEFWthsDlwxkRTzNWLTl4hvw3872BaOWI3iy7B05JoTnN+0eeV29BdSbyN3
 RR7hTc+JecdrypoDd7rBB8RLv19IoF0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-pHXPz13dM1mio0oee29zgw-1; Tue, 09 Mar 2021 14:33:57 -0500
X-MC-Unique: pHXPz13dM1mio0oee29zgw-1
Received: by mail-pg1-f197.google.com with SMTP id i1so8180859pgg.20
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 11:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=avJtp16vLH3ysAvGNZjvdMJS5OXrs5RoA1exdXYwigY=;
 b=Fgr1imEwXSOVtrvlN5mBbcNNL818rf5WuJHO12YiG/retGN4ZUoGwhY2akcc71EcEj
 Rr9p3hJjM/k3B6wzxt9FwBCvyXAu2NbtT9qQfzEImZw2rWbKcoDwVdWLkfg7n8nJQali
 egYUPnbiW742byvEDsSiRIQiEmhnXzzAepAq4MBHB0z7R9nr/zjIL5tO4kZMFebEalDy
 XCrowrH+Fpc5oBE8zx0+OwdWwoq3pBkCGnFupi2r2u20Tv76la1F/JUGWbBVbTXzC1Qd
 mdbAmWyR0x125Tt0hw6Fm/VSVTGdbXy6rmbXUPfi0a9EZZxT86f9swvWTErFiXel3jUO
 vTYw==
X-Gm-Message-State: AOAM531UOkVkTegOx2mNzorlIJIksGwNBYRGUwWpusCLkPzBXE2Vh3En
 nlWg+OFwQhpfGFAchUnfM1dVKOSMQVQTMvPPUbGrGUBjbmSU7CzAqNuHpy8tjfnD/MoqcvD9vxh
 1A26VwpBwqMuOQHHMYMabrDvsxG6d
X-Received: by 2002:a17:90a:d0c4:: with SMTP id
 y4mr6388469pjw.233.1615318436756; 
 Tue, 09 Mar 2021 11:33:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRoheltWC3q/OlHwNvgRQikUup4a/cbSjffjIeSZP5QkLBGPEM1MUby0bF5Es4MSGuUmH/sg==
X-Received: by 2002:a17:90a:d0c4:: with SMTP id
 y4mr6388446pjw.233.1615318436540; 
 Tue, 09 Mar 2021 11:33:56 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z3sm13835115pff.40.2021.03.09.11.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:33:56 -0800 (PST)
Date: Wed, 10 Mar 2021 03:33:42 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] fs: rename alloc_anon_inode to alloc_anon_inode_sb
Message-ID: <20210309193342.GA3958006@xiangao.remote.csb>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210309155348.974875-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 04:53:40PM +0100, Christoph Hellwig wrote:
> Rename alloc_inode to free the name for a new variant that does not
> need boilerplate to create a super_block first.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

That is a nice idea as well to avoid sb by introducing an unique
fs...

Reviewed-by: Gao Xiang <hsiangkao@redhat.com>

Thanks,
Gao Xiang

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
