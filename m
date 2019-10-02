Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A15C87B4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694E8897CD;
	Wed,  2 Oct 2019 12:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AE3897CD;
 Wed,  2 Oct 2019 12:02:21 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M26iv-1iI7En17CD-002Te9; Wed, 02 Oct 2019 14:02:16 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/6] drm/amdgpu: make pmu support optional, again
Date: Wed,  2 Oct 2019 14:01:22 +0200
Message-Id: <20191002120136.1777161-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191002120136.1777161-1-arnd@arndb.de>
References: <20191002120136.1777161-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:a5b90JQEWWEeBtwVRSZFjdGm9b3I8/kdLc+6ckDpRAohLoCOLNA
 Zt4AJ464Pz/isbP+TP5Kwc89OJD3wbonPMlq/qENKAvYZB1vR8s2mS577y7JdJA+FtGwNAm
 wv5IefPzHdJPWeBjXQg9O5pmwYi/FuswYNw0pL0xXRdmWyFBmcYgbalu8WPFx9G3U3VFOwc
 JV8P3sVH+zYNVEG8X0rNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gCX3Pclsid0=:2lnBRc1wB+VF4RSpdJj4pZ
 fUwT10GYvO0RsxFhbCUbiaYIcMydMqqMM56ICOu4Ar1iEzLA4bLtuE2kjxLk3E61oljDTaPkf
 wXWUN+FYoFQZQWg014b8ji+w/TzQmvBIydjneTRzjw9psnZOH3q5kd80JSSlTOnA5Jt67faFG
 SYCwOoaeaeEtyr/LzIBPSSiHFfWrZbolvAJf+P+OHRNrDttMBmClrSGBtWEHMIDhcCTWZCmH+
 KUwJthhWAqgwIsI8zMc3w6APokxYyO2Kk6mtyu6dbUxL+aI5wbfuFvVdargQIKy18Xl8AXRJQ
 Ar5fBn73URH/PbHM3bXFfH5owy4aqZQH1Wlmo2KX+5RuhkTt39ba/QWvPM/XvPqs2DrU1baxQ
 nb2CwF7ucyLT0T5sXzHUyHVxRXX6BEolSLzfLJVqgvIJJ2oL4l09qlg5XssKdoTaQ1vRXznKo
 F4yZjZir9RbLuE9lmQY0Vtq8aK0/4cjErS/JUIjIkIrKWtXg/TrklmkwdSW6uhZht8QP79+rR
 YiTKNAZNKZgZm67NQjHOA7Q0e11HtM8B/ofPgXvvw7jQ+x/zfD9oZHQ7vqOttg1o+lGBRbzck
 5zjXRHACBqPhJHjHWh5Vt3nfHftZs5meLjT4MX3KhCD0cl0b+/DYY38aaNnE/h9wkkK7tIm2N
 RFcnie4SKAfRNC+zeaTqhxo8Ev5EiDVg5ux1iynqkEof4uorAWjyW4tptFFCCdtP61kGptB8U
 uNvPiWYiK8Aimjr+Yvc8D8lnxzzHqeDhSu5CjfukuG/ZSylarKgsyDwQthMBs/jFRpZLNFlt5
 WJyAJYvPyrCxWFwePNBukYvFe8lg9gXEZagcgcVxUYOK2kUvaVa7GMOKNylTYpmjw6txrjPoa
 BhFwQrKLI3BWRiiXf1UQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, Huang Rui <ray.huang@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Luben Tuikov <Luben.Tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBDT05GSUdfUEVSRl9FVkVOVFMgaXMgZGlzYWJsZWQsIHdlIGNhbm5vdCBjb21waWxlIHRo
ZSBwbXUKcG9ydGlvbiBvZiB0aGUgYW1kZ3B1IGRyaXZlcjoKCmRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbXUuYzo0ODozODogZXJyb3I6IG5vIG1lbWJlciBuYW1lZCAnaHcnIGlu
ICdzdHJ1Y3QgcGVyZl9ldmVudCcKICAgICAgICBzdHJ1Y3QgaHdfcGVyZl9ldmVudCAqaHdjID0g
JmV2ZW50LT5odzsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+ICBe
CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzo1MToxMzogZXJyb3I6IG5v
IG1lbWJlciBuYW1lZCAnYXR0cicgaW4gJ3N0cnVjdCBwZXJmX2V2ZW50JwogICAgICAgIGlmIChl
dmVudC0+YXR0ci50eXBlICE9IGV2ZW50LT5wbXUtPnR5cGUpCiAgICAgICAgICAgIH5+fn5+ICBe
Ci4uLgoKVGhlIHNhbWUgYnVnIHdhcyBhbHJlYWR5IGZpeGVkIGJ5IGNvbW1pdCBkMTU1YmVmMDYz
NmUgKCJhbWRncHU6IG1ha2UgcG11CnN1cHBvcnQgb3B0aW9uYWwiKSBidXQgYnJva2VuIGFnYWlu
IGJ5IHdoYXQgbG9va3MgbGlrZSBhbiBpbmNvcnJlY3RseQpyZWJhc2VkIHBhdGNoLgoKRml4ZXM6
IDY0ZjU1ZTYyOTIzNyAoImRybS9hbWRncHU6IEFkZCBSQVMgRUVQUk9NIHRhYmxlLiIpClNpZ25l
ZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCmluZGV4
IDQyZTJjMWY1NzE1Mi4uMDA5NjJhNjU5MDA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtl
ZmlsZQpAQCAtNTQsNyArNTQsNyBAQCBhbWRncHUteSArPSBhbWRncHVfZGV2aWNlLm8gYW1kZ3B1
X2ttcy5vIFwKIAlhbWRncHVfZ3R0X21nci5vIGFtZGdwdV92cmFtX21nci5vIGFtZGdwdV92aXJ0
Lm8gYW1kZ3B1X2F0b21maXJtd2FyZS5vIFwKIAlhbWRncHVfdmZfZXJyb3IubyBhbWRncHVfc2No
ZWQubyBhbWRncHVfZGVidWdmcy5vIGFtZGdwdV9pZHMubyBcCiAJYW1kZ3B1X2dtYy5vIGFtZGdw
dV94Z21pLm8gYW1kZ3B1X2NzYS5vIGFtZGdwdV9yYXMubyBhbWRncHVfdm1fY3B1Lm8gXAotCWFt
ZGdwdV92bV9zZG1hLm8gYW1kZ3B1X3BtdS5vIGFtZGdwdV9kaXNjb3ZlcnkubyBhbWRncHVfcmFz
X2VlcHJvbS5vIHNtdV92MTFfMF9pMmMubworCWFtZGdwdV92bV9zZG1hLm8gYW1kZ3B1X2Rpc2Nv
dmVyeS5vIGFtZGdwdV9yYXNfZWVwcm9tLm8gc211X3YxMV8wX2kyYy5vCiAKIGFtZGdwdS0kKENP
TkZJR19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3BtdS5vCiAKLS0gCjIuMjAuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
