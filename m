Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3B1B985F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3889F31;
	Mon, 27 Apr 2020 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B3989C33
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 16:17:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6771C2612F5
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume
 static
Date: Sun, 26 Apr 2020 18:16:53 +0200
Message-Id: <20200426161653.7710-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Apr 2020 07:21:44 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgZGV0ZWN0ZWQgd2hlbiBydW5uaW5nIG1h
a2Ugd2l0aCBXPTEKCiAgICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvL2Nkbi1kcC1jb3JlLmM6
MTExMjo1OiB3YXJuaW5nOiBubyBwcmV2aW91cwogICAgcHJvdG90eXBlIGZvciDigJhjZG5fZHBf
c3VzcGVuZOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgogICAgZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwLy9jZG4tZHAtY29yZS5jOjExMjY6NTogd2FybmluZzogbm8gcHJldmlvdXMKICAgIHBy
b3RvdHlwZSBmb3Ig4oCYY2RuX2RwX3Jlc3VtZeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpT
aWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xs
YWJvcmEuY29tPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jCmluZGV4IGVlZDU5NGJkMzhkMy4u
NGZhMDBhZjg5Y2NhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRw
LWNvcmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYwpAQCAt
MTEwOSw3ICsxMTA5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfb3BzIGNkbl9k
cF9jb21wb25lbnRfb3BzID0gewogCS51bmJpbmQgPSBjZG5fZHBfdW5iaW5kLAogfTsKIAotaW50
IGNkbl9kcF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyBpbnQgY2RuX2RwX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCWludCByZXQgPSAwOwpAQCAtMTEyMyw3ICsxMTIzLDcg
QEAgaW50IGNkbl9kcF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gcmV0Owog
fQogCi1pbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCitzdGF0aWMgaW50IGNk
bl9kcF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBjZG5fZHBfZGV2aWNl
ICpkcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
