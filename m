Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D257D7C7B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E236E384;
	Tue, 15 Oct 2019 16:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007836E872
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 16:55:54 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50709
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iKQ6y-0001RY-QY; Tue, 15 Oct 2019 18:55:52 +0200
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
 <20191015155911.GM32742@smile.fi.intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8df47b42-856a-8a5d-9da7-549c1ca46422@tronnes.org>
Date: Tue, 15 Oct 2019 18:55:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015155911.GM32742@smile.fi.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9pR+ZE+zmcpZd5djFKbCS8ujw/nbcMhDnWBSHgDvoCk=; b=DzlAL1cKpmMp5SjeiwJ1UGSga/
 wtCIkgfu/R5YMmZoaDGh/SwSc52aZ9OYZn80A2Z8adcqK+wQ6/EJLwicFves6LCNl2042AviU3lyw
 q22h3ku7rVkA9AcsWFjhzkP/LTYw/fo0BB0ezEu8thQlpQGrnSYxP//gZswipXZeZPoRF+fazKg6a
 J2FWnBlZh4myFVw0GhNCoBDh0/Jjv/wg5xx/6YFEI3L0QZkN8YYxx0rmema9Ett7tJK0rBj9N8EqB
 xaapxVfKrcNdUekFYZO/Hm99cjNDS3lgUJ2CdY56ZVpOtJoOUHY9aIMHFjOZ8Uw0UpIcM8lYGpNzK
 tGhn/+ag==;
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

CgpEZW4gMTUuMTAuMjAxOSAxNy41OSwgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+IE9uIFR1ZSwg
T2N0IDE1LCAyMDE5IGF0IDA1OjQxOjUzUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToK
Pj4gRGVuIDE1LjEwLjIwMTkgMTYuMzIsIHNrcmV2IEFuZHkgU2hldmNoZW5rbzoKPj4+IE9uIEZy
aSwgSnVsIDE5LCAyMDE5IGF0IDA1OjU5OjEwUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90
ZToKPj4+PiBzcGktYmNtMjgzNSBjYW4gaGFuZGxlID42NGtCIGJ1ZmZlcnMgbm93IHNvIHRoZXJl
IGlzIG5vIG5lZWQgdG8gY2hlY2sKPj4+PiAtPm1heF9kbWFfbGVuLiBUaGUgdGlueWRybV9zcGlf
bWF4X3RyYW5zZmVyX3NpemUoKSBtYXhfbGVuIGFyZ3VtZW50IGlzCj4+Pj4gbm90IHVzZWQgYnkg
YW55IGNhbGxlcnMsIHNvIG5vdCBuZWVkZWQuCj4+Pj4KPj4+PiBUaGVuIHdlIGhhdmUgdGhlIHNw
aV9tYXggbW9kdWxlIHBhcmFtZXRlci4gSXQgd2FzIGFkZGVkIGJlY2F1c2UKPj4+PiBzdGFnaW5n
L2ZidGZ0IGhhcyBzdXBwb3J0IGZvciBpdCBhbmQgdGhlcmUgd2FzIGEgcmVwb3J0IHRoYXQgc29t
ZW9uZSB1c2VkCj4+Pj4gaXQgdG8gc2V0IGEgc21hbGwgYnVmZmVyIHNpemUgdG8gYXZvaWQgcG9w
cGluZyBvbiBhIFVTQiBzb3VuZGNhcmQgb24gYQo+Pj4+IFJhc3BiZXJyeSBQaS4gSW4gaGluZHNp
Z2h0IGl0IHNob3VsZG4ndCBoYXZlIGJlZW4gYWRkZWQsIEkgc2hvdWxkIGhhdmUKPj4+PiB3YWl0
ZWQgZm9yIGl0IHRvIGJlY29tZSBhIHByb2JsZW0gZmlyc3QuIEkgZG9uJ3Qga25vdyBpdCBhbnlv
bmUgaXMKPj4+PiBhY3R1YWxseSB1c2luZyBpdCwgYnV0IHNpbmNlIHRpbnlkcm1fc3BpX3RyYW5z
ZmVyKCkgaXMgYmVpbmcgbW92ZWQgdG8KPj4+PiBtaXBpLWRiaSwgSSdtIHRha2luZyB0aGUgb3Bw
b3J0dW5pdHkgdG8gcmVtb3ZlIGl0LiBJJ2xsIGFkZCBpdCBiYWNrIHRvCj4+Pj4gbWlwaS1kYmkg
aWYgc29tZW9uZSBjb21wbGFpbnMuCj4+Pj4KPj4+PiBXaXRoIHRoYXQgb3V0IG9mIHRoZSB3YXks
IHNwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIGNhbiBiZSB1c2VkIGluc3RlYWQuCj4+Pj4KPj4+PiBU
aGUgY2hvc2VuIDE2a0IgYnVmZmVyIHNpemUgZm9yIFR5cGUgQyBPcHRpb24gMSAoOS1iaXQpIGlu
dGVyZmFjZSBpcwo+Pj4+IHNvbWV3aGF0IGFyYml0cmFyeSwgYnV0IGEgYmlnZ2VyIGJ1ZmZlciB3
aWxsIGhhdmUgYSBtaW5pc2N1bGUgaW1wYWN0IG9uCj4+Pj4gdHJhbnNmZXIgc3BlZWQsIHNvIGl0
J3MgcHJvYmFibHkgZmluZS4KPj4+Cj4+PiBUaGlzIGJyZWFrcyB0aGUgU1BJIFBYQTJ4eCBjYXNl
IEknbSB1c2luZy4gVGhlIHdvcmxkIGlzIG5vdCBhIFBpOmUuCj4+Pgo+Pj4gWyAgMzg4LjQ0NTc1
Ml0gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVu
Z3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPj4+IFsgIDM4OC42MzQ0MzddIG1pMDI4M3F0
IHNwaS1QUlAwMDAxOjAxOiBETUEgZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0aCAxNTM2MDAg
Z3JlYXRlciB0aGFuIDY1NTM2Cj4+PiBbICAzODguODIyOTMzXSBtaTAyODNxdCBzcGktUFJQMDAw
MTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAwIGdyZWF0ZXIgdGhh
biA2NTUzNgo+Pj4KPj4+IFRoZSBjcnVjaWFsIHRoaW5nIGlzIHRvIGNoZWNrIHRoZSB0cmFuc2Zl
ciBzaXplIGFnYWluc3QgbWF4aW11bSBETUEgbGVuZ3RoCj4+PiBvZiB0aGUgbWFzdGVyLgo+Pj4K
Pj4KPj4gSXNuJ3QgdGhpcyBhIHNwaSBjb250cm9sbGVyIGRyaXZlciBwcm9ibGVtPwo+IAo+IEl0
IGRvZXNuJ3QgbWF0dGVyLiBUaGlzIHBhdGNoIG1hZGUgYSByZWdyZXNzaW9uLiBCZWZvcmUgaXQg
d29ya2VkLAo+IG5vdyBpdCBkb2Vzbid0Lgo+IAo+PiBzcGlfbWF4X3RyYW5zZmVyX3NpemUoKSB0
ZWxscyB0aGUgY2xpZW50IHdoYXQgdGhlIG1heGltdW0gdHJhbnNmZXIKPj4gbGVuZ3RoIGlzLiBU
aGUgY29udHJvbGxlciBkcml2ZXIgY2FuIHVzZSBjdGxyLT5tYXhfdHJhbnNmZXJfc2l6ZSBpZiBp
dAo+PiBoYXMgcmVzdHJpY3Rpb25zLgo+IAo+IEl0IG1pZ2h0IGJlIGEgcHJvYmxlbSBvZiB0aGUg
U1BJIGNvcmUuCj4gCj4+IEFGQUlVSSBtYXhfZG1hX2xlbiBpcyB1c2VkIHdoZW4gc3BsaXR0aW5n
IHVwIHRoZSBidWZmZXIgZm9yIHRoZSBzZyB0YWJsZQo+PiBpbiBzcGlfbWFwX2J1ZigpLgo+IAo+
Pj4gUGxlYXNlLCBmaXguCj4gCj4gU2hvdWxkIEkgc2VuZCB0aGUgcmV2ZXJ0Pwo+IAoKUGxlYXNl
IGRvLgoKSSBzdGlsbCBiZWxpZXZlIHRoYXQgdGhpcyBwYXBlcnMgb3ZlciBhIGNvbnRyb2xsZXIg
ZHJpdmVyCmJ1Zy9zaG9ydGNvbWluZywgYnV0IHRoZXJlIGNvdWxkIGJlIG1vcmUgZHJpdmVycyB0
aGF0IGhhdmUgdGhlIHNhbWUKcHJvYmxlbSBzbyBpdCdzIGJldHRlciB0byByZXZlcnQgdG8gdGhl
IG9sZCBiZWhhdmlvdXIuIEkgZ3Vlc3MgdGhlCnByb2JsZW0gaXMgdGhhdCBub3QgbWFueSBjb250
cm9sbGVyIGRyaXZlcnMgYXJlIHRlc3RlZCB3aXRoIGJ1ZmZlcnMKYmlnZ2VyIHRoYW4gbWF4X2Rt
YV9sZW4gKDY0a0IgaW4gdGhpcyBjYXNlLCBzYW1lIGFzIGZvciB0aGUgUGkpLgoKSWYgSSBoYXZl
IHRoZSByZXZlcnQgYnkgdG9tb3Jyb3csIHRoZW4gSSBjYW4gYXBwbHkgaXQgYmVmb3JlIE1heGlt
ZQpzZW5kcyB0aGUgLXJjIFBSIHRvIERhdmUgb24gVGh1cnNkYXkuCgpOb3JhbGYuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
