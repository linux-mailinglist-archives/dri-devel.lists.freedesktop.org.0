Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D463C45C64
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC55897F5;
	Fri, 14 Jun 2019 12:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0D48979F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:14:02 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 672CDE000C;
 Fri, 14 Jun 2019 12:13:59 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 12/12] drm/vc4: hdmi: Set default state margin at reset
Date: Fri, 14 Jun 2019 14:13:19 +0200
Message-Id: <a8f01d3653f3ed4166a4d88dcc5d6e905fa2e602.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIFRWIG1hcmdpbnMgYXJlIHByb3Blcmx5IHBhcnNlZCBhbmQgZmlsbGVkIGlu
dG8KZHJtX2NtZGxpbmVfbW9kZSwgd2UganVzdCBuZWVkIHRvIGluaXRpYWxpc2UgdGhlIGZpcnN0
IHN0YXRlIGF0IHJlc2V0IHRvCmdldCB0aG9zZSB2YWx1ZXMgYW5kIHN0YXJ0IHVzaW5nIHRoZW0u
CgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDggKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9o
ZG1pLmMKaW5kZXggOTlmYzg1NjllMGY1Li40MzQ0MmM1NjE5YTMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9o
ZG1pLmMKQEAgLTI1NSwxMSArMjU1LDE3IEBAIHN0YXRpYyBpbnQgdmM0X2hkbWlfY29ubmVjdG9y
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXJldHVybiByZXQ7
CiB9CiAKK3N0YXRpYyB2b2lkIHZjNF9oZG1pX2Nvbm5lY3Rvcl9yZXNldChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yKQoreworCWRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNl
dChjb25uZWN0b3IpOworCWRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl90dl9yZXNldChjb25u
ZWN0b3IpOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgdmM0
X2hkbWlfY29ubmVjdG9yX2Z1bmNzID0gewogCS5kZXRlY3QgPSB2YzRfaGRtaV9jb25uZWN0b3Jf
ZGV0ZWN0LAogCS5maWxsX21vZGVzID0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9y
X21vZGVzLAogCS5kZXN0cm95ID0gdmM0X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3ksCi0JLnJlc2V0
ID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0LAorCS5yZXNldCA9IHZjNF9oZG1p
X2Nvbm5lY3Rvcl9yZXNldCwKIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNf
aGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsCiAJLmF0b21pY19kZXN0cm95X3N0YXRl
ID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCiB9OwotLSAKZ2l0
LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
