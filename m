Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEA45ACC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 12:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BF0892EA;
	Fri, 14 Jun 2019 10:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2BA892EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 10:43:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190614104356euoutp02b8cee5be0c59299978d43e6d35402681~oCrNuZYOP1111511115euoutp020
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 10:43:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190614104356euoutp02b8cee5be0c59299978d43e6d35402681~oCrNuZYOP1111511115euoutp020
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190614104355eucas1p217c5dacecfec33cfdbd7887519d2a78a~oCrNGFicf1341513415eucas1p2Y;
 Fri, 14 Jun 2019 10:43:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C1.B6.04377.B6A730D5; Fri, 14
 Jun 2019 11:43:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190614104355eucas1p236ecb70b6d48f37508f3837cee49b19f~oCrMSQjgh1341513415eucas1p2W;
 Fri, 14 Jun 2019 10:43:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190614104354eusmtrp276153a14cefbc37a839d65795e31ef03~oCrMCznpo1815618156eusmtrp2v;
 Fri, 14 Jun 2019 10:43:54 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-70-5d037a6bf500
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.C6.04146.A6A730D5; Fri, 14
 Jun 2019 11:43:54 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190614104354eusmtip1e5cff7dccf3f6757a4b7145d8b5ae8e8~oCrL0oNKa1678516785eusmtip1h;
 Fri, 14 Jun 2019 10:43:54 +0000 (GMT)
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: pvr2fb: fix build warning when compiling as
 module
Message-ID: <2376f0a7-2511-b52d-c0d1-9162382f8693@samsung.com>
Date: Fri, 14 Jun 2019 12:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djP87rZVcyxBte2aFlc+fqezeJE3wdW
 i8u75rBZbN17ld2BxaPxxg02j/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4Mp4Nv8Za8EM9orz
 0xwbGH+zdjFyckgImEj8WPWaqYuRi0NIYAWjxMmXbxghnC+MEm2vdjJDOJ8ZJc7vusUG03Kr
 7whUy3JGiQUHtrNAOG8ZJbqfn2MHqRIRSJBYMX0GI4jNLKAt0fv2PTOIzSZgJTGxfRVYXFgg
 WGLHv0awQ3gF7CS+XW8Ds1kEVCWWbz/HAmKLCkRI3D+2AapGUOLkzCcsEDPFJW49mc8EYctL
 bH87B+xUCYHPbBJ/ni5jhDjVReLr3MssELawxKvjW9ghbBmJ/zvnM0E0rGOU+NvxAqp7O6PE
 8sn/oB61ljh8/CLQag6gFZoS63fpQ4QdJQ5v/cgGEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqE
 IKrVJDYs28AGs7Zr50pmCNtDYkbzCqYJjIqzkLw2C8lrs5C8NgvhhgWMLKsYxVNLi3PTU4uN
 8lLL9YoTc4tL89L1kvNzNzECU8rpf8e/7GDc9SfpEKMAB6MSD+8BK6ZYIdbEsuLK3EOMEhzM
 SiK886yZY4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUw
 rrp3fR2rvvlkSevDqhlVqY9OfdIw+LRpbd9V+2kHrk3cc8ZL9un7vk/Pdn6/1rd1a6Semuz2
 +BqLWx4lnJ+4q6Ll5x1PM3656mP2iWaLrnt7GapC8g4k/ZgWoLI0wsDz4I0T+Tukvlo5Zrpb
 VUfZx8aviX4ay2w70dv2aH1tCf+Fg0HS1ek5SizFGYmGWsxFxYkApOjzlyUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4Xd2sKuZYg70vjSyufH3PZnGi7wOr
 xeVdc9gstu69yu7A4tF44wabx/3u40wenzfJBTBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZ
 mVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GU8m/+MtWAGe8X5aY4NjL9Zuxg5OSQETCRu9R1h
 6mLk4hASWMoo8WXiIbYuRg6ghIzE8fVlEDXCEn+udbFB1LxmlFh0+z0bSEJEIEHi6ev5YDaz
 gLZE79v3zCA2m4CVxMT2VYwgtrBAsMSOf41gy3gF7CS+XW8Ds1kEVCWWbz/HAmKLCkRInHm/
 ggWiRlDi5MwnLBAz1SX+zLvEDGGLS9x6Mp8JwpaX2P52DvMERoFZSFpmIWmZhaRlFpKWBYws
 qxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjYduxn5t3MF7aGHyIUYCDUYmH94AVU6wQa2JZ
 cWXuIUYJDmYlEd551syxQrwpiZVVqUX58UWlOanFhxhNgR6ayCwlmpwPjNW8knhDU0NzC0tD
 c2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MRhVfHBUuTVK57xH3W9rR61jrP+bU
 A+ey9x7Ty2NPdtLY/F/T8+oVa009bT3j1XcmvQrRkfwfcl3NSzlpDU+keuij8pe8bL0J+1Qn
 V+WfFFyiE2S9V+H+gktX9t65vmz25p9P+TY99P3Jdd9h16Xd7pI+5xiVv0yKuB+wu/tYpV/Q
 /otMP6KNlFiKMxINtZiLihMBpVOgjZ0CAAA=
X-CMS-MailID: 20190614104355eucas1p236ecb70b6d48f37508f3837cee49b19f
X-Msg-Generator: CA
X-RootMTR: 20190614104355eucas1p236ecb70b6d48f37508f3837cee49b19f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190614104355eucas1p236ecb70b6d48f37508f3837cee49b19f
References: <CGME20190614104355eucas1p236ecb70b6d48f37508f3837cee49b19f@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560509036;
 bh=Zl7VnI5bsj4BuaNyNNSUeOVR4pqArffBJEh0eJbRbws=;
 h=To:Cc:From:Subject:Date:References:From;
 b=Ae1H5KsQQy+rjpQC3oXOlZ+Knk4zza9lc3lwkZLGm/7ikJQDgHtbwc68M4hPrztoV
 5/9FrpF0R5LfHEmSbpL/xKp9f0xHwxkHj0Ag8ce1K+ZqtTK8UeizwyPbKsFCzWVwBP
 PwvubvsZmNQhLEqozi7lIvS4wRSQDFzf3Z16cFyQ=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgI2lmbmRlZiBNT0RVTEUgYXJvdW5kIHB2cjJfZ2V0X3BhcmFtX3ZhbCgpLgoK
Rml4ZXM6IDBmNWE1NzEyYWQxZSAoInZpZGVvOiBmYmRldjogcHZyMmZiOiBhZGQgQ09NUElMRV9U
RVNUIHN1cHBvcnQiKQpSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1
Zy5vcmcuYXU+ClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9s
bmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5jIHwg
ICAgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKSW5kZXg6IGIvZHJpdmVy
cy92aWRlby9mYmRldi9wdnIyZmIuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvcHZyMmZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYwpAQCAtNzIyLDYg
KzcyMiw3IEBAIHN0YXRpYyBzdHJ1Y3QgZmJfb3BzIHB2cjJmYl9vcHMgPSB7CiAJLmZiX2ltYWdl
YmxpdAk9IGNmYl9pbWFnZWJsaXQsCiB9OwogCisjaWZuZGVmIE1PRFVMRQogc3RhdGljIGludCBw
dnIyX2dldF9wYXJhbV92YWwoY29uc3Qgc3RydWN0IHB2cjJfcGFyYW1zICpwLCBjb25zdCBjaGFy
ICpzLAogCQkJICAgICAgaW50IHNpemUpCiB7CkBAIC03MzMsNiArNzM0LDcgQEAgc3RhdGljIGlu
dCBwdnIyX2dldF9wYXJhbV92YWwoY29uc3Qgc3RydQogCX0KIAlyZXR1cm4gLTE7CiB9CisjZW5k
aWYKIAogc3RhdGljIGNoYXIgKnB2cjJfZ2V0X3BhcmFtX25hbWUoY29uc3Qgc3RydWN0IHB2cjJf
cGFyYW1zICpwLCBpbnQgdmFsLAogCQkJICBpbnQgc2l6ZSkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
