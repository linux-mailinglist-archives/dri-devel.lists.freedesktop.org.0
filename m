Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8E1292DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779236E21D;
	Mon, 23 Dec 2019 08:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3F86EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191220120146euoutp01680d0602ada9ff7da189a468e2e24926~iEqIJfglK1021410214euoutp01H
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191220120146euoutp01680d0602ada9ff7da189a468e2e24926~iEqIJfglK1021410214euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576843306;
 bh=ottFIS2g2f1gTBdIXmtOFHs/1PpTz7Q1HbB6uCSxjhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=geNABEjIaOFXEsDfuCtb/8bRiOyRzMqgb1u7bFO99PqV24v/4xhZrvWo2wynGp1Qw
 80zQ1+esXMPoAXbVUhdyyN24TfbCOAQ9UG2avn2aW4IY+Ozjci3Snw+AKppMmhaMat
 otrXz1NBJ/JcOC57Y+pBBtYIGEswYPy+hUahdpig=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191220120146eucas1p277fcbaeb4927a426027d863a1b7fa318~iEqH5oQwq2774727747eucas1p2M;
 Fri, 20 Dec 2019 12:01:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C0.0F.61286.A28BCFD5; Fri, 20
 Dec 2019 12:01:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191220120146eucas1p25dada01c315215d18bb8a15e3173b52c~iEqHkkr5b2771427714eucas1p2-;
 Fri, 20 Dec 2019 12:01:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191220120146eusmtrp20bd7f72940e3e4eec57c60e3327bbce1~iEqHj4j7s2149221492eusmtrp22;
 Fri, 20 Dec 2019 12:01:46 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-e4-5dfcb82a814a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 07.87.08375.928BCFD5; Fri, 20
 Dec 2019 12:01:45 +0000 (GMT)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191220120145eusmtip2b65526bcbcb8592d3644f3e504e06f1f~iEqGuNs463105631056eusmtip2b;
 Fri, 20 Dec 2019 12:01:45 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 6/7] arm: dts: exynos: Add interconnects to
 Exynos4412 mixer
Date: Fri, 20 Dec 2019 12:56:52 +0100
Message-Id: <20191220115653.6487-7-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220115653.6487-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRTv2919aE0+p+lBy3LUHwWtxIIvirCIuEHF/rHIGDb1ppGu2lXL
 MPKBtpKWaOVcDyUixcjHqqmjQmy1huXQSgUNeyJGKWYKvlbb7qL++53ze5xz4HCU8g0dxR3V
 ZwsGvS5TxQTLbS9m3OvWts1rN4zVLSXDt0oQaTE30aT/1whNahzdNHk7Nc6QqidWhlQMl8uJ
 293Mkvr3EzSxfu6jyRv7DYZMXnIgYnY/lZH7jvcsGSysZ4i5cpRJwLy14QLDD/U9ZvjhMqeM
 f3DnHN8y1ibjTQ8bED9pjdGwScFb04TMo7mCYf22w8EZYzfPnbjCnh69Wk0VIA99EQVxgDdC
 /1szcxEFc0pcj6B53sb6CCX+hWCiPEwiJhE0vrzM/HU4Gl7QElGHoKd4jpUKr8PU0irzqRi8
 HSqufvAT4diBoLJ2XO4rKHxDBsYLdXKfKgwnwsfnZn+uHK+GoY7nfrcCE3AOlrPSvBVwr7mD
 8uEgvBkG3vVSkiYUXNVf/DmUV1P86Dol6SdYcNVFSngntBZVBfYOg2/Oh4HMZfC7vUYmYRG+
 tg/77wFcgMB61xEI2gJD3bNeM+cdsAaa7Oul9nYoLXGyvjbgEBj4ESqtEAIVtipKaivAWKqU
 oArs1SGSEaDoXl8gm4eerjKqHMVa/rvF8t8tln9jaxHVgCKFHDErXRDj9MIptajLEnP06erU
 41lW5H21Lo/zZxua6k3pRJhDqiWKhCNzWiWtyxXzsjoRcJQqXDFonNEqFWm6vDOC4XiyISdT
 EDtRNCdXRSrib49qlThdly0cE4QTguEvK+OCogrQPvX+V1Mjy62HVtl25KhnM/IbYyL2FmtS
 53BE/qJDqaUHdimeJR48nN+x2yTGxyZdN5bONZmi6bMxffsKPZ+slXuuBeUyHlOiY2GhO1s/
 zy62c7dW9n5HlugrS3uVo/xNTb0rLXlT9HiKe7qmsOxkf1zbrqfnn00/0eCyrtcJLpVczNDF
 raUMou4PvSE3m2YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xe7qaO/7EGqzdaG1xf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3WHH3I6vFpsfXWC0u75rDZvG59wij
 xYzz+5gs1h65y25xu3EFm8WMyS/ZHAQ8Nq3qZPO4c20Pm8f97uNMHpuX1HtsfLeDyaNvyypG
 j8+b5ALYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/Tt
 EvQy3s2tL5jCXvFy6kzmBsZ/rF2MnBwSAiYSR1YdA7OFBJYySnzpL4WIS0h8XH8DqkZY4s+1
 LrYuRi6gmk+MEocn9rCDJNgEHCUmTX3ADpIQETjFKLF1+Tk2kASzwAomif45wiC2sECwxPSu
 V2ANLAKqEncOHGUCsXkFLCSO357ADrFBXmL1hgPMIDangKXEjauXmCEuspDY+bkPql5Q4uTM
 JyxdjBxA89Ul1s8TglglL9G8dTbzBEbBWUiqZiFUzUJStYCReRWjSGppcW56brGhXnFibnFp
 Xrpecn7uJkZgrG479nPzDsZLG4MPMQpwMCrx8L5M/h0rxJpYVlyZe4hRgoNZSYT3dsfPWCHe
 lMTKqtSi/Pii0pzU4kOMpkCvTWSWEk3OB6aRvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJ
 JanZqakFqUUwfUwcnFINjKZ768qWXluQvDj27Swrkbxn0V89eDo1zCMa1rnIlF7h6QqUOdT6
 eXrF/jxdSYOTUueNZW2zw5UfMm0sPtHinflGJPCT9dMn+RyvG/gDznk1/y3Y/fdvQN7Nlx/y
 m+dzSf3sv9o292XX+XSNfz8PekwV6vt26abywanKQlIf35lkZa9Oy7oqrMRSnJFoqMVcVJwI
 ADa+5O7rAgAA
X-CMS-MailID: 20191220120146eucas1p25dada01c315215d18bb8a15e3173b52c
X-Msg-Generator: CA
X-RootMTR: 20191220120146eucas1p25dada01c315215d18bb8a15e3173b52c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120146eucas1p25dada01c315215d18bb8a15e3173b52c
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120146eucas1p25dada01c315215d18bb8a15e3173b52c@eucas1p2.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGFuICdpbnRlcmNvbm5lY3RzJyBwcm9wZXJ0eSB0byBFeHlub3M0NDEy
IERUUyBpbiBvcmRlciB0bwpkZWNsYXJlIHRoZSBpbnRlcmNvbm5lY3QgcGF0aCB1c2VkIGJ5IHRo
ZSBtaXhlci4gUGxlYXNlIG5vdGUgdGhhdCB0aGUKJ2ludGVyY29ubmVjdC1uYW1lcycgcHJvcGVy
dHkgaXMgbm90IG5lZWRlZCB3aGVuIHRoZXJlIGlzIG9ubHkgb25lIHBhdGggaW4KJ2ludGVyY29u
bmVjdHMnLCBpbiB3aGljaCBjYXNlIGNhbGxpbmcgb2ZfaWNjX2dldCgpIHdpdGggYSBOVUxMIG5h
bWUgc2ltcGx5CnJldHVybnMgdGhlIHJpZ2h0IHBhdGguCgpTaWduZWQtb2ZmLWJ5OiBBcnR1ciDF
mndpZ2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNDQxMi5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9leHlub3M0NDEyLmR0c2kKaW5kZXggNDg4Njg5NDczNzNlLi4xM2E2NzlhOWExMDcgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKQEAgLTc3MSw2ICs3NzEsNyBAQAogCWNsb2NrLW5h
bWVzID0gIm1peGVyIiwgImhkbWkiLCAic2Nsa19oZG1pIiwgInZwIjsKIAljbG9ja3MgPSA8JmNs
b2NrIENMS19NSVhFUj4sIDwmY2xvY2sgQ0xLX0hETUk+LAogCQkgPCZjbG9jayBDTEtfU0NMS19I
RE1JPiwgPCZjbG9jayBDTEtfVlA+OworCWludGVyY29ubmVjdHMgPSA8JmJ1c19kaXNwbGF5ICZi
dXNfZG1jPjsKIH07CiAKICZwbXUgewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
