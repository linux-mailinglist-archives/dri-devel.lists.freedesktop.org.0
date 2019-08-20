Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A895311
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 03:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EFA6E4A0;
	Tue, 20 Aug 2019 01:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823C6E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:17:35 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1B4556A;
 Tue, 20 Aug 2019 03:17:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/50] drm/connector: Add helper to get a connector type
 name
Date: Tue, 20 Aug 2019 04:16:33 +0300
Message-Id: <20190820011721.30136-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566263853;
 bh=5XHZgpdA8mnIUhf0LV7Bc7CO33AuLoETQ8KiU079OdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L2N3lQvU6TpBpBRdUjEULay0EeanXF0yxTZhQvcqGRqhEqADzY58ZqDcDpvgHpzIx
 wnTtUqTaJFDYDYelHTxQUO577DlvshQd2ILRx5qAQzI5YLl1rEZ8hePlzBcT+b59EF
 gnfFxJDtybxOq4qT8Tobd6G8XDbHMLB+v8VpAkZ8=
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

ZHJtX2Nvbm5lY3Rvci5jIGNvbnRhaW5zIGEgbWFwIG9mIGNvbm5lY3RvciB0eXBlcyAoRFJNX01P
REVfQ09OTkVDVE9SXyopCnRvIG5hbWUgc3RyaW5ncywgYnV0IGRvZXNuJ3QgZXhwb3NlIGl0LiBU
aGlzIGxlYWRzIHRvIGRyaXZlcnMgaGF2aW5nIHRvCnN0b3JlIGEgc2ltaWxhciBtYXAuCgpBZGQg
YSBuZXcgZHJtX2dldF9jb25uZWN0b3JfdHlwZV9uYW1lKCkgaGVscGVyIGZ1bmN0aW9uIHRoYXQg
cmV0dXJuIGEKbmFtZSBzdHJpbmcgZm9yIGEgY29ubmVjdG9yIHR5cGUuCgpTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDE1ICsrKysrKysrKysrKysrKwog
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVj
dG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCmluZGV4IDRjNzY2NjI0YjIw
ZC4uM2Y5MzYzM2E5ZmYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKQEAgLTExMSw2ICsxMTEs
MjEgQEAgdm9pZCBkcm1fY29ubmVjdG9yX2lkYV9kZXN0cm95KHZvaWQpCiAJCWlkYV9kZXN0cm95
KCZkcm1fY29ubmVjdG9yX2VudW1fbGlzdFtpXS5pZGEpOwogfQogCisvKioKKyAqIGRybV9nZXRf
Y29ubmVjdG9yX3R5cGVfbmFtZSAtIHJldHVybiBhIHN0cmluZyBmb3IgY29ubmVjdG9yIHR5cGUK
KyAqIEB0eXBlOiBUaGUgY29ubmVjdG9yIHR5cGUgKERSTV9NT0RFX0NPTk5FQ1RPUl8qKQorICoK
KyAqIFJldHVybnM6IHRoZSBuYW1lIG9mIHRoZSBjb25uZWN0b3IgdHlwZSwgb3IgTlVMTCBpZiB0
aGUgdHlwZSBpcyBub3QgdmFsaWQuCisgKi8KK2NvbnN0IGNoYXIgKmRybV9nZXRfY29ubmVjdG9y
X3R5cGVfbmFtZSh1bnNpZ25lZCBpbnQgdHlwZSkKK3sKKwlpZiAodHlwZSA8IEFSUkFZX1NJWkUo
ZHJtX2Nvbm5lY3Rvcl9lbnVtX2xpc3QpKQorCQlyZXR1cm4gZHJtX2Nvbm5lY3Rvcl9lbnVtX2xp
c3RbdHlwZV0ubmFtZTsKKworCXJldHVybiBOVUxMOworfQorRVhQT1JUX1NZTUJPTChkcm1fZ2V0
X2Nvbm5lY3Rvcl90eXBlX25hbWUpOworCiAvKioKICAqIGRybV9jb25uZWN0b3JfZ2V0X2NtZGxp
bmVfbW9kZSAtIHJlYWRzIHRoZSB1c2VyJ3MgY21kbGluZSBtb2RlCiAgKiBAY29ubmVjdG9yOiBj
b25uZWN0b3IgdG8gcXV3ZXJ5CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9y
LmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKaW5kZXggNjgxY2I1OTBmOTUyLi5iOTFl
MzY5Y2ZiMTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKQEAgLTE1MDAsNiArMTUwMCw3IEBAIGRybV9jb25u
ZWN0b3JfaXNfdW5yZWdpc3RlcmVkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJ
CURSTV9DT05ORUNUT1JfVU5SRUdJU1RFUkVEOwogfQogCitjb25zdCBjaGFyICpkcm1fZ2V0X2Nv
bm5lY3Rvcl90eXBlX25hbWUodW5zaWduZWQgaW50IGNvbm5lY3Rvcl90eXBlKTsKIGNvbnN0IGNo
YXIgKmRybV9nZXRfY29ubmVjdG9yX3N0YXR1c19uYW1lKGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0
dXMgc3RhdHVzKTsKIGNvbnN0IGNoYXIgKmRybV9nZXRfc3VicGl4ZWxfb3JkZXJfbmFtZShlbnVt
IHN1YnBpeGVsX29yZGVyIG9yZGVyKTsKIGNvbnN0IGNoYXIgKmRybV9nZXRfZHBtc19uYW1lKGlu
dCB2YWwpOwotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
