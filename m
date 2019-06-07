Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8138A4D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F989DED;
	Fri,  7 Jun 2019 12:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9679089DED
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:29:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607122942euoutp02e43fafbd42382938ed86dcc0e74277c0~l6mjjho7P3241532415euoutp02G
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 12:29:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190607122942euoutp02e43fafbd42382938ed86dcc0e74277c0~l6mjjho7P3241532415euoutp02G
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607122941eucas1p25843e59fb845e95ab08b63f15142ebc5~l6mjH5nEK2857028570eucas1p2A;
 Fri,  7 Jun 2019 12:29:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 12.55.04298.5B85AFC5; Fri,  7
 Jun 2019 13:29:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607122940eucas1p21f149e3c1a9936bc8ce1fcaf8a5d7a12~l6miakt_m0273802738eucas1p2k;
 Fri,  7 Jun 2019 12:29:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607122940eusmtrp2218ea10ddc9677a1a3de77f50e8e8552~l6miLJVSp0756107561eusmtrp2a;
 Fri,  7 Jun 2019 12:29:40 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-63-5cfa58b5fd3c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6B.48.04146.4B85AFC5; Fri,  7
 Jun 2019 13:29:40 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190607122940eusmtip29d3b634ffc8140115e7e7ed195ae5ea2~l6mh7Lcyk1944419444eusmtip2K;
 Fri,  7 Jun 2019 12:29:40 +0000 (GMT)
Subject: Re: [PATCH v2] video: fbdev: pxa168fb: add COMPILE_TEST support
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <ce42e607-0a55-0f25-adb7-b110d704d9e8@samsung.com>
Date: Fri, 7 Jun 2019 14:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1059f924-7bbb-37b1-42ee-52cad878f572@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42LZduznOd2tEb9iDBbflbK48vU9m8WJvg+s
 Fpd3zWFzYPa4332cyePzJrkApigum5TUnMyy1CJ9uwSujMeb57IV3GGq2LH0PWsD40KmLkZO
 DgkBE4lfv4+ygthCAisYJSZ/te9i5AKyvzBKzD86nR3C+cwo0fn+KjNMx7s5fxghEssZJVo3
 3GKEaH/LKDGxIxLEFhbwkPj25TlYnE3ASmJi+yowW0QgQWLF9BlgNq+AncSHP3vAhrIIqEjc
 +r4d7AxRgQiJ+8c2sELUCEqcnPmEBcTmFLCX2Lf+C1gvs4C4xK0n85kgbHmJ7W/nMIMcJCHw
 mU1ix87pjBCXukhM3HOZFcIWlnh1fAs7hC0j8X8nSDNIwzpGib8dL6C6tzNKLJ/8jw2iylri
 8PGLQN0cQCs0Jdbv0ocIO0r8/94AFpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqEIKrVJDYs28AG
 s7Zr50poIHpIrF/5jmkCo+IsJG/OQvLaLCSvzUK4YQEjyypG8dTS4tz01GLDvNRyveLE3OLS
 vHS95PzcTYzA5HH63/FPOxi/Xko6xCjAwajEw+vB/jNGiDWxrLgy9xCjBAezkghv2YUfMUK8
 KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGanphakFsFkmTg4pRoYNRbsOCSwz3PL
 WaNFCUGX4y7YcpZl2M+c+uRmkyQv12Zdtx9PW26ZTpig2lwR+/m6RaDKqwtf0+9eF4vgf83K
 KMGc+8s8bXLHB4+4dt3fidatLhIrlu5Smett+0zdb878gL64Pqv0i99uas8qvC7drxP3TM/h
 5s+IpNRCXcUythi7Pzo8x+4qsRRnJBpqMRcVJwIARpSadBoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4Pd0tEb9iDJ680rC48vU9m8WJvg+s
 Fpd3zWFzYPa4332cyePzJrkApig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNT
 JX07m5TUnMyy1CJ9uwS9jMeb57IV3GGq2LH0PWsD40KmLkZODgkBE4l3c/4wdjFycQgJLGWU
 eH/iMXMXIwdQQkbi+PoyiBphiT/Xutggal4zSvz/v4wVJCEs4CHx7ctzRhCbTcBKYmL7KjBb
 RCBB4unr+WwgtpCAncTc3mvsIDYvkP3hzx5mEJtFQEXi1vftYHNEBSIkzrxfwQJRIyhxcuYT
 MJtTwF5i3/ovYDOZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEbBWUjaZyFpmYWkZRaSlgWM
 LKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECo2LbsZ+bdzBe2hh8iFGAg1GJh9eB4WeMEGti
 WXFl7iFGCQ5mJRHesgs/YoR4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5HxixeSXxhqaG5haW
 hubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGHVsntSdtk0SOZUhv2WBuQbvx2TP
 6zc9jzWteMx9Y95jm7nbNZmbHyRe3rax8T/rpNNvY7lq1xldEYu6sm2z4LNtCjdeJSxYd+Uc
 v7z1gorKOpXwWVtd7B9oXnf1CEhj5WITPcCjFKGieJRx4vQm/hMuj1UP2Cy7paOfKDknYuJm
 P4Pd6ju7DJVYijMSDbWYi4oTAR8pMq2gAgAA
X-CMS-MailID: 20190607122940eucas1p21f149e3c1a9936bc8ce1fcaf8a5d7a12
X-Msg-Generator: CA
X-RootMTR: 20190607122940eucas1p21f149e3c1a9936bc8ce1fcaf8a5d7a12
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607122940eucas1p21f149e3c1a9936bc8ce1fcaf8a5d7a12
References: <1059f924-7bbb-37b1-42ee-52cad878f572@samsung.com>
 <CGME20190607122940eucas1p21f149e3c1a9936bc8ce1fcaf8a5d7a12@eucas1p2.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559910582;
 bh=DTVlfGeRVYY7R7Qk/EHiImAG/evC8NLIJfw2cqSZuSk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=C3AoGA0z7tjopZs0COuobklM459Dj0ucwpsI8faZaMnl6BQ91QeBiOjjkRlam7Wip
 tC6hVbctdD6Of63zjU/XYK/rMIyCfqPdM6OziigfgecTeJeSMyvUC89ZjDngPpD2Pk
 pI9AMQMYOFN876fMforU5QNoTTeEy/iI/HNnZwkM=
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

Ck9uIDUvMjEvMTkgMTI6NDkgUE0sIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogd3JvdGU6Cj4g
QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIHB4YTE2OGZiIGRyaXZlciBmb3IgYmV0dGVyIGNv
bXBpbGUKPiB0ZXN0aW5nIGNvdmVyYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWog
Wm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KCkkgcXVldWVkIHRoZSBw
YXRjaCBmb3IgdjUuMy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2lj
egpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
