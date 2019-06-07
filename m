Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2638A58
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E000F89DAB;
	Fri,  7 Jun 2019 12:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92789DAB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:30:57 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607123056euoutp012647c9fc0c3d551ba3fd287abf68b253~l6npGcESn3218132181euoutp01f
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:30:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607123056euoutp012647c9fc0c3d551ba3fd287abf68b253~l6npGcESn3218132181euoutp01f
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607123056eucas1p144917f52f689fb73cbdfaefd321a8d1b~l6nospfFT0621306213eucas1p1x;
 Fri,  7 Jun 2019 12:30:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 2F.62.04325.FF85AFC5; Fri,  7
 Jun 2019 13:30:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607123055eucas1p2c00e55a61972be0d0da49249a7e15e26~l6nng3vVI0519005190eucas1p23;
 Fri,  7 Jun 2019 12:30:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607123054eusmtrp220d447702e348eb9cc2d576e0b20ca94~l6nnRXeXL0884308843eusmtrp2t;
 Fri,  7 Jun 2019 12:30:54 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-95-5cfa58ff7619
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7D.A2.04140.EF85AFC5; Fri,  7
 Jun 2019 13:30:54 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607123054eusmtip241e14def18d6884c28839bc180af4070~l6nnDYEWY2165521655eusmtip2C;
 Fri,  7 Jun 2019 12:30:54 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: gbefb: add COMPILE_TEST support
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <e1537488-d30e-3680-36d0-3a848b79f370@samsung.com>
Date: Fri, 7 Jun 2019 14:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8bcfd5b8-347b-89e4-5faf-8569a3d00115@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZduzned3/Eb9iDNYes7C48vU9m8WJvg+s
 Fpd3zWFzYPa4332cyePzJrkApigum5TUnMyy1CJ9uwSujBv/5zIV3GKueLt3O3MDYzNzFyMn
 h4SAicT7Zd2sXYxcHEICKxgldvxezQThfGGUmLnrBjtIlZDAZ0aJe/tEYTp+LvvPDBFfzihx
 prMEouEto8Sdj6vAGoQFXCVaF01mArHZBKwkJravYgSxRQQSJFZMnwFm8wrYSSz984sVxGYR
 UJE4cvQVWFxUIELi/rENrBA1ghInZz5hAbE5Bewlfm95zwZiMwuIS9x6Mp8JwpaX2P52DjPI
 ERIC79kkHv5uhPrNReLDhR2MELawxKvjW9ghbBmJ/zvnM0E0rGOU+NvxAqp7O6PE8sn/2CCq
 rCUOH78IdAYH0ApNifW79CHCjhLr5n5kAQlLCPBJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVahIb
 lm1gg1nbtXMl1GkeEvevHGeewKg4C8mbs5C8NgvJa7MQbljAyLKKUTy1tDg3PbXYOC+1XK84
 Mbe4NC9dLzk/dxMjMHmc/nf86w7GfX+SDjEKcDAq8fB6sP+MEWJNLCuuzD3EKMHBrCTCW3bh
 R4wQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZqakFqUUwWSYOTqkGxqL94S7O
 vxncTKfblLw9Jfk4yoBPeHoG947/AQ/2ZGaxzEit/6cryPmn0zdjyf1Yf4br/Ocsmvfw5vx+
 /dL8a0TofKmzLdln2j0aNdUudgR4qWWqtXbffJbIkP03y6Q0P5Wx1eETjxqXikXPjarXLHs1
 Z+huLZbX2eZUp6atfHBdhQuXa6gSS3FGoqEWc1FxIgDBtGNpGgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4Pd1/Eb9iDE4tMra48vU9m8WJvg+s
 Fpd3zWFzYPa4332cyePzJrkApig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNT
 JX07m5TUnMyy1CJ9uwS9jBv/5zIV3GKueLt3O3MDYzNzFyMnh4SAicTPZf+BbC4OIYGljBLP
 714FcjiAEjISx9eXQdQIS/y51sUGUfOaUeLHxhlsIAlhAVeJ1kWTmUBsNgEriYntqxhBbBGB
 BImnr+eD1QgJ2EnsaT0CtowXyF765xcriM0ioCJx5OgrsHpRgQiJM+9XsEDUCEqcnPkEzOYU
 sJf4veU92BxmAXWJP/MuMUPY4hK3nsxngrDlJba/ncM8gVFwFpL2WUhaZiFpmYWkZQEjyypG
 kdTS4tz03GIjveLE3OLSvHS95PzcTYzAqNh27OeWHYxd74IPMQpwMCrx8M5g+hkjxJpYVlyZ
 e4hRgoNZSYS37MKPGCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB0ZsXkm8oamhuYWlobmx
 ubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRsVvawU5k9VbTpSsczBhc1A4csi2yfH5
 4qVzXjcsyN9rfzRh6q7/m+V3XvqpJFNt7CN4+7yJ256IE56zfvc/WXLvEdN/j97JRX5+1z98
 ntv/+H526OFJXvs31z9p7prxZLl+K9tek+1/xAoN0nb0JZRx5R827DN3/WV7VTbugeThxyb6
 yvMM3JVYijMSDbWYi4oTATiQp2OgAgAA
X-CMS-MailID: 20190607123055eucas1p2c00e55a61972be0d0da49249a7e15e26
X-Msg-Generator: CA
X-RootMTR: 20190607123055eucas1p2c00e55a61972be0d0da49249a7e15e26
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607123055eucas1p2c00e55a61972be0d0da49249a7e15e26
References: <8bcfd5b8-347b-89e4-5faf-8569a3d00115@samsung.com>
 <CGME20190607123055eucas1p2c00e55a61972be0d0da49249a7e15e26@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910656;
 bh=jVgHTVhAOSFZU12CT5tL8EynrAm4MZd6GB6AuG5JpIc=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=aYc01CadvnVlR6ul1GnucX96oRWYzUBgGrNsKnpgm+fqByNZA+Wp9SI5FXLjorT2R
 X6VHLvi6VquWkjP+5OpNqRTXH3tLCkQwj9XTXS1cGgybHosv8GjRTFT0lu0gR3O6q5
 aaXVasF2C4H3qNEI9BfocXaWls838VDiwBzkCRVU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMjEvMTkgMTo1MSBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiBB
ZGQgQ09NUElMRV9URVNUIHN1cHBvcnQgdG8gZ2JlZmIgZHJpdmVyIGZvciBiZXR0ZXIgY29tcGls
ZQo+IHRlc3RpbmcgY292ZXJhZ2UuCj4gCj4gV2hpbGUgYXQgaXQgY29udmVydCBib2d1cyB1ZGVs
YXkoKSBjYWxscyB0byBtZGVsYXkoKSAobmVlZGVkIHRvCj4gYnVpbGQgZHJpdmVyIG9uIEFSTSkg
YW5kIHJlbW92ZSBkZWFkIHg4NiBzcGVjaWZpYyBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkkgcXVl
dWVkIHRoZSBwYXRjaCBmb3IgdjUuMy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xu
aWVya2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25p
Y3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
