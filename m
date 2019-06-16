Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB747508
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4553E89267;
	Sun, 16 Jun 2019 14:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.daemonic.se (mail.daemonic.se [176.58.89.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B7789180
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:56:05 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45RbTv5jD0z3kl9;
 Sun, 16 Jun 2019 13:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id aW172vcbdPD7; Sun, 16 Jun 2019 13:56:03 +0000 (UTC)
Received: from vivi.daemonic.se (vivi.daemonic.se [IPv6:2001:470:dca9:2::4])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45RbTv11C6z3c7W;
 Sun, 16 Jun 2019 13:56:03 +0000 (UTC)
Subject: Re: [PATCH libdrm v2 2/4] *symbols-check: use normal shell over bash
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
 <20190616132343.26370-2-emil.l.velikov@gmail.com>
From: Niclas Zeising <zeising@daemonic.se>
Message-ID: <d6844eed-2cbc-e8d0-f1c0-92ec5301f45b@daemonic.se>
Date: Sun, 16 Jun 2019 15:56:02 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616132343.26370-2-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received; s=20151023; t=1560693363; bh=fm3ACmScot8Di4Ef/ge9ImND
 SRfA8M7TciOVCXWAHwU=; b=LmFRoaVcE2ZX/T+vAbHJiydMAj8/0qvGtIM7+Ogv
 vt0F258CVwbh++CjOeagVh1LdQ6mCmqnAE3HtVPPncJYgWUi2WJZoRWc8sm79yhZ
 cPTHHIJgZhXzBLIEOgGTQIHZu0hTqjSEO9EIo5epb5ihYGHmt4vuz0G01HsM0LF9
 TyE=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNiAxNToyMywgRW1pbCBWZWxpa292IHdyb3RlOgo+IE5vbmUgb2YgdGhlIHRl
c3RzIGFyZSBiYXNoIHNwZWNpZmljLiBUZXN0ZWQgd2l0aCBiYXNoLCB6c2gsIGRhc2gsIG1rc2gK
PiBhbmQga3NoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlr
b3ZAZ21haWwuY29tPgoKVGVzdGVkLWJ5OiBOaWNsYXMgWmVpc2luZyA8emVpc2luZ0BkYWVtb25p
Yy5zZT4KUmV2aWV3ZWQtYnk6IE5pY2xhcyBaZWlzaW5nIDx6ZWlzaW5nQGRhZW1vbmljLnNlPgoK
PiAtLS0KPiAgIGFtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrICAgICAgIHwgMiArLQo+ICAgZXRu
YXZpdi9ldG5hdml2LXN5bWJvbC1jaGVjayAgICAgfCAyICstCj4gICBleHlub3MvZXh5bm9zLXN5
bWJvbC1jaGVjayAgICAgICB8IDIgKy0KPiAgIGZyZWVkcmVuby9mcmVlZHJlbm8tc3ltYm9sLWNo
ZWNrIHwgMiArLQo+ICAgaW50ZWwvaW50ZWwtc3ltYm9sLWNoZWNrICAgICAgICAgfCAyICstCj4g
ICBsaWJrbXMva21zLXN5bWJvbC1jaGVjayAgICAgICAgICB8IDIgKy0KPiAgIG5vdXZlYXUvbm91
dmVhdS1zeW1ib2wtY2hlY2sgICAgIHwgMiArLQo+ICAgb21hcC9vbWFwLXN5bWJvbC1jaGVjayAg
ICAgICAgICAgfCAyICstCj4gICByYWRlb24vcmFkZW9uLXN5bWJvbC1jaGVjayAgICAgICB8IDIg
Ky0KPiAgIHRlZ3JhL3RlZ3JhLXN5bWJvbC1jaGVjayAgICAgICAgIHwgMiArLQo+ICAgMTAgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrIGIvYW1kZ3B1L2FtZGdwdS1zeW1ib2wt
Y2hlY2sKPiBpbmRleCA1Y2UxNWY0Ni4uZWE4Mzg1MGQgMTAwNzU1Cj4gLS0tIGEvYW1kZ3B1L2Ft
ZGdwdS1zeW1ib2wtY2hlY2sKPiArKysgYi9hbWRncHUvYW1kZ3B1LXN5bWJvbC1jaGVjawo+IEBA
IC0xLDQgKzEsNCBAQAo+IC0jIS9iaW4vYmFzaAo+ICsjIS9iaW4vc2gKPiAgIAo+ICAgc2V0IC11
Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZXRuYXZpdi9ldG5hdml2LXN5bWJvbC1jaGVjayBiL2V0bmF2
aXYvZXRuYXZpdi1zeW1ib2wtY2hlY2sKPiBpbmRleCAxODkxMDY4OC4uZWY0ZTY2ZjQgMTAwNzU1
Cj4gLS0tIGEvZXRuYXZpdi9ldG5hdml2LXN5bWJvbC1jaGVjawo+ICsrKyBiL2V0bmF2aXYvZXRu
YXZpdi1zeW1ib2wtY2hlY2sKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyEvYmluL2Jhc2gKPiArIyEv
YmluL3NoCj4gICAKPiAgIHNldCAtdQo+ICAgCj4gZGlmZiAtLWdpdCBhL2V4eW5vcy9leHlub3Mt
c3ltYm9sLWNoZWNrIGIvZXh5bm9zL2V4eW5vcy1zeW1ib2wtY2hlY2sKPiBpbmRleCA0OWQ2MTFl
Ni4uZDJjMzYyZTEgMTAwNzU1Cj4gLS0tIGEvZXh5bm9zL2V4eW5vcy1zeW1ib2wtY2hlY2sKPiAr
KysgYi9leHlub3MvZXh5bm9zLXN5bWJvbC1jaGVjawo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIS9i
aW4vYmFzaAo+ICsjIS9iaW4vc2gKPiAgIAo+ICAgc2V0IC11Cj4gICAKPiBkaWZmIC0tZ2l0IGEv
ZnJlZWRyZW5vL2ZyZWVkcmVuby1zeW1ib2wtY2hlY2sgYi9mcmVlZHJlbm8vZnJlZWRyZW5vLXN5
bWJvbC1jaGVjawo+IGluZGV4IDk3ODAyNmMwLi45ODdlMzhmYSAxMDA3NTUKPiAtLS0gYS9mcmVl
ZHJlbm8vZnJlZWRyZW5vLXN5bWJvbC1jaGVjawo+ICsrKyBiL2ZyZWVkcmVuby9mcmVlZHJlbm8t
c3ltYm9sLWNoZWNrCj4gQEAgLTEsNCArMSw0IEBACj4gLSMhL2Jpbi9iYXNoCj4gKyMhL2Jpbi9z
aAo+ICAgCj4gICBzZXQgLXUKPiAgIAo+IGRpZmYgLS1naXQgYS9pbnRlbC9pbnRlbC1zeW1ib2wt
Y2hlY2sgYi9pbnRlbC9pbnRlbC1zeW1ib2wtY2hlY2sKPiBpbmRleCBkZTM3N2JlZi4uMmYzNTUz
MjEgMTAwNzU1Cj4gLS0tIGEvaW50ZWwvaW50ZWwtc3ltYm9sLWNoZWNrCj4gKysrIGIvaW50ZWwv
aW50ZWwtc3ltYm9sLWNoZWNrCj4gQEAgLTEsNCArMSw0IEBACj4gLSMhL2Jpbi9iYXNoCj4gKyMh
L2Jpbi9zaAo+ICAgCj4gICBzZXQgLXUKPiAgIAo+IGRpZmYgLS1naXQgYS9saWJrbXMva21zLXN5
bWJvbC1jaGVjayBiL2xpYmttcy9rbXMtc3ltYm9sLWNoZWNrCj4gaW5kZXggMzBmNDQ0ZjcuLjdk
MzQyNmY2IDEwMDc1NQo+IC0tLSBhL2xpYmttcy9rbXMtc3ltYm9sLWNoZWNrCj4gKysrIGIvbGli
a21zL2ttcy1zeW1ib2wtY2hlY2sKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyEvYmluL2Jhc2gKPiAr
IyEvYmluL3NoCj4gICAKPiAgIHNldCAtdQo+ICAgCj4gZGlmZiAtLWdpdCBhL25vdXZlYXUvbm91
dmVhdS1zeW1ib2wtY2hlY2sgYi9ub3V2ZWF1L25vdXZlYXUtc3ltYm9sLWNoZWNrCj4gaW5kZXgg
NjI5NjI0NGMuLjM2NzAzYTNlIDEwMDc1NQo+IC0tLSBhL25vdXZlYXUvbm91dmVhdS1zeW1ib2wt
Y2hlY2sKPiArKysgYi9ub3V2ZWF1L25vdXZlYXUtc3ltYm9sLWNoZWNrCj4gQEAgLTEsNCArMSw0
IEBACj4gLSMhL2Jpbi9iYXNoCj4gKyMhL2Jpbi9zaAo+ICAgCj4gICBzZXQgLXUKPiAgIAo+IGRp
ZmYgLS1naXQgYS9vbWFwL29tYXAtc3ltYm9sLWNoZWNrIGIvb21hcC9vbWFwLXN5bWJvbC1jaGVj
awo+IGluZGV4IDE2ZGEzYzQwLi4yMTUyMmJhMCAxMDA3NTUKPiAtLS0gYS9vbWFwL29tYXAtc3lt
Ym9sLWNoZWNrCj4gKysrIGIvb21hcC9vbWFwLXN5bWJvbC1jaGVjawo+IEBAIC0xLDQgKzEsNCBA
QAo+IC0jIS9iaW4vYmFzaAo+ICsjIS9iaW4vc2gKPiAgIAo+ICAgc2V0IC11Cj4gICAKPiBkaWZm
IC0tZ2l0IGEvcmFkZW9uL3JhZGVvbi1zeW1ib2wtY2hlY2sgYi9yYWRlb24vcmFkZW9uLXN5bWJv
bC1jaGVjawo+IGluZGV4IGRhNjA1YmI4Li43YjY5ZjlhNCAxMDA3NTUKPiAtLS0gYS9yYWRlb24v
cmFkZW9uLXN5bWJvbC1jaGVjawo+ICsrKyBiL3JhZGVvbi9yYWRlb24tc3ltYm9sLWNoZWNrCj4g
QEAgLTEsNCArMSw0IEBACj4gLSMhL2Jpbi9iYXNoCj4gKyMhL2Jpbi9zaAo+ICAgCj4gICBzZXQg
LXUKPiAgIAo+IGRpZmYgLS1naXQgYS90ZWdyYS90ZWdyYS1zeW1ib2wtY2hlY2sgYi90ZWdyYS90
ZWdyYS1zeW1ib2wtY2hlY2sKPiBpbmRleCA4NTM5Yjk1Yi4uYTc0ZDk3NDkgMTAwNzU1Cj4gLS0t
IGEvdGVncmEvdGVncmEtc3ltYm9sLWNoZWNrCj4gKysrIGIvdGVncmEvdGVncmEtc3ltYm9sLWNo
ZWNrCj4gQEAgLTEsNCArMSw0IEBACj4gLSMhL2Jpbi9iYXNoCj4gKyMhL2Jpbi9zaAo+ICAgCj4g
ICBzZXQgLXUKPiAgIAo+IAoKCi0tIApOaWNsYXMgWmVpc2luZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
