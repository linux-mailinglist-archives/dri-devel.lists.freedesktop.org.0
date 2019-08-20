Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB69533C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1052D6E5A9;
	Tue, 20 Aug 2019 01:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8C26E520
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:18:01 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 135CCB83;
 Tue, 20 Aug 2019 03:17:54 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 32/50] drm/omap: dss: Remove .set_hdmi_mode() and
 .set_infoframe() operations
Date: Tue, 20 Aug 2019 04:17:03 +0300
Message-Id: <20190820011721.30136-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263874;
 bh=RhTlrthgKcmG8eLd0/ODM61sscMM+jpp1kgFZ84bI7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uoPAu9ltO2Qbjh5L87YZ0ckoAF/B57gWUaiRNEz1HfpfJ5myfwWel1HJmBmaIUnRm
 s7tWc9v9tbfzd3BPQtbaClvN/IEoWZzVrPNU1g0td279S7qX9r/OJY9DhdGT1uJLu3
 /eSQQwqaWFVSp6D4+rtq4QC1YbnI8nxHo1oAudR4=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9tYXBkc3NfaGRtaV9vcHMgLnNldF9oZG1pX21vZGUoKSBhbmQgLnNldF9pbmZvZnJhbWUo
KSBvcGVyYXRpb25zCm9wZXJhdGlvbnMgYXJlIG5vdCB1c2VkIGFueW1vcmUsIHJlbW92ZSB0aGVt
LgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgg
IHwgIDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2VuY29kZXIuYyB8IDI2IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmggYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5oCmluZGV4IDI2OWUxNDNkNTdiZS4u
MzBhMTJjZjkxY2JiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21h
cGRzcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKQEAgLTI4
Nyw5ICsyODcsNiBAQCBzdHJ1Y3Qgb21hcF9kc3Nfd3JpdGViYWNrX2luZm8gewogCiBzdHJ1Y3Qg
b21hcGRzc19oZG1pX29wcyB7CiAJdm9pZCAoKmxvc3RfaG90cGx1Zykoc3RydWN0IG9tYXBfZHNz
X2RldmljZSAqZHNzZGV2KTsKLQlpbnQgKCpzZXRfaGRtaV9tb2RlKShzdHJ1Y3Qgb21hcF9kc3Nf
ZGV2aWNlICpkc3NkZXYsIGJvb2wgaGRtaV9tb2RlKTsKLQlpbnQgKCpzZXRfaW5mb2ZyYW1lKShz
dHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYsCi0JCWNvbnN0IHN0cnVjdCBoZG1pX2F2aV9p
bmZvZnJhbWUgKmF2aSk7CiB9OwogCiBzdHJ1Y3Qgb21hcGRzc19kc2lfb3BzIHsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9lbmNvZGVyLmMKaW5kZXggYmQ4N2MyOGY5MDQ2Li4xNTQ1ZDMwZjI2
ZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZW5jb2Rlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZW5jb2Rlci5jCkBAIC02OCwyOCArNjgs
NiBAQCBzdGF0aWMgdm9pZCBvbWFwX2VuY29kZXJfdXBkYXRlX3ZpZGVvbW9kZV9mbGFncyhzdHJ1
Y3QgdmlkZW9tb2RlICp2bSwKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIG9tYXBfZW5jb2Rlcl9oZG1p
X21vZGVfc2V0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCi0JCQkJICAgICAgIHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKLQkJCQkgICAgICAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKmFkanVzdGVkX21vZGUpCi17Ci0Jc3RydWN0IG9tYXBfZW5jb2RlciAqb21hcF9lbmNv
ZGVyID0gdG9fb21hcF9lbmNvZGVyKGVuY29kZXIpOwotCXN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ug
KmRzc2RldiA9IG9tYXBfZW5jb2Rlci0+b3V0cHV0OwotCWJvb2wgaGRtaV9tb2RlID0gY29ubmVj
dG9yLT5kaXNwbGF5X2luZm8uaXNfaGRtaTsKLQotCWlmIChkc3NkZXYtPm9wcyAmJiBkc3NkZXYt
Pm9wcy0+aGRtaS5zZXRfaGRtaV9tb2RlKQotCQlkc3NkZXYtPm9wcy0+aGRtaS5zZXRfaGRtaV9t
b2RlKGRzc2RldiwgaGRtaV9tb2RlKTsKLQotCWlmIChoZG1pX21vZGUgJiYgZHNzZGV2LT5vcHMg
JiYgZHNzZGV2LT5vcHMtPmhkbWkuc2V0X2luZm9mcmFtZSkgewotCQlzdHJ1Y3QgaGRtaV9hdmlf
aW5mb2ZyYW1lIGF2aTsKLQkJaW50IHI7Ci0KLQkJciA9IGRybV9oZG1pX2F2aV9pbmZvZnJhbWVf
ZnJvbV9kaXNwbGF5X21vZGUoJmF2aSwgY29ubmVjdG9yLAotCQkJCQkJCSAgICAgYWRqdXN0ZWRf
bW9kZSk7Ci0JCWlmIChyID09IDApCi0JCQlkc3NkZXYtPm9wcy0+aGRtaS5zZXRfaW5mb2ZyYW1l
KGRzc2RldiwgJmF2aSk7Ci0JfQotfQotCiBzdGF0aWMgdm9pZCBvbWFwX2VuY29kZXJfbW9kZV9z
ZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAogCQkJCSAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUsCiAJCQkJICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9k
ZSkKQEAgLTE0MCwxMCArMTE4LDYgQEAgc3RhdGljIHZvaWQgb21hcF9lbmNvZGVyX21vZGVfc2V0
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKIAkJaWYgKGRzc2Rldi0+b3BzICYmIGRzc2Rl
di0+b3BzLT5zZXRfdGltaW5ncykKIAkJCWRzc2Rldi0+b3BzLT5zZXRfdGltaW5ncyhkc3NkZXYs
IGFkanVzdGVkX21vZGUpOwogCX0KLQotCS8qIFNldCB0aGUgSERNSSBtb2RlIGFuZCBIRE1JIGlu
Zm9mcmFtZSBpZiBhcHBsaWNhYmxlLiAqLwotCWlmIChvdXRwdXQtPnR5cGUgPT0gT01BUF9ESVNQ
TEFZX1RZUEVfSERNSSkKLQkJb21hcF9lbmNvZGVyX2hkbWlfbW9kZV9zZXQoY29ubmVjdG9yLCBl
bmNvZGVyLCBhZGp1c3RlZF9tb2RlKTsKIH0KIAogc3RhdGljIHZvaWQgb21hcF9lbmNvZGVyX2Rp
c2FibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
