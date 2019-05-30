Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462E2FB94
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 14:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863B76E33C;
	Thu, 30 May 2019 12:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2493D6E33C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 12:30:18 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190530123017euoutp017212d3dd09e7c2e716dc5cbb437b0d22~jdcyMGZt91557515575euoutp01V
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 12:30:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190530123017euoutp017212d3dd09e7c2e716dc5cbb437b0d22~jdcyMGZt91557515575euoutp01V
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190530123017eucas1p2c5af602281ac3b3f30663bd705a5986f~jdcx3d3852345123451eucas1p2P;
 Thu, 30 May 2019 12:30:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 19.2F.04325.8DCCFEC5; Thu, 30
 May 2019 13:30:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61~jdcxGWxd90451604516eucas1p2a;
 Thu, 30 May 2019 12:30:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190530123015eusmtrp195d81c13e4784a1c2aef07b057426f84~jdcw22ISC1402014020eusmtrp17;
 Thu, 30 May 2019 12:30:15 +0000 (GMT)
X-AuditID: cbfec7f5-fbbf09c0000010e5-4b-5cefccd852ad
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.88.04146.7DCCFEC5; Thu, 30
 May 2019 13:30:15 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190530123015eusmtip2b655394a251cc6ef2a9636882a39000a~jdcwYkvkm2162821628eusmtip2H;
 Thu, 30 May 2019 12:30:15 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3] video: fbdev: atmel_lcdfb: add COMPILE_TEST support
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <69cd6b8b-1fd1-86fa-2070-99d0ce15a868@samsung.com>
Date: Thu, 30 May 2019 14:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87o3zryPMehaqmvR/m4Zu8WVr+/Z
 LDY9vsZqcaLvA6vF5V1z2CxerL3OarF980JmB3aPeWuqPe53H2fy2Lyk3uPOj6WMHp83yQWw
 RnHZpKTmZJalFunbJXBlHP2xmK3gFn/F/c5JzA2M83m7GDk5JARMJO7+bmfpYuTiEBJYwSjR
 /Og/E4TzhVHi9srprBDOZ0aJNe+72WBaJlzrZYNILGeUOPXtB1TVW0aJV5OnsoJUsQlYSUxs
 X8UIYgsLuEu8bfkMNJeDQ0RAX+JPlyJIPbPAJ0aJ9llrwWp4Bewkfp1bCraBRUBVonHnPxYQ
 W1QgQuL+sQ2sEDWCEidnPgGLMwuIS9x6Mp8JwpaX2P52DjPIUAmB6ewSD1q2s0Kc6iKx7cVa
 JghbWOLV8S3sELaMxOnJPSwQDesYJf52vIDq3s4osXzyP6hHrSUOH7/ICnI2s4CmxPpd+hBh
 R4kfXR8ZQcISAnwSN94KQhzBJzFp23RmiDCvREebEES1msSGZRvYYNZ27VzJDGF7SLzY+YZ1
 AqPiLCSvzULy2iwkr81CuGEBI8sqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwBR0+t/x
 rzsY9/1JOsQowMGoxMMrcPB9jBBrYllxZe4hRgkOZiUR3p/L38UI8aYkVlalFuXHF5XmpBYf
 YpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYEzblCu+7eCjLJPZUgu7n7Ht8m9bPtFG
 uWJeBe/Bsxp+bXf39z6/o1F86JfY1/ZP3rZ+ffq+6de3NO9TD9EW2fGOc3n3j35LkVMS01xi
 qzK/Mz7b7VEx460jz9yj6ivcXi9XFrJfp+g8z2HqmfgqY/dcZwXVLT88jsTMSGs5I/pu6veI
 Sx7JD5RYijMSDbWYi4oTAbcRiMo9AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7rXz7yPMZi339ii/d0ydosrX9+z
 WWx6fI3V4kTfB1aLy7vmsFm8WHud1WL75oXMDuwe89ZUe9zvPs7ksXlJvcedH0sZPT5vkgtg
 jdKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLOPpj
 MVvBLf6K+52TmBsY5/N2MXJySAiYSEy41svWxcjFISSwlFFiZ+Me9i5GDqCEjMTx9WUQNcIS
 f651QdW8ZpTYun8DK0iCTcBKYmL7KkYQW1jAXeJty2cmkF4RAX2JP12KIPXMAp8YJX49bwer
 4RWwk/h1bikbiM0ioCrRuPMfC4gtKhAhceb9ChaIGkGJkzOfgNnMAuoSf+ZdYoawxSVuPZnP
 BGHLS2x/O4d5AqPALCQts5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiB
 8bPt2M/NOxgvbQw+xCjAwajEwytw8H2MEGtiWXFl7iFGCQ5mJRHen8vfxQjxpiRWVqUW5ccX
 leakFh9iNAV6aCKzlGhyPjC280riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB
 9DFxcEo1MOavrM9Tz6twK9dhe+n6QnzP5X+PXUoeHVTp5mMOUeL5+H5Ni4RlymG22nkKveFX
 eZX/t0tHVd8SO7lZ2+XKyVVPv9ZYm/zce93pLsMV501X153fvDMtXfRNdMbribNUjZQutvBM
 m/j2iEZMCAvT9Gc1ZRJn2GKPaBXnfPd/9HX2UgVv1cyWJUosxRmJhlrMRcWJAIrKAuG1AgAA
X-CMS-MailID: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
X-Msg-Generator: CA
X-RootMTR: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190530123016eucas1p2e18747b8ac1d156657232eab52876a61
References: <CGME20190530123016eucas1p2e18747b8ac1d156657232eab52876a61@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559219417;
 bh=rRfb4nIQIlulai7VhUp6tUgeds7+T13bxgzJ6lGHQr0=;
 h=From:Subject:To:Cc:Date:References:From;
 b=HTnrnE85RKKW4euGLPzcyYUYxL/R+LhA6OJiSSo1VrdcnvSUHr2qAy8nsdo43L+zP
 BnVorvltXUY0QdH0KIhkqh61tS82mHxtNAp5hCQoeWwZ6PgB1iOcP9UWab9jyC6Kt3
 hGgK3F0cIpGhX5mswgfuE9plJUAXGbLRdofQ9M3M=
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIGF0bWVsX2xjZGZiIGRyaXZlciBmb3IgYmV0dGVy
IGNvbXBpbGUKdGVzdGluZyBjb3ZlcmFnZS4KCldoaWxlIGF0IGl0IGZpeCBpbXByb3BlciB1c2Ug
b2YgVUwgKHRvIHNpbGVuY2UgYnVpbGQgd2FybmluZ3Mgb24KeDg2XzY0KS4KCkNjOiBBbGV4YW5k
cmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+CkNjOiBMdWRvdmljIERl
c3JvY2hlcyA8bHVkb3ZpYy5kZXNyb2NoZXNAbWljcm9jaGlwLmNvbT4KU2lnbmVkLW9mZi1ieTog
QmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgotLS0K
djM6IGZpeCBidWlsZCB3YXJuaW5ncyBvbiB4ODZfNjQKCnYyOiBhZGQgbWlzc2luZyBIQVZFX0NM
SyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzCgogZHJpdmVycy92aWRlby9mYmRldi9LY29uZmln
ICAgICAgIHwgICAgMyArKy0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYyB8ICAg
IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29u
ZmlnCkBAIC04NTUsNyArODU1LDggQEAgY29uZmlnIEZCX1MxRDEzWFhYCiAKIGNvbmZpZyBGQl9B
VE1FTAogCXRyaXN0YXRlICJBVDkxIExDRCBDb250cm9sbGVyIHN1cHBvcnQiCi0JZGVwZW5kcyBv
biBGQiAmJiBPRiAmJiBIQVZFX0ZCX0FUTUVMCisJZGVwZW5kcyBvbiBGQiAmJiBPRiAmJiBIQVZF
X0NMSyAmJiBIQVNfSU9NRU0KKwlkZXBlbmRzIG9uIEhBVkVfRkJfQVRNRUwgfHwgQ09NUElMRV9U
RVNUCiAJc2VsZWN0IEZCX0JBQ0tMSUdIVAogCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QKIAlzZWxl
Y3QgRkJfQ0ZCX0NPUFlBUkVBCkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNk
ZmIuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYwor
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0bWVsX2xjZGZiLmMKQEAgLTY3Myw3ICs2NzMsNyBA
QCBzdGF0aWMgaW50IGF0bWVsX2xjZGZiX3NldF9wYXIoc3RydWN0IGZiCiAJbGNkY193cml0ZWwo
c2luZm8sIEFUTUVMX0xDRENfTVZBTCwgMCk7CiAKIAkvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1cHRz
ICovCi0JbGNkY193cml0ZWwoc2luZm8sIEFUTUVMX0xDRENfSURSLCB+MFVMKTsKKwlsY2RjX3dy
aXRlbChzaW5mbywgQVRNRUxfTENEQ19JRFIsIH4wVSk7CiAJLyogRW5hYmxlIEZJRk8gJiBETUEg
ZXJyb3JzICovCiAJbGNkY193cml0ZWwoc2luZm8sIEFUTUVMX0xDRENfSUVSLCBBVE1FTF9MQ0RD
X1VGTFdJIHwgQVRNRUxfTENEQ19PV1JJIHwgQVRNRUxfTENEQ19NRVJJKTsKIApAQCAtMTI5MSw3
ICsxMjkxLDcgQEAgc3RhdGljIGludCBhdG1lbF9sY2RmYl9zdXNwZW5kKHN0cnVjdCBwbAogCSAq
IFdlIGRvbid0IHdhbnQgdG8gaGFuZGxlIGludGVycnVwdHMgd2hpbGUgdGhlIGNsb2NrIGlzCiAJ
ICogc3RvcHBlZC4gSXQgbWF5IHRha2UgZm9yZXZlci4KIAkgKi8KLQlsY2RjX3dyaXRlbChzaW5m
bywgQVRNRUxfTENEQ19JRFIsIH4wVUwpOworCWxjZGNfd3JpdGVsKHNpbmZvLCBBVE1FTF9MQ0RD
X0lEUiwgfjBVKTsKIAogCXNpbmZvLT5zYXZlZF9sY2Rjb24gPSBsY2RjX3JlYWRsKHNpbmZvLCBB
VE1FTF9MQ0RDX0NPTlRSQVNUX0NUUik7CiAJbGNkY193cml0ZWwoc2luZm8sIEFUTUVMX0xDRENf
Q09OVFJBU1RfQ1RSLCAwKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
