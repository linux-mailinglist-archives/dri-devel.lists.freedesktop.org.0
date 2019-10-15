Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBACD7A00
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 17:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0112F89C6C;
	Tue, 15 Oct 2019 15:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0136289C6C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 15:42:00 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50166
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iKOxS-0003wu-NN; Tue, 15 Oct 2019 17:41:58 +0200
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
Date: Tue, 15 Oct 2019 17:41:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015143236.GA5363@smile.fi.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tq9njI8lFM0TH4cMdt0ApWwoZZnprevalUQpGx8L9cI=; b=aiv/2BB+sbmMLxjFs/Rfqf6BnM
 z/T7Cgbypp77r0oMgtWczwjdYyWlbbQhGH0Yq/nFmKIRbWIEi+uTGnx3PxY6CxQM9QJuiwK9/VbyT
 MTt8usjWJrDCpU8wfqo2GrOCtj0NIQIP8+QiuCbbiCFKI2v+fAgs1uQ67t4rRUQgjsFS0oYARG0Gv
 /jlgPoH9LStgmDPb2OaPOplmXNKbOttXnLJl4TDBYR6/3p86ObcktJKlM4P7X2sXV/frX2tNo24xj
 IKjV6f7zgd3vlpe7h9tylPlJOcXm1Xzd0iJqG6sPCxYOD7Qep+8PF2d/U2L8fEGMjF2PBO1jdv+Oz
 11YgUuQQ==;
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
Cc: sam@ravnborg.org, david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMTAuMjAxOSAxNi4zMiwgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+IE9uIEZyaSwg
SnVsIDE5LCAyMDE5IGF0IDA1OjU5OjEwUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToK
Pj4gc3BpLWJjbTI4MzUgY2FuIGhhbmRsZSA+NjRrQiBidWZmZXJzIG5vdyBzbyB0aGVyZSBpcyBu
byBuZWVkIHRvIGNoZWNrCj4+IC0+bWF4X2RtYV9sZW4uIFRoZSB0aW55ZHJtX3NwaV9tYXhfdHJh
bnNmZXJfc2l6ZSgpIG1heF9sZW4gYXJndW1lbnQgaXMKPj4gbm90IHVzZWQgYnkgYW55IGNhbGxl
cnMsIHNvIG5vdCBuZWVkZWQuCj4+Cj4+IFRoZW4gd2UgaGF2ZSB0aGUgc3BpX21heCBtb2R1bGUg
cGFyYW1ldGVyLiBJdCB3YXMgYWRkZWQgYmVjYXVzZQo+PiBzdGFnaW5nL2ZidGZ0IGhhcyBzdXBw
b3J0IGZvciBpdCBhbmQgdGhlcmUgd2FzIGEgcmVwb3J0IHRoYXQgc29tZW9uZSB1c2VkCj4+IGl0
IHRvIHNldCBhIHNtYWxsIGJ1ZmZlciBzaXplIHRvIGF2b2lkIHBvcHBpbmcgb24gYSBVU0Igc291
bmRjYXJkIG9uIGEKPj4gUmFzcGJlcnJ5IFBpLiBJbiBoaW5kc2lnaHQgaXQgc2hvdWxkbid0IGhh
dmUgYmVlbiBhZGRlZCwgSSBzaG91bGQgaGF2ZQo+PiB3YWl0ZWQgZm9yIGl0IHRvIGJlY29tZSBh
IHByb2JsZW0gZmlyc3QuIEkgZG9uJ3Qga25vdyBpdCBhbnlvbmUgaXMKPj4gYWN0dWFsbHkgdXNp
bmcgaXQsIGJ1dCBzaW5jZSB0aW55ZHJtX3NwaV90cmFuc2ZlcigpIGlzIGJlaW5nIG1vdmVkIHRv
Cj4+IG1pcGktZGJpLCBJJ20gdGFraW5nIHRoZSBvcHBvcnR1bml0eSB0byByZW1vdmUgaXQuIEkn
bGwgYWRkIGl0IGJhY2sgdG8KPj4gbWlwaS1kYmkgaWYgc29tZW9uZSBjb21wbGFpbnMuCj4+Cj4+
IFdpdGggdGhhdCBvdXQgb2YgdGhlIHdheSwgc3BpX21heF90cmFuc2Zlcl9zaXplKCkgY2FuIGJl
IHVzZWQgaW5zdGVhZC4KPj4KPj4gVGhlIGNob3NlbiAxNmtCIGJ1ZmZlciBzaXplIGZvciBUeXBl
IEMgT3B0aW9uIDEgKDktYml0KSBpbnRlcmZhY2UgaXMKPj4gc29tZXdoYXQgYXJiaXRyYXJ5LCBi
dXQgYSBiaWdnZXIgYnVmZmVyIHdpbGwgaGF2ZSBhIG1pbmlzY3VsZSBpbXBhY3Qgb24KPj4gdHJh
bnNmZXIgc3BlZWQsIHNvIGl0J3MgcHJvYmFibHkgZmluZS4KPiAKPiBUaGlzIGJyZWFrcyB0aGUg
U1BJIFBYQTJ4eCBjYXNlIEknbSB1c2luZy4gVGhlIHdvcmxkIGlzIG5vdCBhIFBpOmUuCj4gCj4g
WyAgMzg4LjQ0NTc1Ml0gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3Ig
dHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiBbICAzODguNjM0NDM3
XSBtaTAyODNxdCBzcGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5n
dGggMTUzNjAwIGdyZWF0ZXIgdGhhbiA2NTUzNgo+IFsgIDM4OC44MjI5MzNdIG1pMDI4M3F0IHNw
aS1QUlAwMDAxOjAxOiBETUEgZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0aCAxNTM2MDAgZ3Jl
YXRlciB0aGFuIDY1NTM2Cj4gCj4gVGhlIGNydWNpYWwgdGhpbmcgaXMgdG8gY2hlY2sgdGhlIHRy
YW5zZmVyIHNpemUgYWdhaW5zdCBtYXhpbXVtIERNQSBsZW5ndGgKPiBvZiB0aGUgbWFzdGVyLgo+
IAoKSXNuJ3QgdGhpcyBhIHNwaSBjb250cm9sbGVyIGRyaXZlciBwcm9ibGVtPwpzcGlfbWF4X3Ry
YW5zZmVyX3NpemUoKSB0ZWxscyB0aGUgY2xpZW50IHdoYXQgdGhlIG1heGltdW0gdHJhbnNmZXIK
bGVuZ3RoIGlzLiBUaGUgY29udHJvbGxlciBkcml2ZXIgY2FuIHVzZSBjdGxyLT5tYXhfdHJhbnNm
ZXJfc2l6ZSBpZiBpdApoYXMgcmVzdHJpY3Rpb25zLgpBRkFJVUkgbWF4X2RtYV9sZW4gaXMgdXNl
ZCB3aGVuIHNwbGl0dGluZyB1cCB0aGUgYnVmZmVyIGZvciB0aGUgc2cgdGFibGUKaW4gc3BpX21h
cF9idWYoKS4KCk5vcmFsZi4KCj4gUGxlYXNlLCBmaXguCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
