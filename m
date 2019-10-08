Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7D4CF3CD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15046E21C;
	Tue,  8 Oct 2019 07:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6FA6E1D6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:09:02 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D863217422481F1C364B;
 Tue,  8 Oct 2019 15:08:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 15:08:39 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/omap: Remove set but not used variable 'err' in
 hdmi4_audio_config
Date: Tue, 8 Oct 2019 15:15:49 +0800
Message-ID: <1570518949-47574-5-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYzogSW4gZnVuY3Rpb24gaGRtaTRfYXVkaW9f
Y29uZmlnOgpkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jOjY4OTo2OiB3
YXJuaW5nOiB2YXJpYWJsZSBlcnIgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KCkl0IGlzIG5vdCB1c2VkIHNpbmNlIGNvbW1pdCBmNWJhYjIyMjkxOTAgKCJPTUFQ
RFNTOgpIRE1JOiBBZGQgT01BUDUgSERNSSBzdXBwb3J0IikKClJlcG9ydGVkLWJ5OiBIdWxrIFJv
Ym90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmlu
MTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29y
ZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNF9jb3Jl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jCmluZGV4IDVkNWQ1
NTguLjZmMzk4OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1p
NF9jb3JlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYwpA
QCAtNjc1LDcgKzY3NSw3IEBAIGludCBoZG1pNF9hdWRpb19jb25maWcoc3RydWN0IGhkbWlfY29y
ZV9kYXRhICpjb3JlLCBzdHJ1Y3QgaGRtaV93cF9kYXRhICp3cCwKIAlzdHJ1Y3QgaGRtaV9hdWRp
b19mb3JtYXQgYXVkaW9fZm9ybWF0OwogCXN0cnVjdCBoZG1pX2F1ZGlvX2RtYSBhdWRpb19kbWE7
CiAJc3RydWN0IGhkbWlfY29yZV9hdWRpb19jb25maWcgYWNvcmU7Ci0JaW50IGVyciwgbiwgY3Rz
LCBjaGFubmVsX2NvdW50OworCWludCBuLCBjdHMsIGNoYW5uZWxfY291bnQ7CiAJdW5zaWduZWQg
aW50IGZzX25yOwogCWJvb2wgd29yZF9sZW5ndGhfMTZiID0gZmFsc2U7CgpAQCAtNzM3LDcgKzcz
Nyw3IEBAIGludCBoZG1pNF9hdWRpb19jb25maWcoc3RydWN0IGhkbWlfY29yZV9kYXRhICpjb3Jl
LCBzdHJ1Y3QgaGRtaV93cF9kYXRhICp3cCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQoKLQllcnIg
PSBoZG1pX2NvbXB1dGVfYWNyKHBjbGssIGZzX25yLCAmbiwgJmN0cyk7CisJaGRtaV9jb21wdXRl
X2FjcihwY2xrLCBmc19uciwgJm4sICZjdHMpOwoKIAkvKiBBdWRpbyBjbG9jayByZWdlbmVyYXRp
b24gc2V0dGluZ3MgKi8KIAlhY29yZS5uID0gbjsKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
