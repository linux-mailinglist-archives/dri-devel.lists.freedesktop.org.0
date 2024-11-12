Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FD9C4E30
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 06:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2D10E56D;
	Tue, 12 Nov 2024 05:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="EZZJ2995";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D3F10E233;
 Tue, 12 Nov 2024 05:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P63/LYtTlv4S5kaMqYTVFRVogiY6Pmn6mZmQEfBCrgo=; b=EZZJ2995WoLdVCIeFUmDxcFhtP
 c4vExF3kDnu+KWQs6dZqU+Gk3OeTwfRe018zV5Pbbo9Ha190pXhoHfrDfSBcfhHo6GPHJNzU6qIu0
 69PvpbaS2uqOZMzwaQbWiLDiloN1wIriRafgENChx8O7NRWsfINs/RfKHUx+uo/R6vDP91SEdJf3K
 GU2laAuy0U4XqHBwtreB7LR8xkBlGX3u3172lJrj48gpOAJBg45BXT7/uu43/Kxb84PpOcjAdGq65
 hz7VvRR0+49EGMDviLYCr+eYEO3tsDfD6tR1IGHDOFjmeaVM82+s5bLP/4XMdNZ77gmgdYO//QrmE
 lnuYxV4Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tAjQM-0000000DtBe-1Blq; Tue, 12 Nov 2024 05:26:46 +0000
Date: Tue, 12 Nov 2024 05:26:46 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Fuad Tabba <tabba@google.com>
Cc: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-mm@kvack.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rppt@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 muchun.song@linux.dev, simona@ffwll.ch, airlied@gmail.com,
 pbonzini@redhat.com, seanjc@google.com, jhubbard@nvidia.com,
 ackerleytng@google.com, vannapurve@google.com,
 mail@maciej.szmigiero.name, kirill.shutemov@linux.intel.com,
 quic_eberman@quicinc.com, maz@kernel.org, will@kernel.org,
 qperret@google.com, keirf@google.com, roypat@amazon.co.uk
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
Message-ID: <ZzLnFh1_4yYao_Yz@casper.infradead.org>
References: <20241108162040.159038-1-tabba@google.com>
 <20241108170501.GI539304@nvidia.com>
 <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
 <CA+EHjTy3kNdg7pfN9HufgibE7qY1S+WdMZfRFRiF5sHtMzo64w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy3kNdg7pfN9HufgibE7qY1S+WdMZfRFRiF5sHtMzo64w@mail.gmail.com>
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

On Mon, Nov 11, 2024 at 08:26:54AM +0000, Fuad Tabba wrote:
> Thanks for your comments Jason, and for clarifying my cover letter
> David. I think David has covered everything, and I'll make sure to
> clarify this in the cover letter when I respin.

I don't want you to respin.  I think this is a bad idea.
