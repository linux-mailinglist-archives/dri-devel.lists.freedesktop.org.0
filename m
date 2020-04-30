Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A4D1BF178
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0469A6EB68;
	Thu, 30 Apr 2020 07:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FA76EA7C;
 Thu, 30 Apr 2020 03:33:44 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7AFE2C6733A4A1EB609E;
 Thu, 30 Apr 2020 11:33:38 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 11:33:29 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amd/display: remove set but not used variable
 'speakers' in dcn10_stream_encoder.c
Date: Thu, 30 Apr 2020 11:40:34 +0800
Message-ID: <20200430034034.106824-5-zhengbin13@huawei.com>
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3N0cmVhbV9lbmNvZGVyLmM6MTI3Nzox
MTogd2FybmluZzogdmFyaWFibGUg4oCYc3BlYWtlcnPigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkl0IGlzIGludHJvZHVjZWQgYnkgY29tbWl0IDBjNDE4
OTFjODFjMCAoImRybS9hbWQvZGlzcGxheToKUmVmYWN0b3Igc3RyZWFtIGVuY29kZXIgZm9yIEhX
IHJldmlldyIpLCBidXQgbmV2ZXIgdXNlZCwgc28gcmVtb3ZlIGl0LgoKUmVwb3J0ZWQtYnk6IEh1
bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGVuZyBCaW4gPHpo
ZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjEwL2RjbjEwX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggN2ViYTkzMzNjMzI4Li4wN2Iy
ZjkzOTk2NzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5jCkBAIC0xMjc0LDcgKzEyNzQsNiBAQCBz
dGF0aWMgdm9pZCBlbmMxX3NlX2F1ZGlvX3NldHVwKAogewogCXN0cnVjdCBkY24xMF9zdHJlYW1f
ZW5jb2RlciAqZW5jMSA9IERDTjEwU1RSRU5DX0ZST01fU1RSRU5DKGVuYyk7CgotCXVpbnQzMl90
IHNwZWFrZXJzID0gMDsKIAl1aW50MzJfdCBjaGFubmVscyA9IDA7CgogCUFTU0VSVChhdWRpb19p
bmZvKTsKQEAgLTEyODIsNyArMTI4MSw2IEBAIHN0YXRpYyB2b2lkIGVuYzFfc2VfYXVkaW9fc2V0
dXAoCiAJCS8qIFRoaXMgc2hvdWxkIG5vdCBoYXBwZW4uaXQgZG9lcyBzbyB3ZSBkb24ndCBnZXQg
QlNPRCovCiAJCXJldHVybjsKCi0Jc3BlYWtlcnMgPSBhdWRpb19pbmZvLT5mbGFncy5pbmZvLkFM
TFNQRUFLRVJTOwogCWNoYW5uZWxzID0gc3BlYWtlcnNfdG9fY2hhbm5lbHMoYXVkaW9faW5mby0+
ZmxhZ3Muc3BlYWtlcl9mbGFncykuYWxsOwoKIAkvKiBzZXR1cCB0aGUgYXVkaW8gc3RyZWFtIHNv
dXJjZSBzZWxlY3QgKGF1ZGlvIC0+IGRpZyBtYXBwaW5nKSAqLwotLQoyLjI2LjAuMTA2Lmc5ZmFk
ZWRkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
