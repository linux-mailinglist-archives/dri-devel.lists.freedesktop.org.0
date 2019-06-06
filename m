Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8D38536
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA020899F2;
	Fri,  7 Jun 2019 07:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346188967F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:24 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 59F3420010;
 Thu,  6 Jun 2019 14:22:20 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 18/20] drm: rcar-du: group: Enable DU's CMM extension
Date: Thu,  6 Jun 2019 16:22:18 +0200
Message-Id: <20190606142220.1392-19-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIHRoZSBDTU0gdW5pdHMgdGhyb3VnaCB0aGUgZGlzcGxheSB1bml0IGV4dGVuc2lvbmFs
IGZ1bmN0aW9uIGNvbnRyb2wKZ3JvdXAgcmVnaXN0ZXIgREVGUjcuCgpTaWduZWQtb2ZmLWJ5OiBK
YWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jIHwgOCArKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9yZWdzLmggIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9ncm91cC5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jCmluZGV4
IDllZWU0Nzk2OWU3Ny4uZDI1MmM5YmI5ODA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2dyb3VwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV9ncm91cC5jCkBAIC0xNDcsNiArMTQ3LDE0IEBAIHN0YXRpYyB2b2lkIHJjYXJfZHVfZ3Jv
dXBfc2V0dXAoc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJncnApCiAKIAlyY2FyX2R1X2dyb3VwX3Nl
dHVwX3BpbnMocmdycCk7CiAKKwlpZiAocmNhcl9kdV9oYXMocmNkdSwgUkNBUl9EVV9GRUFUVVJF
X0NNTSkpIHsKKwkJdTMyIGRlZnI3ID0gREVGUjdfQ09ERSB8CisJCQkgICAgKHJncnAtPmNtbXNf
bWFzayAmIEJJVCgxKSA/IERFRlI3X0NNTUUxIDogMCkgfAorCQkJICAgIChyZ3JwLT5jbW1zX21h
c2sgJiBCSVQoMCkgPyBERUZSN19DTU1FMCA6IDApOworCisJCXJjYXJfZHVfZ3JvdXBfd3JpdGUo
cmdycCwgREVGUjcsIGRlZnI3KTsKKwl9CisKIAlpZiAocmNkdS0+aW5mby0+Z2VuID49IDIpIHsK
IAkJcmNhcl9kdV9ncm91cF9zZXR1cF9kZWZyOChyZ3JwKTsKIAkJcmNhcl9kdV9ncm91cF9zZXR1
cF9kaWRzcihyZ3JwKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmgKaW5kZXgg
YmM4N2YwODBiMTcwLi5mYjk5NjQ5NDkzNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfcmVncy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfcmVncy5oCkBAIC0xOTcsNiArMTk3LDExIEBACiAjZGVmaW5lIERFRlI2X01MT1MxCQkoMSA8
PCAyKQogI2RlZmluZSBERUZSNl9ERUZBVUxUCQkoREVGUjZfQ09ERSB8IERFRlI2X1RDTkUxKQog
CisjZGVmaW5lIERFRlI3CQkJMHgwMDBlYworI2RlZmluZSBERUZSN19DT0RFCQkoMHg3Nzc5IDw8
IDE2KQorI2RlZmluZSBERUZSN19DTU1FMQkJQklUKDYpCisjZGVmaW5lIERFRlI3X0NNTUUwCQlC
SVQoNCkKKwogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAqIFI4QTc3OTAtb25seSBDb250cm9s
IFJlZ2lzdGVycwogICovCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
