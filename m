Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE671FC137
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF36E314;
	Thu, 14 Nov 2019 08:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554366ECC2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:04:28 +0000 (UTC)
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0BBDAC0013;
 Wed, 13 Nov 2019 10:04:24 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v7 6/7] drm: rcar-du: crtc: Register GAMMA_LUT properties
Date: Wed, 13 Nov 2019 11:05:55 +0100
Message-Id: <20191113100556.15616-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:51 +0000
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
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKaW5kZXggM2YwZjE2
OTQ2ZjQyLi5lMTJjZTljODkyM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0
Yy5jCkBAIC0xMTM2LDYgKzExMzYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1
bmNzIGNydGNfZnVuY3NfZ2VuMyA9IHsKIAkuc2V0X2NyY19zb3VyY2UgPSByY2FyX2R1X2NydGNf
c2V0X2NyY19zb3VyY2UsCiAJLnZlcmlmeV9jcmNfc291cmNlID0gcmNhcl9kdV9jcnRjX3Zlcmlm
eV9jcmNfc291cmNlLAogCS5nZXRfY3JjX3NvdXJjZXMgPSByY2FyX2R1X2NydGNfZ2V0X2NyY19z
b3VyY2VzLAorCS5nYW1tYV9zZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9sZWdhY3lfZ2FtbWFfc2V0
LAogfTsKIAogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQEAgLTEyNTksNiArMTI2MCw5IEBAIGlu
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
