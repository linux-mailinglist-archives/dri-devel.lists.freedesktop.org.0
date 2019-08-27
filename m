Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A59E80E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 14:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D822897F5;
	Tue, 27 Aug 2019 12:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5989762
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 12:36:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18277524-1500050 for multiple; Tue, 27 Aug 2019 13:36:28 +0100
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAMuHMdUk9G22rDfUrX3CZ=st3_bSehyaW_URtCk0ZfJqFTmLuQ@mail.gmail.com>
References: <CAMuHMdUk9G22rDfUrX3CZ=st3_bSehyaW_URtCk0ZfJqFTmLuQ@mail.gmail.com>
Message-ID: <156690938679.15406.15977840485564172260@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: dma-buf: Add selftests for dma-fence
Date: Tue, 27 Aug 2019 13:36:26 +0100
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
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBHZWVydCBVeXR0ZXJob2V2ZW4gKDIwMTktMDgtMjcgMTM6MzA6MDQpCj4gSGkgQ2hy
aXMsCj4gCj4gV2hlbiBydW5uaW5nIHRoZSBuZXcgZG1hYnVmLXNlbGZ0ZXN0cyBvbiB0d28gZGlm
ZmVyZW50IHN5c3RlbXMsIEkgZ2V0Ogo+IAo+ICAgICBkbWEtYnVmOiBSdW5uaW5nIHNhbml0eWNo
ZWNrCj4gICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlCj4gICAgIHNpemVvZihkbWFfZmVu
Y2UpPTQ4Cj4gICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Nhbml0eWNoZWNrCj4gICAg
IGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Rlc3Rfc2lnbmFsaW5nCj4gICAgIGRtYS1idWY6
IFJ1bm5pbmcgZG1hX2ZlbmNlL3Rlc3RfYWRkX2NhbGxiYWNrCj4gICAgIGRtYS1idWY6IFJ1bm5p
bmcgZG1hX2ZlbmNlL3Rlc3RfbGF0ZV9hZGRfY2FsbGJhY2sKPiAgICAgZG1hLWJ1ZjogUnVubmlu
ZyBkbWFfZmVuY2UvdGVzdF9ybV9jYWxsYmFjawo+ICAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9m
ZW5jZS90ZXN0X2xhdGVfcm1fY2FsbGJhY2sKPiAgICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVu
Y2UvdGVzdF9zdGF0dXMKPiAgICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2UvdGVzdF9lcnJv
cgo+ICAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0X3dhaXQKPiAgICAgZG1hLWJ1
ZjogUnVubmluZyBkbWFfZmVuY2UvdGVzdF93YWl0X3RpbWVvdXQKPiAgICAgZG1hLWJ1ZjogUnVu
bmluZyBkbWFfZmVuY2UvdGVzdF9zdHViCj4gICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNl
L3JhY2Vfc2lnbmFsX2NhbGxiYWNrCj4gICAgIHRocmVhZF9zaWduYWxfY2FsbGJhY2tbMF0gY29t
cGxldGVkIDI4ODU1IHBhc3NlcywgMzkyOSBtaXNzZXMKPiAgICAgdGhyZWFkX3NpZ25hbF9jYWxs
YmFja1sxXSBjb21wbGV0ZWQgMjg4NDYgcGFzc2VzLCAzOTE4IG1pc3Nlcwo+ICAgICB0aHJlYWRf
c2lnbmFsX2NhbGxiYWNrWzBdIGNvbXBsZXRlZCAzNzE3OSBwYXNzZXMsIDM3MTc5IG1pc3Nlcwo+
ICAgICB0aHJlYWRfc2lnbmFsX2NhbGxiYWNrWzFdIGNvbXBsZXRlZCAzNzE4NCBwYXNzZXMsIDM3
MTgzIG1pc3Nlcwo+IAo+IGFuZAo+IAo+ICAgICBkbWEtYnVmOiBSdW5uaW5nIHNhbml0eWNoZWNr
Cj4gICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlCj4gICAgIHNpemVvZihkbWFfZmVuY2Up
PTY0Cj4gICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Nhbml0eWNoZWNrCj4gICAgIGRt
YS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Rlc3Rfc2lnbmFsaW5nCj4gICAgIGRtYS1idWY6IFJ1
bm5pbmcgZG1hX2ZlbmNlL3Rlc3RfYWRkX2NhbGxiYWNrCj4gICAgIGRtYS1idWY6IFJ1bm5pbmcg
ZG1hX2ZlbmNlL3Rlc3RfbGF0ZV9hZGRfY2FsbGJhY2sKPiAgICAgZG1hLWJ1ZjogUnVubmluZyBk
bWFfZmVuY2UvdGVzdF9ybV9jYWxsYmFjawo+ICAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5j
ZS90ZXN0X2xhdGVfcm1fY2FsbGJhY2sKPiAgICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2Uv
dGVzdF9zdGF0dXMKPiAgICAgZG1hLWJ1ZjogUnVubmluZyBkbWFfZmVuY2UvdGVzdF9lcnJvcgo+
ICAgICBkbWEtYnVmOiBSdW5uaW5nIGRtYV9mZW5jZS90ZXN0X3dhaXQKPiAgICAgZG1hLWJ1Zjog
UnVubmluZyBkbWFfZmVuY2UvdGVzdF93YWl0X3RpbWVvdXQKPiAgICAgZG1hLWJ1ZjogUnVubmlu
ZyBkbWFfZmVuY2UvdGVzdF9zdHViCj4gICAgIGRtYS1idWY6IFJ1bm5pbmcgZG1hX2ZlbmNlL3Jh
Y2Vfc2lnbmFsX2NhbGxiYWNrCj4gICAgIHRocmVhZF9zaWduYWxfY2FsbGJhY2tbMF0gY29tcGxl
dGVkIDM0MjMgcGFzc2VzLCAyMTQ4IG1pc3Nlcwo+ICAgICB0aHJlYWRfc2lnbmFsX2NhbGxiYWNr
WzFdIGNvbXBsZXRlZCAyMzYwIHBhc3NlcywgOSBtaXNzZXMKPiAgICAgdGhyZWFkX3NpZ25hbF9j
YWxsYmFja1swXSBjb21wbGV0ZWQgNDAyOCBwYXNzZXMsIDQwMjggbWlzc2VzCj4gICAgIHRocmVh
ZF9zaWduYWxfY2FsbGJhY2tbMV0gY29tcGxldGVkIDgwODAgcGFzc2VzLCA4MDc5IG1pc3Nlcwo+
IAo+IFVuZm9ydHVuYXRlbHkgaXQgaXMgbm90IGNsZWFyIHRvIG1lIGlmIHRoaXMgaXMgZ29vZCBv
ciBiYWQ/Cj4gUGVyaGFwcyB0aGUgdGVzdCBvdXRwdXQgY2FuIGJlIGltcHJvdmVkLCBlLmcuIHdp
dGggYSBjbGVhciBQQVNTL0ZBSUwgb3V0cHV0PwoKSXQncyBjb21tdW5pY2F0ZWQgdmlhIHRoZSBl
cnJvciBjb2RlLCBhbG9uZyB3aXRoIGZhaWx1cmUgbWVzc2FnZXMuIEZvcgptb3JlIGNvbXBsZXgg
cGVyc2lzdGVudCBzZWxmdGVzdCBtb2R1bGVzLCB3ZSB1c2UgYW4gbW9kcGFyYW0gdG8gcmVwb3J0
CnRoZSBlcnJvciBjb2RlLgoKU2VlIGlndC9kbWFidWYgZm9yIHRoZSB0ZXN0IHJ1bm5lci4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
