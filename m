Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E627ACCF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 17:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9196E5AB;
	Tue, 30 Jul 2019 15:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE16D6E5AA;
 Tue, 30 Jul 2019 15:51:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBA843E2D3;
 Tue, 30 Jul 2019 15:51:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-36.rdu2.redhat.com [10.10.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFACB608A5;
 Tue, 30 Jul 2019 15:51:37 +0000 (UTC)
Date: Tue, 30 Jul 2019 11:51:34 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
Message-ID: <20190730155134.GA10366@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de>
 <20190729233044.GA7171@redhat.com> <20190730054633.GA28515@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730054633.GA28515@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 30 Jul 2019 15:51:41 +0000 (UTC)
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDc6NDY6MzNBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDc6MzA6NDRQTSAtMDQwMCwgSmVy
b21lIEdsaXNzZSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA1OjI4OjQzUE0g
KzAzMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBUaGUgTUlHUkFURV9QRk5fV1JJ
VEUgaXMgb25seSB1c2VkIGxvY2FsbHkgaW4gbWlncmF0ZV92bWFfY29sbGVjdF9wbWQsCj4gPiA+
IHdoZXJlIGl0IGNhbiBiZSByZXBsYWNlZCB3aXRoIGEgc2ltcGxlIGJvb2xlYW4gbG9jYWwgdmFy
aWFibGUuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KPiA+IAo+ID4gTkFLIHRoYXQgZmxhZyBpcyB1c2VmdWwsIGZvciBpbnN0YW5jZSBh
IGFub255bW91cyB2bWEgbWlnaHQgaGF2ZQo+ID4gc29tZSBvZiBpdHMgcGFnZSByZWFkIG9ubHkg
ZXZlbiBpZiB0aGUgdm1hIGhhcyB3cml0ZSBwZXJtaXNzaW9uLgo+ID4gCj4gPiBJdCBzZWVtcyB0
aGF0IHRoZSBjb2RlIGluIG5vdXZlYXUgaXMgd3JvbmcgKHByb2JhYmx5IGxvc3QgdGhhdAo+ID4g
aW4gdmFyaW91cyByZWJhc2UvcmV3b3JrKSBhcyB0aGlzIGZsYWcgc2hvdWxkIGJlIHVzZSB0byBk
ZWNpZGUKPiA+IHdldGhlciB0byBtYXAgdGhlIGRldmljZSBtZW1vcnkgd2l0aCB3cml0ZSBwZXJt
aXNzaW9uIG9yIG5vdC4KPiA+IAo+ID4gSSBhbSB0cmF2ZWxpbmcgcmlnaHQgbm93LCBpIHdpbGwg
aW52ZXN0aWdhdGUgd2hhdCBoYXBwZW5lZCB0bwo+ID4gbm91dmVhdSBjb2RlLgo+IAo+IFdlIGNh
biBhZGQgaXQgYmFjayB3aGVuIG5lZWRlZCBwcmV0dHkgZWFzaWx5LiAgTXVjaCBvZiB0aGlzIGhh
cyBiaXRyb3R0ZWQKPiB3YXkgdG8gZmFzdCwgYW5kIHRoZSBwZW5kaW5nIHBwYyBrdm1obW0gY29k
ZSBkb2Vzbid0IG5lZWQgaXQgZWl0aGVyLgoKTm90IHVzaW5nIGlzIGEgc2VyaW91cyBidWcsIGkg
d2lsbCBpbnZlc3RpZ2F0ZSB0aGlzIGZyaWRheS4KCkNoZWVycywKSsOpcsO0bWUKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
