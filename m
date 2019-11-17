Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA6FF91B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9E46E348;
	Sun, 17 Nov 2019 11:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A3B6E1D8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id E9C0F28F740
Received: by earth.universe (Postfix, from userid 1000)
 id 8A9F93C0C77; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 01/42] omap/drm: drop unused dsi.configure_pins
Date: Sun, 17 Nov 2019 03:39:47 +0100
Message-Id: <20191117024028.2233-2-sebastian.reichel@collabora.com>
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

VGhlIHBhbmVsLWRzaS1jbSdzIGRkYXRhLT5waW5fY29uZmlnIGlzIGFsd2F5cyBOVUxMLCBzbyB0
aGlzCmNhbGxiYWNrIGlzIG5ldmVyIGNhbGxlZC4gSW5zdGVhZCB0aGUgRFNJIGVuY29kZXIgZ2V0
cyB0aGUgcGluCmNvbmZpZ3VyYXRpb24gZGlyZWN0bHkgZnJvbSBEVC4KClNpZ25lZC1vZmYtYnk6
IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jIHwgMTEgLS0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYyAgICAgICAgICAgICAg
IHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL29tYXBkc3MuaCAgICAgICAgICAg
fCAgMiAtLQogMyBmaWxlcyBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyBiL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCmluZGV4IDU2NGUzZTFhMTg5
MS4uYzNkZGY5OGY0ZWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNw
bGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5
cy9wYW5lbC1kc2ktY20uYwpAQCAtNjgsOCArNjgsNiBAQCBzdHJ1Y3QgcGFuZWxfZHJ2X2RhdGEg
ewogCWludCB3aWR0aF9tbTsKIAlpbnQgaGVpZ2h0X21tOwogCi0Jc3RydWN0IG9tYXBfZHNpX3Bp
bl9jb25maWcgcGluX2NvbmZpZzsKLQogCS8qIHJ1bnRpbWUgdmFyaWFibGVzICovCiAJYm9vbCBl
bmFibGVkOwogCkBAIC02MjMsMTUgKzYyMSw2IEBAIHN0YXRpYyBpbnQgZHNpY21fcG93ZXJfb24o
c3RydWN0IHBhbmVsX2Rydl9kYXRhICpkZGF0YSkKIAkJfQogCX0KIAotCWlmIChkZGF0YS0+cGlu
X2NvbmZpZy5udW1fcGlucyA+IDApIHsKLQkJciA9IHNyYy0+b3BzLT5kc2kuY29uZmlndXJlX3Bp
bnMoc3JjLCAmZGRhdGEtPnBpbl9jb25maWcpOwotCQlpZiAocikgewotCQkJZGV2X2VycigmZGRh
dGEtPnBkZXYtPmRldiwKLQkJCQkiZmFpbGVkIHRvIGNvbmZpZ3VyZSBEU0kgcGluc1xuIik7Ci0J
CQlnb3RvIGVycl92ZGRpOwotCQl9Ci0JfQotCiAJciA9IHNyYy0+b3BzLT5kc2kuc2V0X2NvbmZp
ZyhzcmMsICZkc2lfY29uZmlnKTsKIAlpZiAocikgewogCQlkZXZfZXJyKCZkZGF0YS0+cGRldi0+
ZGV2LCAiZmFpbGVkIHRvIGNvbmZpZ3VyZSBEU0lcbiIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rz
aS5jCmluZGV4IGRhMTZlYTA5NWYxMy4uOGUzNjY0MzY4YzRmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2RzaS5jCkBAIC00ODkyLDcgKzQ4OTIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9tYXBf
ZHNzX2RldmljZV9vcHMgZHNpX29wcyA9IHsKIAogCQkuZW5hYmxlX2hzID0gZHNpX3ZjX2VuYWJs
ZV9ocywKIAotCQkuY29uZmlndXJlX3BpbnMgPSBkc2lfY29uZmlndXJlX3BpbnMsCiAJCS5zZXRf
Y29uZmlnID0gZHNpX3NldF9jb25maWcsCiAKIAkJLmVuYWJsZV92aWRlb19vdXRwdXQgPSBkc2lf
ZW5hYmxlX3ZpZGVvX291dHB1dCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9vbWFwZHNzLmggYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCmlu
ZGV4IDc5ZjZiMTk1YzdjZi4uNzVlNTA2Yjg4NzMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rz
cy9vbWFwZHNzLmgKQEAgLTI5OSw4ICsyOTksNiBAQCBzdHJ1Y3Qgb21hcGRzc19kc2lfb3BzIHsK
IAkvKiBidXMgY29uZmlndXJhdGlvbiAqLwogCWludCAoKnNldF9jb25maWcpKHN0cnVjdCBvbWFw
X2Rzc19kZXZpY2UgKmRzc2RldiwKIAkJCWNvbnN0IHN0cnVjdCBvbWFwX2Rzc19kc2lfY29uZmln
ICpjZmcpOwotCWludCAoKmNvbmZpZ3VyZV9waW5zKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpk
c3NkZXYsCi0JCQljb25zdCBzdHJ1Y3Qgb21hcF9kc2lfcGluX2NvbmZpZyAqcGluX2NmZyk7CiAK
IAl2b2lkICgqZW5hYmxlX2hzKShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYsIGludCBj
aGFubmVsLAogCQkJYm9vbCBlbmFibGUpOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
