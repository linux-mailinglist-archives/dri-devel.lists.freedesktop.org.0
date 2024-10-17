Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147ED9A217A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 13:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84B310E319;
	Thu, 17 Oct 2024 11:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="GCJ36JeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7310E319
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 11:53:07 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7b154f71885so2070185a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729165986; x=1729770786; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GmBZesZtIEIysD3cyQDt0/aeQz0fuSRlJ48sSX4MZM0=;
 b=GCJ36JeTiUvxbv711H+DUxWiSSbt1XIPxohfYNNEshqkzf3phS6PmOE3ne+4NAQWS5
 AuXtM5kc+qbjCxDl6ZA5X11FkDTy/+MOGHZAL9NFWBls840H9QN9mzCGCYGnWRk81epE
 WGYbTU5vaoUkhNkQdrrSEXh5VjDQ0y8ifpgcQPxBlAQsifqQvouNIlXB/bjKfqAGSxAJ
 Mkq7FKKbz4oyNGPuHt6ypVqF6dhe8cNmOTtuu5W5ZIvk5JwP4zJInmaiNiVwllN+c0EU
 i69fmVXrwEyAlt+Tr8vgNyU/V81jX61ogrZlJ/PPdQJgvCjf0iYUbVVIIxf5egmvmC/g
 pQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729165986; x=1729770786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmBZesZtIEIysD3cyQDt0/aeQz0fuSRlJ48sSX4MZM0=;
 b=gZU737myoxEie6bITADI2U5d6qGTrRu15rd9NJ34I3lBXVWVvXYByTCyobupu2Xv5g
 BRrkArtgUf/lz6eZx2JMbMNkn8BC/gNcVt0qTzOIImRcr8v8JXf3LxjG7jOt9XRZbn/f
 XKNhp0VpIE5OZ0uuF/I6z+d1IihIC88VcBLDHu0A5ngvznmmO23dgfi6NABu9Cxibc55
 GT38v9zvWYAz95j5p2f7yEPGNhj8LtGvB82quIs9ecZmdMv6qDgwIcxr5iUvJgEhHRr6
 bwshKMRo+UrhcS5D/XWGbD32+Q0jgse1uxOQMfM/P8urQxE0lFm5sAFJaIEdU880Hclp
 V1HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc6PQORfxXJl/KPbnahfmgHXJhNINmmLssmbrkUhLGFHgeA/JOfRxm0IXg93CeM8K55UHb1S5Tx7A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/WqjQ4reRHeiWYBI2YLrf/PRR1Oc9SLGRemDdhDZizNMQXN+f
 XSS2muOAT/HT6mZWvOQoeE9RoGApoPvgWXdfpoclxqIAqd9TlmMzERIBn1VY1fw=
X-Google-Smtp-Source: AGHT+IE0lhUEHRItAIlBXkzlmf1pFQcVgjaWoPErjcdruR1w2i306r6pb8Z5KQ2AjKUo4kdIciA/gA==
X-Received: by 2002:a05:620a:3712:b0:7a9:a8c5:d4b3 with SMTP id
 af79cd13be357-7b120fc4b4emr3591459085a.33.1729165985823; 
 Thu, 17 Oct 2024 04:53:05 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b136164d89sm291152685a.3.2024.10.17.04.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 04:53:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t1P3w-003fyz-5b;
 Thu, 17 Oct 2024 08:53:04 -0300
Date: Thu, 17 Oct 2024 08:53:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, bskeggs@nvidia.com,
 Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241017115304.GH4020792@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <87frow8wdk.fsf@nvdebian.thelocal>
 <20241016154555.GE4020792@ziepe.ca>
 <878quno4os.fsf@nvdebian.thelocal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878quno4os.fsf@nvdebian.thelocal>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 17, 2024 at 12:58:48PM +1100, Alistair Popple wrote:

> Actually I think the rule should be don't look at the page at
> all. hmm_range_fault() is about mirroring PTEs, no assumption should
> even be made about the existence or otherwise of a struct page.

We are not there yet..
 
> > We don't need to enforce, it we don't know what else the driver will
> > want to use that P2P page for after all. It might stick it in a VMA
> > for some unrelated reason.
> 
> And wouldn't that touch the refcount and therefore be wrong?

I mean the originating driver would do that

Jason
