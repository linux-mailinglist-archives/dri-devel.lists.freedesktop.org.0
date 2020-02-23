Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589BE169924
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 18:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6AF6E0DE;
	Sun, 23 Feb 2020 17:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFA56E0DE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yvu2oKZOlC2jMRTg5bIqhX+gpozzd1r46c0VrXSAU0U=; b=aRhhK3XXrLYlMZ3oJ/XpG9I9Dy
 6eDrKihMBu2VjLCrhjmMUA+/cVr58ptpaam+Xk0s197pex9tbQzs4wP7eHaZzJBlo9dQUGcMqkJIl
 PS5Vud3A+VqIU3LYPNz+/Dymw2j9wKzDhnw0ARKGgZd2TWUeTtkpylJEiyUd6Ggg0HDUkd1apya9k
 qn4I3MWedtdvP/iwW1Idxtjaf5iOSzyjKFE8O+2erp+nABh2uwN3roNxLbfhiMfLABkhLvXIm6ae3
 s4cZY8qJkxEy7DZXUM8YZk1jdDyzgvP2gHzH/Nk/hwAdxDGjl+DdKoMIgJi0X6mR1PEoiSe2qXlwM
 Z8XdkcDA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50027
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j5vIJ-0006bO-ID; Sun, 23 Feb 2020 18:43:55 +0100
Subject: Re: [RFC 8/9] drm/client: Add drm_client_init_from_id() and
 drm_client_modeset_set()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-9-noralf@tronnes.org>
 <20200217093836.GH2363188@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <393a8dcf-e01b-715c-551b-5108e42ebefc@tronnes.org>
Date: Sun, 23 Feb 2020 18:43:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217093836.GH2363188@phenom.ffwll.local>
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
Cc: balbi@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, broonie@kernel.org,
 lee.jones@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDIuMjAyMCAxMC4zOCwgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBTdW4sIEZl
YiAxNiwgMjAyMCBhdCAwNjoyMToxNlBNICswMTAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4+
IGRybV9jbGllbnRfaW5pdF9mcm9tX2lkKCkgcHJvdmlkZXMgYSB3YXkgZm9yIGNsaWVudHMgdG8g
YWRkIGEgY2xpZW50IGJhc2VkCj4+IG9uIHRoZSBtaW5vci4gZHJtX2NsaWVudF9tb2Rlc2V0X3Nl
dCgpIHByb3ZpZGVzIGEgd2F5IHRvIHNldCB0aGUgbW9kZXNldAo+PiBmb3IgY2xpZW50cyB0aGF0
IGhhbmRsZXMgY29ubmVjdG9ycyBhbmQgZGlzcGxheSBtb2RlIG9uIHRoZWlyIG93bi4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4+IC0t
LQo+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyAgICAgICAgIHwgMzcgKysrKysrKysr
KysrKysrKysrKysKPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyB8IDUy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIGluY2x1ZGUvZHJtL2RybV9jbGllbnQu
aCAgICAgICAgICAgICB8ICA0ICsrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jbGllbnQuYwo+PiBpbmRleCBkOWEyZTM2OTU1MjUuLmRiZDczZmU4
ZDk4NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jCj4+IEBAIC0xMTIsNiArMTEyLDQzIEBAIGlu
dCBkcm1fY2xpZW50X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9jbGll
bnRfZGV2ICpjbGllbnQsCj4+ICB9Cj4+ICBFWFBPUlRfU1lNQk9MKGRybV9jbGllbnRfaW5pdCk7
Cj4+ICAKPj4gKy8qKgo+PiArICogZHJtX2NsaWVudF9pbml0X2Zyb21faWQgLSBJbml0aWFsaXNl
IGEgRFJNIGNsaWVudAo+PiArICogQG1pbm9yX2lkOiBEUk0gbWlub3IgaWQKPj4gKyAqIEBjbGll
bnQ6IERSTSBjbGllbnQKPj4gKyAqIEBuYW1lOiBDbGllbnQgbmFtZQo+PiArICogQGZ1bmNzOiBE
Uk0gY2xpZW50IGZ1bmN0aW9ucyAob3B0aW9uYWwpCj4+ICsgKgo+PiArICogVGhpcyBmdW5jdGlv
biBsb29rcyB1cCB0aGUgZHJtX2RldmljZSB1c2luZyB0aGUgbWlub3IgaWQgYW5kIGluaXRpYWxp
emVzIHRoZSBjbGllbnQuCj4+ICsgKiBJdCBhbHNvIHJlZ2lzdGVyZXMgdGhlIGNsaWVudCB0byBh
dm9pZCBhIHBvc3NpYmxlIHJhY2Ugd2l0aCBEUk0gZGV2aWNlIHVucmVnaXN0ZXIuCj4gCj4gSSB0
aGluayBhbm90aGVyIHNlbnRlbmNlIGhlcmUgd291bGQgYmUgZ29vZCwgZXhwbGFpbmluZyB0aGF0
IHRoaXMgaXMgZm9yCj4gZHJpdmVycyBvdXRzaWRlIG9mIGRybSB0byBleHBvc2UgYSBzcGVjaWZp
YyBkcm0gZHJpdmVyIGluIHNvbWUgZmFzaGlvbiwKPiBhbmQganVzdCBvdXRyaWdodCBtZW50aW9u
IHlvdXIgdXNlLWNhc2UgYXMgYW4gZXhhbXBsZS4KPiAKPiBJJ20gYWxzbyBub3Qgc3VyZSB3aGV0
aGVyIGxvb2t1cC1ieS1taW5vciBpcyB0aGUgZ3JlYXRlc3QgdGhpbmcgZm9yCj4ga2VybmVsLWlu
dGVybmFsIGxvb2t1cHMgbGlrZSB0aGlzLCBtYXliZSBHcmVnIGhhcyBzb21lIGlkZWE/Cj4gCgpX
aGF0IGFsdGVybmF0aXZlcyBkbyB5b3Ugc2VlPyBQYXJlbnQgZGV2aWNlIG5hbWU/CgpJIGRpZCBh
IHNjYW4gdG8gc2VlIHdoYXQgb3RoZXJzIGFyZSBkb2luZywgYW5kIG1vc3QgaGF2ZSBhIGNvbnN1
bWVyIG5hbWUKbG9va3VwIG9uIHRoZSBzdHJ1Y3QgZGV2aWNlIChEZXZpY2UgVHJlZSBvciBsb29r
dXAgdGFibGVzKToKCnN0cnVjdCByZXNldF9jb250cm9sICpfX3Jlc2V0X2NvbnRyb2xfZ2V0KHN0
cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhcgoqaWQsCgkJCQkJICBpbnQgaW5kZXgsIGJvb2wg
c2hhcmVkLAoJCQkJCSAgYm9vbCBvcHRpb25hbCwgYm9vbCBhY3F1aXJlZCk7CgpzdHJ1Y3QgaWlv
X2NoYW5uZWwgKmlpb19jaGFubmVsX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsCgkJCQkgICAgY29u
c3QgY2hhciAqY29uc3VtZXJfY2hhbm5lbCk7CgpzdHJ1Y3QgcmVndWxhdG9yICpfX211c3RfY2hl
Y2sgcmVndWxhdG9yX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsCgkJCQkJICAgICBjb25zdCBjaGFy
ICppZCk7CgpzdHJ1Y3QgcHdtX2RldmljZSAqcHdtX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IGNoYXIgKmNvbl9pZCkKCnN0cnVjdCBncGlvX2Rlc2MgKl9fbXVzdF9jaGVjayBncGlvZF9n
ZXQoc3RydWN0IGRldmljZSAqZGV2LAoJCQkJCSBjb25zdCBjaGFyICpjb25faWQsCgkJCQkJIGVu
dW0gZ3Bpb2RfZmxhZ3MgZmxhZ3MpOwoKU1BJIGFuZCBJMkMgdXNlIHRoZSBidXMgaW5kZXggYXMg
bG9va3VwOgoKZXh0ZXJuIHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2dldF9hZGFwdGVyKGludCBu
cik7CgpleHRlcm4gc3RydWN0IHNwaV9jb250cm9sbGVyICpzcGlfYnVzbnVtX3RvX21hc3Rlcih1
MTYgYnVzbnVtKTsKCgpOb3JhbGYuCgo+PiArICoKPj4gKyAqIFNlZSBkcm1fY2xpZW50X2luaXQo
KSBhbmQgZHJtX2NsaWVudF9yZWdpc3RlcigpLgo+PiArICoKPj4gKyAqIFJldHVybnM6Cj4+ICsg
KiBaZXJvIG9uIHN1Y2Nlc3Mgb3IgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+PiAr
ICovCj4+ICtpbnQgZHJtX2NsaWVudF9pbml0X2Zyb21faWQodW5zaWduZWQgaW50IG1pbm9yX2lk
LCBzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwKPj4gKwkJCSAgICBjb25zdCBjaGFyICpu
YW1lLCBjb25zdCBzdHJ1Y3QgZHJtX2NsaWVudF9mdW5jcyAqZnVuY3MpCj4+ICt7Cj4+ICsJc3Ry
dWN0IGRybV9taW5vciAqbWlub3I7Cj4+ICsJaW50IHJldDsKPj4gKwo+PiArCW1pbm9yID0gZHJt
X21pbm9yX2FjcXVpcmUobWlub3JfaWQpOwo+PiArCWlmIChJU19FUlIobWlub3IpKQo+PiArCQly
ZXR1cm4gUFRSX0VSUihtaW5vcik7Cj4+ICsKPj4gKwltdXRleF9sb2NrKCZtaW5vci0+ZGV2LT5j
bGllbnRsaXN0X211dGV4KTsKPj4gKwlyZXQgPSBkcm1fY2xpZW50X2luaXQobWlub3ItPmRldiwg
Y2xpZW50LCBuYW1lLCBmdW5jcyk7Cj4+ICsJaWYgKCFyZXQpCj4+ICsJCWxpc3RfYWRkKCZjbGll
bnQtPmxpc3QsICZtaW5vci0+ZGV2LT5jbGllbnRsaXN0KTsKPj4gKwltdXRleF91bmxvY2soJm1p
bm9yLT5kZXYtPmNsaWVudGxpc3RfbXV0ZXgpOwo+PiArCj4+ICsJZHJtX21pbm9yX3JlbGVhc2Uo
bWlub3IpOwo+PiArCj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0woZHJt
X2NsaWVudF9pbml0X2Zyb21faWQpOwo+PiArCj4+ICAvKioKPj4gICAqIGRybV9jbGllbnRfcmVn
aXN0ZXIgLSBSZWdpc3RlciBjbGllbnQKPj4gICAqIEBjbGllbnQ6IERSTSBjbGllbnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
