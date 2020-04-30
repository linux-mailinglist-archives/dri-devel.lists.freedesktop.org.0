Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B941BF5C5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 12:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599026E21B;
	Thu, 30 Apr 2020 10:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599086E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nQammwL/KER+BZcG7PHhZvvr0kyfo7A035lR1ln3CZM=; b=cMcywDi5TEcehrwg96yR6INmiN
 4qNQtzWXcIjVtFTwFidVlu8gRz2/8IwEfMyJWMzV1gI7zuPmyIWjPxJqRWaFK7slGQuizGVcS9Inb
 mpKtgiGV8YWvgE6/Zq+3mi9JmCo69qj7VIVulxKLcuJQ8cadnh0GdgP9M6UILdCC1AhV6lx3ljiUI
 IO/kdRmYuZsS3qfts312A5ncHv2/6kTGmQPWboX6VXAfTrZkjrS7FvbcKKOOE0msTBvJvPxspjCjs
 TVA10Iu6GYt1WSh9cIBf7VA/OPc7tGcHFo/ij5uM7RU+Yan69FQf2zbuJ8QkpeQGv1FVDjrkkS2F+
 LVwyT/dA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61204
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jU6e6-0000yj-J5; Thu, 30 Apr 2020 12:42:22 +0200
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
To: Lee Jones <lee.jones@linaro.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org> <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
 <20200430101529.GB298816@dell>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a1ac82de-c303-be00-70ae-7ae26eb39c82@tronnes.org>
Date: Thu, 30 Apr 2020 12:42:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430101529.GB298816@dell>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzAuMDQuMjAyMCAxMi4xNSwgc2tyZXYgTGVlIEpvbmVzOgo+IE9uIFRodSwgMzAgQXBy
IDIwMjAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiAKPj4KPj4KPj4gRGVuIDMwLjA0LjIwMjAg
MTAuMzIsIHNrcmV2IExlZSBKb25lczoKPj4+IE9uIFdlZCwgMjkgQXByIDIwMjAsIE5vcmFsZiBU
csO4bm5lcyB3cm90ZToKPj4+Cj4+Pj4gQWRkIGEgd2F5IHRvIGxvb2t1cCBhIGJhY2tsaWdodCBk
ZXZpY2UgYmFzZWQgb24gaXRzIG5hbWUuCj4+Pj4gV2lsbCBiZSB1c2VkIGJ5IGEgVVNCIGRpc3Bs
YXkgZ2FkZ2V0IGdldHRpbmcgdGhlIG5hbWUgZnJvbSBjb25maWdmcy4KPj4+Pgo+Pj4+IENjOiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+Pj4+IENjOiBEYW5pZWwgVGhvbXBzb24g
PGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+Pj4+IENjOiBKaW5nb28gSGFuIDxqaW5nb29o
YW4xQGdtYWlsLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFj
a2xpZ2h0LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPj4+PiAgaW5jbHVkZS9saW51eC9i
YWNrbGlnaHQuaCAgICAgICAgICAgfCAgMSArCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKQo+Pj4KPj4+IE9uY2UgcmV2aWV3ZWQsIGNhbiB0aGlzIHBhdGNoIGJlIGFwcGxp
ZWQgb24gaXRzIG93bj8KPj4+Cj4+Cj4+IElmIHlvdSBjYW4gYXBwbHkgaXQgZm9yIDUuOCwgdGhl
biB3ZSdyZSBnb29kLiBEUk0gaGFzIGN1dG9mZiBhdCAtcmM1IGFuZAo+PiB0aGUgZHJpdmVyIHdv
bid0IGJlIHJlYWR5IGZvciB0aGF0LiBUaGlzIHBhdGNoIGhhcyB0aGlzIGRlcGVuZGVuY3kKPj4g
Y2hhaW46IHVzYiAtPiBkcm0gLT4gYmFja2xpZ2h0LiBTbyBpZiB5b3UgY2FuIGFwcGx5IGl0IGZv
ciA1LjgsIHRoaW5ncwo+PiBnZXRzIGVhc2llci4KPj4KPj4+IE15IGd1ZXNzIGlzIHRoYXQgaXQg
Y2FuJ3QsIGFzIHRoZSBvdGhlciBwYXRjaGVzIGluIHRoaXMgc2V0IGRlcGVuZCBvbgo+Pj4gaXQs
IHJpZ2h0PyAgSWYgdGhpcyBhc3N1bXB0aW9uIGlzIHRydWUsIHlvdSBuZWVkIHRvIHNlbmQgbWUg
dGhlIHJlc3QKPj4+IG9mIHRoZSBzZXQuCj4+Pgo+Pj4gRllJOiBJdCdzIG5vcm1hbGx5IGJldHRl
ciB0byBzZW5kIHRoZSB3aG9sZSBzZXQgdG8gZXZlcnlvbmUsIGFzIGl0Cj4+PiBwcm92aWRlcyB2
aXNpYmlsaXR5IG9uIGN1cnJlbnQgcmV2aWV3IChvciBsYWNrIHRoZXJlIG9mKSBzdGF0dXMgb2Yg
dGhlCj4+PiBvdGhlciBwYXRjaGVzIGFuZCBhbGxvd3MgZWFjaCBvZiB0aGUgbWFpbnRhaW5lcnMg
dG8gZGlzY3VzcyBwb3NzaWJsZQo+Pj4gbWVyZ2Ugc3RyYXRlZ2llcy4KPj4KPj4gZHJpLWRldmVs
IGlzIHRoZSBNTCBmb3IgYmFja2xpZ2h0IHNvIEkgYXNzdW1lZCB5b3UgZ290IHRoZSBmdWxsIHNl
dC4KPiAKPiBkcmktZGV2ZWwgaXNuJ3QgdGhlIE1MIGZvciBCYWNrbGlnaHQuICBJdCdzIGFuIGlu
dGVyZXN0ZWQgcGFydHkuCgpPaCwgSSB0aG91Z2h0IGl0IHdhcyBzdHJhbmdlLCBidXQga2VybmVs
IGRldmVsb3BtZW50IGhhcyBhbGwga2luZHMgb2YKdGhpbmdzIHRoYXQgc2VlbXMgc3RyYW5nZSB0
byBtZSwgc28gSSBqdXN0IHdlbnQgd2l0aCBpdC4KCj4gCj4gSSBjZXJ0YWlubHkgaGF2ZSBubyBp
bnRlbnRpb24gb2Ygc3Vic2NyaWJpbmcgdG8gaXQuCj4gCj4+IEkgaGF2ZSBoYWQgdHJvdWJsZSBp
biB0aGUgcGFzdCB3aXRoIG15IGVtYWlsIHByb3ZpZGVyIGRyb3BwaW5nIHBhcnRzIG9mCj4+IGEg
c2VyaWVzIHdoZW4gSSBoYWQgdG8gbWFueSByZWNpcGllbnRzLgo+IAo+IFdpdGhvdXQgdmlzaWJp
bGl0eSBpbnRvIHRoZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXQsIHRoaW5ncyBiZWNvbWUKPiBt
b3JlIGRpZmZpY3VsdC4gIE1heWJlIHVzZSBhIGRpZmZlcmVudC9iZXR0ZXIgZW1haWwgcHJvdmlk
ZXIuCj4gCgpZZWFoLCB5b3UgbmVlZCB0byBoYXZlIGNvbnRleHQsIEkgaGF2ZSByZXNlbnQgdGhl
IHNlcmllcyB0byB5b3UsIERhbmllbAphbmQgSmluZ29vLgoKTm9yYWxmLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
