Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89D636D4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 15:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6424389CAD;
	Tue,  9 Jul 2019 13:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC8F89CAD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:22:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190709132234euoutp02699f6bef6c24ce21e8664d27f8452876~vv92pcRWJ1483214832euoutp02i
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 13:22:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190709132234euoutp02699f6bef6c24ce21e8664d27f8452876~vv92pcRWJ1483214832euoutp02i
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190709132233eucas1p189693530e7269533176806bc1bd1eb48~vv9198NtR3252832528eucas1p1I;
 Tue,  9 Jul 2019 13:22:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CE.AB.04325.915942D5; Tue,  9
 Jul 2019 14:22:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190709132233eucas1p2a6131219ab97ae35ba54ff8aeac8d5a1~vv91T5qlo1461414614eucas1p2Z;
 Tue,  9 Jul 2019 13:22:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190709132232eusmtrp1b4a711f414c38754f7e9f74b0a72e88e~vv91F3DzB3051430514eusmtrp1F;
 Tue,  9 Jul 2019 13:22:32 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-94-5d2495194291
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3B.D7.04140.815942D5; Tue,  9
 Jul 2019 14:22:32 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190709132232eusmtip2abddef2e6b80ca9416774b9dee3e2ec4~vv90qhW_62284522845eusmtip2p;
 Tue,  9 Jul 2019 13:22:32 +0000 (GMT)
Subject: Re: [PATCH 02/60] video: hdmi: Change return type of
 hdmi_avi_infoframe_init() to void
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <6f7462f0-f42a-dd1b-9867-c1d7b9a9fdf3@samsung.com>
Date: Tue, 9 Jul 2019 15:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190707180852.5512-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj22zk7O4qzz6OyVzPS5R8lL5E/BqUYSe2HRRGEpFZHPajkjR3v
 /kho6ZyFqUg4yUtp3iJFm5eVBm64TMKCCLVMyxVYLhGdZGjmdpT88/G8z/s87/s+8NEE81zs
 Q6dl5nCqTDZdTrmQ/WMbk8HetQEJYdXthxTb/VWE4r1tmVKUV7VIFM0relIxv/gSKWZrTDvP
 z/OK7sYZKopWNjwpVg7OtiDl8HoTqazX1ImVDeMXlXMVZpHSbJiRKM1TA6IL9BWXk8lceloe
 pwqNvO6S+nSgnszuFBVsVmSVoD9Ii5xpwOGwrdVItMiFZnA7gvlH60go1hAM9dYSdhWDVxG8
 UKfuOdas9YQgakOg+WLYtVsRNBs7dgqa9sAsqO86DJ44Dgw9w2K7hsC3RVClWxTbGxQOhK2+
 acqOpTgSVheqHNtIHABthjrSjr3wZdhoKt/VuMN4ncXBO+MzMGsYdmQg8GG4pa8nBCyDGUuj
 yL4M8JgEHtY2UMLZ0bD6oEIiYA/4YX62i31houYOKeCbMNeuJgSzBoG+Z4gQGifAaH4nticj
 dq7uNoQK9CkwLlgcgQG7wZTVXbjBDar77xMCLQVNKSOo/WHujX53oAxa39qoe0iu25dMty+N
 bl8a3f+9TYjsRDIul89I4fjjmVx+CM9m8LmZKSFJWRm9aOdLTfw12wbRyGbiKMI0krtKQR2Q
 wIjZPL4wYxQBTcg9pSNnjyQw0mS2sIhTZV1T5aZz/Cg6SJNymbTYaT6OwSlsDneD47I51V5X
 RDv7lKADkyuqxEJcFFNnlfKvOkxfw2KjjrZaxd5dr7vzP3p8Tg3s2ir43m369Sm4jzStTvYt
 BF0tXa9cjqDdnCpjT3/brrlUEr/kH2N8rBrjo22l6tp49pwZRZZTCzUloojQMuRrJpgyr6RS
 5wm/aT+LdtxtKPz32qYrs6Q2UB9oOcmnsseCCBXP/gPzfkQDTgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7oSU1ViDU6s1rP4v20is8WVr+/Z
 LDonLmG3WPhxK4vFg5f7GS3uTj4CJF77Wayff4vNgcNj3ppqjx13lzB67P22gMVjdsdMVo95
 JwM97ncfZ/I4vusWu8fxG9uZAjii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DLWbZ/NUrCKqeJPd34D4y/GLkZODgkBE4kvb2czdzFycQgJLGWU
 WHx4HhtEQlxi9/y3zBC2sMSfa11sEEWvGSWm7XjD3sXIwSEskCjR0psBUiMiEC1x5tBhsHpm
 gXYmica1BhD1Vxkl5jdMA0uwCWhK/N18E2wBr4CdxOfHE8HiLAIqEst3zWQBmSkqECZx9EQe
 RImgxMmZT1hAbE4BN4m7u/YyQsxXl/gz7xLULnmJ5q2zoWxxiVtP5jNNYBSahaR9FpKWWUha
 ZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwKrcd+7llB2PXu+BDjAIcjEo8vBIt
 KrFCrIllxZW5hxglOJiVRHj3uSvHCvGmJFZWpRblxxeV5qQWH2I0BfptIrOUaHI+MGHklcQb
 mhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgFFp5quiinU9Kp+3r5gPc
 q3fuefTyz7HEP04Vz57Vplo+1fj2dGGVxN73K8/kzHO+uniPicdVYbc9yUcvxnwr3KYcktly
 uL6070S63zkd1rp13X+lOddwswmareRr5Er6PTGre+ZH5wW3r/J0PUn9djC/5nXAZ9lTyduZ
 VdOj+0TdbztoBixlVWIpzkg01GIuKk4EAKTjMufgAgAA
X-CMS-MailID: 20190709132233eucas1p2a6131219ab97ae35ba54ff8aeac8d5a1
X-Msg-Generator: CA
X-RootMTR: 20190707181053epcas2p3d3c7b44c0712719fbceaede6202a1718
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190707181053epcas2p3d3c7b44c0712719fbceaede6202a1718
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <CGME20190707181053epcas2p3d3c7b44c0712719fbceaede6202a1718@epcas2p3.samsung.com>
 <20190707180852.5512-3-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562678554;
 bh=SvAFZNOHaLtAYFKgxf8W+0bEs3Y6wkWRpwXmvHBEOXI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=bGOwOceyH5X9qJHWs+E85WxL5fCU8KOqbnG0aNF7K2Ururd4WoWffG6Vio3fR5NU9
 HLrUt4ZGjbbUkqhUX1WkjuyGEupp+Zm2KtshUq2hbwYLaoSb2vWohe4P4QNAQXSswe
 BBK+TwWOI/kuHxSwL24D23XCsMdzmZkIfZDuIGLc=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDcuMjAxOSAyMDowNywgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgaGRtaV9h
dmlfaW5mb2ZyYW1lX2luaXQoKSBuZXZlciBuZWVkcyB0byByZXR1cm4gYW4gZXJyb3IsIGNoYW5n
ZSBpdHMKPiByZXR1cm4gdHlwZSB0byB2b2lkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpSZXZpZXdlZC1ieTog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
