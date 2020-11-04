Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC862A61D6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99A6E996;
	Wed,  4 Nov 2020 10:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A566E994
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:37:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201104103723euoutp02fb25d68941cc9542f187b65da911b19d~ER7zDAmRe2966229662euoutp02W
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:37:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201104103723euoutp02fb25d68941cc9542f187b65da911b19d~ER7zDAmRe2966229662euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604486243;
 bh=JVDzwKYDWs8UfRwIGBYBtNMVEUPNKijXopbFsSAO7ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jbvoaNOR1qfCiIIsDqrYgq5IRGtqNAtssqgABlAH9rD387MSsrlD51UGFAzZPspBt
 26h6SEZ5z+k3sQpVwt8kuUMfHHQ87HXls9+FhamsR0oZOdeuEXLp00YB6lCgKOQWER
 r4qmsMB4/Mr+TYTzv6BMekguxiokoup442nUop/E=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201104103722eucas1p19f219189819cdd57aa91ceb9a3e65b85~ER7yqrybB1564115641eucas1p1v;
 Wed,  4 Nov 2020 10:37:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id BB.8F.05997.26482AF5; Wed,  4
 Nov 2020 10:37:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5~ER7ybbYM92474024740eucas1p1Q;
 Wed,  4 Nov 2020 10:37:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104103722eusmtrp157280ff025fb2b2439ad5375e1ea529c~ER7yanSCp0613806138eusmtrp1U;
 Wed,  4 Nov 2020 10:37:22 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-7d-5fa284627140
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C2.64.06017.26482AF5; Wed,  4
 Nov 2020 10:37:22 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201104103721eusmtip26ce723cdd0acee79fb5b9f40f4703844~ER7xszX011402114021eusmtip2H;
 Wed,  4 Nov 2020 10:37:21 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH v8 3/7] MAINTAINERS: Add entry for Samsung interconnect drivers
Date: Wed,  4 Nov 2020 11:36:53 +0100
Message-Id: <20201104103657.18007-4-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104103657.18007-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3ZfXU2uy+qkUTQyKt+yTJ7SLEPofpICIRDKZl40nFa7alZC
 mu9Th+gHTctUCm1i2rIVmiU2nSW5orAia5SGGoXaFEojc7uT/PY/5/x/nP95eFhC+YbyYk+n
 pAraFLVGRctJU99vq39cbkPszi+1e7CtNg/hu1WtFH47M0bhG+ZBCr+ZnaRxZZeRxuW2MhJb
 rW0MNo4MUfh1xzUa20vNCFdZH8twi/kjgz9kN9E4r8vM4KffCyhcVTFBH/TgjYYimh8eekTz
 tmKLjL938zKvbzcg3m7ceISOkYfFC5rT6YI2MPykPLFEx5/9SWeM28yyLPSd0iE3FrhgWOib
 JnVIziq5JgTvR17SUjGDoL83H0mFHcHw5Bi5hFhaql1II4L6zwbCMXAis81JDk1zQVDaq0cO
 7clFQv7XWidAcIUEmB6WO4HV3FEw9d1zBiE5H5gruMI4tIILBd18oyvgJmhu63b63bgweGXP
 cXk84NnVUWciYtGTc7+GcCwAbpaB56ZGRoIj4f3EXZdeDd8s7S69AQYqSkgJyEFQ0vmBkYoy
 BDZLHZJcoTA8OLf4HOziiu3Q2hEotSPgevdt0tEGzh3e/fCQQrhDuamSkNoKKMxXSu4tMG+o
 lEnaC4pHF1wkD4W1mjK0uXrZNdXLrqn+v7YOEQa0TkgTkxMEcVeKcD5AVCeLaSkJAafOJBvR
 4l8b+GuZeYg6/sT1II5FqlWKblN9rJJSp4sXknsQsITKU3HoxcAJpSJefeGioD0Tq03TCGIP
 8mZJ1TrF7oaJ40ouQZ0qJAnCWUG7NJWxbl5ZKLAtM7rmVlTI0PBhPeRuPWb/RH5dU+j/JKQg
 qtU7iNnvk9G+Yu1KhfVwEuV7KTN8mujfRsVlPNP7prp1BnuxUz1tm+908BmDk0j/diry3AO/
 S+d0ey9H7NoZXcT4rX98Po/O37pPjPkV25tFrtFkkjlJB1rHfmfHV8ing/BEwLiKFBPVQTsI
 raj+B0iTP79nAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xe7pJLYviDb5OVbG4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
 gl5GT5dHwSe2ihf3jzA1ML5h7WLk5JAQMJE4vnYWSxcjF4eQwFJGiVmzlzB2MXIAJaQk5rco
 QdQIS/y51sUGUfOJUWLPjYUsIAk2AUOJ3qN9jCC2iICHxKnWtWBDmQVmMEucnmUKYgsL+Esc
 ezSFDcRmEVCV+NXexA5i8wpYS3T9Xg51hLzE6g0HmEFsTgEbiYufm8FqhIBqFj8/xwRRLyhx
 cuYTFpDbmAXUJdbPE4JYJS/RvHU28wRGwVlIqmYhVM1CUrWAkXkVo0hqaXFuem6xkV5xYm5x
 aV66XnJ+7iZGYKRuO/Zzyw7GrnfBhxgFOBiVeHgPbFsYL8SaWFZcmXuIUYKDWUmE1+ns6Tgh
 3pTEyqrUovz4otKc1OJDjKZAr01klhJNzgcmkbySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLp
 iSWp2ampBalFMH1MHJxSDYx+IS/qZ/mvYHSvSBJmXxu+7Makr82L7x7J7F95WOiKcmbm/nWx
 FyZ/2DqzUW562lV7w3WlGr8T1zzMqUxLYfuuqzzH4YvI55alvlmPNa6WFNzcssDqjeAM8UUb
 Oq5+mLB879Idz55bLuN5aPSlMWT55k+66sefH1zRuv6r6NSzE195B+86Ei9/TYmlOCPRUIu5
 qDgRACyFl5fqAgAA
X-CMS-MailID: 20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5
X-Msg-Generator: CA
X-RootMTR: 20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5@eucas1p1.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 myungjoo.ham@samsung.com, dri-devel@lists.freedesktop.org,
 s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1haW50YWluZXJzIGVudHJ5IGZvciB0aGUgU2Ftc3VuZyBpbnRlcmNvbm5lY3QgZHJpdmVy
cywgdGhpcyBjdXJyZW50bHkKaW5jbHVkZXMgRXh5bm9zIFNvQyBnZW5lcmljIGludGVyY29ubmVj
dCBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBTeWx3ZXN0ZXIgTmF3cm9ja2kgPHMubmF3cm9ja2lA
c2Ftc3VuZy5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHY3OgogLSBuZXcgcGF0Y2guCi0tLQogTUFJ
TlRBSU5FUlMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGU3MzYzNmIuLjRiYmFm
ZWYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC05MTU2LDYg
KzkxNTYsMTMgQEAgRjoJaW5jbHVkZS9kdC1iaW5kaW5ncy9pbnRlcmNvbm5lY3QvCiBGOglpbmNs
dWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oCiBGOglpbmNsdWRlL2xpbnV4L2ludGVy
Y29ubmVjdC5oCiAKK1NBTVNVTkcgSU5URVJDT05ORUNUIERSSVZFUlMKK006CVN5bHdlc3RlciBO
YXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KK006CUFydHVyIFN3aWdvxYQgPGEuc3dp
Z29uQHNhbXN1bmcuY29tPgorTDoJbGludXgtcG1Admdlci5rZXJuZWwub3JnCitTOglTdXBwb3J0
ZWQKK0Y6CWRyaXZlcnMvaW50ZXJjb25uZWN0L3NhbXN1bmcKKwogSU5WRU5TRU5TRSBJQ00tNDI2
eHggSU1VIERSSVZFUgogTToJSmVhbi1CYXB0aXN0ZSBNYW5leXJvbCA8am1hbmV5cm9sQGludmVu
c2Vuc2UuY29tPgogTDoJbGludXgtaWlvQHZnZXIua2VybmVsLm9yZwotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
