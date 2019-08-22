Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B286E98F77
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D696EAE7;
	Thu, 22 Aug 2019 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AFE6EAE7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:36:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB49F309175F;
 Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE522600CD;
 Thu, 22 Aug 2019 09:36:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A3757F; Thu, 22 Aug 2019 11:36:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] udmabuf: add documentation
Date: Thu, 22 Aug 2019 11:36:52 +0200
Message-Id: <20190822093654.23752-2-kraxel@redhat.com>
In-Reply-To: <20190822093654.23752-1-kraxel@redhat.com>
References: <20190822093654.23752-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 22 Aug 2019 09:36:58 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 laurent.pinchart@ideasonboard.com,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5j
bHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaCAgICAgICAgIHwgNTIgKysrKysrKysrKysrKysrKysr
KysrKysrKystLQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0IHwgIDggKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdWRtYWJ1Zi5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L3VkbWFidWYuaAppbmRleCA0NmI2NTMyZWQ4NTUuLjlmZTQ0MGFiZjJmOSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
dWRtYWJ1Zi5oCkBAIC01LDggKzUsMzkgQEAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2lvY3RsLmg+CiAKKy8qKgorICogRE9DOiB1ZG1hYnVmCisgKgorICogdWRt
YWJ1ZiBpcyBhIGRldmljZSBkcml2ZXIgd2hpY2ggYWxsb3dzIHVzZXJzcGFjZSB0byBjcmVhdGUK
KyAqIGRtYWJ1ZnMuICBUaGUgbWVtb3J5IHVzZWQgZm9yIHRoZXNlIGRtYWJ1ZnMgbXVzdCBiZSBi
YWNrZWQgYnkKKyAqIG1lbWZkLiAgVGhlIG1lbWZkIG11c3QgaGF2ZSBGX1NFQUxfU0hSSU5LIGFu
ZCBpdCBtdXN0IG5vdCBoYXZlCisgKiBGX1NFQUxfV1JJVEUuCisgKgorICogVGhlIGRyaXZlciBo
YXMgdHdvIGlvY3Rscywgb25lIHRvIGNyZWF0ZSBhIGRtYWJ1ZiBmcm9tIGEgc2luZ2xlCisgKiBt
ZW1vcnkgYmxvY2sgYW5kIG9uZSB0byBjcmVhdGUgYSBkbWFidWYgZnJvbSBhIGxpc3Qgb2YgbWVt
b3J5CisgKiBibG9ja3MuCisgKgorICogVURNQUJVRl9DUkVBVEUgLSBfSU9XKCd1JywgMHg0Miwg
dWRtYWJ1Zl9jcmVhdGUpCisgKgorICogVURNQUJVRl9DUkVBVEVfTElTVCAtIF9JT1coJ3UnLCAw
eDQzLCB1ZG1hYnVmX2NyZWF0ZV9saXN0KQorICovCisKKyNkZWZpbmUgVURNQUJVRl9DUkVBVEUg
ICAgICAgX0lPVygndScsIDB4NDIsIHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZSkKKyNkZWZpbmUgVURN
QUJVRl9DUkVBVEVfTElTVCAgX0lPVygndScsIDB4NDMsIHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9s
aXN0KQorCiAjZGVmaW5lIFVETUFCVUZfRkxBR1NfQ0xPRVhFQwkweDAxCiAKKy8qKgorICogc3Ry
dWN0IHVkbWFidWZfY3JlYXRlIC0gY3JlYXRlIGEgZG1hYnVmIGZyb20gYSBzaW5nbGUgbWVtb3J5
IGJsb2NrLgorICoKKyAqIEBtZW1mZDogVGhlIGZpbGUgaGFuZGxlLgorICogQG9mZnNldDogU3Rh
cnQgb2YgdGhlIGJ1ZmZlciAoZnJvbSBtZW1mZCBzdGFydCkuCisgKiBNdXN0IGJlIHBhZ2UgYWxp
Z25lZC4KKyAqIEBzaXplOiBTaXplIG9mIHRoZSBidWZmZXIuICBNdXN0IGJlIHJvdW5kZWQgdG8g
cGFnZSBzaXplLgorICoKKyAqIEBmbGFnczoKKyAqIFVETUFCVUZfRkxBR1NfQ0xPRVhFQzogc2V0
IENMT0VYRUMgZmxhZyBmb3IgdGhlIGRtYWJ1Zi4KKyAqLwogc3RydWN0IHVkbWFidWZfY3JlYXRl
IHsKIAlfX3UzMiBtZW1mZDsKIAlfX3UzMiBmbGFnczsKQEAgLTE0LDYgKzQ1LDE1IEBAIHN0cnVj
dCB1ZG1hYnVmX2NyZWF0ZSB7CiAJX191NjQgc2l6ZTsKIH07CiAKKy8qKgorICogc3RydWN0IHVk
bWFidWZfY3JlYXRlX2l0ZW0gLSBvbmUgbWVtb3J5IGJsb2NrIGxpc3QgaXRlbS4KKyAqCisgKiBA
bWVtZmQ6IFRoZSBmaWxlIGhhbmRsZS4KKyAqIEBfX3BhZDogUGFkZGluZyBmaWVsZCAodW51c2Vk
KS4KKyAqIEBvZmZzZXQ6IFN0YXJ0IG9mIHRoZSBidWZmZXIgKGZyb20gbWVtZmQgc3RhcnQpLgor
ICogTXVzdCBiZSBwYWdlIGFsaWduZWQuCisgKiBAc2l6ZTogU2l6ZSBvZiB0aGUgYnVmZmVyLiAg
TXVzdCBiZSByb3VuZGVkIHRvIHBhZ2Ugc2l6ZS4KKyAqLwogc3RydWN0IHVkbWFidWZfY3JlYXRl
X2l0ZW0gewogCV9fdTMyIG1lbWZkOwogCV9fdTMyIF9fcGFkOwpAQCAtMjEsMTMgKzYxLDE5IEBA
IHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9pdGVtIHsKIAlfX3U2NCBzaXplOwogfTsKIAorLyoqCisg
KiBzdHJ1Y3QgdWRtYWJ1Zl9jcmVhdGVfbGlzdCAtIGNyZWF0ZSBhIGRtYWJ1ZiBmcm9tIGEgbWVt
b3J5IGJsb2NrIGxpc3QuCisgKgorICogQGNvdW50OiBUaGUgbnVtYmVyIG9mIGxpc3QgZWxlbWVu
dHMuCisgKiBAbGlzdDogVGhlIG1lbW9yeSBibG9jayBsaXN0CisgKgorICogQGZsYWdzOgorICog
VURNQUJVRl9GTEFHU19DTE9FWEVDOiBzZXQgQ0xPRVhFQyBmbGFnIGZvciB0aGUgZG1hYnVmLgor
ICovCiBzdHJ1Y3QgdWRtYWJ1Zl9jcmVhdGVfbGlzdCB7CiAJX191MzIgZmxhZ3M7CiAJX191MzIg
Y291bnQ7CiAJc3RydWN0IHVkbWFidWZfY3JlYXRlX2l0ZW0gbGlzdFtdOwogfTsKIAotI2RlZmlu
ZSBVRE1BQlVGX0NSRUFURSAgICAgICBfSU9XKCd1JywgMHg0Miwgc3RydWN0IHVkbWFidWZfY3Jl
YXRlKQotI2RlZmluZSBVRE1BQlVGX0NSRUFURV9MSVNUICBfSU9XKCd1JywgMHg0Mywgc3RydWN0
IHVkbWFidWZfY3JlYXRlX2xpc3QpCi0KICNlbmRpZiAvKiBfVUFQSV9MSU5VWF9VRE1BQlVGX0gg
Ki8KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCBiL0Rv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAppbmRleCBiNTQxZTk3YzdhYjEuLjFm
NjJjMzBhMTRiMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdApAQCAtMTY2LDMg
KzE2NiwxMSBAQCBETUEgRmVuY2UgdUFCSS9TeW5jIEZpbGUKIC4uIGtlcm5lbC1kb2M6OiBpbmNs
dWRlL2xpbnV4L3N5bmNfZmlsZS5oCiAgICA6aW50ZXJuYWw6CiAKK1VzZXJzcGFjZSBETUEgQnVm
ZmVyIGRyaXZlcgorfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CisKKy4uIGtlcm5lbC1kb2M6
OiBpbmNsdWRlL3VhcGkvbGludXgvdWRtYWJ1Zi5oCisgICA6ZG9jOiB1ZG1hYnVmCisKKy4uIGtl
cm5lbC1kb2M6OiBpbmNsdWRlL3VhcGkvbGludXgvdWRtYWJ1Zi5oCisgICA6aW50ZXJuYWw6Ci0t
IAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
