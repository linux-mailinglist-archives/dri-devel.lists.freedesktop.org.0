Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC3911A3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2615F88C07;
	Sat, 17 Aug 2019 15:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551C76E550;
 Sat, 17 Aug 2019 15:27:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18173807-1500050 for multiple; Sat, 17 Aug 2019 16:27:16 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <00872790-f514-6524-1876-d9461cb3fd8c@amd.com>
References: <20190817144736.7826-1-chris@chris-wilson.co.uk>
 <20190817144736.7826-6-chris@chris-wilson.co.uk>
 <00872790-f514-6524-1876-d9461cb3fd8c@amd.com>
Message-ID: <156605563372.25088.10824119829158086438@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 6/6] dma-fence: Store the timestamp in the same union as
 the cb_list
Date: Sat, 17 Aug 2019 16:27:13 +0100
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wOC0xNyAxNjoyMDoxMikKPiBBbSAxNy4w
OC4xOSB1bSAxNjo0NyBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiA+
IGluZGV4IDg5ZDk2ZTNlNmRmNi4uMmMyMTExNWIxYTM3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL2RtYS1mZW5jZS5jCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMKPiA+IEBAIC0xMjksNiArMTI5LDcgQEAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfY29udGV4
dF9hbGxvYyk7Cj4gPiAgIGludCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChzdHJ1Y3QgZG1hX2Zl
bmNlICpmZW5jZSkKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IGRtYV9mZW5jZV9jYiAqY3VyLCAq
dG1wOwo+ID4gKyAgICAgc3RydWN0IGxpc3RfaGVhZCBjYl9saXN0Owo+ID4gICAKPiA+ICAgICAg
IGxvY2tkZXBfYXNzZXJ0X2hlbGQoZmVuY2UtPmxvY2spOwo+ID4gICAKPiA+IEBAIC0xMzYsMTYg
KzEzNywxNiBAQCBpbnQgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQoc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZmVuY2UtPmZs
YWdzKSkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gICAKPiA+ICsgICAg
IC8qIFN0YXNoIHRoZSBjYl9saXN0IGJlZm9yZSByZXBsYWNpbmcgaXQgd2l0aCB0aGUgdGltZXN0
YW1wICovCj4gPiArICAgICBsaXN0X3JlcGxhY2UoJmZlbmNlLT5jYl9saXN0LCAmY2JfbGlzdCk7
Cj4gCj4gU3Rhc2hpbmcgdGhlIHRpbWVzdGFtcCBpbnN0ZWFkIGlzIHByb2JhYmx5IGxlc3MgYnl0
ZXMgdG8gbW9kaWZ5LgoKTXkgdGhpbmtpbmcgd2FzIHRvIHBhc3MgdGhlIHRpbWVzdGFtcCB0byB0
aGUgbm90aWZ5IGNhbGxiYWNrcywgd2UgbmVlZAp0byBzdGFzaCB0aGUgbGlzdCBhbmQgc2V0IHRo
ZSB0aW1lc3RhbXAgZmlyc3QuCgpOb3RoaW5nIHRoYXQgSSdtIGF3YXJlIG9mIHVzZXMgdGhlIHRp
bWVzdGFtcCAoanVzdCB0aGUgc3luYyBmaWxlIGRlYnVnCndoaWNoIHdlc3RvbiB3YXMgY29uc2lk
ZXJpbmcgdXNpbmcgYXQgb25lIHBvaW50KS4uLiBTbyBJIGd1ZXNzIHdlIGRvbid0CmNhcmU/IEJ1
dCBJIHdvdWxkIHNheSB3ZSBzaG91bGQgZG8gdGhhdCBhcyBhIHNlcGFyYXRlIHN0ZXAgaW4gY2Fz
ZQpzb21lb25lIGRvZXMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
