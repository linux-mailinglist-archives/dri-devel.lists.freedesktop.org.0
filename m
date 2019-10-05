Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4BCCB2D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773E36E395;
	Sat,  5 Oct 2019 16:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 931 seconds by postgrey-1.36 at gabe;
 Sat, 05 Oct 2019 02:53:08 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA36E6E0C0;
 Sat,  5 Oct 2019 02:53:08 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C8E86ADEAC5B6B2683EF;
 Sat,  5 Oct 2019 10:37:33 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 10:37:25 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amd/display: Remove set but not used variable
 'source_bpp'
Date: Sat, 5 Oct 2019 10:44:33 +0800
Message-ID: <1570243476-44419-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
References: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:30 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9yY19jYWxjLmM6IEluIGZ1bmN0aW9uIGNhbGNfcmNf
cGFyYW1zOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL3JjX2NhbGMuYzoxODA6
Njogd2FybmluZzogdmFyaWFibGUgc291cmNlX2JwcCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDk3YmRhMDMy
MmI4YSAoImRybS9hbWQvZGlzcGxheToKQWRkIERTQyBzdXBwb3J0IGZvciBOYXZpICh2MikiKQoK
UmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5
OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kc2MvcmNfY2FsYy5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
c2MvcmNfY2FsYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9yY19jYWxj
LmMKaW5kZXggY2E1MWU4My4uNzZjNGIxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RzYy9yY19jYWxjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RzYy9yY19jYWxjLmMKQEAgLTE3Nyw3ICsxNzcsNiBAQCB2b2lkIGNhbGNfcmNfcGFy
YW1zKHN0cnVjdCByY19wYXJhbXMgKnJjLCBlbnVtIGNvbG91cl9tb2RlIGNtLCBlbnVtIGJpdHNf
cGVyX2NvbQogewogCWZsb2F0IGJwcF9ncm91cDsKIAlmbG9hdCBpbml0aWFsX3htaXRfZGVsYXlf
ZmFjdG9yOwotCWludCBzb3VyY2VfYnBwOwogCWludCBwYWRkaW5nX3BpeGVsczsKIAlpbnQgaTsK
CkBAIC0yMTcsOCArMjE2LDYgQEAgdm9pZCBjYWxjX3JjX3BhcmFtcyhzdHJ1Y3QgcmNfcGFyYW1z
ICpyYywgZW51bSBjb2xvdXJfbW9kZSBjbSwgZW51bSBiaXRzX3Blcl9jb20KIAkJCXJjLT5pbml0
aWFsX3htaXRfZGVsYXkrKzsKIAl9CgotCXNvdXJjZV9icHAgPSBNT0RFX1NFTEVDVChicGMgKiAz
LCBicGMgKiAyLCBicGMgKiAxLjUpOwotCiAJcmMtPmZsYXRuZXNzX21pbl9xcCAgICAgPSAoKGJw
YyA9PSBCUENfOCkgPyAgKDMpIDogKChicGMgPT0gQlBDXzEwKSA/ICg3KSAgOiAoMTEpKSkgLSAo
KG1pbm9yX3ZlcnNpb24gPT0gMSAmJiBjbSA9PSBDTV80NDQpID8gMSA6IDApOwogCXJjLT5mbGF0
bmVzc19tYXhfcXAgICAgID0gKChicGMgPT0gQlBDXzgpID8gKDEyKSA6ICgoYnBjID09IEJQQ18x
MCkgPyAoMTYpIDogKDIwKSkpIC0gKChtaW5vcl92ZXJzaW9uID09IDEgJiYgY20gPT0gQ01fNDQ0
KSA/IDEgOiAwKTsKIAlyYy0+ZmxhdG5lc3NfZGV0X3RocmVzaCA9IDIgPDwgKGJwYyAtIDgpOwot
LQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
