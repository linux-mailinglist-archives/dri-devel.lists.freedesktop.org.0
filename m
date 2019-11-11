Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13AF6F67
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 09:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFFC6E846;
	Mon, 11 Nov 2019 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970236E111;
 Mon, 11 Nov 2019 03:38:44 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 08A98DFEDDAA9A8ACA21;
 Mon, 11 Nov 2019 11:38:41 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 11 Nov 2019
 11:38:32 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <rex.zhu@amd.com>, <evan.quan@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/powerplay: remove set but not used variable
 'vbios_version', 'data'
Date: Mon, 11 Nov 2019 11:45:55 +0800
Message-ID: <1573443956-76489-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573443956-76489-1-git-send-email-zhengbin13@huawei.com>
References: <1573443956-76489-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 11 Nov 2019 08:06:55 +0000
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
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jOiBJbiBmdW5jdGlvbiBzbXU3
X2NoZWNrX21jX2Zpcm13YXJlOgpkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9z
bXU3X2h3bWdyLmM6NDIxNToxMTogd2FybmluZzogdmFyaWFibGUgdmJpb3NfdmVyc2lvbiBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQpkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmM6IEluIGZ1bmN0aW9uIHNtdTdfZ2V0X3Bl
cmZvcm1hbmNlX2xldmVsOgpkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3
X2h3bWdyLmM6NTA1NDoyMTogd2FybmluZzogdmFyaWFibGUgZGF0YSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKJ3ZiaW9zX3ZlcnNpb24nIGlzIGludHJvZHVj
ZWQgYnkgY29tbWl0IDU5OWE3ZTlmZTFiNiAoImRybS9hbWQvcG93ZXJwbGF5OgppbXBsZW1lbnQg
c211NyBod21nciB0byBtYW5hZ2VyIGFzaWNzIHdpdGggc211IGlwIHZlcnNpb24gNy4iKSwKYnV0
IG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdC4KCidkYXRhJyBpcyBpbnRyb2R1Y2VkIGJ5IGNvbW1p
dCBmNjg4YjYxNGI2NDMgKCJkcm0vYW1kL3BwOgpJbXBsZW1lbnQgZ2V0X3BlcmZvcm1hbmNlX2xl
dmVsIGZvciBsZWdhY3kgZGdwdSIpLCBidXQgbmV2ZXIgdXNlZCwKc28gcmVtb3ZlIGl0LgoKUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6
aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3Ivc211N19od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211N19od21nci5jCmluZGV4IGM4MDVjNmYuLjc3NTM2NmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKQEAgLTQyMTgsNyArNDIxOCw2
IEBAIHN0YXRpYyBpbnQgc211N19jaGVja19tY19maXJtd2FyZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3
bWdyKQogewogCXN0cnVjdCBzbXU3X2h3bWdyICpkYXRhID0gKHN0cnVjdCBzbXU3X2h3bWdyICop
KGh3bWdyLT5iYWNrZW5kKTsKCi0JdWludDMyX3QgdmJpb3NfdmVyc2lvbjsKIAl1aW50MzJfdCB0
bXA7CgogCS8qIFJlYWQgTUMgaW5kaXJlY3QgcmVnaXN0ZXIgb2Zmc2V0IDB4OUYgYml0cyBbMzow
XSB0byBzZWUKQEAgLTQyMjcsNyArNDIyNiw2IEBAIHN0YXRpYyBpbnQgc211N19jaGVja19tY19m
aXJtd2FyZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCSAqLwoKIAlzbXU3X2dldF9tY19taWNy
b2NvZGVfdmVyc2lvbihod21ncik7Ci0JdmJpb3NfdmVyc2lvbiA9IGh3bWdyLT5taWNyb2NvZGVf
dmVyc2lvbl9pbmZvLk1DICYgMHhmOwoKIAlkYXRhLT5uZWVkX2xvbmdfbWVtb3J5X3RyYWluaW5n
ID0gZmFsc2U7CgpAQCAtNTA1NywxMyArNTA1NSwxMSBAQCBzdGF0aWMgaW50IHNtdTdfZ2V0X3Bl
cmZvcm1hbmNlX2xldmVsKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGNvbnN0IHN0cnVjdCBwcF9o
dwogCQkJCVBITV9QZXJmb3JtYW5jZUxldmVsICpsZXZlbCkKIHsKIAljb25zdCBzdHJ1Y3Qgc211
N19wb3dlcl9zdGF0ZSAqcHM7Ci0Jc3RydWN0IHNtdTdfaHdtZ3IgKmRhdGE7CiAJdWludDMyX3Qg
aTsKCiAJaWYgKGxldmVsID09IE5VTEwgfHwgaHdtZ3IgPT0gTlVMTCB8fCBzdGF0ZSA9PSBOVUxM
KQogCQlyZXR1cm4gLUVJTlZBTDsKCi0JZGF0YSA9IGh3bWdyLT5iYWNrZW5kOwogCXBzID0gY2Fz
dF9jb25zdF9waHdfc211N19wb3dlcl9zdGF0ZShzdGF0ZSk7CgogCWkgPSBpbmRleCA+IHBzLT5w
ZXJmb3JtYW5jZV9sZXZlbF9jb3VudCAtIDEgPwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
