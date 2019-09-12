Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF7B0AAC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 10:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1301E6EC71;
	Thu, 12 Sep 2019 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062606EC71
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 08:52:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77181190C01F;
 Thu, 12 Sep 2019 08:52:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BC195D712;
 Thu, 12 Sep 2019 08:52:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1274016E05; Thu, 12 Sep 2019 10:52:04 +0200 (CEST)
Date: Thu, 12 Sep 2019 10:52:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] drm/fb-helper: Synchronize dirty worker with vblank
Message-ID: <20190912085204.k6ozeuydtlbwo4ng@sirius.home.kraxel.org>
References: <20190912064230.27972-1-tzimmermann@suse.de>
 <20190912064230.27972-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912064230.27972-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 12 Sep 2019 08:52:05 +0000 (UTC)
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDg6NDI6MjhBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUn
cyBzaGFkb3cgYnVmZmVyLCB0aGUgZGlydHkKPiB3b3JrZXIgbm93IHdhaXRzIGZvciB2Ymxhbmsu
IFRoaXMgYWxsb3dzIHNldmVyYWwgc2NyZWVuIHVwZGF0ZXMgdG8gcGlsZQo+IHVwIGFuZCBhY3Rz
IGFzIGEgcmF0ZSBsaW1pdGVyLgo+IAo+IHYyOgo+IAkqIGRvbid0IGhvbGQgaGVscGVyLT5sb2Nr
IHdoaWxlIHdhaXRpbmcgZm9yIHZibGFuawo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiMKClJldmlld2VkLWJ5OiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gaW5kZXggYTdiYTViNDkwMmQ2Li5kMGNiMWZh
NGY5MDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiBAQCAtNDAyLDggKzQwMiwxOCBA
QCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2RpcnR5X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQo+ICAJCQkJCQkgICAgZGlydHlfd29yayk7Cj4gIAlzdHJ1Y3QgZHJtX2NsaXBfcmVj
dCAqY2xpcCA9ICZoZWxwZXItPmRpcnR5X2NsaXA7Cj4gIAlzdHJ1Y3QgZHJtX2NsaXBfcmVjdCBj
bGlwX2NvcHk7Cj4gKwlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7Cj4gIAl1bnNpZ25lZCBsb25nIGZs
YWdzOwo+ICAJdm9pZCAqdmFkZHI7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qIHJhdGUtbGltaXQg
dXBkYXRlIGZyZXF1ZW5jeSAqLwo+ICsJY3J0YyA9IGhlbHBlci0+Y2xpZW50Lm1vZGVzZXRzWzBd
LmNydGM7Cj4gKwlyZXQgPSBkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpOwo+ICsJaWYgKCFyZXQp
IHsKPiArCQlkcm1fY3J0Y193YWl0X29uZV92YmxhbmsoY3J0Yyk7Cj4gKwkJZHJtX2NydGNfdmJs
YW5rX3B1dChjcnRjKTsKPiArCX0KPiAgCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmaGVscGVyLT5k
aXJ0eV9sb2NrLCBmbGFncyk7Cj4gIAljbGlwX2NvcHkgPSAqY2xpcDsKPiAtLSAKPiAyLjIzLjAK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
