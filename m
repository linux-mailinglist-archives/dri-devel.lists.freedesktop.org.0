Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191456414
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4E6E2E4;
	Wed, 26 Jun 2019 08:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4676E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:46:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 90928260A37
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: 
Subject: [PATCH 1/2] drm: Include ddc adapter pointer in struct drm_connector
Date: Tue, 25 Jun 2019 11:46:35 +0200
Message-Id: <04382593e44ac3f69cd63adfe0dd0660dc32a722.1561452052.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGdlbmVyaWMgY29kZSB3aGljaCBjcmVhdGVzIHN5bWJvbGljIGxpbmtzIGluIHN5c2ZzLCBw
b2ludGluZyB0byBkZGMKaW50ZXJmYWNlIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIHZpZGVvIG91dHB1
dC4gRm9yIGV4YW1wbGU6CgpscyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9pMmMt
Mgpscnd4cnd4cnd4IDEgcm9vdCByb290IDAgSnVuIDI0IDEwOjQyIC9zeXMvY2xhc3MvZHJtL2Nh
cmQwLUhETUktQS0xL2kyYy0yIFwKCS0+IC4uLy4uLy4uLy4uL3NvYy8xMzg4MDAwMC5pMmMvaTJj
LTIKClRoaXMgbWFrZXMgaXQgZWFzeSBmb3IgdXNlciB0byBhc3NvY2lhdGUgYSBkaXNwbGF5IHdp
dGggaXRzIGRkYyBhZGFwdGVyCmFuZCB1c2UgZS5nLiBkZGN1dGlsIHRvIGNvbnRyb2wgdGhlIGNo
b3NlbiBtb25pdG9yLgoKVGhpcyBwYXRjaCBhZGRzIGFuIGkyY19hZGFwdGVyIHBvaW50ZXIgdG8g
c3RydWN0IGRybV9jb25uZWN0b3IuIFBhcnRpY3VsYXIKZHJpdmVycyBjYW4gdGhlbiB1c2UgaXQg
aW5zdGVhZCBvZiB1c2luZyB0aGVpciBvd24gcHJpdmF0ZSBpbnN0YW5jZS4gSWYgYQpjb25uZWN0
b3IgY29udGFpbnMgYSBkZGMsIHRoZW4gY3JlYXRlIGEgc3ltYm9saWMgbGluayBpbiBzeXNmcy4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9y
YS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jIHwgIDkgKysrKysrKysrCiBp
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAxMSArKysrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCmluZGV4IGFkMTA4MTBiYzk3Mi4u
NjI3ZjhlYmZjODdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCkBAIC0yOTQsNiArMjk0LDEwIEBAIGludCBk
cm1fc3lzZnNfY29ubmVjdG9yX2FkZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQog
CS8qIExldCB1c2Vyc3BhY2Uga25vdyB3ZSBoYXZlIGEgbmV3IGNvbm5lY3RvciAqLwogCWRybV9z
eXNmc19ob3RwbHVnX2V2ZW50KGRldik7CiAKKwlpZiAoY29ubmVjdG9yLT5kZGMpCisJCXJldHVy
biBzeXNmc19jcmVhdGVfbGluaygmY29ubmVjdG9yLT5rZGV2LT5rb2JqLAorCQkJCSAmY29ubmVj
dG9yLT5kZGMtPmRldi5rb2JqLAorCQkJCSBjb25uZWN0b3ItPmRkYy0+ZGV2LmtvYmoubmFtZSk7
CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTMwMSw2ICszMDUsMTEgQEAgdm9pZCBkcm1fc3lzZnNfY29u
bmVjdG9yX3JlbW92ZShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCWlmICgh
Y29ubmVjdG9yLT5rZGV2KQogCQlyZXR1cm47CisKKwlpZiAoY29ubmVjdG9yLT5kZGMpCisJCXN5
c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3ItPmtkZXYtPmtvYmosCisJCQkJICBjb25uZWN0b3It
PmRkYy0+ZGV2LmtvYmoubmFtZSk7CisKIAlEUk1fREVCVUcoInJlbW92aW5nIFwiJXNcIiBmcm9t
IHN5c2ZzXG4iLAogCQkgIGNvbm5lY3Rvci0+bmFtZSk7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAppbmRleCBj
YTc0NWQ5ZmVhZjUuLjFhZDNkMWQ1NGJhNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaApAQCAtMjMsNiArMjMs
NyBAQAogI2lmbmRlZiBfX0RSTV9DT05ORUNUT1JfSF9fCiAjZGVmaW5lIF9fRFJNX0NPTk5FQ1RP
Ul9IX18KIAorI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4K
ICNpbmNsdWRlIDxsaW51eC9sbGlzdC5oPgogI2luY2x1ZGUgPGxpbnV4L2N0eXBlLmg+CkBAIC0x
MzA4LDYgKzEzMDksMTYgQEAgc3RydWN0IGRybV9jb25uZWN0b3IgewogCSAqIFswXTogcHJvZ3Jl
c3NpdmUsIFsxXTogaW50ZXJsYWNlZAogCSAqLwogCWludCBhdWRpb19sYXRlbmN5WzJdOworCisJ
LyoqCisJICogQGRkYzogYXNzb2NpYXRlZCBkZGMgYWRhcHRlci4KKwkgKiBBIGNvbm5lY3RvciB1
c3VhbGx5IGhhcyBpdHMgYXNzb2NpYXRlZCBkZGMgYWRhcHRlci4gSWYgYSBkcml2ZXIgdXNlcwor
CSAqIHRoaXMgZmllbGQsIHRoZW4gYW4gYXBwcm9wcmlhdGUgc3ltYm9saWMgbGluayBpcyBjcmVh
dGVkIGluIGNvbm5lY3RvcgorCSAqIHN5c2ZzIGRpcmVjdG9yeSB0byBtYWtlIGl0IGVhc3kgZm9y
IHRoZSB1c2VyIHRvIHRlbGwgd2hpY2ggaTJjCisJICogYWRhcHRlciBpcyBmb3IgYSBwYXJ0aWN1
bGFyIGRpc3BsYXkuCisJICovCisJc3RydWN0IGkyY19hZGFwdGVyICpkZGM7CisKIAkvKioKIAkg
KiBAbnVsbF9lZGlkX2NvdW50ZXI6IHRyYWNrIHNpbmtzIHRoYXQgZ2l2ZSB1cyBhbGwgemVyb3Mg
Zm9yIHRoZSBFRElELgogCSAqIE5lZWRlZCB0byB3b3JrYXJvdW5kIHNvbWUgSFcgYnVncyB3aGVy
ZSB3ZSBnZXQgYWxsIDBzCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
