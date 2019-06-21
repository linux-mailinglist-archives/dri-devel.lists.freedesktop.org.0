Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DA74E6B8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D2A6E869;
	Fri, 21 Jun 2019 11:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C96E869
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:06:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190621110649euoutp01f92a11f11fb6b7ada30663ccbde3c72a~qMgMTEQ2b2736827368euoutp01D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:06:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190621110649euoutp01f92a11f11fb6b7ada30663ccbde3c72a~qMgMTEQ2b2736827368euoutp01D
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190621110649eucas1p239c3781c1f4d8a0831ead85463f81612~qMgL8KEMK2565525655eucas1p2e;
 Fri, 21 Jun 2019 11:06:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 4B.AA.04325.84ABC0D5; Fri, 21
 Jun 2019 12:06:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190621110647eucas1p2d7b803b54304d653e5755677d28e3117~qMgKxLsse2562325623eucas1p2X;
 Fri, 21 Jun 2019 11:06:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190621110647eusmtrp1f54c463b296dc6d604430407b0ca6664~qMgKjLIpA0123601236eusmtrp15;
 Fri, 21 Jun 2019 11:06:47 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-84-5d0cba48dbae
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C0.54.04140.74ABC0D5; Fri, 21
 Jun 2019 12:06:47 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190621110647eusmtip19ef13f2272bbabdbfec1cc8ae1f6259c~qMgKTb_L10104201042eusmtip1e;
 Fri, 21 Jun 2019 11:06:47 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: pvr2fb: fix build warning when compiling
 as module
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <b54d11f4-bc25-3e1a-1a7e-2c61555be39b@samsung.com>
Date: Fri, 21 Jun 2019 13:06:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2376f0a7-2511-b52d-c0d1-9162382f8693@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7oeu3hiDXouWFpc+fqezeJE3wdW
 i8u75rBZbN17ld2BxaPxxg02j/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4MrYcnQzW8Eh5orn
 J++xNjD+Y+pi5OSQEDCRuL/kLJgtJLCCUeL/5CQI+wujxNRXJl2MXED2Z0aJHef2MMM0fDu/
 gg0isZxRYuW/T1DOW0aJNV8/soFUCQuES6x9vQKsg03ASmJi+ypGEFtEIEFixfQZYDazgLZE
 79v3YDW8AnYS845cBOtlEVCVuHjlJFhcVCBC4v6xDawQNYISJ2c+YQGxOQXsJY7e/Qs1R1zi
 1pP5TBC2vMT2t3OYQQ6SEGhnl2g43Ah1totE66bJUD8LS7w6voUdwpaROD25hwWiYR2jxN+O
 F1Dd2xkllk/+xwZRZS1x+PhFoDM4gFZoSqzfpQ8RdpT4+2UrC0hYQoBP4sZbQYgj+CQmbZvO
 DBHmlehoE4KoVpPYsGwDG8zarp0rmScwKs1C8tosJO/MQvLOLIS9CxhZVjGKp5YW56anFhvn
 pZbrFSfmFpfmpesl5+duYgQmlNP/jn/dwbjvT9IhRgEORiUe3gOzuGOFWBPLiitzDzFKcDAr
 ifDy5PDECvGmJFZWpRblxxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamDU
 bn7xP/76KyMJn21GqmdtVr55tWBtV3Pf0X3317GtaElPU7F+LTDr4fEjha7KtlddUoWn318p
 upI5n2n226Om/78oPTrQzR58pYVz6zz5wMab/bfE9AuOc/PtmtdTWOmctFY8x6phQsalp+yC
 T3YkcxfyTr2xYt39wgvRQk9WZab2rwlw1DJRYinOSDTUYi4qTgQAOG+QAiQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7ruu3hiDa5e0bK48vU9m8WJvg+s
 Fpd3zWGz2Lr3KrsDi0fjjRtsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex5ehmtoJDzBXPT95jbWD8x9TFyMkhIWAi8e38
 CjYQW0hgKaPEw9PsXYwcQHEZiePryyBKhCX+XOsCKuECKnnNKLHxxCEWkISwQLjE4aX/wHrZ
 BKwkJravYgSxRQQSJJ6+ng8WZxbQluh9+54ZYr6dROOijWB7eYHseUcugtWwCKhKXLxyEqxG
 VCBC4sz7FSwQNYISJ2c+AbM5Bewljt79ywgxU13iz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSa
 haR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwfrYd+7llB2PXu+BD
 jAIcjEo8vAdmcccKsSaWFVfmHmKU4GBWEuHlyeGJFeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp
 0eR8YGznlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgnJ2VEb9u
 UpBkU8KXNbtnCrCkLtn6cX/5pi6H8qcpTGcXHl5rIxI7d5+6E9+5ZZIHWo8u2ju7N8SkRadt
 U8EGh7ify5qvzvmk9fWDZ9eTnc3aB+5KrvYU/1ilHN3uOKvlYlxw/12m3lc7D9dvfC6z9t4x
 Q/tNSsEyUxecy82amGz6/n2KZXLwaiWW4oxEQy3mouJEAM+4YUa1AgAA
X-CMS-MailID: 20190621110647eucas1p2d7b803b54304d653e5755677d28e3117
X-Msg-Generator: CA
X-RootMTR: 20190621110647eucas1p2d7b803b54304d653e5755677d28e3117
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190621110647eucas1p2d7b803b54304d653e5755677d28e3117
References: <2376f0a7-2511-b52d-c0d1-9162382f8693@samsung.com>
 <CGME20190621110647eucas1p2d7b803b54304d653e5755677d28e3117@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561115209;
 bh=2caUkBUX34B65u2vHzuNj9T+cWmaNw+VM2Qj1PAYCqY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HbYw+pf9hEidKfU3aRd9WpCvjp3ILFWSLBdVPIq38S+0x5Tp5uMmm32u10o1iy52F
 p7thgR7e1w2JFRjHs4GPR7/u1l5Vasrx80D/9eBfqmnZdIKkkAQKKdXmR2Cb/ms/Mv
 qHN2fUqLQ/JLlfO4CX+NCQhXCEpMyiC6iNxC0H60=
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

Ck9uIDYvMTQvMTkgMTI6NDMgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
QWRkIG1pc3NpbmcgI2lmbmRlZiBNT0RVTEUgYXJvdW5kIHB2cjJfZ2V0X3BhcmFtX3ZhbCgpLgo+
IAo+IEZpeGVzOiAwZjVhNTcxMmFkMWUgKCJ2aWRlbzogZmJkZXY6IHB2cjJmYjogYWRkIENPTVBJ
TEVfVEVTVCBzdXBwb3J0IikKPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+Cj4gU2lnbmVkLW9mZi1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2lj
eiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgoKSSBxdWV1ZWQgdGhlIHBhdGNoIGZvciB2NS4z
LgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZE
IEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
