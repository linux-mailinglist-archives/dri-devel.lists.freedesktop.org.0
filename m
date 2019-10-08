Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F4CF3C9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DD56E1F6;
	Tue,  8 Oct 2019 07:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DFF6E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:09:02 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D3B40E08AF60E3B41D78;
 Tue,  8 Oct 2019 15:08:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 15:08:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/omap: Remove set but not used variable 'tclk_trail'
Date: Tue, 8 Oct 2019 15:15:47 +0800
Message-ID: <1570518949-47574-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
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
cHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOiBJbiBmdW5jdGlvbiBkc2lfcHJvdG9fdGltaW5nczoK
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOjM1NjI6NDY6IHdhcm5pbmc6IHZhcmlh
YmxlIHRjbGtfdHJhaWwgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KCkl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCA5OTYwYWE3Y2I1OGMgKCJkcm0vb21hcDoK
bW92ZSBvbWFwZHNzICYgZGlzcGxheXMgdW5kZXIgb21hcGRybSIpCgpSZXBvcnRlZC1ieTogSHVs
ayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVu
Z2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMgYi9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMKaW5kZXggYjMwZmNhYS4uZGExNmVhMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9kc2kuYwpAQCAtMzU0OCw3ICszNTQ4LDcgQEAgc3RhdGljIGludCBk
c2lfcHJvdG9fY29uZmlnKHN0cnVjdCBkc2lfZGF0YSAqZHNpKQoKIHN0YXRpYyB2b2lkIGRzaV9w
cm90b190aW1pbmdzKHN0cnVjdCBkc2lfZGF0YSAqZHNpKQogewotCXVuc2lnbmVkIGludCB0bHB4
LCB0Y2xrX3plcm8sIHRjbGtfcHJlcGFyZSwgdGNsa190cmFpbDsKKwl1bnNpZ25lZCBpbnQgdGxw
eCwgdGNsa196ZXJvLCB0Y2xrX3ByZXBhcmU7CiAJdW5zaWduZWQgaW50IHRjbGtfcHJlLCB0Y2xr
X3Bvc3Q7CiAJdW5zaWduZWQgaW50IHRoc19wcmVwYXJlLCB0aHNfcHJlcGFyZV90aHNfemVybywg
dGhzX3plcm87CiAJdW5zaWduZWQgaW50IHRoc190cmFpbCwgdGhzX2V4aXQ7CkBAIC0zNTY3LDcg
KzM1NjcsNiBAQCBzdGF0aWMgdm9pZCBkc2lfcHJvdG9fdGltaW5ncyhzdHJ1Y3QgZHNpX2RhdGEg
KmRzaSkKCiAJciA9IGRzaV9yZWFkX3JlZyhkc2ksIERTSV9EU0lQSFlfQ0ZHMSk7CiAJdGxweCA9
IEZMRF9HRVQociwgMjAsIDE2KSAqIDI7Ci0JdGNsa190cmFpbCA9IEZMRF9HRVQociwgMTUsIDgp
OwogCXRjbGtfemVybyA9IEZMRF9HRVQociwgNywgMCk7CgogCXIgPSBkc2lfcmVhZF9yZWcoZHNp
LCBEU0lfRFNJUEhZX0NGRzIpOwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
