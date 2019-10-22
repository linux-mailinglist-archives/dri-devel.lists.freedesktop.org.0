Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F5DFFE0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AC46E463;
	Tue, 22 Oct 2019 08:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6786E463
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 37CFAFB03;
 Tue, 22 Oct 2019 10:45:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_7FrQl3FDaI; Tue, 22 Oct 2019 10:45:15 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 1D2F949BFC; Tue, 22 Oct 2019 10:45:15 +0200 (CEST)
Date: Tue, 22 Oct 2019 10:45:14 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Add NWL MIPI DSI host controller
 support
Message-ID: <20191022084514.GA30274@bogon.m.sigxcpu.org>
References: <e0304ab9320cbbf3e63d78449e50975c036b2633.1571494140.git.agx@sigxcpu.org>
 <201910211901.yB3b4mYu%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201910211901.yB3b4mYu%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDA3OjExOjEyUE0gKzA4MDAsIGtidWlsZCB0ZXN0
IHJvYm90IHdyb3RlOgo+IEhpICJHdWlkbywKPiAKPiBJIGxvdmUgeW91ciBwYXRjaCEgWWV0IHNv
bWV0aGluZyB0byBpbXByb3ZlOgo+IAo+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMv
bWFzdGVyXQo+IFtjYW5ub3QgYXBwbHkgdG8gdjUuNC1yYzQgbmV4dC0yMDE5MTAxOF0KPiBbaWYg
eW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3Ag
dXMgYSBub3RlIHRvIGhlbHAKPiBpbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdn
ZXN0IHRvIHVzZSAnLS1iYXNlJyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPiBiYXNlIHRyZWUgaW4g
Z2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNlZQo+IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20v
YS8zNzQwNjk4Ml0KClRoZSBiYXNlIGZvciB0aGlzIHNlcmllcyBpcyBuZXh0LTIwMTkxMDE4IHdo
ZXJlIGRybV9wYW5lbF9icmlkZ2VfYWRkKCkKbGlzdCBpdCdzIHNlY29uZCBhcmd1bWVudCAoODk5
NThiN2NkOTU1NWE1ZDgyNTU2Y2M5YTFmNGM2MmZmZmRhNmY5NikuCgpDaGVlcnMsCiAtLSBHdWlk
bwoKPiAKPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMv
R3VpZG8tRy1udGhlci9kdC1iaW5kaW5ncy1kaXNwbGF5LWJyaWRnZS1BZGQtYmluZGluZy1mb3It
TldMLW1pcGktZHNpLWhvc3QtY29udHJvbGxlci8yMDE5MTAyMS0xODA4MjUKPiBiYXNlOiAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdCA3ZDE5NGMyMTAwYWQyYTZkZGVkNTQ1ODg3ZDAyNzU0OTQ4Y2E1MjQxCj4gY29uZmln
OiBtaXBzLWFsbG1vZGNvbmZpZyAoYXR0YWNoZWQgYXMgLmNvbmZpZykKPiBjb21waWxlcjogbWlw
cy1saW51eC1nY2MgKEdDQykgNy40LjAKPiByZXByb2R1Y2U6Cj4gICAgICAgICB3Z2V0IGh0dHBz
Oi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4v
bWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9t
YWtlLmNyb3NzCj4gICAgICAgICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5jb25maWcgdG8gbGludXgg
YnVpbGQgdHJlZQo+ICAgICAgICAgR0NDX1ZFUlNJT049Ny40LjAgbWFrZS5jcm9zcyBBUkNIPW1p
cHMgCj4gCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwo+
IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiAKPiBBbGwg
ZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4gCj4gICAgZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9ud2wtZHNpLmM6IEluIGZ1bmN0aW9uICdud2xfZHNpX2hvc3RfYXR0YWNoJzoKPiA+
PiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYzozODQ6MTI6IGVycm9yOiB0b28gZmV3
IGFyZ3VtZW50cyB0byBmdW5jdGlvbiAnZHJtX3BhbmVsX2JyaWRnZV9hZGQnCj4gICAgICAgYnJp
ZGdlID0gZHJtX3BhbmVsX2JyaWRnZV9hZGQocGFuZWwpOwo+ICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvZHJtL2Ry
bV9jcnRjLmg6NDQ6MCwKPiAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9kcm0vZHJt
X2F0b21pY19oZWxwZXIuaDozMSwKPiAgICAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9ud2wtZHNpLmM6MjQ6Cj4gICAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5o
OjQzMjoyMDogbm90ZTogZGVjbGFyZWQgaGVyZQo+ICAgICBzdHJ1Y3QgZHJtX2JyaWRnZSAqZHJt
X3BhbmVsX2JyaWRnZV9hZGQoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwsCj4gICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IHZpbSArL2RybV9wYW5lbF9icmlk
Z2VfYWRkICszODQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ud2wtZHNpLmMKPiAKPiAgICAzNTgJ
Cj4gICAgMzU5CXN0YXRpYyBpbnQgbndsX2RzaV9ob3N0X2F0dGFjaChzdHJ1Y3QgbWlwaV9kc2lf
aG9zdCAqZHNpX2hvc3QsCj4gICAgMzYwCQkJCSAgICAgICBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNl
ICpkZXZpY2UpCj4gICAgMzYxCXsKPiAgICAzNjIJCXN0cnVjdCBud2xfZHNpICpkc2kgPSBjb250
YWluZXJfb2YoZHNpX2hvc3QsIHN0cnVjdCBud2xfZHNpLCBkc2lfaG9zdCk7Cj4gICAgMzYzCQlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBkc2ktPmRldjsKPiAgICAzNjQJCXN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2U7Cj4gICAgMzY1CQlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsKPiAgICAzNjYJCWlu
dCByZXQ7Cj4gICAgMzY3CQo+ICAgIDM2OAkJRFJNX0RFVl9JTkZPKGRldiwgImxhbmVzPSV1LCBm
b3JtYXQ9MHgleCBmbGFncz0weCVseFxuIiwgZGV2aWNlLT5sYW5lcywKPiAgICAzNjkJCQkgICAg
IGRldmljZS0+Zm9ybWF0LCBkZXZpY2UtPm1vZGVfZmxhZ3MpOwo+ICAgIDM3MAkKPiAgICAzNzEJ
CWlmIChkZXZpY2UtPmxhbmVzIDwgMSB8fCBkZXZpY2UtPmxhbmVzID4gNCkKPiAgICAzNzIJCQly
ZXR1cm4gLUVJTlZBTDsKPiAgICAzNzMJCj4gICAgMzc0CQlkc2ktPmxhbmVzID0gZGV2aWNlLT5s
YW5lczsKPiAgICAzNzUJCWRzaS0+Zm9ybWF0ID0gZGV2aWNlLT5mb3JtYXQ7Cj4gICAgMzc2CQlk
c2ktPmRzaV9tb2RlX2ZsYWdzID0gZGV2aWNlLT5tb2RlX2ZsYWdzOwo+ICAgIDM3NwkKPiAgICAz
NzgJCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkc2ktPmRldi0+b2Zfbm9kZSwg
MSwgMCwgJnBhbmVsLAo+ICAgIDM3OQkJCQkJCSAgJmJyaWRnZSk7Cj4gICAgMzgwCQlpZiAocmV0
KQo+ICAgIDM4MQkJCXJldHVybiByZXQ7Cj4gICAgMzgyCQo+ICAgIDM4MwkJaWYgKHBhbmVsKSB7
Cj4gID4gMzg0CQkJYnJpZGdlID0gZHJtX3BhbmVsX2JyaWRnZV9hZGQocGFuZWwpOwo+ICAgIDM4
NQkJCWlmIChJU19FUlIoYnJpZGdlKSkKPiAgICAzODYJCQkJcmV0dXJuIFBUUl9FUlIoYnJpZGdl
KTsKPiAgICAzODcJCX0KPiAgICAzODgJCj4gICAgMzg5CQlkc2ktPnBhbmVsX2JyaWRnZSA9IGJy
aWRnZTsKPiAgICAzOTAJCWRybV9icmlkZ2VfYWRkKCZkc2ktPmJyaWRnZSk7Cj4gICAgMzkxCQo+
ICAgIDM5MgkJcmV0dXJuIDA7Cj4gICAgMzkzCX0KPiAgICAzOTQJCj4gCj4gLS0tCj4gMC1EQVkg
a2VybmVsIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAgICAgICAgICAgT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXIKPiBodHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwva2J1aWxkLWFs
bCAgICAgICAgICAgICAgICAgICBJbnRlbCBDb3Jwb3JhdGlvbgoKCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
