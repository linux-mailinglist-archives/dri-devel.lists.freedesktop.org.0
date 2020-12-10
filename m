Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B412D7153
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A3D6EC95;
	Fri, 11 Dec 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Thu, 10 Dec 2020 16:24:45 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ACF6EA9B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607617484;
 bh=RbB5v5ckMmMVLBuO4h4nv0LaMyl22jZh7Yg7N1OraqU=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=djgmsxXDV0RCgahwRsCEHs48FntQ67P3QVnJr2MfaTvich8tTI8ysNKzdG5dHuZZ1
 Bk7BsuLbyqtezafX8mBx/28VFSAMori4ysw6ow4p+od0tuHA4bd5ZEDq0RIQW3n+HB
 9ycPmKffH8Jd+6lsDorYodIzGxMcmPcUXBqh+k3Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.143.229]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MMEzJ-1kmaLo2uYH-0085qM; Thu, 10
 Dec 2020 17:17:09 +0100
To: linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Haiyang Zhang <haiyangz@microsoft.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?=5bPATCH=5d_video=3a_hyperv=5ffb=3a_Reduce_scope_for_the_?=
 =?UTF-8?B?dmFyaWFibGUg4oCccGFnZeKAnSBpbiBodmZiX2dldF9waHltZW0oKQ==?=
Message-ID: <d9e33aa4-19a7-e169-1da3-3d4b48f1417c@web.de>
Date: Thu, 10 Dec 2020 17:17:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:wtWOaEAAK/7ggzXbYs2wm3X81hOMSW+pDL/XqRmybj3L0m1GbdC
 0fUFgF2f8jyUu0WdYScQdLo83nEd4E2nw5TZzXPgWR4I8dIYGE5QoqkNSnqfioQDSgAqMva
 cmspeQP9dm3zcwFUKHfVGgdrGN0WxWefnJLW0rDjKglDuQdgj3SlUfc5i3TFnTe2e4h0FRi
 E121pMYJ/T6++mpVHOxLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cx+zacpPxug=:U32SO3VZOCW8mX03iKCpD/
 GxW+tdUVm4OANqyiUt9z5YlWyK5vKXuNtTrXHCCeiOfgaVlxi0tu5LusGBI+U5JhgLCBdHfyo
 8X3q4FtMFBaanp2rXDnuDqFURAN21ZKJn7wRoHfrA+/YM2ekZXJqROLmYSV8EkfucPXJHuGS9
 dfg/h+tGDyMp7Hx90l4mWvIDev1XKIkxsBdO4nI3n39xDL1IDRyURh1T/PnN7wzAP5UdiCf8Q
 9oNgErYIbZ9E9gt/+MCeZtWp49KCnljU8IRU3qfWZO4jVEUjlPSRMHxTxBbt8cY1U9iCRyPtI
 t4i2Dx9vol+EWwkB2qDizO37R8JYl5WGS9P85ADhHAB0EIdtg6IWMUaw7e7koXU9Tay6LyR/C
 new2ZaH3clslOS8/72LBd334jsQV+t6fEsdx+pYNRIhw+d1kmejiyEbALJ90O0xPSIQlxP0c2
 VKLm96DrN2OIPAzIK+MY5kbfuivjgQgwud7fjUeisdsKITxHAzI92O2BEEwkE8Gfs+OWYMxUb
 DzD0/VaOzLIV6z6XC31H/CV4cdTgO1I4329irZfLGDjEPyva4W7n0Er6Qdw3DFsLjm1d9T4yx
 yIQdt53NlNTMCHRqA5vQ4CfsQy87SucWuWb/Jl1paKREn4tZc+CPogyt8D+kfUaK1HxMK7Hm8
 M29IGzQDEMw6WWFPEI/sy4g83evsr8VVUzn+GDdYtD3Vm5n0lFPblx23YObjULGct445DVOwt
 UzLo3HXM6VkxUUhpCDhKerYcxb/CfP5GkrXpOURL9Lxs8ArSubCEuSxNOXlLYYQkbqkH+TJMM
 3uwRjPnkL4EfAJMjEKmgk6y/m/WrAJsN5UaIlb9iNvWFsMGWgOxoqqL7z6oQuGh92/W5qnFU6
 byf+stGCsO/KAk7dyVdQ==
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUaHUsIDEwIERlYyAyMDIwIDE3OjAwOjEzICswMTAwCgpBIGxvY2FsIHZhcmlhYmxlIHdhcyB1
c2VkIG9ubHkgd2l0aGluIGFuIGlmIGJyYW5jaC4KVGh1cyBtb3ZlIHRoZSBkZWZpbml0aW9uIGZv
ciB0aGUgdmFyaWFibGUg4oCccGFnZeKAnSBpbnRvIHRoZSBjb3JyZXNwb25kaW5nCmNvZGUgYmxv
Y2suCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0
d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMyArLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIGIvZHJpdmVycy92aWRlby9mYmRl
di9oeXBlcnZfZmIuYwppbmRleCBjOGIwYWU2NzY4MDkuLmUxOGZhODc5MzYwOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2h5cGVydl9mYi5jCkBAIC05NjEsNyArOTYxLDYgQEAgc3RhdGljIHZvaWQgaHZmYl9nZXRf
b3B0aW9uKHN0cnVjdCBmYl9pbmZvICppbmZvKQogc3RhdGljIHBoeXNfYWRkcl90IGh2ZmJfZ2V0
X3BoeW1lbShzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2LAogCQkJCSAgIHVuc2lnbmVkIGludCByZXF1
ZXN0X3NpemUpCiB7Ci0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSBOVUxMOwogCWRtYV9hZGRyX3QgZG1h
X2hhbmRsZTsKIAl2b2lkICp2bWVtOwogCXBoeXNfYWRkcl90IHBhZGRyID0gMDsKQEAgLTk3Miw3
ICs5NzEsNyBAQCBzdGF0aWMgcGh5c19hZGRyX3QgaHZmYl9nZXRfcGh5bWVtKHN0cnVjdCBodl9k
ZXZpY2UgKmhkZXYsCgogCWlmIChvcmRlciA8IE1BWF9PUkRFUikgewogCQkvKiBDYWxsIGFsbG9j
X3BhZ2VzIGlmIHRoZSBzaXplIGlzIGxlc3MgdGhhbiAyXk1BWF9PUkRFUiAqLwotCQlwYWdlID0g
YWxsb2NfcGFnZXMoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8sIG9yZGVyKTsKKwkJc3RydWN0IHBh
Z2UgKnBhZ2UgPSBhbGxvY19wYWdlcyhHRlBfS0VSTkVMIHwgX19HRlBfWkVSTywgb3JkZXIpOwog
CQlpZiAoIXBhZ2UpCiAJCQlyZXR1cm4gLTE7CgotLQoyLjI5LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
