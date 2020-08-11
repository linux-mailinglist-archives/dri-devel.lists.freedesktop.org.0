Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3D2416AF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF46E158;
	Tue, 11 Aug 2020 06:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CBE89CC9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 02:13:06 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9CE0B367C7515FE61482;
 Tue, 11 Aug 2020 10:13:02 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 11 Aug 2020
 10:12:54 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/rockchip: cdn-dp: Mark cdn_dp_core_suspend/resume
 __maybe_unused
Date: Tue, 11 Aug 2020 10:12:25 +0800
Message-ID: <20200811021225.50296-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: linux-rockchip@lists.infradead.org, YueHaibing <yuehaibing@huawei.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgQ09ORklHX1BNIGlzIG5vdCBzZXQsIGdjYyB3YXJuczoKCmRyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9jZG4tZHAtY29yZS5jOjExMjQ6MTI6CiB3YXJuaW5nOiDigJhjZG5fZHBfcmVzdW1l4oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KCk1hcmsgdGhlbSBfX21h
eWJlX3VudXNlZCB0byBmaXggdGhpcy4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lA
aHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jIGIvZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKaW5kZXggYTRhNDVkYWY5M2YyLi40MTNiMGU5
MGYxMGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jCkBAIC0xMTA3LDcg
KzExMDcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9vcHMgY2RuX2RwX2NvbXBv
bmVudF9vcHMgPSB7CiAJLnVuYmluZCA9IGNkbl9kcF91bmJpbmQsCiB9OwogCi1zdGF0aWMgaW50
IGNkbl9kcF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyBfX21heWJlX3VudXNl
ZCBpbnQgY2RuX2RwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBjZG5f
ZHBfZGV2aWNlICpkcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCWludCByZXQgPSAwOwpAQCAt
MTEyMSw3ICsxMTIxLDcgQEAgc3RhdGljIGludCBjZG5fZHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBjZG5fZHBfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKK3N0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgY2RuX2RwX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGNkbl9kcF9kZXZpY2UgKmRwID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
