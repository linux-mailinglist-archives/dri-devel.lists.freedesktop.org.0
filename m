Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CEF4F42B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 09:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E166E95E;
	Sat, 22 Jun 2019 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB876E95E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 07:31:55 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A12F08035B;
 Sat, 22 Jun 2019 09:31:50 +0200 (CEST)
Date: Sat, 22 Jun 2019 09:31:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/1] drm/exynos: drop use of drmP.h
Message-ID: <20190622073144.GA12883@ravnborg.org>
References: <20190621184904.25975-1-sam@ravnborg.org>
 <CAJKOXPeNDGYCctL4OpBH1V+Ez4Ld1CDzB_pANxQkwqBzj8zEmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPeNDGYCctL4OpBH1V+Ez4Ld1CDzB_pANxQkwqBzj8zEmA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yxeCLFYXrFKN8Uma3W4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLgoKPiA+IEJ1aWxkIHRlc3RlZCB1c2luZyBhbGx5ZXNjb25maWcsIGFsbG1v
ZGNvbmZpZyBmb3IgdmFyaW91cwo+ID4gYXJjaGl0ZWN0dXJlcy4KPiAKPiBIaSwKPiAKPiBUaGFu
a3MgZm9yIGZpeGVzLiBKdXN0IGZvciB0aGUgcmVjb3JkLCBhbGx5ZXNjb25maWcvYWxsbW9kY29u
ZmlnIGFyZQo+IG5vdCBhIHByb3BlciB3YXkgZm9yIGJ1aWxkIHRlc3Qgc3BlY2lmaWMgZHJpdmVy
cy4gVGhleSBhcmUgbmljZSBidXQKPiBzaW5jZSBhbGwgZGVwZW5kZW5jaWVzIGFyZSBpbiwgdGhl
eSBtaWdodCBtaXNzIGEgbG90LiBZb3Ugc2hvdWxkIGJ1aWxkCj4gbWVudGlvbmVkIHBsYXRmb3Jt
IChleHlub3NfZGVmY29uZmlnIG9uIEFSTXY3LCBkZWZjb25maWcgb24gQVJNdjgpIGFuZAo+IG11
bHRpIGNvbmZpZ3MgKG11bHRpX3Y3IG9uIEFSTXY3KS4gU3VjaCBydWxlIGlzIGFsc28gdmFsaWQg
Zm9yIG90aGVyCj4gZHJpdmVycywgbm90IHNwZWNpZmljIHRvIEV4eW5vcy4KClRoYW5rcyBmb3Ig
dGhlIGZlZWRiYWNrLiBJIGhhdmUgYWRkZWQgZXh5bm9zX2RlZmNvbmZpZywKbXVsdGlfdjdfZGVm
Y29uZmlnIHRvIG15IGdyb3dpbmcgbGlzdCBvZiBjb25maWdzIHRoYXQgSSB0cnkgd2hlbiBkb2lu
Zwpjcm9zcyBkcml2ZXIgY2hhbmdlcy4KVGhleSBpbmNsdWRlIGRlZmNvbmZpZyArIGFsbG5vY29u
ZmlnIGZvciB0aGUgc3VwcG9ydGVkIGFyY2hzIHRvby4KCk5vbmUgb2YgdGhlc2UgY29uZmlncyB3
b3VsZCBoYXZlIHRyaWdnZXJlZCBhIGJ1aWxkIG9mIGV4eW5vc19kcm1fZzJkLmMKc28gdG8gZG8g
dGhhdCBzb21lIG1hbnVhbCB0d2Fla3Mgb2YgdGhlIGNvbmZnIHdhcyBuZWNlc3NhcnkuCgpBZGRp
bmcgYSBDT01QSUxFX1RFU1QgZGVwZW5kZW5jeSB3aWxsIGVuYWJsZSB0aGUgYnVpbGQKZm9yIHRo
ZSBhbGx5ZXNjb25maWcsIGFsbG1vZGNvbmZpZy4KVGhhdHMgd29ydGhzIHRvIGNvbnNpZGVyIHRv
IGF2b2lkIGZ1dHVyZSBtaXN0YWtlcy4KCglTYW0KClNvbWV0aGluZyBsaWtlIHRoaXM6CgpGcm9t
IDliMjliODVmMjVmNGNjNDg1ZjM2ZWZiOGQ2NTg3NjZmYTlhMjUyZDkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCkZyb206IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KRGF0ZTogU2F0
LCAyMiBKdW4gMjAxOSAwOToyNDowNiArMDIwMApTdWJqZWN0OiBbUEFUQ0ggdjFdIGRybS9leHlu
b3M6IHRyaWdnZXIgYnVpbGQgb2YgYWxsIG1vZHVsZXMKCkFkZCBDT01QSUxFX1RFU1QgZGVwZW5k
ZW5jeSB0byBhIGZldyBvcHRpb25zIHRvIHRyaWdnZXIgdGhhdCB0aGUgbW9kdWxlcwpnZXQgYnVp
bHQgdXNpbmcgYWxseWVzY29uZmlnLCBhbGxtb2Rjb25maWcuClRoaXMgYWxsb3dzIGEgbm9uLWV4
eW5vcyBkZXZlbG9wZXIgdG8gY2F0Y2ggYnVpbGQgaXNzdWVzCmluIGZpbGVzIHRoYXQgaXMgdXN1
YWxseSBub3QgYnVpbHQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CkNjOiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CkNjOiBKb29ueW91bmcg
U2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+CkNjOiBTZXVuZy1Xb28gS2ltIDxzdzAzMTIu
a2ltQHNhbXN1bmcuY29tPgpDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5n
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5vcmc+CkNj
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CkNjOiBKaW5nb28gSGFuIDxq
aW5nb29oYW4xQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9LY29uZmlnCmluZGV4IGNiZTU4ZDMwN2QxYy4uZWFkZWEyZGFmMWFiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9LY29uZmlnCkBAIC04Niw3ICs4Niw3IEBAIGNvbW1lbnQgIlN1Yi1kcml2
ZXJzIgogCiBjb25maWcgRFJNX0VYWU5PU19HMkQKIAlib29sICJHMkQiCi0JZGVwZW5kcyBvbiBW
SURFT19TQU1TVU5HX1M1UF9HMkQ9bgorCWRlcGVuZHMgb24gVklERU9fU0FNU1VOR19TNVBfRzJE
PW4gfHwgQ09NUElMRV9URVNUCiAJc2VsZWN0IEZSQU1FX1ZFQ1RPUgogCWhlbHAKIAkgIENob29z
ZSB0aGlzIG9wdGlvbiBpZiB5b3Ugd2FudCB0byB1c2UgRXh5bm9zIEcyRCBmb3IgRFJNLgpAQCAt
MTE0LDcgKzExNCw3IEBAIGNvbmZpZyBEUk1fRVhZTk9TX1NDQUxFUgogCiBjb25maWcgRFJNX0VY
WU5PU19HU0MKIAlib29sICJHU2NhbGVyIgotCWRlcGVuZHMgb24gVklERU9fU0FNU1VOR19FWFlO
T1NfR1NDPW4KKwlkZXBlbmRzIG9uIFZJREVPX1NBTVNVTkdfRVhZTk9TX0dTQz1uIHx8IENPTVBJ
TEVfVEVTVAogCXNlbGVjdCBEUk1fRVhZTk9TX0lQUAogCWhlbHAKIAkgIENob29zZSB0aGlzIG9w
dGlvbiBpZiB5b3Ugd2FudCB0byB1c2UgRXh5bm9zIEdTQyBmb3IgRFJNLgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
