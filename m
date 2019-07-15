Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18F685A2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 10:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635C3894C9;
	Mon, 15 Jul 2019 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B5D893AB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 08:39:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190715083859euoutp023aa45915b4135bbdd22edf620b47dee4~xh99sUFBd0063100631euoutp02a
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 08:38:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190715083859euoutp023aa45915b4135bbdd22edf620b47dee4~xh99sUFBd0063100631euoutp02a
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190715083858eucas1p1061be8cc96299077ac936b1afb47196e~xh98_Pl4F2177321773eucas1p1q;
 Mon, 15 Jul 2019 08:38:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C2.B4.04298.2AB3C2D5; Mon, 15
 Jul 2019 09:38:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190715083857eucas1p272d8e645daa15994fff794dbf7c26841~xh98SjSe82048420484eucas1p2k;
 Mon, 15 Jul 2019 08:38:57 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190715083857eusmtrp287a3b3c3f8be41c509cb66bd42b6d009~xh98Ee65X0327603276eusmtrp2e;
 Mon, 15 Jul 2019 08:38:57 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-50-5d2c3ba2c4c9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A4.97.04140.1AB3C2D5; Mon, 15
 Jul 2019 09:38:57 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190715083857eusmtip11a4e3e0060559b732ca13b129b64540c~xh97ppbQx2302623026eusmtip1f;
 Mon, 15 Jul 2019 08:38:57 +0000 (GMT)
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To: Mark Brown <broonie@kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8b74afa7-65ed-c53d-3dc2-d758361f2d62@samsung.com>
Date: Mon, 15 Jul 2019 10:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190711145045.GI14859@sirena.co.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG/e9cdhxNjtPwxSLzdKPsYtHlhEs0Ik4fkqgQKsRmHjTyUpta
 1ocuhGyK4QQzl6XOa2Ym001XyszSZaKYmVhWVq4LhprlZkK5No+C337v/3me9+WBP4XJugh/
 6nRSCq9MUiQwpAQ3dcz0bNKHbIwK1tzzYbN7OkVsl2UcZ/M+2UjWadJibL99gmQzKh0Yq9GW
 iVmtpVvMvnpUSLLfSv5gYRKuxVGMc2bdezF3W11AcIZqDcm9G2gmuUbHR4IbzrKKuN+GFYeo
 4xJ5LJ9wOo1Xbgk9KYmftGViZ5ukF778aCeuoGFJJvKkgN4OHRWjeCaSUDK6CkFPxjQpDFMI
 huqqCGH4jSCropdciORMl4kFoRJBweCH+fwYAu2LKuR2+bhcteWtmJt96VXwerplzoTRahH0
 X22YE0h6PfyrfzO3VkqHQm/OrbkwTq+BkVwt4ealdCTMFGvmPd7QWWDD3exJb4PG7PciN2N0
 MDzTFxICB0DjWCEmsB+8tRWJ3IeB/iyGkqxJl0C5hn1gqwGhjg+MWhvEAi8Hp7lIJPBlGK66
 jglZNQJjnRkThBB4an1JCBwO+ulSXNjpBYNj3sJdL8g15c+fkoI6Qya4A2G42zi/xQ/Ke+1k
 DmJ0i5rpFrXRLWqjW9SmGOHVyI9PVSXG8aqtSfz5zSpFoio1KW7zqeREA3J9sa5Z668mZO+L
 aUM0hZgl0rDYoCgZoUhTpSe2IaAwxle6x+56ksYq0i/yyuRoZWoCr2pDyyic8ZNe8vh4QkbH
 KVL4Mzx/llcuqCLK0/8K0rWvDdvtEdhsztZfM02tjqkOuhYhL+3YO+j/oMIwNRJzzPK4rO9m
 TeRA0LlLwJi/3/n5ZuhJr/1AtNWRpTji3PlQvi3D6LkutLW2vivgBhM9K9ZP7rg7Lres7Isb
 MB90GvN3HW6CEWPf3/sRyfKhkK/BjqPPGSU+EbY/jzOFOxlcFa/YugFTqhT/AblKCAleAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xu7oLrXViDZZ0Klv0njvJZHF6/zsW
 i6kPn7BZ/N82kdniytf3bBZty78xW3ROXMJuMXH/WXaLy7vmsFk8X/iD2YHLY++3BSweO2fd
 ZfeY3TGT1WPTqk42jzvX9rB5bP/2gNXjfvdxJo/Pm+QCOKL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mj4+6WIu2MFb8fT1UdYGxvtcXYycHBIC
 JhITvi9h72Lk4hASWMoo0XVnLSNEQlxi9/y3zBC2sMSfa11sEEWvGSVmXQbp4OQQBupet/QA
 WJGIgLLE1e97WUCKmAU6mCRerHvECNFxmkniQvtWVpAqNgFNib+bb7KB2LwCdhIXJswAW8ci
 oCrxeNJEoBoODlGBMImjJ/IgSgQlTs58wgJicwoYSWzvvcsEYjML6EnsuP6LFcKWl9j+dg4z
 hC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgTG
 7LZjP7fsYOx6F3yIUYCDUYmH1yFFO1aINbGsuDL3EKMEB7OSCK/tV6AQb0piZVVqUX58UWlO
 avEhRlOg3yYyS4km5wPTSV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4m
 Dk6pBsYy0xf2J6W28L69duFiw9zZN4s2XNnbXZe/5Tm3nq4Eu0ToEb6GY6/mJa37ITT7UF+P
 XX3n+WNFtUkrmHNkp1T4zWBv2BOtxK7u8s5x9abtd2tOaYjU741wVo2cOLmEl/F45cOHslq8
 TirfXokHTn054dj9E7w/v8fJsEbsUPjGd09MtnSa9BMlluKMREMt5qLiRAAFCI9Z7wIAAA==
X-CMS-MailID: 20190715083857eucas1p272d8e645daa15994fff794dbf7c26841
X-Msg-Generator: CA
X-RootMTR: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk>
 <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
 <20190711145045.GI14859@sirena.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563179939;
 bh=KJ3DnEhLriuVeWg98K+79IN0DVUic0shWLHqhmyUMzM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=hEYthpWLFYhVJjHE0S/wQaiOoD4M8zKN2j2dIMwkSkXNeCuluP2kkl6CGTdRFqVqP
 x6zJ2GPXCH6zdyK/CnbBlcCVMZY8vFoGZzWrMIFMFDFjlOwmaHwaHhDYBx+EfQhESz
 dqDFP2s1IlKrzfi9D89EjC0DgSfVqwK0sDhVwx7k=
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEuMDcuMjAxOSAxNjo1MCwgTWFyayBCcm93biB3cm90ZToKPiBPbiBUaHUsIEp1bCAxMSwg
MjAxOSBhdCAwMzoxMTo1NlBNICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+Cj4+IDEuIERT
SSBwcm90b2NvbCBkZWZpbmVzIGFjdHVhbGx5IG1vcmUgdGhhbiAzMCB0eXBlcyBvZiB0cmFuc2Fj
dGlvbnNbMV0sCj4+IGJ1dCB0aGlzIHBhdGNoc2V0IGltcGxlbWVudHMgb25seSBmZXcgb2YgdGhl
bSAoZHNpIGdlbmVyaWMgd3JpdGUvcmVhZAo+PiBmYW1pbHkpLiBJcyBpdCBwb3NzaWJsZSB0byBp
bXBsZW1lbnQgbXVsdGlwbGUgdHlwZXMgb2YgdHJhbnNhY3Rpb25zIGluCj4+IHJlZ21hcD8KPiBZ
b3UgY2FuLCB0aGVyZSdzIGEgY291cGxlIG9mIGRpZmZlcmVudCB3YXlzIGRlcGVuZGluZyBvbiBo
b3cKPiBleGFjdGx5IHRoaW5ncyBhcmUgZG9uZS4KPgo+PiAzLiBEU0kgZGV2aWNlcyBhcmUgbm8g
TUZEcyBzbyByZWdtYXAgYWJzdHJhY3Rpb24gaGFzIG5vIGJpZyB2YWx1ZSBhZGRlZAo+PiAoY29y
cmVjdCBtZSwgaWYgdGhlcmUgYXJlIG90aGVyIHNpZ25pZmljYW50IGJlbmVmaXRzKS4KPiBUaGVy
ZSdzIGEgZmV3IGV4dHJhIGJpdHMgZXZlbiBpZiB5b3UncmUgbm90IHVzaW5nIHRoZSBtYXJzaGFs
bGluZwo+IGNvZGUgdG8gZ2V0IHRoaW5ncyBvbnRvIHRoZSBidXMgLSB0aGUgbWFpbiBvbmVzIGFy
ZSB0aGUgcmVnaXN0ZXIKPiBjYWNoZSBzdXBwb3J0ICh3aGljaCBwZW9wbGUgb2Z0ZW4gdXNlIGZv
ciBzaW1wbGVyIHN1c3BlbmQvcmVzdW1lCj4gc3VwcG9ydCkgYW5kIHRoZSBkZWJ1ZyBhbmQgdHJh
Y2UgZmFjaWxpdGllcyAodGhpbmdzIGxpa2UKPiB0cmFjZXBvaW50cyBhbmQgZGVidWdmcyBmb3Ig
ZHVtcGluZyB0aGUgcmVnaXN0ZXIgbWFwKS4KCkkgZG8gbm90IHNlZSBjYWNoZSB1c2FibGUgaW4g
YnJpZGdlIGRyaXZlcnMsIEkgZ3Vlc3MgZGVmYXVsdCBjb25maWcgd2lsbApiZSBjYWNoaW5nIGRp
c2FibGVkLCBhcyBpdCBpcyBhbHJlYWR5IGluIHRoZSBkcml2ZXIgZnJvbSB0aGlzIHBhdGNoc2V0
LgoKU28gYmVzaWRlIG1hcnNoYWxpbmcsIHdlIGFyZSBsZWZ0IG9ubHkgd2l0aCBkZWJ1ZyBmYWNp
bGl0aWVzLCBub3QgYSBiaWcKZ2FpbiA6KQoKTW9yZW92ZXIgYXMgaXQgd2FzIGFscmVhZHkgd3Jp
dHRlbiBEU0kgaXMgbWFpbmx5IHVzZWQgdG8gdHJhbnNwb3J0CkNPTU1BTkRTIHRvIHRoZSBkZXZp
Y2UsIHdpdGggdmFyaWFibGUgbnVtYmVyIG9mIGFyZ3VtZW50cyAtIGl0IGRvZXMgbm90CnJlc2Vt
YmxlcyByZWdpc3RyeSBtYXAgYXQgYWxsLgoKT24gdGhlIG90aGVyIHNpZGUgdGhlcmUgaXMgc29t
ZSBzdWJzZXQgb2YgRFNJIGRldmljZXMgd2hpY2ggZXhwb3NlcwpyZWdpc3RlciBtZW1vcnkgdXNp
bmcgTUlQSSBEU0kgR2VuZXJpYyBXcml0ZS9SZWFkIHBhY2tldHMsIGZvciBleGFtcGxlOgp0aS1z
bjY1ZHNpODYsIHRjMzU4NzY0LiBUaGV5IGZpdCBiZXR0ZXIgdG8gcmVnbWFwIGZyYW1ld29yay4g
SGFyZCB0byBzYXkKaG93IGNvbW1vbiBpcyB0aGlzIHBhdHRlcm4uIE1heWJlIHdlIGNhbiB0cnkg
d2l0aCBpdD8gSWYgeWVzIGl0IHdvdWxkIGJlCmdvb2QgdG8gcHV0IGNsZWFyIHJlbWFyayB0aGF0
IHJlZ21hcC9kc2kgaXMgZm9yIHN1Y2ggZGV2aWNlcywgdG8gYXZvaWQKcG9zc2libGUgY29uZnVz
aW9uLgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
