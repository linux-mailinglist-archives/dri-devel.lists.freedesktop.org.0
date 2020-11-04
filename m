Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF062A78C5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB42F6E9AD;
	Thu,  5 Nov 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ABE6E0E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 12:52:15 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CR64F6dy5z1rxXl;
 Wed,  4 Nov 2020 13:52:13 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CR64F5JHDz1qwm0;
 Wed,  4 Nov 2020 13:52:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yRjIT8PYsG6G; Wed,  4 Nov 2020 13:52:12 +0100 (CET)
X-Auth-Info: 330ErkJ8ipbWk2iQgph/8v29aMRCJ8Rgq1daKFr7MdI=
Received: from localhost.localdomain (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  4 Nov 2020 13:52:12 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/stm: Enable RPM during fbdev registration
Date: Wed,  4 Nov 2020 13:52:00 +0100
Message-Id: <20201104125200.259639-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: Marek Vasut <marex@denx.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlIHJ1bnRpbWUgUE0gYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBmYmRldiBlbXVsYXRpb24g
YW5kIGRpc2FibGUgaXQKYWZ0ZXJ3YXJkLCBvdGhlcndpc2UgcmVnaXN0ZXIgYWNjZXNzIHRvIHRo
ZSBMVERDIElQIGR1cmluZyB0aGUgZmJkZXYKZW11bGF0aW9uIHJlZ2lzdHJhdGlvbiBtaWdodCBo
YW5nIHRoZSBzeXN0ZW0uCgpUaGUgcHJvYmxlbSBoYXBwZW5zIGJlY2F1c2UgUlBNIGlzIGFjdGl2
YXRlZCBhdCB0aGUgZW5kIG9mIGx0ZGNfbG9hZCgpLApidXQgdGhlIGZiZGV2IGVtdWxhdGlvbiBy
ZWdpc3RyYXRpb24gaGFwcGVucyBvbmx5IGFmdGVyIHRoYXQsIGFuZCBlbmRzCnVwIGNhbGxpbmcg
bHRkY19jcnRjX21vZGVfc2V0X25vZmIoKSwgd2hpY2ggY2hlY2tzIHdoZXRoZXIgUlBNIGlzIGFj
dGl2ZQphbmQgb25seSBpZiBpdCBpcyBub3QgYWN0aXZlLCBjYWxscyBwbV9ydW50aW1lX2dldF9z
eW5jKCkgdG8gZW5hYmxlIHRoZQpjbG9jayBhbmQgc28gb24uIElmIHRoZSBjbG9jayBhcmUgbm90
IGVuYWJsZWQsIGFueSByZWdpc3RlciBhY2Nlc3MgaW4KbHRkY19jcnRjX21vZGVfc2V0X25vZmIo
KSBjb3VsZCBoYW5nIHRoZSBwbGF0Zm9ybSBjb21wbGV0ZWx5LgoKVGhpcyBwYXRjaCBtYWtlcyBz
dXJlIHRoYXQgbHRkY19jcnRjX21vZGVfc2V0X25vZmIoKSBpcyBjYWxsZWQgd2l0aGluCnBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSwgc28gd2l0aCBjbG9jayBlbmFibGVkLgoKU2lnbmVkLW9mZi1ieTog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5k
cmUudG9yZ3VlQHN0LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFy
ZEBzdC5jb20+CkNjOiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgpDYzog
WWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jCmluZGV4IDQxMTEwM2YwMTNlMi4uZDg5MjFlZGM4M2RiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
ZHJ2LmMKQEAgLTE5Nyw3ICsxOTcsOSBAQCBzdGF0aWMgaW50IHN0bV9kcm1fcGxhdGZvcm1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlnb3RvIGVycl9w
dXQ7CiAKKwlwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7CiAJZHJtX2ZiZGV2X2dlbmVy
aWNfc2V0dXAoZGRldiwgMTYpOworCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGRldi0+ZGV2KTsKIAog
CXJldHVybiAwOwogCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
