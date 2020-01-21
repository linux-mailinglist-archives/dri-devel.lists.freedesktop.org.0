Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE21438F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ED16EC02;
	Tue, 21 Jan 2020 09:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139E46EC02
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:04:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200121090432euoutp020786186f7c9fd3f31af9d394e5b95ac1~r24gmSaCY0281302813euoutp02-
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:04:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200121090432euoutp020786186f7c9fd3f31af9d394e5b95ac1~r24gmSaCY0281302813euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579597472;
 bh=ifddvjexljeaaOXd6+kau9EW+a8o6z/1Nn9174QwJXc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nE5+BnUtvRUUkZDbaBz2s+ZM60KHDxdyVZPjZby7XbP0gap7v5VHyhVBcjFtx62Q2
 q6Dai44pGFRGntxgjEdDMf3GmBIqbQYTupiJB1rSe1szvn33kpobgqWACCc8ELmZve
 qv9d/FXCS5lHpQH//nrUWeqRy2987UD+lKVqWqLI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200121090431eucas1p2a612a10162a53f7f9a81a8f880584e57~r24gUCaZk2181921819eucas1p2K;
 Tue, 21 Jan 2020 09:04:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 9A.39.60679.F9EB62E5; Tue, 21
 Jan 2020 09:04:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200121090431eucas1p298648de3b791714802d433caf17352c1~r24fr1Vr62054420544eucas1p23;
 Tue, 21 Jan 2020 09:04:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200121090431eusmtrp23b6e2f338f4a6035ac1c7b096bac1b8b~r24fq7Jw-2280922809eusmtrp2J;
 Tue, 21 Jan 2020 09:04:31 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-7c-5e26be9f8042
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C0.75.08375.F9EB62E5; Tue, 21
 Jan 2020 09:04:31 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200121090430eusmtip102ee2f0654405702bfc40ae1f99dfc10~r24e3qjOz1475114751eusmtip1y;
 Tue, 21 Jan 2020 09:04:30 +0000 (GMT)
Subject: Re: [PATCH v4 1/3] drm: bridge: adv7511: Remove DRM_I2C_ADV7533
 Kconfig
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <c10a8079-e9d7-0c18-c31b-353e2af1efa0@samsung.com>
Date: Tue, 21 Jan 2020 10:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121082719.27972-2-bogdan.togorean@analog.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGc+dOp0NDcSgoJy5RGyXRgCiguVFEcYmT+OBCSIxEsOqwRCik
 FRQftC4guBQVlwBKK7sIwYBFrEGwGhDRBhAEDBENqIALMRYJuGDb0cjbd//zn3Puf3NZrLjK
 zGRj1QcEjVoVp2RkdE3juNXX8MA7YmlHiR85Z22myJXe+xJyPPUSJpM1FzDpGB1hyImCSoZ0
 jg1h0vypkyYZFwql5IX5GkOKutooYu4zUsSiDycvx/sxSa17LCWl4yZEqqsuY6K3blqr4FPb
 fzH8cGcIX55XjviR7lQpn6tro/m670aaz03PlvBVZRkM/+R8O8V/sVql/N3vbyR8/fVyKd93
 poniC690Mvz7G5U033Aui96q2CkL2ifExSYLGr/g3bKYhuxJKjGPOvQ6P43WoRF0GrmwwAWC
 ruu0nWWsgitFMGKoZcSDDUH+RTMtHr4h6M14a6+wzpa8U26iXoKg/1HJX9NnBK1fm7Bjrge3
 HbJ/WCUO9uRCYfRrltOEOT0GW8Uxp4nhFsGv6h7GwXIuGO4OW5xMcwvhUnEx5eDp3A4Y6OiX
 iB53aM4eoB3swq2Fj/pep465uXDClItF9oJXAwbKsQy4ZyycbdXTYtINUDqWyYjsAcNNd6Qi
 z4bJewZK5KPQV3oSi83pCEy372GxsAp6rRPO/Nh+60qznyiHQEuajRafxQ26P7uLd3CDizVX
 sSjLIT1NIbrnQ99z09+BXlDUOsqcR8qcKclypqTJmZIm5/9eI6LLkJeQpI2PFrT+auHgEq0q
 Xpukjl6yNyG+Ctm/a8vvJlstMv/cY0Eci5Su8sGshREKiSpZmxJvQcBipafceNwuyfepUg4L
 moRITVKcoLWgWSyt9JIH5A/tUnDRqgPCfkFIFDT/qhTrMlOH5r1NeroxM6rW/YHhfsiE7Oaa
 I+EtwT+fP/u9vn5w9+qVCxI0tq6C6IAtQzPoqCCNP1Pv57vsXWN4SnFbaGBmQWSJYfbyTH9v
 756Hjaayupo3rivObE9PS5T98Jzma9K3j60fdDf67/eJY8OGNk9sM+kGwtS3girW7fkQ4ju/
 as5Bn5VKWhujWrYYa7SqP+EfD+2qAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec85O5vm4rgpvkmQLEwKmh2vr6VmRHQEP0RGSV6XntRyTnam
 aZ9EW15CUVNps+YstRLN8hqal1akFq1caVqWYSY0Mw3S8JZNV+C3H8//+fHwwF+Ai+7ynAWJ
 ySpWmSxLkpC2xIs/fR/3Vnbvito3fo1EBcYBDJWPdfJQlroUR2ttxTh6Oz9LouxbjSQa+v0N
 RwPfhwiUV1zNR286rpOo5t0ghjrG9RgyFIaj4cUvOFJ3PeWjO4utADU3leGo0Hg0SMSoTask
 Yx46xNTr6gEzO6LmMxWZgwTTtaAnmIpcDY9pqssjmf4iE8b8MBr5TPvCZx7Tc6Oez4xf6cOY
 6vIhkpmqaiSY3oKrxDHRaam/UpGqYl0SFJwqQBJOIw8p7YekHl5+UtrTN3K/h7fEPdA/jk1K
 TGOV7oEx0oRezRqWosPSP928TGSCWZAPBAJIeUFdztZ8YCsQUTUAmvt1/HxgY5k7wc7KGdzK
 YrgynE9al6YBXB4z89YDMXUcapaNG+xAhcKfqyMbMk4V4vDlkqtVGACwqspIrAcktRuuNo+S
 6yykAmG72bDBBOUKS2trsXV2pMLgzPIoz7pjDwc0kxuuDRUEpwvHeNYDbnBFZ8KtvANmt1b8
 Yyf4frISKwIi7SZdu0nRblK0mxQ9IOqAA5vKyePlHC3lZHIuNTleGquQNwFLTdqeLTY/BKYH
 oQZACYDEThhU7hol4snSuAy5AUABLnEQ6rMsI2GcLOMiq1REK1OTWM4AvC3PFePOjrEKS+mS
 VdG0N+2L/GhfT19PHyRxEuZSjyNEVLxMxZ5n2RRW+d/DBDbOmSD3dvpXuTFmbu6J0aWlUVtu
 H9ztR7bYhXAh5z6E1Nos1flI2l4H7+x/RcY2q6fmJxvuZW3JwztNE+NebtuT2koiqEt6U445
 26A6GynetpgepDnFTTeIc+1d6cCQIwdyDg8HkLJfz93FfSfLRBM9hvt5JdlU1cGwfvGJJfWZ
 RxckBJcgo/fgSk72Fx9v7Hg8AwAA
X-CMS-MailID: 20200121090431eucas1p298648de3b791714802d433caf17352c1
X-Msg-Generator: CA
X-RootMTR: 20200121083857eucas1p2d62144f4f264cf751def772341a72c9b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200121083857eucas1p2d62144f4f264cf751def772341a72c9b
References: <20200121082719.27972-1-bogdan.togorean@analog.com>
 <CGME20200121083857eucas1p2d62144f4f264cf751def772341a72c9b@eucas1p2.samsung.com>
 <20200121082719.27972-2-bogdan.togorean@analog.com>
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEuMDEuMjAyMCAwOToyNywgQm9nZGFuIFRvZ29yZWFuIHdyb3RlOgo+IFRoaXMgY29tbWl0
IHJlbW92ZSBEUk1fSTJDX0FEVjc1MzMgcmVzdWx0aW5nIGEgc2ltcGxlciBkcml2ZXIgYW5kIGxl
c3MKPiBjaG9pY2VzIGluIEtjb25maWcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCb2dkYW4gVG9nb3Jl
YW4gPGJvZ2Rhbi50b2dvcmVhbkBhbmFsb2cuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
