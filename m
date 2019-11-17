Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8362FF900
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6E6E2E8;
	Sun, 17 Nov 2019 11:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583516E1F1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 3509D28FA26
Received: by earth.universe (Postfix, from userid 1000)
 id 4EA763C0CAF; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 35/42] drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
Date: Sun, 17 Nov 2019 03:40:21 +0100
Message-Id: <20191117024028.2233-36-sebastian.reichel@collabora.com>
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

VXNlIERFVklDRV9BVFRSX1JPIGhlbHBlciBpbnN0ZWFkIG9mIHBsYWluIERFVklDRV9BVFRSLAp3
aGljaCBtYWtlcyB0aGUgY29kZSBhIGJpdCBzaG9ydGVyIGFuZCBlYXNpZXIgdG8gcmVhZC4KClNp
Z25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJv
cmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1j
bS5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9w
YW5lbC1kc2ktY20uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRz
aS1jbS5jCmluZGV4IDg0YjBlNzljMDI1ZS4uMDE0OGY0MGVjZWIyIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtMjE5LDcgKzIxOSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBkc2ljbV9ibF9vcHMgPSB7CiAJ
LnVwZGF0ZV9zdGF0dXMgID0gZHNpY21fYmxfdXBkYXRlX3N0YXR1cywKIH07CiAKLXN0YXRpYyBz
c2l6ZV90IGRzaWNtX251bV9lcnJvcnNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCitzdGF0aWMg
c3NpemVfdCBudW1fZHNpX2Vycm9yc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJc3RydWN0
IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKIHsKIAlzdHJ1Y3QgcGFuZWxfZHJ2
X2RhdGEgKmRkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CkBAIC0yMzksNyArMjM5LDcgQEAg
c3RhdGljIHNzaXplX3QgZHNpY21fbnVtX2Vycm9yc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwK
IAlyZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlZFxuIiwgZXJyb3JzKTsKIH0KIAot
c3RhdGljIHNzaXplX3QgZHNpY21faHdfcmV2aXNpb25fc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
CitzdGF0aWMgc3NpemVfdCBod19yZXZpc2lvbl9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJ
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKIHsKIAlzdHJ1Y3QgcGFu
ZWxfZHJ2X2RhdGEgKmRkYXRhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CkBAIC0yNTksOCArMjU5
LDggQEAgc3RhdGljIHNzaXplX3QgZHNpY21faHdfcmV2aXNpb25fc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsCiAJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJTAyeC4lMDJ4LiUwMnhc
biIsIGlkMSwgaWQyLCBpZDMpOwogfQogCi1zdGF0aWMgREVWSUNFX0FUVFIobnVtX2RzaV9lcnJv
cnMsIFNfSVJVR08sIGRzaWNtX251bV9lcnJvcnNfc2hvdywgTlVMTCk7Ci1zdGF0aWMgREVWSUNF
X0FUVFIoaHdfcmV2aXNpb24sIFNfSVJVR08sIGRzaWNtX2h3X3JldmlzaW9uX3Nob3csIE5VTEwp
Oworc3RhdGljIERFVklDRV9BVFRSX1JPKG51bV9kc2lfZXJyb3JzKTsKK3N0YXRpYyBERVZJQ0Vf
QVRUUl9STyhod19yZXZpc2lvbik7CiAKIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpkc2ljbV9h
dHRyc1tdID0gewogCSZkZXZfYXR0cl9udW1fZHNpX2Vycm9ycy5hdHRyLAotLSAKMi4yNC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
