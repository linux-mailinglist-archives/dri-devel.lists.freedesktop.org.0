Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0435841D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E406EAD3;
	Thu,  8 Apr 2021 13:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD666EACB;
 Thu,  8 Apr 2021 12:41:44 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGLRK5HsYzpVbR;
 Thu,  8 Apr 2021 20:38:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 20:41:34 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/amd/display: Fix the Wunused-function warning
Date: Thu, 8 Apr 2021 20:41:58 +0800
Message-ID: <1617885718-2697-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 08 Apr 2021 13:05:10 +0000
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Solomon Chiu <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Ma <hanghong.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmM6OTQxOjEzOiB3YXJuaW5nOiDigJhkbV9kbXViX3RyYWNlX2hpZ2hfaXJx4oCZIGRlZmluZWQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KICA5NDEgfCBzdGF0aWMgdm9pZCBkbV9k
bXViX3RyYWNlX2hpZ2hfaXJxKHZvaWQgKmludGVycnVwdF9wYXJhbXMpCiAgICAgIHwgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKRml4ZXM6IDgzYjM5ZTFmYzNlYSAoImRybS9h
bWQvZGlzcGxheTogTG9nIERNQ1VCIHRyYWNlIGJ1ZmZlciBldmVudHMiKQpDYzogTGVvIChIYW5n
aG9uZykgTWEgPGhhbmdob25nLm1hQGFtZC5jb20+CkNjOiBEYW5pZWwgV2hlZWxlciA8ZGFuaWVs
LndoZWVsZXJAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBhbWQu
Y29tPgpDYzogU29sb21vbiBDaGl1IDxzb2xvbW9uLmNoaXVAYW1kLmNvbT4KQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2hhb2t1biBa
aGFuZyA8emhhbmdzaGFva3VuQGhpc2lsaWNvbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGRhYWNjNWNjOGQ1MS4uNTI5OGU1
ZDQwNzViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKQEAgLTkzNyw2ICs5MzcsNyBAQCBzdGF0aWMgaW50IGRtX2RtdWJfaHdfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4gMDsKIH0KIAorI2lmIGRlZmlu
ZWQoQ09ORklHX0RSTV9BTURfRENfRENOKQogI2RlZmluZSBETVVCX1RSQUNFX01BWF9SRUFEIDY0
CiBzdGF0aWMgdm9pZCBkbV9kbXViX3RyYWNlX2hpZ2hfaXJxKHZvaWQgKmludGVycnVwdF9wYXJh
bXMpCiB7CkBAIC05NjMsNyArOTY0LDYgQEAgc3RhdGljIHZvaWQgZG1fZG11Yl90cmFjZV9oaWdo
X2lycSh2b2lkICppbnRlcnJ1cHRfcGFyYW1zKQogCUFTU0VSVChjb3VudCA8PSBETVVCX1RSQUNF
X01BWF9SRUFEKTsKIH0KIAotI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOKQogc3Rh
dGljIHZvaWQgbW1odWJfcmVhZF9zeXN0ZW1fY29udGV4dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgc3RydWN0IGRjX3BoeV9hZGRyX3NwYWNlX2NvbmZpZyAqcGFfY29uZmlnKQogewogCXVp
bnQ2NF90IHB0X2Jhc2U7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
