Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972CA2A749
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 00:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B686E194;
	Sat, 25 May 2019 22:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8343A6E194
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 22:52:12 +0000 (UTC)
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net
 [73.223.200.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8FC42081C;
 Sat, 25 May 2019 22:52:10 +0000 (UTC)
Date: Sat, 25 May 2019 15:52:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: RFC: Run a dedicated hmm.git for 5.3
Message-Id: <20190525155210.8a9a66385ac8169d0e144225@linux-foundation.org>
In-Reply-To: <20190524124455.GB16845@ziepe.ca>
References: <20190522235737.GD15389@ziepe.ca>
 <20190523150432.GA5104@redhat.com>
 <20190523154149.GB12159@ziepe.ca>
 <20190523155207.GC5104@redhat.com>
 <20190523163429.GC12159@ziepe.ca>
 <20190523173302.GD5104@redhat.com>
 <20190523175546.GE12159@ziepe.ca>
 <20190523182458.GA3571@redhat.com>
 <20190523191038.GG12159@ziepe.ca>
 <20190524064051.GA28855@infradead.org>
 <20190524124455.GB16845@ziepe.ca>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558824731;
 bh=MJPUSD67w1vDzE1s8ukB7WvKrTYgamW84goFYYVDSPI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uYhUPzjxc/GeB+FzHFhyxZ7vo3ablcJVW7xTFZBQ663X5B5pDMj9l2/WBJbSP5sIr
 PmGFV5rSX7sooE3xDLZ0ZP95v/yHZ+2wABSbIW1lqY2R4xZBk6KSwpM+VoS3oiefLg
 XSQ9v+swjbOvZCStCoNjXDVcLBs5kNEKQR+06saQ=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Doug Ledford <dledford@redhat.com>, linux-mm@kvack.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Kaike Wan <kaike.wan@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Leon Romanovsky <leonro@mellanox.com>, Jerome Glisse <jglisse@redhat.com>,
 Moni Shoua <monis@mellanox.com>, Artemy Kovalyov <artemyko@mellanox.com>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNCBNYXkgMjAxOSAwOTo0NDo1NSAtMDMwMCBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cgo+IE5vdyB0aGF0IC1tbSBtZXJnZWQgdGhlIGJhc2ljIGhtbSBBUEkg
c2tlbGV0b24gSSB0aGluayBydW5uaW5nIGxpa2UKPiB0aGlzIHdvdWxkIGdldCB1cyBxdWlja2x5
IHRvIHRoZSBwbGFjZSB3ZSBhbGwgd2FudDogY29tcHJlaGVuc2l2ZSBpbiB0cmVlCj4gdXNlcnMg
b2YgaG1tLgo+IAo+IEFuZHJldywgd291bGQgdGhpcyBiZSBhY2NlcHRhYmxlIHRvIHlvdT8KClN1
cmUuICBQbGVhc2UgdGFrZSBjYXJlIG5vdCB0byBwZXJtaXQgdGhpcyB0byByZWR1Y2UgdGhlIGFt
b3VudCBvZgpleHBvc3VyZSBhbmQgcmV2aWV3IHdoaWNoIHRoZSBjb3JlIEhNTSBwaWVjZXMgZ2V0
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
