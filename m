Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D6FF934
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0326E438;
	Sun, 17 Nov 2019 11:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9180A6E1F7
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0D5E428F7A9
Received: by earth.universe (Postfix, from userid 1000)
 id E9A943C0C9E; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 18/42] drm/omap: dsi: drop unused get_te()
Date: Sun, 17 Nov 2019 03:40:04 +0100
Message-Id: <20191117024028.2233-19-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxh
Ym9yYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNp
LWNtLmMgfCAxMyAtLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21h
cGRzcy5oICAgICAgICAgICB8ICAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNp
LWNtLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpp
bmRleCBlMzA5YTU1NmM3MDAuLmIyZWI4MzRjOWVmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMKQEAgLTkxOSwxOCArOTE5LDYgQEAgc3Rh
dGljIGludCBkc2ljbV9lbmFibGVfdGUoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2LCBi
b29sIGVuYWJsZSkKIAlyZXR1cm4gcjsKIH0KIAotc3RhdGljIGludCBkc2ljbV9nZXRfdGUoc3Ry
dWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2KQotewotCXN0cnVjdCBwYW5lbF9kcnZfZGF0YSAq
ZGRhdGEgPSB0b19wYW5lbF9kYXRhKGRzc2Rldik7Ci0JaW50IHI7Ci0KLQltdXRleF9sb2NrKCZk
ZGF0YS0+bG9jayk7Ci0JciA9IGRkYXRhLT50ZV9lbmFibGVkOwotCW11dGV4X3VubG9jaygmZGRh
dGEtPmxvY2spOwotCi0JcmV0dXJuIHI7Ci19Ci0KIHN0YXRpYyB2b2lkIGRzaWNtX3VscHNfd29y
ayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB7CiAJc3RydWN0IHBhbmVsX2Rydl9kYXRhICpk
ZGF0YSA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgcGFuZWxfZHJ2X2RhdGEsCkBAIC0xMDAy
LDcgKzk5MCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb21hcF9kc3NfZHJpdmVyIGRzaWNtX2Rz
c19kcml2ZXIgPSB7CiAJLnN5bmMJCT0gZHNpY21fc3luYywKIAogCS5lbmFibGVfdGUJPSBkc2lj
bV9lbmFibGVfdGUsCi0JLmdldF90ZQkJPSBkc2ljbV9nZXRfdGUsCiB9OwogCiBzdGF0aWMgaW50
IGRzaWNtX3Byb2JlX29mKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSkKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmggYi9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3Mvb21hcGRzcy5oCmluZGV4IDc0MjA4OGI4ZjU3MC4uOWJlMWM2NTlkM2E0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKQEAgLTQxMiw3ICs0MTIsNiBAQCBz
dHJ1Y3Qgb21hcF9kc3NfZHJpdmVyIHsKIAlpbnQgKCpzeW5jKShzdHJ1Y3Qgb21hcF9kc3NfZGV2
aWNlICpkc3NkZXYpOwogCiAJaW50ICgqZW5hYmxlX3RlKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNl
ICpkc3NkZXYsIGJvb2wgZW5hYmxlKTsKLQlpbnQgKCpnZXRfdGUpKHN0cnVjdCBvbWFwX2Rzc19k
ZXZpY2UgKmRzc2Rldik7CiB9OwogCiBzdHJ1Y3QgZHNzX2RldmljZSAqb21hcGRzc19nZXRfZHNz
KHZvaWQpOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
