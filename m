Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB691BF16A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A736EB51;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F7D6EA80;
 Thu, 30 Apr 2020 03:33:44 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8012BAE089AE068FE176;
 Thu, 30 Apr 2020 11:33:38 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 11:33:28 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amd/display: remove set but not used variable
 'speakers' in dce_stream_encoder.c
Date: Thu, 30 Apr 2020 11:40:33 +0800
Message-ID: <20200430034034.106824-4-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200430034034.106824-1-zhengbin13@huawei.com>
References: <20200430034034.106824-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYzoxMzM5OjExOiB3
YXJuaW5nOiB2YXJpYWJsZSDigJhzcGVha2Vyc+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgaW50cm9kdWNlZCBieSBjb21taXQgNDU2MjIzNmIz
YmMwICgiZHJtL2FtZC9kYzoKQWRkIGRjIGRpc3BsYXkgZHJpdmVyICh2MikiKSwgYnV0IG5ldmVy
IHVzZWQsIHNvIHJlbW92ZSBpdC4KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVh
d2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWmhlbmcgQmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29k
ZXIuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5j
CmluZGV4IDQ1MTU3NDk3MWI5Ni4uNGNkYWFmNGQ4ODFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmMKQEAgLTEz
MzYsNyArMTMzNiw2IEBAIHN0YXRpYyB2b2lkIGRjZTExMF9zZV9hdWRpb19zZXR1cCgKIHsKIAlz
dHJ1Y3QgZGNlMTEwX3N0cmVhbV9lbmNvZGVyICplbmMxMTAgPSBEQ0UxMTBTVFJFTkNfRlJPTV9T
VFJFTkMoZW5jKTsKCi0JdWludDMyX3Qgc3BlYWtlcnMgPSAwOwogCXVpbnQzMl90IGNoYW5uZWxz
ID0gMDsKCiAJQVNTRVJUKGF1ZGlvX2luZm8pOwpAQCAtMTM0NCw3ICsxMzQzLDYgQEAgc3RhdGlj
IHZvaWQgZGNlMTEwX3NlX2F1ZGlvX3NldHVwKAogCQkvKiBUaGlzIHNob3VsZCBub3QgaGFwcGVu
Lml0IGRvZXMgc28gd2UgZG9uJ3QgZ2V0IEJTT0QqLwogCQlyZXR1cm47CgotCXNwZWFrZXJzID0g
YXVkaW9faW5mby0+ZmxhZ3MuaW5mby5BTExTUEVBS0VSUzsKIAljaGFubmVscyA9IHNwZWFrZXJz
X3RvX2NoYW5uZWxzKGF1ZGlvX2luZm8tPmZsYWdzLnNwZWFrZXJfZmxhZ3MpLmFsbDsKCiAJLyog
c2V0dXAgdGhlIGF1ZGlvIHN0cmVhbSBzb3VyY2Ugc2VsZWN0IChhdWRpbyAtPiBkaWcgbWFwcGlu
ZykgKi8KLS0KMi4yNi4wLjEwNi5nOWZhZGVkZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
