Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B201B3856C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB9489B3B;
	Fri,  7 Jun 2019 07:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69689354
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:22:16 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C092D20007;
 Thu,  6 Jun 2019 14:22:12 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 15/20] drm: rcar-du: Claim CMM support for Gen3 SoCs
Date: Thu,  6 Jun 2019 16:22:15 +0200
Message-Id: <20190606142220.1392-16-jacopo+renesas@jmondi.org>
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

QWRkIENNTSB0byB0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgZmVhdHVyZXMgZm9yIEdlbjMgU29DcyB0
aGF0IHByb3ZpZGUgaXQ6Ci0gUjhBNzc5NQotIFI4QTc3OTYKLSBSOEE3Nzk2NQotIFI4QTc3OTl4
CgpMZWF2ZSBSOEE3Nzk3MCBvdXQgYXMgVjNNIGFuZCBWM0ggYXJlIHRoZSBvbmx5IEdlbjMgU29D
cyB0aGF0IGRvIG5vdApzdXBwb3J0IENNTS4KClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8
amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2Rydi5jIHwgMTIgKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2Rydi5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKaW5kZXggNzVh
YjE3YWYxM2E5Li4xZTY5Y2ZhMTE3OTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9k
cnYuYwpAQCAtMjQ3LDcgKzI0Nyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9kdV9kZXZp
Y2VfaW5mbyByY2FyX2R1X3I4YTc3OTVfaW5mbyA9IHsKIAkuZmVhdHVyZXMgPSBSQ0FSX0RVX0ZF
QVRVUkVfQ1JUQ19JUlFfQ0xPQ0sKIAkJICB8IFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRQog
CQkgIHwgUkNBUl9EVV9GRUFUVVJFX0lOVEVSTEFDRUQKLQkJICB8IFJDQVJfRFVfRkVBVFVSRV9U
Vk1fU1lOQywKKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9UVk1fU1lOQworCQkgIHwgUkNBUl9EVV9G
RUFUVVJFX0NNTSwKIAkuY2hhbm5lbHNfbWFzayA9IEJJVCgzKSB8IEJJVCgyKSB8IEJJVCgxKSB8
IEJJVCgwKSwKIAkucm91dGVzID0gewogCQkvKgpAQCAtMjgwLDcgKzI4MSw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcmNhcl9kdV9kZXZpY2VfaW5mbyByY2FyX2R1X3I4YTc3OTZfaW5mbyA9IHsK
IAkuZmVhdHVyZXMgPSBSQ0FSX0RVX0ZFQVRVUkVfQ1JUQ19JUlFfQ0xPQ0sKIAkJICB8IFJDQVJf
RFVfRkVBVFVSRV9WU1AxX1NPVVJDRQogCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0lOVEVSTEFDRUQK
LQkJICB8IFJDQVJfRFVfRkVBVFVSRV9UVk1fU1lOQywKKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9U
Vk1fU1lOQworCQkgIHwgUkNBUl9EVV9GRUFUVVJFX0NNTSwKIAkuY2hhbm5lbHNfbWFzayA9IEJJ
VCgyKSB8IEJJVCgxKSB8IEJJVCgwKSwKIAkucm91dGVzID0gewogCQkvKgpAQCAtMzA5LDcgKzMx
MSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmNhcl9kdV9kZXZpY2VfaW5mbyByY2FyX2R1X3I4
YTc3OTY1X2luZm8gPSB7CiAJLmZlYXR1cmVzID0gUkNBUl9EVV9GRUFUVVJFX0NSVENfSVJRX0NM
T0NLCiAJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UKIAkJICB8IFJDQVJfRFVfRkVB
VFVSRV9JTlRFUkxBQ0VECi0JCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMsCisJCSAgfCBS
Q0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMKKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9DTU0sCiAJLmNo
YW5uZWxzX21hc2sgPSBCSVQoMykgfCBCSVQoMSkgfCBCSVQoMCksCiAJLnJvdXRlcyA9IHsKIAkJ
LyoKQEAgLTM1Nyw3ICszNjAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJjYXJfZHVfZGV2aWNl
X2luZm8gcmNhcl9kdV9yOGE3Nzk3MF9pbmZvID0gewogc3RhdGljIGNvbnN0IHN0cnVjdCByY2Fy
X2R1X2RldmljZV9pbmZvIHJjYXJfZHVfcjhhNzc5OXhfaW5mbyA9IHsKIAkuZ2VuID0gMywKIAku
ZmVhdHVyZXMgPSBSQ0FSX0RVX0ZFQVRVUkVfQ1JUQ19JUlFfQ0xPQ0sKLQkJICB8IFJDQVJfRFVf
RkVBVFVSRV9WU1AxX1NPVVJDRSwKKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRQor
CQkgIHwgUkNBUl9EVV9GRUFUVVJFX0NNTSwKIAkuY2hhbm5lbHNfbWFzayA9IEJJVCgxKSB8IEJJ
VCgwKSwKIAkucm91dGVzID0gewogCQkvKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2
LmgKaW5kZXggMTMyN2NkMGRmOTBhLi5hMDBkY2NjNDQ3YWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9kcnYuaApAQCAtMjgsNiArMjgsNyBAQCBzdHJ1Y3QgcmNhcl9kdV9lbmNvZGVy
OwogI2RlZmluZSBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UJQklUKDEpCS8qIEhhcyBpbnB1
dHMgZnJvbSBWU1AxICovCiAjZGVmaW5lIFJDQVJfRFVfRkVBVFVSRV9JTlRFUkxBQ0VECUJJVCgy
KQkvKiBIVyBzdXBwb3J0cyBpbnRlcmxhY2VkICovCiAjZGVmaW5lIFJDQVJfRFVfRkVBVFVSRV9U
Vk1fU1lOQwlCSVQoMykJLyogSGFzIFRWIHN3aXRjaC9zeW5jIG1vZGVzICovCisjZGVmaW5lIFJD
QVJfRFVfRkVBVFVSRV9DTU0JCUJJVCg0KQkvKiBIYXMgQ01NICovCiAKICNkZWZpbmUgUkNBUl9E
VV9RVUlSS19BTElHTl8xMjhCCUJJVCgwKQkvKiBBbGlnbiBwaXRjaGVzIHRvIDEyOCBieXRlcyAq
LwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
