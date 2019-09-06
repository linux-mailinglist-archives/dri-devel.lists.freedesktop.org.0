Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20995AD3C3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CCC89862;
	Mon,  9 Sep 2019 07:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107386E2A3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 13:53:36 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2F486FF805;
 Fri,  6 Sep 2019 13:53:33 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v4 4/9] drm: rcar-du: Claim CMM support for Gen3 SoCs
Date: Fri,  6 Sep 2019 15:54:31 +0200
Message-Id: <20190906135436.10622-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENNTSB0byB0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgZmVhdHVyZXMgZm9yIEdlbjMgU29DcyB0
aGF0IHByb3ZpZGUgaXQ6Ci0gUjhBNzc5NQotIFI4QTc3OTYKLSBSOEE3Nzk2NQotIFI4QTc3OTl4
CgpMZWF2ZSBSOEE3Nzk3MCBvdXQgYXMgVjNNIGFuZCBWM0ggYXJlIHRoZSBvbmx5IEdlbjMgU29D
cyB0aGF0IGRvIG5vdApzdXBwb3J0IENNTS4KClJldmlld2VkLWJ5OiBVbHJpY2ggSGVjaHQgPHVs
aStyZW5lc2FzQGZwb25kLmV1PgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9kcnYuYyB8IDEyICsrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9kcnYuaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCmluZGV4IDZk
ZjM3YzJhOTY3OC4uMDE4NDgwYThmMzVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
ZHJ2LmMKQEAgLTI3Niw3ICsyNzYsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJjYXJfZHVfZGV2
aWNlX2luZm8gcmNhcl9kdV9yOGE3Nzk1X2luZm8gPSB7CiAJLmZlYXR1cmVzID0gUkNBUl9EVV9G
RUFUVVJFX0NSVENfSVJRX0NMT0NLCiAJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UK
IAkJICB8IFJDQVJfRFVfRkVBVFVSRV9JTlRFUkxBQ0VECi0JCSAgfCBSQ0FSX0RVX0ZFQVRVUkVf
VFZNX1NZTkMsCisJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMKKwkJICB8IFJDQVJfRFVf
RkVBVFVSRV9DTU0sCiAJLmNoYW5uZWxzX21hc2sgPSBCSVQoMykgfCBCSVQoMikgfCBCSVQoMSkg
fCBCSVQoMCksCiAJLnJvdXRlcyA9IHsKIAkJLyoKQEAgLTMwOSw3ICszMTAsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHJjYXJfZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9yOGE3Nzk2X2luZm8gPSB7
CiAJLmZlYXR1cmVzID0gUkNBUl9EVV9GRUFUVVJFX0NSVENfSVJRX0NMT0NLCiAJCSAgfCBSQ0FS
X0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UKIAkJICB8IFJDQVJfRFVfRkVBVFVSRV9JTlRFUkxBQ0VE
Ci0JCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVFZNX1NZTkMsCisJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVf
VFZNX1NZTkMKKwkJICB8IFJDQVJfRFVfRkVBVFVSRV9DTU0sCiAJLmNoYW5uZWxzX21hc2sgPSBC
SVQoMikgfCBCSVQoMSkgfCBCSVQoMCksCiAJLnJvdXRlcyA9IHsKIAkJLyoKQEAgLTMzOCw3ICsz
NDAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJjYXJfZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9y
OGE3Nzk2NV9pbmZvID0gewogCS5mZWF0dXJlcyA9IFJDQVJfRFVfRkVBVFVSRV9DUlRDX0lSUV9D
TE9DSwogCQkgIHwgUkNBUl9EVV9GRUFUVVJFX1ZTUDFfU09VUkNFCiAJCSAgfCBSQ0FSX0RVX0ZF
QVRVUkVfSU5URVJMQUNFRAotCQkgIHwgUkNBUl9EVV9GRUFUVVJFX1RWTV9TWU5DLAorCQkgIHwg
UkNBUl9EVV9GRUFUVVJFX1RWTV9TWU5DCisJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfQ01NLAogCS5j
aGFubmVsc19tYXNrID0gQklUKDMpIHwgQklUKDEpIHwgQklUKDApLAogCS5yb3V0ZXMgPSB7CiAJ
CS8qCkBAIC0zODYsNyArMzg5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByY2FyX2R1X2Rldmlj
ZV9pbmZvIHJjYXJfZHVfcjhhNzc5NzBfaW5mbyA9IHsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmNh
cl9kdV9kZXZpY2VfaW5mbyByY2FyX2R1X3I4YTc3OTl4X2luZm8gPSB7CiAJLmdlbiA9IDMsCiAJ
LmZlYXR1cmVzID0gUkNBUl9EVV9GRUFUVVJFX0NSVENfSVJRX0NMT0NLCi0JCSAgfCBSQ0FSX0RV
X0ZFQVRVUkVfVlNQMV9TT1VSQ0UsCisJCSAgfCBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UK
KwkJICB8IFJDQVJfRFVfRkVBVFVSRV9DTU0sCiAJLmNoYW5uZWxzX21hc2sgPSBCSVQoMSkgfCBC
SVQoMCksCiAJLnJvdXRlcyA9IHsKIAkJLyoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Ry
di5oCmluZGV4IDEzMjdjZDBkZjkwYS4uYTAwZGNjYzQ0N2FhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfZHJ2LmgKQEAgLTI4LDYgKzI4LDcgQEAgc3RydWN0IHJjYXJfZHVfZW5jb2Rl
cjsKICNkZWZpbmUgUkNBUl9EVV9GRUFUVVJFX1ZTUDFfU09VUkNFCUJJVCgxKQkvKiBIYXMgaW5w
dXRzIGZyb20gVlNQMSAqLwogI2RlZmluZSBSQ0FSX0RVX0ZFQVRVUkVfSU5URVJMQUNFRAlCSVQo
MikJLyogSFcgc3VwcG9ydHMgaW50ZXJsYWNlZCAqLwogI2RlZmluZSBSQ0FSX0RVX0ZFQVRVUkVf
VFZNX1NZTkMJQklUKDMpCS8qIEhhcyBUViBzd2l0Y2gvc3luYyBtb2RlcyAqLworI2RlZmluZSBS
Q0FSX0RVX0ZFQVRVUkVfQ01NCQlCSVQoNCkJLyogSGFzIENNTSAqLwogCiAjZGVmaW5lIFJDQVJf
RFVfUVVJUktfQUxJR05fMTI4QglCSVQoMCkJLyogQWxpZ24gcGl0Y2hlcyB0byAxMjggYnl0ZXMg
Ki8KIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
