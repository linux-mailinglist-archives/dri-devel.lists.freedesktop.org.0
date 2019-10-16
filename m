Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5DD8D67
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385E76E91F;
	Wed, 16 Oct 2019 10:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157F6E904
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:55:13 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 33E91240002;
 Wed, 16 Oct 2019 08:55:10 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v6 6/8] drm: rcar-du: crtc: Register GAMMA_LUT properties
Date: Wed, 16 Oct 2019 10:55:46 +0200
Message-Id: <20191016085548.105703-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 10:11:37 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIHRoZSBHQU1NQV9MVVQgS01TIHByb3BlcnR5IHVzaW5nIHRoZSBmcmFtZXdvcmsgaGVs
cGVycyB0bwpyZWdpc3RlciB0aGUgcHJvcGVydHkgYW5kIHNldCB0aGUgYXNzb2NpYXRlZCBnYW1t
YSB0YWJsZSBtYXhpbXVtIHNpemUuCgpSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJh
bi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IFVscmljaCBI
ZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY29w
byBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2NydGMuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKaW5kZXggZDdhZDQ5
MTU3N2YzLi5hMGE1MTJiODFhZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0
Yy5jCkBAIC0xMTMwLDYgKzExMzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1
bmNzIGNydGNfZnVuY3NfZ2VuMyA9IHsKIAkuc2V0X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNf
c2V0X2NyY19zb3VyY2UsCiAJLnZlcmlmeV9jcmNfc291cmNlID0gcmNhcl9kdV9jcnRjX3Zlcmlm
eV9jcmNfc291cmNlLAogCS5nZXRfY3JjX3NvdXJjZXMgPSByY2FyX2R1X2NydGNfZ2V0X2NyY19z
b3VyY2VzLAorCS5nYW1tYV9zZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0
LAogfTsKIAogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQEAgLTEyNTMsNiArMTI1NCw5IEBAIGlu
dCByY2FyX2R1X2NydGNfY3JlYXRlKHN0cnVjdCByY2FyX2R1X2dyb3VwICpyZ3JwLCB1bnNpZ25l
ZCBpbnQgc3dpbmRleCwKIAlpZiAocmNkdS0+Y21tc1tzd2luZGV4XSkgewogCQlyY3J0Yy0+Y21t
ID0gcmNkdS0+Y21tc1tzd2luZGV4XTsKIAkJcmdycC0+Y21tc19tYXNrIHw9IEJJVChod2luZGV4
ICUgMik7CisKKwkJZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6ZShjcnRjLCBDTTJfTFVUX1NJ
WkUpOworCQlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChjcnRjLCAwLCBmYWxzZSwgQ00yX0xV
VF9TSVpFKTsKIAl9CiAKIAlkcm1fY3J0Y19oZWxwZXJfYWRkKGNydGMsICZjcnRjX2hlbHBlcl9m
dW5jcyk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
