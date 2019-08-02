Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967497EF7E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16F26ED4C;
	Fri,  2 Aug 2019 08:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 531 seconds by postgrey-1.36 at gabe;
 Fri, 02 Aug 2019 08:40:22 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E9A6ED4C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:40:22 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20190802083128epoutp02c905dd26db86b79afce3d99d29bab0a5~3Deita1hL2580425804epoutp02A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:31:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20190802083128epoutp02c905dd26db86b79afce3d99d29bab0a5~3Deita1hL2580425804epoutp02A
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190802083128epcas1p22cb261f98be8d12fb6aa730514709b97~3Deic7FqU1853418534epcas1p2H;
 Fri,  2 Aug 2019 08:31:28 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 460L3d6CpXzMqYkg; Fri,  2 Aug
 2019 08:31:25 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 2F.17.04066.AD4F34D5; Fri,  2 Aug 2019 17:31:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190802083122epcas1p298fb8295a77e3adfa839eec619318591~3DedD7ft02569325693epcas1p2B;
 Fri,  2 Aug 2019 08:31:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190802083122epsmtrp2b3eab5e99ef77855b0a72f82709d8ff3~3Dec68GBg2981529815epsmtrp2r;
 Fri,  2 Aug 2019 08:31:22 +0000 (GMT)
X-AuditID: b6c32a37-e3fff70000000fe2-12-5d43f4da43a7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.8F.03706.AD4F34D5; Fri,  2 Aug 2019 17:31:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190802083122epsmtip2b37799ed9cda0981c2a7fef097fcacd1~3DecxKIVK0621006210epsmtip2H;
 Fri,  2 Aug 2019 08:31:22 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-fixes
Date: Fri,  2 Aug 2019 17:33:11 +0900
Message-Id: <1564734791-745-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGeXfddv3YuN5ZnSRFrxopTHed06toiYpI+YcUBAlrXtxlmvtq
 d36FkUJEmZWzAikqLQ3TwNA+NFR0QpKhJRiZCqaFqYFF6pBMavMq9d+Pc57nPIf3PThGdosD
 8UKznbOZWSMl8fF6PhipVE6upmtVixtJzJXR1yJmfO27hKl/2ydKxbJeuD6Js2YuD4myVjqC
 c7DcouQCjtVzthDOnG/RF5oNKdSRY7p0nSZeRSvpRCaBCjGzJi6FysjOUWYWGt1BVEgJayx2
 l3JYnqdiDibbLMV2LqTAwttTKM6qN1oTrdE8a+KLzYbofIspiVapYjVuYV5RwVTbNGZ1yssG
 Zz9LK9G6bzXyxoGIgyqHS1yNfHCS6ELQNHxX7GmQxE8EjzoMArsQfJs7sWOY37gmFQy9CBbO
 N2+7VxH01NVKPSoJEQGOlhmJhwOIABh6uLnFGJEJv5tHvKoRjiuIcOh3yD1lL7e8tX5J5GEZ
 kQbXnUtiISwYPo5ewjzzgXgvhsrbw1KhkQELN50igRWwNPR0ux4IK8u9EoFLYX55fisLiApw
 3SkTUA1jLXoPYkQktL+MEcSh0L1xBwlLymF5rUYsqGVw8QIpSCh4NTaBBAZ41+TYzsmCxaVZ
 qUdOElpob8urRUG3/s1vQKgV7easvMnA8bRV/f//dKCts4lK6EJPRrOdiMAR5Sdr+ZKmJcVs
 CV9uciLAMSpAdlWWriVlerb8DGez6GzFRo53Io375RxY4K58i/sIzXYdrYlVq9VMHB2voWlq
 j6xxndGShIG1c0UcZ+VsOz4R7h1Yiex+0xsPhvclr9+AuIjjfQ3IqGr0jWUWD0zVGFyKQWZi
 7+AI9qtNcS6ookHdfzIsYyA5/DAdprLypD3ufuXAIU7UUoViNaXhdR9GvzqXg9c2zypOy+ti
 cv88ji7p/HFK1/Rm9Si237/pXu9cT6fyWap/aBurWGCCIrIn5eOI8uILWDoKs/HsX/ewn1lM
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNJMWRmVeSWpSXmKPExsWy7bCSvO6tL86xBnN28Fn0njvJZHHl63s2
 ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgybq++w1xwiK/i8MPH7A2M
 P7i7GDk5JARMJJ797mfvYuTiEBLYzSgxZ/slxi5GDqCEhMSWrRwQprDE4cPFECWfGCUOtsxg
 AellE1CVmLjiPhuILSIgInF82V8wm1nAQ+L9ntXsIL3CAioSBybygYRZgMpXzXjFBGLzCjhJ
 TD70ihXiBDmJm+c6mScw8ixgZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcBFqa
 OxgvL4k/xCjAwajEwxtQ4RwrxJpYVlyZe4hRgoNZSYS3jxcoxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnPdp3rFIIYH0xJLU7NTUgtQimCwTB6dUA2OC0CHNxu/ighNmNp5tiZhXKMUmbeLw0kCI
 O17b7YJKqvq5FP0s7l7O2+dVMzyNI65Zb9dbrxec/6NIXmySwP41HG6S735Ye71YE67uy/G1
 yvp61P/Ys06tplNnLFaxfiJiP4mBP+6qnKWw/M7JCasCV6x6e0ZuR4AGn+nLdrvTk1ersr8y
 UmIpzkg01GIuKk4EADd7ITX+AQAA
X-CMS-MailID: 20190802083122epcas1p298fb8295a77e3adfa839eec619318591
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190802083122epcas1p298fb8295a77e3adfa839eec619318591
References: <CGME20190802083122epcas1p298fb8295a77e3adfa839eec619318591@epcas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564734688;
 bh=yqpuOWzrDPMFoZJsbFTNx74DMDad0yREIqUb6smTkoM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Uow61PUCBKS1r1H9wJwmJO6nETFZiHLwdI5h1vtekzrBiKd7+XX/69cQwEh/EcwBI
 DwZDHeWFAwdoj5nMFNfOinz9A4uvK8bJQDgTpGHSrz/KUbAIzfxlf4gVuYs+N3hg5U
 5OPsvbv51slumZX60I6jbesqOffRyyd4qMjdr71c=
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCiAgIEp1c3QgdHdvIGZpeHVwcyB3aGljaCBmaXhlcyB1bmRlZmluZWQgcmVmZXJl
bmNlIGVycm9yIHdpdGggTk9NTVUKICAgY29uZmlndXJhdGlvbiBhbmQgcG90ZW50aWFsIGluZmlu
aXRlIGlzc3VlIG9mIHNjYWxlciBtb2R1bGUsCiAgIGFuZCB0d28gdHJpdmlhbCBjbGVhbnVwcy4K
CiAgIFBsZWFzZSBraW5kbHkgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55IHByb2JsZW0uCgpU
aGFua3MsCklua2kgRGFlCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGY4OTgx
ZTAzMDllOTAwNGM2ZTg2ZDIxODA0OTA0NTcwMGM3OWQ3NDA6CgogIE1lcmdlIHRhZyAnbXNtLWZp
eGVzLTIwMTlfMDhfMDEnIG9mIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbXNt
IGludG8gZHJtLWZpeGVzICgyMDE5LTA4LTAyIDEwOjE3OjI1ICsxMDAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9kYWVpbmtpL2RybS1leHlub3MgdGFncy9leHlub3MtZHJtLWZp
eGVzLWZvci12NS4zLXJjMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFiYmJhYjA5
N2EwNTI3NmUzMTJkZDI0NjI3OTFkMzJiMjFjZWIxZWU6CgogIGRybS9leHlub3M6IGZpeCBtaXNz
aW5nIGRlY3JlbWVudCBvZiByZXRyeSBjb3VudGVyICgyMDE5LTA4LTAyIDE2OjUwOjE4ICswOTAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQotIFR3byBjbGVhbnVwIHBhdGNoZXMKICAuIHVzZSBkZXZfZ2V0X2RydmRhdGEg
Zm9yIHJlYWRhYmlsaXR5IGluc3RlYWQgb2YgcGxhdGZvcm1fZ2V0X2RydmRhdGEKICAuIHJlbW92
ZSByZWR1bmRhbnQgYXNzaWdubWVudCB0byBub2RlLgotIFR3byBmaXh1cCBwYXRjaGVzCiAgLiBm
aXggdW5kZWZpbmVkIHJlZmVyZW5jZSB0byAndm1mX2luc2VydF9taXhlZCcgd2l0aCBOT01NVSBj
b25maWd1cmF0aW9uLgogIC4gZml4IHBvdGVudGlhbCBpbmZpbml0ZSBzcGluIGlzc3VlIGJ5IGRl
Y3JlbWVudGluZyAncmV0cnknIHZhcmlhYmxlIGluCiAgICBzY2FsZXJfcmVzZXQgZnVuY3Rpb24g
b2YgZXh5bm9zX2RybV9zY2FsZXIuYwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBcm5kIEJlcmdtYW5uICgxKToKICAgICAg
ZHJtL2V4eW5vczogYWRkIENPTkZJR19NTVUgZGVwZW5kZW5jeQoKQ29saW4gSWFuIEtpbmcgKDIp
OgogICAgICBkcm0vZXh5bm9zOiByZW1vdmUgcmVkdW5kYW50IGFzc2lnbm1lbnQgdG8gcG9pbnRl
ciAnbm9kZScKICAgICAgZHJtL2V4eW5vczogZml4IG1pc3NpbmcgZGVjcmVtZW50IG9mIHJldHJ5
IGNvdW50ZXIKCkZ1cWlhbiBIdWFuZyAoMSk6CiAgICAgIGRybS9leHlub3M6IHVzaW5nIGRldl9n
ZXRfZHJ2ZGF0YSBkaXJlY3RseQoKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZyAgICAg
ICAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYyAg
IHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jICAgIHwgMiAr
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICAgIHwgMiArLQogZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3NjYWxlci5jIHwgNCArKy0tCiA1IGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
