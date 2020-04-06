Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0726F19F7D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 16:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0556E3DB;
	Mon,  6 Apr 2020 14:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D876E3DB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 14:23:53 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200406142351euoutp0196764849ce449d277b8bb294280ccd59~DQRAngaW70589405894euoutp01J
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 14:23:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200406142351euoutp0196764849ce449d277b8bb294280ccd59~DQRAngaW70589405894euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586183031;
 bh=80HiovpSACSa5iKWuDtXEGNMjiGgvGqhBPfk2+6zg2I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Y9S1R0tpk3yqYW2uH+9884TfpcTEYO2pF84lZFKPXhwoYBc3gkBFO6OqyCH1+jTGC
 T20P0WZ5F0EYNMBJc42m//fPODIqTgx52+aa81BSoufpKyfLnK3pQQn9XNc+MECcpD
 i1iSdMn2lfk0sAkq6grWcDGvAnsDJGNU5oTk1MkY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200406142351eucas1p176e16341c0ae5cba40259b3b3b64279e~DQRAfqxZE2343723437eucas1p1r;
 Mon,  6 Apr 2020 14:23:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F5.1A.61286.77B3B8E5; Mon,  6
 Apr 2020 15:23:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200406142350eucas1p2524f266941cfedd66c0181f2fedcf388~DQRAJGFE81495514955eucas1p2N;
 Mon,  6 Apr 2020 14:23:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200406142350eusmtrp1d2e992634175bcb2ae0fea4a3e778668~DQRAIQ9ax0348903489eusmtrp1a;
 Mon,  6 Apr 2020 14:23:50 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-ea-5e8b3b77753e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 01.CF.08375.67B3B8E5; Mon,  6
 Apr 2020 15:23:50 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200406142350eusmtip1eccb47d1871edabd5397fc2de3e805dc~DQQ-biU9_1810518105eusmtip1e;
 Mon,  6 Apr 2020 14:23:50 +0000 (GMT)
Subject: Re: [PATCH v5 0/5] Genericize DW MIPI DSI bridge and add i.MX 6 driver
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <7b95e129-8035-df7f-3d50-2ae3c2e8af8d@samsung.com>
Date: Mon, 6 Apr 2020 16:23:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330113542.181752-1-adrian.ratiu@collabora.com>
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTYRDH83V3y7ahuBSQEYxiY6JouIIxm6Aoxod9EKM+qQlHkQ0Q21Ja
 DlEjBJBAOUTw4jAQjoggqFQQiCFQCEiQIkcJJDQQqA8QDsuloIi0i5G338z855v5Tz4SExsI
 FzJKEcuqFFKZhC/Em7o3BjwS/LKCvUsfiuiNvCaCLu3SE/TI2hKfNvyYxejeeQNOa/XZBJ35
 uNKGbpgZJWjN5muMHm4t4dPLU9sYrRk1EedtmWZjJWKKMwoJ5nPeEI+ZzOrhMdrKJOb9YjOP
 ac8pwJmONh9mpeHQFcFN4ZlwVhYVz6q8/EOFkbpOQmnad2ep7SeRjKpsNYgkgToFXYMyDRKS
 YqoawcJ8H48LVhF8+j2Oc8EKguWhZzYaJLB2mKe6Ma7wCsGX7dJd1RICY043z6JyoK6CfjCd
 b2FHKgb0jTWERYRRnTxYSa+3iviUO2xpx60iEeUPQ+W1yMI4dRTq5zKt7EQFgX56jOA09tBb
 aMItLKACYD3dbGWMOgypjcUYx44wNp2GLMOAMtvA8PYIj9v7IhjNjwiOHWCu58Oun4PQV5CN
 c5wEk9VpGNecgaDxXQvGFfxgQr/Jt5wM29n6basXlw6Aj4YKxF3SDsYW7Lkd7CC/6TnGpUWQ
 kS7m1Edgsr9x90FnqPq6xs9DkqI9zor2uCna46bo/9wyhNcgZzZOLY9g1T4KNsFTLZWr4xQR
 nrei5Q1o57P1/elZbkZrQ2E6RJFIYiu6LsgKFhPSeHWiXIeAxCSOIpeczGCxKFyaeJdVRYeo
 4mSsWodcSVziLPItnw0SUxHSWPY2yypZ1b8qjxS4JKPSXMPZurGZGGX9E8Elj7Jjvxbvvfwu
 7ovq/+bqWvGipeTCcZt2U8KD0yMzymKnXreClIYws/vTrRSTW5VyK1cwkqqr0cqlvuc2t94I
 BxbTah0TT3a4pdi1hOYYPZxv3J+A6fzlJEVI3eV1o2v0ag+L9N4Z+xXa1c5A3YGga4GTElwd
 KfU5ganU0r9uZjfdaAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRmVeSWpSXmKPExsVy+t/xu7pl1t1xBr82mFj8nLCN1WL+kXOs
 Fle+vmezuPr9JbPFyTdXWSw2n+thteicuITdYtPja6wWXb9WMltc3jWHzeLTg//MFl3XnrA6
 8HjsuLuE0WN2x0xWjxMTLjF53O8+zuSxeUm9x8Z3O5g8DvROZvE4uM/Q4/MmuQDOKD2bovzS
 klSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MQ4dZC57wV7zf
 94O1gXEpTxcjJ4eEgInExwfHmEFsIYGljBKXe70g4uISu+e/ZYawhSX+XOti62LkAqp5yyix
 /fE2JpCEsECgxLmLbWwgtohAocSX6xvAipgFDjNJ7F02lR2iYwqjxIemVkaQKjYBTYm/m2+C
 dfAK2ElcWrQaLM4ioCKx7lUnmC0qECvR37ybEaJGUOLkzCcsIDangKPEt7aPYDazgJnEvM0P
 mSFseYnmrbOhbBGJG49aGCcwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqX
 rpecn7uJERjL24793LyD8dLG4EOMAhyMSjy8EZzdcUKsiWXFlbmHGCU4mJVEeKV6O+OEeFMS
 K6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YZvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5ak
 ZqemFqQWwfQxcXBKNTD61jyd80V46Z2jM0M1Xwufq2LR3dcptittXrc7I3PXbcnnSk/cNvfs
 2nfkusDU3Q2GcdN7TlxxK7h1Pd3Tr6rmu0+44+9ZftXHtjwISiu3SQ5u99vductMaBWn3p5V
 pfKLprBp7P9fo2Z2Ri786nqLb0vL3QVPcM0wb1i1z9/7LfPF68+514orsRRnJBpqMRcVJwIA
 Q/GjXvsCAAA=
X-CMS-MailID: 20200406142350eucas1p2524f266941cfedd66c0181f2fedcf388
X-Msg-Generator: CA
X-RootMTR: 20200330113455eucas1p1441dc79d44de5081e9d90079e2020ca0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200330113455eucas1p1441dc79d44de5081e9d90079e2020ca0
References: <CGME20200330113455eucas1p1441dc79d44de5081e9d90079e2020ca0@eucas1p1.samsung.com>
 <20200330113542.181752-1-adrian.ratiu@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWFuLAoKRHVlIHRvIGRpZmZlcmVudCB3YXlzIG9mIHdvcmsgSSB1c2UgZGlmZmVyZW50
IG1haWwgY2xpZW50LCBzbyBmb3JnaXZlIG1lIAppZiB0aGVyZSBhcmUgc29tZSBtaXNjb25mdWdy
YXRpb25zLgoKClcgZG5pdSAzMC4wMy4yMDIwIG/CoDEzOjM1LCBBZHJpYW4gUmF0aXUgcGlzemU6
Cj4gSGVsbG8gZXZlcnlvbmUsCj4KPiBUaGUgdjUgc2VyaWVzIGlzIGEgc2lnbmlmaWNhbnRseSBj
bGVhbmVkIHVwIHZlcnNpb24gZnJvbSB2NCwKPiBzdGFydGVkIGJ5IEV6ZXF1aWVsIEdhcmNpYSdz
IHN1Z2dlc3Rpb24gb2Ygc3BsaXR0aW5nIG91dCB0aGUKPiByZWdtYXAgaW5mcmFzdHJ1Y3R1cmUg
ZnJvbSB0aGUgZHJpdmVycyAodGhhbmsgeW91ISkuCj4KPiBUdXJucyBvdXQgbm8gY2hhbmdlcyBh
cmUgcmVxdWlyZWQgdG8gdGhlIGV4aXN0aW5nIGRyaXZlcnMgYW5kCj4gdGhlIGJyaWRnZSBjYW4g
dHJhbnNwYXJlbnRseSB0YWtlIGNhcmUgb2YgdGhlIGxheW91dCBsb2dpYywKPiBzbyB0aGVyZSdz
IG5vIG5lZWQgdG8gZXhwb3NlIHRoZSByZWdtYXAgdmlhIHBsYXRfZGF0YSBhbnltb3JlLgo+Cj4g
U3RhcnRpbmcgZnJvbSB0aGlzIHZlcnNpb24gSSBhbHNvIG9wdGVkIHRvIGFkZCBwZXItcGF0Y2gK
PiBjaGFuZ2Vsb2dzLiBBbGwgcmV2aWV3IGNvbW1lbnRzIHVwIHRvIG5vdyBoYXZlIGJlZW4gYWRk
cmVzc2VkLgo+Cj4gVGVzdGVkIG9uIElNWDZETC4KPgo+IEFkcmlhbiBSYXRpdSAoNSk6Cj4gICAg
ZHJtOiBicmlkZ2U6IGR3X21pcGlfZHNpOiBhZGQgaW5pdGlhbCByZWdtYXAgaW5mcmFzdHJ1Y3R1
cmUKPiAgICBkcm06IGJyaWRnZTogZHdfbWlwaV9kc2k6IGFic3RyYWN0IHJlZ2lzdGVyIGFjY2Vz
cyB1c2luZyByZWdfZmllbGRzCj4gICAgZHJtOiBicmlkZ2U6IHN5bm9wc2lzOiBhZGQgZHNpIHYx
LjAxIHN1cHBvcnQKPiAgICBkcm06IGlteDogQWRkIGkuTVggNiBNSVBJIERTSSBob3N0IHBsYXRm
b3JtIGRyaXZlcgo+ICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBhZGQgaS5NWDYgTUlQSSBEU0kg
aG9zdCBjb250cm9sbGVyIGRvYwo+Cj4gICAuLi4vZGlzcGxheS9pbXgvZnNsLG1pcGktZHNpLWlt
eDYueWFtbCAgICAgICAgfCAxMzQgKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1taXBpLWRzaS5jIHwgNjgzICsrKysrKysrKysrKystLS0tLQoKClNvIHdlIGhhdmUg
YWJvdmUgNDAwIGxpbmVzIG1vcmUganVzdCB0byBhZGQgc2xpZ2h0bHkgZGlmZmVyZW50IHJlZ2lz
dGVyIApsYXlvdXQgb2YgdjEuMDEuCgpRdWl0ZSBiaWcgbGluZWNvdW50IGZvciBhcHBhcmVudGx5
IHNtYWxsICg/KSBmdW5jdGlvbmFsIGNoYW5nZSAtIEkgd2FzIAp0b28gbGF6eSB0byBjaGVjayBo
b3cgbWFueSByZWcgZmllbGRzIGFyZSByZWFsbHkgdXNlZCAoc29tZSBhcmUgbm90IHVzZWQgCmF0
IGFsbCksIGJ1dCBpdCBkb2VzIG5vdCBzZWVtIHRvIGJlIGJpZyBlbm91Z2ggdG8ganVzdHlmeSBz
byBiaWcgY2hhbmdlIElNTy4KCkkgd2lsbCBhZGQgbW9yZSBjb21tZW50cyBpbiBzcGVjaWZpYyBw
YXRjaGVzLgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+ICAgZHJpdmVycy9ncHUvZHJtL2lteC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgIHwgICA3ICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9pbXgvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L2R3
X21pcGlfZHNpLWlteDYuYyAgICAgICAgfCAzOTkgKysrKysrKysrKwo+ICAgNSBmaWxlcyBjaGFu
Z2VkLCAxMDQ5IGluc2VydGlvbnMoKyksIDE3NSBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvZnNs
LG1pcGktZHNpLWlteDYueWFtbAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9pbXgvZHdfbWlwaV9kc2ktaW14Ni5jCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
