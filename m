Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3AD87C4B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 16:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756FC6EE0E;
	Fri,  9 Aug 2019 14:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5966EE0E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 14:07:39 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190809140737euoutp02f12d7b1c5ba54ea31b3598fdb5c81492~5RlCrRHKD0681706817euoutp02V
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 14:07:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190809140737euoutp02f12d7b1c5ba54ea31b3598fdb5c81492~5RlCrRHKD0681706817euoutp02V
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190809140737eucas1p1e959583176472bdb9eefd482d81cbb9c~5RlCXT8yp2256822568eucas1p1i;
 Fri,  9 Aug 2019 14:07:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 12.05.04374.92E7D4D5; Fri,  9
 Aug 2019 15:07:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190809140736eucas1p2b14d3205aa7268cd1a6bba15ebd81066~5RlBifsfV1267712677eucas1p2R;
 Fri,  9 Aug 2019 14:07:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190809140736eusmtrp25a5aa358440e2c8dbce4df151fe11564~5RlBUf1m11842018420eusmtrp2L;
 Fri,  9 Aug 2019 14:07:36 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-31-5d4d7e2931fe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.2F.04117.82E7D4D5; Fri,  9
 Aug 2019 15:07:36 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190809140735eusmtip1a7fdab549a7159935ceec23e0249cfa8~5RlBBJkpv1392113921eusmtip1H;
 Fri,  9 Aug 2019 14:07:35 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [GIT PULL] fbdev fix for v5.3-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <22bfe177-272e-afe8-31d1-75bc0cf852c7@samsung.com>
Date: Fri, 9 Aug 2019 16:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djPc7qadb6xBps+c1lc+fqezeJE3wdW
 i8u75rBZPOp7y+7A4nFixm8Wj/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4MpYtvYAc8Fejoob
 R7wbGHvYuxg5OSQETCS2buxn6mLk4hASWMEoMXXDSzYI5wujxMdbFxghnM+MEhvmfGGBaZnx
 bg5UYjmjRE97JwuE85ZRYvnRLWCD2QSsJCa2r2IEsYUFtCQOrpjBDGKLCBhJfH5xhRXEZhZI
 kPhy8zNQnIODV8BO4sZVfZAwi4CKxI1DH5lAbFGBCIn7xzaAlfMKCEqcnPmEBaJVXOLWk/lM
 ELa8xPa3c5hBbpAQ+M4mseZpJyvEpS4SF3ctYIawhSVeHd8C9bSMxP+d85kgGtYxSvzteAHV
 vR3og8n/2CCqrCUOH7/ICnIds4CmxPpd+iCmhICjxN1VwRAmn8SNt4IQN/BJTNo2nRkizCvR
 0SYEMUNNYsOyDWwwW7t2roS6xkOi98VZ9gmMirOQfDYLyWezkHw2C+GEBYwsqxjFU0uLc9NT
 i43zUsv1ihNzi0vz0vWS83M3MQLTyel/x7/uYNz3J+kQowAHoxIPb4OiT6wQa2JZcWXuIUYJ
 DmYlEd4rHL6xQrwpiZVVqUX58UWlOanFhxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODil
 Ghgrbx/mq59VnF1gNbmIw2thZMqV39zln9+py2We9VXKXS9eFDxz27yZieyOlzO/a7EJx4ZP
 PhSs6MfhZ1+74Iy7z/8Eo5XbD13L+Jj6Jr2nU6e9/K7F89WmNw1+nH904seXZHOPld35bqpT
 BL7EnyuyeXV4457DP8qO3lz+qm/3sy7Ht3vzF7EosRRnJBpqMRcVJwIAqDr+hiMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV2NOt9Yg1ePeCyufH3PZnGi7wOr
 xeVdc9gsHvW9ZXdg8Tgx4zeLx/3u40wenzfJBTBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZ
 mVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GUsW3uAuWAvR8WNI94NjD3sXYycHBICJhIz3s1h
 BLGFBJYySrybkNbFyAEUl5E4vr4MokRY4s+1LrYuRi6gkteMEieeLWcDSbAJWElMbF8F1iss
 oCVxcMUMZhBbRMBI4vOLK6wgNrNAgsSm+1PZQGbyCthJ3LiqDxJmEVCRuHHoIxOILSoQIXHm
 /QoWEJtXQFDi5MwnLBCt6hJ/5l1ihrDFJW49mc8EYctLbH87h3kCo8AsJC2zkLTMQtIyC0nL
 AkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGxsO3Yzy07GLveBR9iFOBgVOLh1ZD3iRVi
 TSwrrsw9xCjBwawkwnuFwzdWiDclsbIqtSg/vqg0J7X4EKMp0EMTmaVEk/OBcZpXEm9oamhu
 YWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoFRNTFv8gHBd3M5/624OdV91dzY
 1ttm7mEXt3ksCtr+36+nl+nonj33+JyW3H/0Z0G654+7Z0uZWx+WrT/FXZcrfZbl+saJolHr
 Pf3u2384N0/q6OoF23uaVGSzb/Wynzv/4XL/gXfiG+bPqdWUmOG6Yum27ARVVjfv07tdmlUD
 i5dJb319SznguhJLcUaioRZzUXEiAOfAZqibAgAA
X-CMS-MailID: 20190809140736eucas1p2b14d3205aa7268cd1a6bba15ebd81066
X-Msg-Generator: CA
X-RootMTR: 20190809140736eucas1p2b14d3205aa7268cd1a6bba15ebd81066
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190809140736eucas1p2b14d3205aa7268cd1a6bba15ebd81066
References: <CGME20190809140736eucas1p2b14d3205aa7268cd1a6bba15ebd81066@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565359657;
 bh=Jnk5qUmdXGpY8skMtfaeEbiGzPLM3WRl+KTAG/hBkhY=;
 h=From:Subject:To:Cc:Date:References:From;
 b=Laxjw3SDHUL7GG2dcBV9rXwSFRQzBDbMH0VPReBaVc0EaxUCbpbRmB0mAO8Loisw/
 TuT61sDwACqbYGYUo1VOe1pYJIqHhdhPveHKoKRM39WxR4HKjmo1QxZqolyXvH0wdZ
 skPaIAAMRcixGCsXl5VbD/vnMynbmtOGWND0kQhI=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIExpbnVzLAoKUGxlYXNlIHB1bGwgZmJkZXYgZml4IGZvciB2NS4zLXJjNCAoZmJkZXYgcGF0
Y2hlcyB3aWxsIG5vdyBnbyB0bwp1cHN0cmVhbSB0aHJvdWdoIGRybS1taXNjIHRyZWUgZm9yIGlt
cHJvdmVkIG1haW50YWluZXJzaGlwIGFuZApiZXR0ZXIgaW50ZWdyYXRpb24gdGVzdGluZyBzbyB1
cGRhdGUgTUFJTlRBSU5FUlMgZmlsZSBhY2NvcmRpbmdseSkuCgpCZXN0IHJlZ2FyZHMsCi0tCkJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1z
dW5nIEVsZWN0cm9uaWNzCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlMjFh
NzEyYTk2ODU0ODhmNWNlODA0OTViMzdiOWZkYmU5NmMyMzBkOgoKICBMaW51eCA1LjMtcmMzICgy
MDE5LTA4LTA0IDE4OjQwOjEyIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9z
aXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9iem9sbmllci9saW51eC5naXQgdGFncy9m
YmRldi12NS4zLXJjNAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDZhNzU1M2U4ZDg0
ZDUzMjJkODgzY2I4M2JiOTg4OGM0OWEwZjA0ZTA6CgogIE1BSU5UQUlORVJTOiBoYW5kbGUgZmJk
ZXYgY2hhbmdlcyB0aHJvdWdoIGRybS1taXNjIHRyZWUgKDIwMTktMDgtMDkgMTU6NDY6NDAgKzAy
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCmZiZGV2IGZpeCBmb3IgdjUuMy1yYzQ6CgotIHVwZGF0ZSBmYmRldiBnaXQg
dHJlZSBpbiBNQUlOVEFJTkVSUyBmaWxlCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdp
Y3ogKDEpOgogICAgICBNQUlOVEFJTkVSUzogaGFuZGxlIGZiZGV2IGNoYW5nZXMgdGhyb3VnaCBk
cm0tbWlzYyB0cmVlCgogTUFJTlRBSU5FUlMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
