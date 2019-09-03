Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F73A6AFF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 16:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EEA893ED;
	Tue,  3 Sep 2019 14:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E7893ED
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 14:15:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-148-17-nat.elisa-mobile.fi
 [85.76.148.17])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AB70542;
 Tue,  3 Sep 2019 16:15:02 +0200 (CEST)
Date: Tue, 3 Sep 2019 17:14:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/7] drm/omap: drop unneeded locking from mgr_fld_write()
Message-ID: <20190903141454.GD4812@pendragon.ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902125359.18001-2-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567520104;
 bh=TioHgoOCdy3bGOwf93yFU36opbsCRn8buASzenq6C9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wnCqIJukWHLFUMAp260Mnz29yxDhS8QacgLRgMuX1tAZlYgzm8TTMvLv4oSzHhw2W
 LazcJ2S0s9bkvX4N1bizaHD0nBV1jSRZPyXSsic/5yt+xV0MKx/PFNzTrr49LomcdC
 qIUnn+7YTKZYTCBwNYWwbAvjECqX7MxPKrDLuGas=
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBTZXAgMDIsIDIwMTkg
YXQgMDM6NTM6NTNQTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gQ29tbWl0IGQ0OWNk
MTU1NTBkOWQ0NDk1ZjYxODc0MjUzMThjMjQ1ZDU4Y2I2M2YgKCJPTUFQRFNTOiBESVNQQzogbG9j
awo+IGFjY2VzcyB0byBESVNQQ19DT05UUk9MICYgRElTUENfQ09ORklHIikgYWRkZWQgbG9ja2lu
ZyB0bwo+IG1ncl9mbGRfd3JpdGUoKS4gVGhpcyB3YXMgbmVlZGVkIGluIG9tYXBmYiB0aW1lcyBk
dWUgdG8gbGFjayBvZiBnb29kCj4gbG9ja2luZywgZXNwZWNpYWxseSBpbiB0aGUgY2FzZSBvZiBi
b3RoIFY0TDIgYW5kIGZiZGV2IGxheWVycyB1c2luZyB0aGUKPiBEU1MgZHJpdmVyLgo+IAo+IFRo
aXMgaXMgbm90IG5lZWRlZCBmb3Igb21hcGRybSwgc28gd2UgY2FuIHJlbW92ZSB0aGUgbG9ja2lu
Zy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgoKSSd2ZSBmb2xsb3dlZCBhbGwgY29kZSBwYXRocywgYW5kIHRoZXkgZW5kIHVwIGVpdGhl
ciBpbiB0aGUgYnJpZGdlCmVuYWJsZSBvcGVyYXRpb25zIG9yIHRoZSBDUlRDIGF0b21pYyBmbHVz
aCAoZGlzcmVnYXJkaW5nCnN1c3BlbmQvcmVzdW1lKS4gVGhvc2UgY2FuJ3QgcmFjZSBlYWNoIG90
aGVyLCBzbyB0aGlzIHNob3VsZCBiZSBzYWZlLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vZHNzL2Rpc3BjLmMgfCAxNiArLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2Rpc3BjLmMKPiBpbmRleCA3ODVjNTU0NjA2N2EuLmM2ZGEzM2U3MDE0ZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jCj4gQEAgLTE4NCw5ICsxODQsNiBAQCBzdHJ1Y3Qg
ZGlzcGNfZGV2aWNlIHsKPiAgCj4gIAlzdHJ1Y3QgcmVnbWFwICpzeXNjb25fcG9sOwo+ICAJdTMy
IHN5c2Nvbl9wb2xfb2Zmc2V0Owo+IC0KPiAtCS8qIERJU1BDX0NPTlRST0wgJiBESVNQQ19DT05G
SUcgbG9jayovCj4gLQlzcGlubG9ja190IGNvbnRyb2xfbG9jazsKPiAgfTsKPiAgCj4gIGVudW0g
b21hcF9jb2xvcl9jb21wb25lbnQgewo+IEBAIC0zNzcsMTYgKzM3NCw3IEBAIHN0YXRpYyB2b2lk
IG1ncl9mbGRfd3JpdGUoc3RydWN0IGRpc3BjX2RldmljZSAqZGlzcGMsIGVudW0gb21hcF9jaGFu
bmVsIGNoYW5uZWwsCj4gIAkJCSAgZW51bSBtZ3JfcmVnX2ZpZWxkcyByZWdmbGQsIGludCB2YWwp
Cj4gIHsKPiAgCWNvbnN0IHN0cnVjdCBkaXNwY19yZWdfZmllbGQgcmZsZCA9IG1ncl9kZXNjW2No
YW5uZWxdLnJlZ19kZXNjW3JlZ2ZsZF07CgpXaGlsZSBhdCBpdCwgc2hvdWxkIHlvdSB0dXJuIHRo
aXMgaW50byBhIHBvaW50ZXIgdG8gYXZvaWQgYW4gdW5uZWNlc3NhcnkKY29weSA/CgpSZXZpZXdl
ZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PgoKPiAtCWNvbnN0IGJvb2wgbmVlZF9sb2NrID0gcmZsZC5yZWcgPT0gRElTUENfQ09OVFJPTCB8
fCByZmxkLnJlZyA9PSBESVNQQ19DT05GSUc7Cj4gLQl1bnNpZ25lZCBsb25nIGZsYWdzOwo+IC0K
PiAtCWlmIChuZWVkX2xvY2spIHsKPiAtCQlzcGluX2xvY2tfaXJxc2F2ZSgmZGlzcGMtPmNvbnRy
b2xfbG9jaywgZmxhZ3MpOwo+IC0JCVJFR19GTERfTU9EKGRpc3BjLCByZmxkLnJlZywgdmFsLCBy
ZmxkLmhpZ2gsIHJmbGQubG93KTsKPiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkaXNwYy0+
Y29udHJvbF9sb2NrLCBmbGFncyk7Cj4gLQl9IGVsc2Ugewo+IC0JCVJFR19GTERfTU9EKGRpc3Bj
LCByZmxkLnJlZywgdmFsLCByZmxkLmhpZ2gsIHJmbGQubG93KTsKPiAtCX0KPiArCVJFR19GTERf
TU9EKGRpc3BjLCByZmxkLnJlZywgdmFsLCByZmxkLmhpZ2gsIHJmbGQubG93KTsKPiAgfQo+ICAK
PiAgc3RhdGljIGludCBkaXNwY19nZXRfbnVtX292bHMoc3RydWN0IGRpc3BjX2RldmljZSAqZGlz
cGMpCj4gQEAgLTQ3NjksOCArNDc1Nyw2IEBAIHN0YXRpYyBpbnQgZGlzcGNfYmluZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgCXBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsIGRpc3BjKTsKPiAgCWRpc3BjLT5kc3MgPSBkc3M7Cj4gIAo+
IC0Jc3Bpbl9sb2NrX2luaXQoJmRpc3BjLT5jb250cm9sX2xvY2spOwo+IC0KPiAgCS8qCj4gIAkg
KiBUaGUgT01BUDMtYmFzZWQgbW9kZWxzIGNhbid0IGJlIHRvbGQgYXBhcnQgdXNpbmcgdGhlIGNv
bXBhdGlibGUKPiAgCSAqIHN0cmluZywgdXNlIFNvQyBkZXZpY2UgbWF0Y2hpbmcuCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
