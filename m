Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3263A038
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 16:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEEA8925B;
	Sat,  8 Jun 2019 14:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B39A89257
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81F0D2DF;
 Sat,  8 Jun 2019 16:13:00 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] devicetree/bindings: display: Merge panel.txt with
 panel-common.txt
Date: Sat,  8 Jun 2019 17:12:42 +0300
Message-Id: <20190608141242.17461-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560003180;
 bh=q3AoJtKW6mKKwOs5V2KUrfDna5Ms9L6OvZfRKU9cFLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pe74f6HjgZpSd4EgbH3m77D73Ao3LMktH4EbvP301fanSeC7ZfFuonM+kl2HVIyIG
 8au1nHJLnKVB2eSiZxpyyHoXkqe0YKUtvoiwQzrMrw3KFFUCyAizWhjGUeaFvHcG5u
 Ipu0dTm0XjMr7SDpxBUzPi+UxUVvpWxXjMWwKPjw=
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
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHR3byBmaWxlcyB3ZXJlIGFkZGVkIGNvbmN1cnJlbnRseSBhbmQgYm90aCBzdG9yZSBjb21t
b24gcGFuZWwKcHJvcGVydGllcy4gTWVyZ2UgdGhlbSB0b2dldGhlci4KClN1Z2dlc3RlZC1ieTog
RW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29t
PgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9u
LnR4dCAgICAgIHwgNiArKysrKysKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BhbmVsLnR4dCAgIHwgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5l
bC1jb21tb24udHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcGFuZWwtY29tbW9uLnR4dAppbmRleCA1ZDI1MTlhZjRiYjUuLmNkOWQ5NDE4OWQ0MyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcGFuZWwtY29tbW9uLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21tb24udHh0CkBAIC0xOCw2ICsxOCwxMiBAQCBEZXNj
cmlwdGl2ZSBQcm9wZXJ0aWVzCiAgIHBoeXNpY2FsIGFyZWEgd2hlcmUgaW1hZ2VzIGFyZSBkaXNw
bGF5ZWQuIFRoZXNlIHByb3BlcnRpZXMgYXJlIGV4cHJlc3NlZCBpbgogICBtaWxsaW1ldGVycyBh
bmQgcm91bmRlZCB0byB0aGUgY2xvc2VzdCB1bml0LgogCistIHJvdGF0aW9uOiBQYW5lbHMgYXJl
IGNvbW1vbmx5IG1vdW50ZWQgcm90YXRlZCwgd2l0aCB0aGVpciBuYXRpdmUgb3JpZW50YXRpb24K
KyAgbm90IGFsaWduZWQgd2l0aCB0aGUgZGV2aWNlJ3Mgb3JpZW50YXRpb24uIFRoZSByb3RhdGlv
biBwcm9wZXJ0eSBzcGVjaWZpZXMKKyAgdGhlIGFuZ2xlIGluIGRlZ3JlZXMgYmV0d2VlbiB0aGUg
cGFuZWwncyBvcmllbnRhdGlvbiBhbmQgdGhlIGRldmljZSdzCisgIG9yaWVudGF0aW9uIChjb3Jy
ZXNwb25kaW5nIHRvIGEgY291bnRlci1jbG9ja3dpc2Ugcm90YXRpb24gb2YgdGhlIHBhbmVsKS4K
KyAgVmFsaWQgdmFsdWVzIGFyZSAgMCwgOTAsIDE4MCBhbmQgMjcwLgorCiAtIGxhYmVsOiBUaGUg
bGFiZWwgcHJvcGVydHkgc3BlY2lmaWVzIGEgc3ltYm9saWMgbmFtZSBmb3IgdGhlIHBhbmVsIGFz
IGEKICAgc3RyaW5nIHN1aXRhYmxlIGZvciB1c2UgYnkgaHVtYW5zLiBJdCB0eXBpY2FsbHkgY29u
dGFpbnMgYSBuYW1lIGluc2NyaWJlZCBvbgogICB0aGUgc3lzdGVtIChlLmcuIGFzIGFuIGFmZml4
ZWQgbGFiZWwpIG9yIHNwZWNpZmllZCBpbiB0aGUgc3lzdGVtJ3MKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTJlNjg2Nzg1MmI4Li4wMDAwMDAwMDAwMDAK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFu
ZWwudHh0CisrKyAvZGV2L251bGwKQEAgLTEsNCArMCwwIEBACi1Db21tb24gZGlzcGxheSBwcm9w
ZXJ0aWVzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0KLS0gcm90YXRpb246CURpc3BsYXkg
cm90YXRpb24gaW4gZGVncmVlcyBjb3VudGVyIGNsb2Nrd2lzZSAoMCw5MCwxODAsMjcwKQotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
