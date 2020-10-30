Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412C2A05DC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 13:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8166EDD7;
	Fri, 30 Oct 2020 12:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD336EDD8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:53:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201030125306euoutp016c00d071fb880cfe86040f648ab8ed72~Cxj3YHfSE0156101561euoutp01T
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:53:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201030125306euoutp016c00d071fb880cfe86040f648ab8ed72~Cxj3YHfSE0156101561euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604062386;
 bh=cRQaPfG8BF7tRwg45YbYTx6wg+Bhj1IaUDssAJxWNEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WnUZCY/aeb9g1nEJ9jr5bvnp4Wv2L3nw+7eUXdWzV69gWUetPHqNqJkyT2zjMXAm6
 l+kQuGT5GWa1dwgUEq7RQnOr8+L8rb2Cn7Hb5mJXRkaSALdWH9IXsE8+pOOGhePSVv
 ixuC4Fg4W5piCJjlQ9yGoeEx99Wdc+iMAmFr7S44=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201030125305eucas1p200f9fc11dbb07ba033d8b80accae8e0e~Cxj3JChtj0096900969eucas1p2I;
 Fri, 30 Oct 2020 12:53:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1F.02.06318.1BC0C9F5; Fri, 30
 Oct 2020 12:53:05 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201030125305eucas1p2d61ba397d77a72e0d1dce8d30b278e16~Cxj2rYcgx0100501005eucas1p2K;
 Fri, 30 Oct 2020 12:53:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201030125305eusmtrp17870df56fb80be2752bd73c53af85b9c~Cxj2qsCNk0319303193eusmtrp16;
 Fri, 30 Oct 2020 12:53:05 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-dc-5f9c0cb1d384
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FA.3A.06314.1BC0C9F5; Fri, 30
 Oct 2020 12:53:05 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201030125304eusmtip2528da988a0f7422cf8f75a53af6e05ba~Cxj1-vJID1609116091eusmtip2H;
 Fri, 30 Oct 2020 12:53:04 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH v7 4/6] ARM: dts: exynos: Add interconnect properties to
 Exynos4412 bus nodes
Date: Fri, 30 Oct 2020 13:51:47 +0100
Message-Id: <20201030125149.8227-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030125149.8227-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0iTURjGOfv2XZRmpyn1Ypm1LmThraJOKaFhtIIgqL+iWks/VHImW1Z2
 Ec003dRsBtq8rRXlJVGHqZiKOW2K5ahMI41VmGUpFkvCrMz1afnf733O85z3fQ+Ho6RdtCcX
 HXuKV8cqY2SMq7ju0WSPb82CQkXA06KtxF6cikhNfhVN+r99oElJew9NeifGGZLXbGaI3p4j
 JjZbNUueNxYyxJHVjki+rUVEKttfs2QguZQhqc3tLLGMXqFJfu4IE4Ll5vIMRj7Y18TI7Tqr
 SJ5dW47kDvPy/fQh1+AIPib6NK/233HMNarvWT8dl4fPdt4oYJNQpkSLOA7wZriVJtYiV06K
 SxEYpy20UHxD0J2SwQqFA8HN77dFc4mn9ZSg30Uwda+G+pewVZfNJFw4BgdCVkc2crIHDoO0
 98ViJ1P4nQhSSignu2MFGBxvGCeL8RrIudTLOhtI8HbQ9rs7ZcDeUFHd+tfugoNAm/FS5GQJ
 XgRdN4Zmr/SGlPsFlOAfYWG89bzAYaCzlCGB3eGTtZYVeBl052b+XRlwCoLMBwOsUOQgsFuN
 s4kgGOz5wTgHorAPVDX6C3IoPLZUssJDuMHLsUXCDG6gr8ujBFkC6WlSwb0apsrzRAJ7gm5o
 WiywHEymYSoHrTTM28YwbxvD/75GRJWjJXy8RhXJazbF8mf8NEqVJj420i/8pMqMZj5Y92/r
 RANq+Xm8DWEOyRZIQrwLFFJaeVqToGpDwFEyD8nOJ91HpZIIZcI5Xn1SoY6P4TVtaCknli2R
 bDKNHJHiSOUp/gTPx/HquVMR5+KZhDoXD392a6vdvXdyeKjk09T1w+u2Ne8LDzJdfrFMX/R1
 8uHXLR87Es/oGscuKL0OGO58SWrCXtaE/cVdJHijUT9UZe5Y6X3loP7qqwB9j65+bXqoRXft
 enJm4uf836vQHm1CyK9nB3ddtG1wwcM+vg0Vib9CPijsneMLV7yOe1sxNpolE2uilIHrKbVG
 +Qepn62gXAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7obeebEG5zcI2Fxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFscftPOajFj8ks2BwGPTas62TzuXNvD5nG/+ziTR9+WVYwenzfJBbBG6dkU
 5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GVcu3SdtWC6
 QMWJmbPZGxh7eLsYOTgkBEwkLm5n7mLk4hASWMoocXbzJzaIuJTE/BalLkZOIFNY4s+1LjaI
 mk9ANT/XMYMk2AQMJXqP9jGC2CICHhKnWteyghQxC3xgklj7oBcsISwQK/G2ewmYzSKgKjGh
 6Qo7yAJeASuJruvCEAvkJVZvOAA2k1PAWqKr8wYTSIkQUMnbA1UgYV4BQYmTM5+wgISZBdQl
 1s8TAgkzA3U2b53NPIFRcBaSqlkIVbOQVC1gZF7FKJJaWpybnltsqFecmFtcmpeul5yfu4kR
 GJXbjv3cvIPx0sbgQ4wCHIxKPLwO8rPjhVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9f
 VJqTWnyI0RTosYnMUqLJ+cCEkVcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUI
 po+Jg1OqgbEz48M6/ckxU4SN45MXndu94cIi9qXvo74uaHLZmr3p9J5d9qxZyf1p9dv6eg1Y
 misufCs1zfdfuGT7jAMK3x7WKb5kYTh342GreZrvY7YPCn0rp9QcyH8VqXPjnqezsNK3PVvM
 5a9VZM44HTNnD4veS4trVYvWeVy8ZHTC3/biMze9NRlT9fYqsRRnJBpqMRcVJwIAVBPJbOAC
 AAA=
X-CMS-MailID: 20201030125305eucas1p2d61ba397d77a72e0d1dce8d30b278e16
X-Msg-Generator: CA
X-RootMTR: 20201030125305eucas1p2d61ba397d77a72e0d1dce8d30b278e16
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201030125305eucas1p2d61ba397d77a72e0d1dce8d30b278e16
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125305eucas1p2d61ba397d77a72e0d1dce8d30b278e16@eucas1p2.samsung.com>
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
 s.nawrocki@samsung.com, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBmb3IgRXh5bm9zNDQxMiBp
bnRlcmNvbm5lY3QKYnVzIG5vZGVzOgogLSBpbnRlcmNvbm5lY3RzOiB0byBkZWNsYXJlIGNvbm5l
Y3Rpb25zIGJldHdlZW4gbm9kZXMgaW4gb3JkZXIgdG8KICAgZ3VhcmFudGVlIFBNIFFvUyByZXF1
aXJlbWVudHMgYmV0d2VlbiBub2RlcywKIC0gI2ludGVyY29ubmVjdC1jZWxsczogcmVxdWlyZWQg
YnkgdGhlIGludGVyY29ubmVjdCBmcmFtZXdvcmssCiAtIHNhbXN1bmcsZGF0YS1jbGstcmF0aW86
IHdoaWNoIGFsbG93cyB0byBzcGVjaWZ5IG1pbmltdW0gZGF0YSBjbG9jawogICBmcmVxdWVuY3kg
Y29ycmVzcG9uZGluZyB0byByZXF1ZXN0ZWQgYmFuZHdpZHRoIGZvciBlYWNoIGJ1cy4KCk5vdGUg
dGhhdCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvIGFuZCBub2RlIElEcyBhcmUg
bm90CmhhcmRjb2RlZCBhbnl3aGVyZS4KClNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxh
LnN3aWdvbkBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxz
Lm5hd3JvY2tpQHNhbXN1bmcuY29tPgotLS0KQ2hhbmdlcyBmb3Igdjc6CiAtIGFkanVzdGVkIHRv
IHRoZSBEVCBwcm9wZXJ0eSBjaGFuZ2VzOiAiaW50ZXJjb25uZWN0cyIgaW5zdGVhZAogICBvZiAi
c2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50IiwgInNhbXN1bmcsZGF0YS1jbGstcmF0aW8iCiAg
IGluc3RlYWQgb2YgImJ1cy13aWR0aCIuCgpDaGFuZ2VzIGZvciB2NjoKIC0gYWRkZWQgYnVzLXdp
ZHRoIHByb3BlcnR5IGluIGJ1c19kbWMgbm9kZS4KCkNoYW5nZXMgZm9yIHY1OgogLSBhZGp1c3Qg
dG8gcmVuYW1lZCBleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlIHByb3BlcnR5LAogLSBh
ZGQgcHJvcGVydGllcyBpbiBjb21tb24gZXh5bm9zNDQxMi5kdHNpIGZpbGUgcmF0aGVyIHRoYW4K
ICAgaW4gT2Ryb2lkIHNwZWNpZmljIG9kcm9pZDQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpLgotLS0K
IGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSB8IDYgKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNDQxMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCmluZGV4IGU3
Njg4MWQuLjQ5OTllNjggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIu
ZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKQEAgLTM4Myw2ICsz
ODMsOCBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRElWX0RNQz47CiAJCQljbG9jay1uYW1l
cyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2RtY19vcHBfdGFibGU+
OworCQkJc2Ftc3VuZyxkYXRhLWNsb2NrLXJhdGlvID0gPDQ+OworCQkJI2ludGVyY29ubmVjdC1j
ZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKQEAgLTQ1Miw2ICs0
NTQsOCBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRElWX0dETD47CiAJCQljbG9jay1uYW1l
cyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2xlZnRidXNfb3BwX3Rh
YmxlPjsKKwkJCWludGVyY29ubmVjdHMgPSA8JmJ1c19kbWM+OworCQkJI2ludGVyY29ubmVjdC1j
ZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKQEAgLTQ2OCw2ICs0
NzIsOCBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfQUNMSzE2MD47CiAJCQljbG9jay1uYW1l
cyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2Rpc3BsYXlfb3BwX3Rh
YmxlPjsKKwkJCWludGVyY29ubmVjdHMgPSA8JmJ1c19sZWZ0YnVzICZidXNfZG1jPjsKKwkJCSNp
bnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9Owog
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
