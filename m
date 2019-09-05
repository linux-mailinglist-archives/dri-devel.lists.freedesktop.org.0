Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B77A9AA3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 08:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B489CB2;
	Thu,  5 Sep 2019 06:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC0489CB2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 06:25:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C01D8830C;
 Thu,  5 Sep 2019 06:25:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C55A5C22C;
 Thu,  5 Sep 2019 06:25:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A42531E76; Thu,  5 Sep 2019 08:25:36 +0200 (CEST)
Date: Thu, 5 Sep 2019 08:25:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] drm/ast: Map fbdev framebuffer while it's being
 displayed
Message-ID: <20190905062536.gxfylquwf6umt3jv@sirius.home.kraxel.org>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <20190904115644.7620-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904115644.7620-3-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 05 Sep 2019 06:25:42 +0000 (UTC)
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
Cc: feng.tang@intel.com, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 dave@stgolabs.net, rong.a.chen@intel.com, YueHaibing <yuehaibing@huawei.com>,
 maxime.ripard@bootlin.com, ying.huang@intel.com,
 Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 sean@poorly.run, Sam Bobroff <sbobroff@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDE6NTY6NDNQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIHdpbGwgbWFwIGFuZCB1bm1h
cCB0aGUgZnJhbWVidWZmZXIncyBtZW1vcnkKPiBpZiByZXF1aXJlZC4gQXMgY29uc29sZXMgYXJl
IG1vc3Qgb2Z0ZW4gdXBkYXRlZCB3aGlsZSBiZWluZyBvbiBzY3JlZW4sCj4gd2UgbWFwIHRoZSBm
YmRldiBidWZmZXIgd2hpbGUgaXQncyBiZWluZyBkaXNwbGF5ZWQuIFRoaXMgYXZvaWRzIGZyZXF1
ZW50Cj4gbWFwL3VubWFwIG9wZXJhdGlvbnMgaW4gdGhlIGZiZGV2IGNvZGUuIFRoZSBvcmlnaW5h
bCBmYmRldiBjb2RlIGluIGFzdAo+IHVzZWQgdGhlIHNhbWUgdHJpY2sgdG8gaW1wcm92ZSBwZXJm
b3JtYW5jZS4KPiAKPiB2MjoKPiAJKiBmaXggdHlwbyBpbiBjb21tZW50Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IE5vcmFs
ZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBD
YzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KPiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IENjOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBZdWVIYWliaW5nIDx5dWVoYWli
aW5nQGh1YXdlaS5jb20+Cj4gQ2M6IFNhbSBCb2Jyb2ZmIDxzYm9icm9mZkBsaW51eC5pYm0uY29t
Pgo+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+IENjOiAiWS5DLiBDaGVuIiA8
eWNfY2hlbkBhc3BlZWR0ZWNoLmNvbT4KPiBDYzogUm9uZyBDaGVuIDxyb25nLmEuY2hlbkBpbnRl
bC5jb20+Cj4gQ2M6IEZlbmcgVGFuZyA8ZmVuZy50YW5nQGludGVsLmNvbT4KPiBDYzogSHVhbmcg
WWluZyA8eWluZy5odWFuZ0BpbnRlbC5jb20+Cj4gQ2M6IERhdmlkbG9ociBCdWVzbyA8ZGF2ZUBz
dGdvbGFicy5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDE5
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCj4gaW5kZXggZDM0OWM3MjE1MDFjLi5jMTBmZmY2NTIy
MjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCj4gQEAgLTUyOSwxMyArNTI5LDIwIEBAIHN0
YXRpYyBpbnQgYXN0X2NydGNfZG9fc2V0X2Jhc2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAJ
CQkJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCj4gIAkJCQlpbnQgeCwgaW50IHksIGludCBh
dG9taWMpCj4gIHsKPiArCXN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIgPSBjcnRjLT5k
ZXYtPmZiX2hlbHBlcjsKCnN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiY29uID0gY3J0Yy0+ZGV2
LT5mYl9oZWxwZXItPmJ1ZmZlci0+ZmIgPwoKbWFrZXMgY2xlYXIgd2hhdCBpcyBnb2luZyBvbiB3
aXRob3V0IGV4Y2Vzc2l2ZSBjb21tZW50aW5nIDspCgo+ICAJc3RydWN0IGRybV9nZW1fdnJhbV9v
YmplY3QgKmdibzsKPiAgCWludCByZXQ7Cj4gIAlzNjQgZ3B1X2FkZHI7Cj4gKwl2b2lkICpiYXNl
Owo+ICAKPiAgCWlmICghYXRvbWljICYmIGZiKSB7Cj4gIAkJZ2JvID0gZHJtX2dlbV92cmFtX29m
X2dlbShmYi0+b2JqWzBdKTsKPiAgCQlkcm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKPiArCj4gKwkJ
Ly8gVW5tYXAgZmJkZXYgRkIgaWYgaXQncyBub3QgYmVpbmcgZGlzcGxheWVkCj4gKwkJLy8gYW55
IGxvbmdlci4KCkknZCBkcm9wIHRoZSBjb21tZW50LiAgSXQgc2F5cyAqd2hhdCogdGhlIGNvbW1l
bnQgaXMgZG9pbmcuICBZb3Ugc2hvdWxkCmJlIGFibGUgdG8gZmlndXJlIGJ5IGp1c3QgcmVhZGlu
ZyB0aGUgY29kZS4gIENvbW1lbnRzIHNob3VsZCBleHBsYWluCip3aHkqIHRoZSBjb2RlIGRvZXMg
c29tZXRoaW5nIC4uLgoKPiArCQlpZiAoZmIgPT0gZmJfaGVscGVyLT5idWZmZXItPmZiKQo+ICsJ
CQlkcm1fZ2VtX3ZyYW1fa3VubWFwKGdibyk7Cj4gIAl9Cj4gIAo+ICAJZ2JvID0gZHJtX2dlbV92
cmFtX29mX2dlbShjcnRjLT5wcmltYXJ5LT5mYi0+b2JqWzBdKTsKPiBAQCAtNTUyLDYgKzU1OSwx
NCBAQCBzdGF0aWMgaW50IGFzdF9jcnRjX2RvX3NldF9iYXNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YywKPiAgCWFzdF9zZXRfb2Zmc2V0X3JlZyhjcnRjKTsKPiAgCWFzdF9zZXRfc3RhcnRfYWRkcmVz
c19jcnQxKGNydGMsICh1MzIpZ3B1X2FkZHIpOwo+ICAKPiArCS8vIE1hcCBmYmRldiBGQiB3aGls
ZSBpdCdzIGJlaW5nIGRpc3BsYXllZC4gVGhpcyBhdm9pZHMgZnJlcXVlbnQKPiArCS8vIG1hcHBp
bmcgYW5kIHVubWFwcGluZyB3aXRoaW4gdGhlIGZiZGV2IGNvZGUuCgouLi4gbGlrZSB0aGlzIG9u
ZSAoYXZvaWQgZnJlcXVlbnQgbWFwL3VubWFwKS4KCkNvbW1lbnRzIHNob3VsZCB1c2UgLyogKi8g
c3R5bGUsIGVzcGVjaWFsbHkgbXVsdGkgbGluZSBjb21tZW50cy4KU2VlIGFsc28gdGhlIGNvbW1l
bnQgc2VjdGlvbiBpbgoJRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QKCmNo
ZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
