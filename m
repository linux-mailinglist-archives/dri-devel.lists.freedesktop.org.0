Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF812F765
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 12:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F736E1D8;
	Fri,  3 Jan 2020 11:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F4D6E1D8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:38:19 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200103113817euoutp0213e753905589bfdb1455115b9c358eb9~mXXni6ku83129031290euoutp02C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 11:38:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200103113817euoutp0213e753905589bfdb1455115b9c358eb9~mXXni6ku83129031290euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578051497;
 bh=3wVrJk58ujYcC0SWAZQq7JaJrJKFI/5RdfelRon5h8w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mtsNyc5St3E1zv1zj8VpXr7jwy7/z7RjD/9xOZrTBxTUNJ5OOUvI12Wn8WJv6XEJL
 M/JBHajqLk1MhU0OJ7MSaWIMYEVqssQW9F9kHmSsGQNPDebfhjXB8RCzvpEiRcXA0i
 gPVzaQ1QJFSI+HGT8owj8RZtiAt0dMokJaDmh9Rc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200103113817eucas1p101992b02a77358fad7b87f37357d674b~mXXnYKx942509925099eucas1p1E;
 Fri,  3 Jan 2020 11:38:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A5.D6.61286.9A72F0E5; Fri,  3
 Jan 2020 11:38:17 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200103113816eucas1p1e7b66948c1906507f40b8654d95c341d~mXXnBqWNW2503625036eucas1p1U;
 Fri,  3 Jan 2020 11:38:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200103113816eusmtrp2e634830fa606e0348dbc7ec2e41b7a17~mXXnBGtbL0328203282eusmtrp2g;
 Fri,  3 Jan 2020 11:38:16 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-d5-5e0f27a9d2d2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 5C.41.08375.8A72F0E5; Fri,  3
 Jan 2020 11:38:16 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200103113816eusmtip1de5bf92e0be7914a8d511a28470a328f~mXXmsOvhe1193211932eusmtip1T;
 Fri,  3 Jan 2020 11:38:16 +0000 (GMT)
Subject: Re: [PATCH 1/3] video: fbdev: mmp: remove duplicated MMP_DISP
 dependency
To: Andrzej Hajda <a.hajda@samsung.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <633e4795-b914-e5ff-7121-7339a936e8ba@samsung.com>
Date: Fri, 3 Jan 2020 12:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0534f6bf-cd94-5416-2d4a-5fc9721aa7ed@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOd2V6vxxBtdWC1ncWneO1eLK1/ds
 Fif6PrBaXN41h82BxeN+93Emj74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4Mpoboko2Mdf8fXx
 XpYGxmc8XYwcHBICJhKfn4d3MXJxCAmsYJTYd3UGM4TzhVFiwfN2VgjnM6PEtZMX2boYOcE6
 Fs+Zzw6RWM4o8WDXVmaQhJDAW0aJ8z/qQcYKCwRLzHylDBIWEVCXmH3yDlgJs0CCxJebn8Fs
 NgEriYntqxhBbF4BO4k103pZQGwWARWJy01TwOKiAhESnx4cZoWoEZQ4OfMJC8h4TgF7if3H
 CiBGikvcejKfCcKWl2jeOhvsAQmBbnaJlxtnQN3sIjF9wwtWCFtY4tXxLewQtozE/50gzSAN
 6xgl/na8gOreziixfPI/qG5riTvnfrGBbGYW0JRYv0sfIuwo0XD5HhMkGPkkbrwVhDiCT2LS
 tunMEGFeiY42IYhqNYkNyzawwazt2rmSeQKj0iwkn81C8s4sJO/MQti7gJFlFaN4amlxbnpq
 sWFearlecWJucWleul5yfu4mRmAqOf3v+KcdjF8vJR1iFOBgVOLhTVDmjxNiTSwrrsw9xCjB
 wawkwlseyBsnxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dU
 A+N6znqGW6nfuBMcz/QdWLRJ5A53SdWBQ5FT1thqya7Ik0g31v+o++n02svF2U+Dny/N0TW8
 2fVx0dsN0yM6X2t3tir4ZVisE/VdEOWiFF7B9v/B3ib1vL1nbM6/nRf1X+jP/fu9YW+mHOx4
 ocyk8veApfB7m4tGTEUHvvY6cP1bZvz2ka7s1PNKLMUZiYZazEXFiQBPpBFfIQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xu7or1PnjDFp+G1vcWneO1eLK1/ds
 Fif6PrBaXN41h82BxeN+93Emj74tqxg9Pm+SC2CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAz
 MrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mtoboko2Mdf8fXxXpYGxmc8XYycHBICJhKL58xn
 B7GFBJYySuy+zNLFyAEUl5E4vr4MokRY4s+1LrYuRi6gkteMEr/3L2YGqREWCJaY+UoZpEZE
 QF1i9sk7zBA1xxkldp5+CzaTWSBBYtP9qWwgNpuAlcTE9lWMIDavgJ3Emmm9LCA2i4CKxOWm
 KWBxUYEIicM7ZkHVCEqcnPkE7B5OAXuJ/ccKIEaqS/yZd4kZwhaXuPVkPhOELS/RvHU28wRG
 oVlIumchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAmNn27Gfm3cwXtoY
 fIhRgINRiYc3QZk/Tog1say4MvcQowQHs5IIb3kgb5wQb0piZVVqUX58UWlOavEhRlOg3yYy
 S4km5wPjOq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2PVyk3n
 DJh4L268K+YukNXiOqX6elShV5KCsfOKZ6rHmPfPLzzx++Wio/sU2DlzdzFP0Lusy5gi5CJs
 s+/jJnvFCUcXJrld8RCqF/qwxWXz3NID0VKX+Ke5h+lVeexw67Zbts3l154HD464OZ5dZPtN
 VPD41UeKzRdZCiW/arje/3H+iFb426dKLMUZiYZazEXFiQAy8NZyswIAAA==
X-CMS-MailID: 20200103113816eucas1p1e7b66948c1906507f40b8654d95c341d
X-Msg-Generator: CA
X-RootMTR: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba
References: <CGME20190627140704eucas1p10f9aca669beb24f5359a0e86f2b6d0ba@eucas1p1.samsung.com>
 <eb28587c-4f8f-f044-1b8b-317a8d7967aa@samsung.com>
 <0534f6bf-cd94-5416-2d4a-5fc9721aa7ed@samsung.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjAvMTkgMTE6NTUgQU0sIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gT24gMjcuMDYuMjAx
OSAxNjowNywgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPj4gVGhpcyBkZXBlbmRl
bmN5IGlzIGFscmVhZHkgcHJlc2VudCBpbiBoaWdoZXIgbGV2ZWwgS2NvbmZpZyBmaWxlCj4+IChk
cml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9LY29uZmlnKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFy
dGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgo+IAo+IAo+
IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgoKVGhhbmtz
LCBJJ3ZlIHF1ZXVlZCB0aGUgcGF0Y2ggZm9yIHY1LjYuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRs
b21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5n
IEVsZWN0cm9uaWNzCgo+IMKgLS0KPiBSZWdhcmRzCj4gQW5kcnplago+IAo+IAo+PiAtLS0KPj4g
IGRyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2ZiL0tjb25maWcgfCAgICA0IC0tLS0KPj4gIGRyaXZl
cnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25maWcgfCAgICA0IC0tLS0KPj4gIDIgZmlsZXMgY2hh
bmdlZCwgOCBkZWxldGlvbnMoLSkKPj4KPj4gSW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9t
bXAvZmIvS2NvbmZpZwo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
bW1wL2ZiL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tbXAvZmIvS2NvbmZp
Zwo+PiBAQCAtMSw2ICsxLDQgQEAKPj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQo+PiAtaWYgTU1QX0RJU1AKPj4gLQo+PiAgY29uZmlnIE1NUF9GQgo+PiAgCXRyaXN0
YXRlICJmYiBkcml2ZXIgZm9yIE1hcnZlbGwgTU1QIERpc3BsYXkgU3Vic3lzdGVtIgo+PiAgCWRl
cGVuZHMgb24gRkIKPj4gQEAgLTEwLDUgKzgsMyBAQCBjb25maWcgTU1QX0ZCCj4+ICAJZGVmYXVs
dCB5Cj4+ICAJaGVscAo+PiAgCQlmYiBkcml2ZXIgZm9yIE1hcnZlbGwgTU1QIERpc3BsYXkgU3Vi
c3lzdGVtCj4+IC0KPj4gLWVuZGlmCj4+IEluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1w
L2h3L0tjb25maWcKPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21t
cC9ody9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25maWcK
Pj4gQEAgLTEsNiArMSw0IEBACj4+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKPj4gLWlmIE1NUF9ESVNQCj4+IC0KPj4gIGNvbmZpZyBNTVBfRElTUF9DT05UUk9MTEVS
Cj4+ICAJYm9vbCAibW1wIGRpc3BsYXkgY29udHJvbGxlciBodyBzdXBwb3J0Igo+PiAgCWRlcGVu
ZHMgb24gQ1BVX1BYQTkxMCB8fCBDUFVfTU1QMgo+PiBAQCAtMTYsNSArMTQsMyBAQCBjb25maWcg
TU1QX0RJU1BfU1BJCj4+ICAJaGVscAo+PiAgCQlNYXJ2ZWxsIE1NUCBkaXNwbGF5IGh3IGNvbnRy
b2xsZXIgc3BpIHBvcnQgc3VwcG9ydAo+PiAgCQl3aWxsIHJlZ2lzdGVyIGFzIGEgc3BpIG1hc3Rl
ciBmb3IgcGFuZWwgdXNhZ2UKPj4gLQo+PiAtZW5kaWYKPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
