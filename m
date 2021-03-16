Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4B33D3E8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 13:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFAC6E0A1;
	Tue, 16 Mar 2021 12:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB28B6E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=59x9pyn/wzMOcK3CFN84LpsThoYhj5p4Kl3EH7xP18Y=; b=SWGLvYtUKUFl08Fqk6npxrMxtX
 lM7iMf1QPVttH/4cCjHq8NWLuUYIcLqXcUvYSiiSNIPlTHNbl+wfbwg/61XUhxE5QpODmAcAoD3kR
 t6LaQe5rA++Dx+wxyv1QDSdrkx3RmsGNCL1uD8LO9/7ZIovCqfn4NCL231iWLKItKZWAxNz5fvSyu
 ON4mnW0cFea4Ogj5KRXPT7qqkRplXZzlCb2r9Dtl3KW37lIOTJMHajA6VeT/EqhqWklMKIiMn2fNs
 1XRiGrvQbfz0Ny/BI1c+/YL1UHz7XhrE29qRU7Q2U5jOeFFYOy7Sv4qpWuukd7gVsQPxAX6KYfWsi
 7HnVc32g==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=64280)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lM8u0-00080A-QZ; Tue, 16 Mar 2021 13:34:24 +0100
Subject: Re: [PATCH v8 0/3] GUD USB Display driver
To: dri-devel@lists.freedesktop.org
References: <20210313112545.37527-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2aca21e4-aab2-426e-87db-f2d2bb2f46c5@tronnes.org>
Date: Tue, 16 Mar 2021 13:34:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210313112545.37527-1-noralf@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTMuMDMuMjAyMSAxMi4yNSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IEhpLAo+IAo+
IEEgd2hpbGUgYmFjayBJIGhhZCB0aGUgaWRlYSB0byB0dXJuIGEgUmFzcGJlcnJ5IFBpIFplcm8g
aW50byBhICQ1Cj4gVVNCIHRvIEhETUkvU0RUVi9EUEkgZGlzcGxheSBhZGFwdGVyLgo+IAo+IFRo
ZSBwcm90b2NvbCBpcyBvcGVuIHNvIHBlb3BsZSBhcmUgZnJlZSB0byBtYWtlIGRpc3BsYXlzIGlt
cGxlbWVudGluZyBpdCBhbmQKPiB1c2UgdGhpcyBkcml2ZXIsIGFsbCB0aGF0J3MgbmVlZGVkIGlz
IHRvIGFkZCBhIFVTQiB2aWQ6cGlkIHRvIHRoZSBkcml2ZXIgZm9yCj4gdGhlIGRpc3BsYXkuCj4g
Cj4gU2VlIHRoZSB3aWtpWzFdIGZvciBtb3JlIGluZm9ybWF0aW9uIGFuZCBpbWFnZXMgZm9yIHRo
ZSBSYXNwYmVycnkgUGkgWmVyby80Lgo+IAo+IENoYW5nZXMgaW4gdGhpcyB2ZXJzaW9uOgo+IC0g
Rm9yZ290IHRvIGZpbHRlciBSR0IxMTEgZnJvbSByZWFjaGluZyB1c2Vyc3BhY2UKPiAtIEhhbmRs
ZSBhIGRldmljZSB0aGF0IG9ubHkgcmV0dXJucyB1bmtub3duIGRldmljZSBwcm9wZXJ0aWVzIChQ
ZXRlcikKPiAtIHMvR1VEX1BJWEVMX0ZPUk1BVF9SR0IxMTEvR1VEX1BJWEVMX0ZPUk1BVF9YUkdC
MTExMS8gKFBldGVyKQo+IC0gRml4IFIxIGFuZCBYUkdCMTExMSBmb3JtYXQgY29udmVyc2lvbgo+
IC0gQWRkIEZJWE1FIGFib3V0IEJpZyBFbmRpYW4gYmVpbmcgYnJva2VuIChQZXRlciwgSWxpYSkK
PiAKPiBJIHdpbGwgYXBwbHkgdGhlIHBhdGNoZXMgYXMgc29vbiBhcyB0aGUgZGVwZW5kZW5jeSBz
aG93cyB1cCBpbiBkcm0tbWlzYy1uZXh0Lgo+IAo+IERlcGVuZGVuY3k6Cj4gZHJtOiBVc2UgVVNC
IGNvbnRyb2xsZXIncyBETUEgbWFzayB3aGVuIGltcG9ydGluZyBkbWFidWZzWzJdCj4gKGN1cnJl
bnRseSBpbiBkcm0tbWlzYy1maXhlcyBidXQgbm90IGluIGRybS1taXNjLW5leHQgeWV0LCBhbHNv
IHByZXNlbnQgaW4KPiBkcm0tdGlwIGFuZCBsaW51eC1uZXh0KQo+IAo+IE5vcmFsZi4KPiAKPiBb
MV0gaHR0cHM6Ly9naXRodWIuY29tL25vdHJvL2d1ZC93aWtpCj4gWzJdIGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIxMDMwMzEzMzIyOS4zMjg4LTEtdHpp
bW1lcm1hbm5Ac3VzZS5kZQo+IAo+IAo+IE5vcmFsZiBUcsO4bm5lcyAoMyk6Cj4gICBkcm0vdWFw
aTogQWRkIFVTQiBjb25uZWN0b3IgdHlwZQo+ICAgZHJtL3Byb2JlLWhlbHBlcjogQ2hlY2sgZXBv
Y2ggY291bnRlciBpbiBvdXRwdXRfcG9sbF9leGVjdXRlKCkKPiAgIGRybTogQWRkIEdVRCBVU0Ig
RGlzcGxheSBkcml2ZXIKPiAKClBhdGNoZXMgYXJlIG5vdyBhcHBsaWVkIHRvIGRybS1taXNjLW5l
eHQuClRoYW5rcyBmb3IgcmV2aWV3aW5nIGFuZCB0ZXN0aW5nIQoKTm9yYWxmLgoKPiAgTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwo+ICBkcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZyAgICAgICAgICAgICB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAg
ICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAg
fCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jICB8ICAgNyArLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZ3VkL0tjb25maWcgICAgICAgICB8ICAxNCArCj4gIGRyaXZlcnMv
Z3B1L2RybS9ndWQvTWFrZWZpbGUgICAgICAgIHwgICA0ICsKPiAgZHJpdmVycy9ncHUvZHJtL2d1
ZC9ndWRfY29ubmVjdG9yLmMgfCA3MjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYyAgICAgICB8IDY2MSArKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2ludGVybmFsLmggIHwgMTU0ICsr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgICAgICB8IDU1MiArKysrKysr
KysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZ3VkLmggICAgICAgICAgICAgICAgICAgfCAz
MzMgKysrKysrKysrKysrKwo+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgICAgICB8
ICAgMSArCj4gIDEzIGZpbGVzIGNoYW5nZWQsIDI0NjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9LY29uZmlnCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL01ha2VmaWxlCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3IuYwo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2ludGVybmFsLmgKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYwo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9kcm0vZ3VkLmgKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
