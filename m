Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79257FF8F8
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E996E2A8;
	Sun, 17 Nov 2019 11:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7A6E1F1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 02:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0EE2B28F7AD
Received: by earth.universe (Postfix, from userid 1000)
 id DC2663C0C9C; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 16/42] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
Date: Sun, 17 Nov 2019 03:40:02 +0100
Message-Id: <20191117024028.2233-17-sebastian.reichel@collabora.com>
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

RHJvcCBsb2NhbCBkZWZpbml0aW9uIG9mIGNvbW1vbiBNSVBJIERDUyAxLjMgZGVmaW5lcy4KClNp
Z25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyB8IDEyICsrKysrKy0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20u
YyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCmluZGV4
IDQyNmM2NjBhZjI2NC4uY2MyNWJkMGI1MDFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtMjgsOCArMjgsNiBAQAogI2luY2x1ZGUg
Ii4uL2Rzcy9vbWFwZHNzLmgiCiAKICNkZWZpbmUgRENTX1JFQURfTlVNX0VSUk9SUwkweDA1Ci0j
ZGVmaW5lIERDU19CUklHSFRORVNTCQkweDUxCi0jZGVmaW5lIERDU19DVFJMX0RJU1BMQVkJMHg1
MwogI2RlZmluZSBEQ1NfR0VUX0lEMQkJMHhkYQogI2RlZmluZSBEQ1NfR0VUX0lEMgkJMHhkYgog
I2RlZmluZSBEQ1NfR0VUX0lEMwkJMHhkYwpAQCAtMzMzLDggKzMzMSwxMCBAQCBzdGF0aWMgaW50
IGRzaWNtX2JsX3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmRldikKIAkJ
c3JjLT5vcHMtPmRzaS5idXNfbG9jayhzcmMpOwogCiAJCXIgPSBkc2ljbV93YWtlX3VwKGRkYXRh
KTsKLQkJaWYgKCFyKQotCQkJciA9IGRzaWNtX2Rjc193cml0ZV8xKGRkYXRhLCBEQ1NfQlJJR0hU
TkVTUywgbGV2ZWwpOworCQlpZiAoIXIpIHsKKwkJCXIgPSBkc2ljbV9kY3Nfd3JpdGVfMShkZGF0
YSwKKwkJCQlNSVBJX0RDU19TRVRfRElTUExBWV9CUklHSFRORVNTLCBsZXZlbCk7CisJCX0KIAog
CQlzcmMtPm9wcy0+ZHNpLmJ1c191bmxvY2soc3JjKTsKIAl9CkBAIC01OTcsMTEgKzU5NywxMSBA
QCBzdGF0aWMgaW50IGRzaWNtX3Bvd2VyX29uKHN0cnVjdCBwYW5lbF9kcnZfZGF0YSAqZGRhdGEp
CiAJaWYgKHIpCiAJCWdvdG8gZXJyOwogCi0JciA9IGRzaWNtX2Rjc193cml0ZV8xKGRkYXRhLCBE
Q1NfQlJJR0hUTkVTUywgMHhmZik7CisJciA9IGRzaWNtX2Rjc193cml0ZV8xKGRkYXRhLCBNSVBJ
X0RDU19TRVRfRElTUExBWV9CUklHSFRORVNTLCAweGZmKTsKIAlpZiAocikKIAkJZ290byBlcnI7
CiAKLQlyID0gZHNpY21fZGNzX3dyaXRlXzEoZGRhdGEsIERDU19DVFJMX0RJU1BMQVksCisJciA9
IGRzaWNtX2Rjc193cml0ZV8xKGRkYXRhLCBNSVBJX0RDU19XUklURV9DT05UUk9MX0RJU1BMQVks
CiAJCQkoMTw8MikgfCAoMTw8NSkpOwkvKiBCTCB8IEJDVFJMICovCiAJaWYgKHIpCiAJCWdvdG8g
ZXJyOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
