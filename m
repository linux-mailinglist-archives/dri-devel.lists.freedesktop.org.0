Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B3D3993
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AAB6EBAC;
	Fri, 11 Oct 2019 06:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF306EA9C;
 Thu, 10 Oct 2019 06:48:10 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7A8F794905A5AC752912;
 Thu, 10 Oct 2019 14:48:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:57 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/msm/dsi: Remove set but not used variable 'lp'
Date: Thu, 10 Oct 2019 14:55:06 +0800
Message-ID: <1570690506-83287-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYzogSW4gZnVuY3Rpb24gZHNpX2NtZF9kbWFfcng6CmRy
aXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmM6MTMwMjo3OiB3YXJuaW5nOiB2YXJpYWJs
ZSBscCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMg
bm90IHVzZWQgc2luY2UgY29tbWl0IGE2ODk1NTRiYTZlZCAoImRybS9tc206CkluaXRpYWwgYWRk
IERTSSBjb25uZWN0b3Igc3VwcG9ydCIpCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2Np
QGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaV9ob3N0LmMKaW5kZXggNjYzZmY5Zi4uNDg1MTE4OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rz
aS9kc2lfaG9zdC5jCkBAIC0xMjkxLDE0ICsxMjkxLDEzIEBAIHN0YXRpYyBpbnQgZHNpX2NtZF9k
bWFfdHgoc3RydWN0IG1zbV9kc2lfaG9zdCAqbXNtX2hvc3QsIGludCBsZW4pCiBzdGF0aWMgaW50
IGRzaV9jbWRfZG1hX3J4KHN0cnVjdCBtc21fZHNpX2hvc3QgKm1zbV9ob3N0LAogCQkJdTggKmJ1
ZiwgaW50IHJ4X2J5dGUsIGludCBwa3Rfc2l6ZSkKIHsKLQl1MzIgKmxwLCAqdGVtcCwgZGF0YTsK
Kwl1MzIgKnRlbXAsIGRhdGE7CiAJaW50IGksIGogPSAwLCBjbnQ7CiAJdTMyIHJlYWRfY250Owog
CXU4IHJlZ1sxNl07CiAJaW50IHJlcGVhdGVkX2J5dGVzID0gMDsKIAlpbnQgYnVmX29mZnNldCA9
IGJ1ZiAtIG1zbV9ob3N0LT5yeF9idWY7CgotCWxwID0gKHUzMiAqKWJ1ZjsKIAl0ZW1wID0gKHUz
MiAqKXJlZzsKIAljbnQgPSAocnhfYnl0ZSArIDMpID4+IDI7CiAJaWYgKGNudCA+IDQpCi0tCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
