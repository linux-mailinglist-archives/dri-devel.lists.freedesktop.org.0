Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C69654C8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 12:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84BB6E175;
	Thu, 11 Jul 2019 10:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCE36E175
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 10:55:29 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190711105527euoutp02fd2fedb3833ffedd05f150ddea70df3e~wVP_SKepc2446824468euoutp02C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 10:55:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190711105527euoutp02fd2fedb3833ffedd05f150ddea70df3e~wVP_SKepc2446824468euoutp02C
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190711105526eucas1p2ae6f12ae0aa1b4df554f58fe535fabfc~wVP9vr88W0464104641eucas1p2J;
 Thu, 11 Jul 2019 10:55:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 02.B4.04298.E95172D5; Thu, 11
 Jul 2019 11:55:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190711105525eucas1p1b4f0f8bf4bd05483c785e54e109275ae~wVP8x7JsI0887508875eucas1p1l;
 Thu, 11 Jul 2019 10:55:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190711105525eusmtrp2d4d86087364c0ce4d6a6917727d8625a~wVP8fxBEo0727707277eusmtrp2G;
 Thu, 11 Jul 2019 10:55:25 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-12-5d27159e4ca9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FB.54.04140.D95172D5; Thu, 11
 Jul 2019 11:55:25 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190711105524eusmtip1d97857399d677a73081a79a74f985f59~wVP77Z0QF1471014710eusmtip1M;
 Thu, 11 Jul 2019 10:55:24 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
To: Philippe CORNU <philippe.cornu@st.com>, Olivier MOYSAN
 <olivier.moysan@st.com>, "narmstrong@baylibre.com"
 <narmstrong@baylibre.com>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "airlied@linux.ie"
 <airlied@linux.ie>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "jsarha@ti.com" <jsarha@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <a8c6cde6-09d5-2175-234b-02cb3aacaa95@samsung.com>
Date: Thu, 11 Jul 2019 12:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj2O5ftbDk5Lm1v2gUXJQWZQj9OJVJUduhXGi1SpFaeVHJTd1LL
 EC01vDAtJawZaWVkQd7nrZRa1DJRuzjbKlLSLouWkk0Num2eSf573ud93vd9no+PwuV2MoBK
 0h7ndFp1slIkJdoe/xxcf8U/OC60/3oAox/oxZim8T7ElFaPk8yQc0LEWGbsONP71UIwJUWF
 JFN0vlbMNI8Nk8zLrssipnjYpTOVxjIV96pEzGj+Z3KrDzthLRCzVYWXSPbJuRcY2z49SrIj
 JWaMbanNYe/rKwj2QU8Y+2G2G2fN1naMnWpesWdRjDQ8nktOyuB0GyIOSRPHun9hqeXUiY8F
 BVgu6hQVIwkF9EZonhhyYSklp+sQDNeZMaH4gcDcelUsFFMIrtTaxPMjExWvcKFxE8F0Xjcp
 FA4E5YMf51SL6UiwXLQT7oYfXSoCfZd7sYQS0Wvhd4tt7rqMjoDab1bkxgS9GorfGkg39qdV
 8LOmyKPxhd5L465FFCWhN8PMbKabxumVkGeswgWsgNfj1XO+gT5NwWfHXUKwugOuVVpwAS+G
 L+ZWT4Rl8LezGhNwDozU5ePCcCECY2OnZ2ALPDQ/J92HcZfphq4NAr0NbupvYW4aaB+wOnwF
 Dz5Q3laJC7QMCs/KBXUQjPQbPQsVcOOZ0/PuLJS160XnUJBhQUjDgmSGBckM/z3UIOI2UnDp
 vCaB48O0XGYIr9bw6dqEkCMpmmbk+oB9f8zfO5DzxWEToimk9JZRjtVxclKdwZ/UmBBQuNJP
 1rNrVZxcFq8+mcXpUg7q0pM53oQCKUKpkJ3yGo2V0wnq49wxjkvldPNdjJIE5CKFmbxmjPa6
 nnEhvac+tiwqLa+shbeFr7FLGqZnxlRL3xREHHAqw5cbV9xJy/ZZu5+rEfPyjkDmz15nve2o
 piPYhpriN71XiNfHN355ynbttlyYPJG4LxOfjFIlxbwOC4o27lyy/a88KzgUpWQftX6K9Vbt
 +x3qqMp+pDoz8C5SSfCJ6rB1uI5X/wOslNJAfAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xu7pzRdVjDXadE7foPXeSyWLjk9OM
 Fn3zn7BaXPn6ns3i6veXzBYn31xlseju7GC16Jy4hN1i0+NrrBaXd81hs+i6BlR3qC/aYvKe
 2WwWD1pesDrweby/0cruMbtjJqvHiQmXmDy2f3vA6nG/+ziTx+Yl9R4HeiezeBzcZ+jx9Mde
 Zo/jN7YzeXzeJBfAHaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Ka
 k1mWWqRvl6CX8XjvH6aCSRwVz1pbmRoYd7J1MXJySAiYSLyffJ25i5GLQ0hgKaPEs0n7oRLi
 Ervnv2WGsIUl/lzrAosLCbxmlHg+wQrEFhZwk7g64yULSLOIwCQ2iQWL7jJBTFrOJPHozzIW
 kCo2AU2Jv5tvgnXzCthJLHl3gxHEZhFQlei6M4u1i5GDQ1QgTOLoiTyIEkGJkzOfsICEOQWs
 JL7/KAcJMwuoS/yZd4kZwpaXaN46G8oWl7j1ZD7TBEbBWUi6ZyFpmYWkZRaSlgWMLKsYRVJL
 i3PTc4uN9IoTc4tL89L1kvNzNzEC43rbsZ9bdjB2vQs+xCjAwajEwxvwUDVWiDWxrLgy9xCj
 BAezkgjvPnflWCHelMTKqtSi/Pii0pzU4kOMpkCvTWSWEk3OB6acvJJ4Q1NDcwtLQ3Njc2Mz
 CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjCzO56O/fs3mUWU/pR242GN59nLzikLTXwYZ
 c4sT3Z48cqjWnvU0NOHjs+PyO34Zhy4xmacntpNXTirp7FzXBLMko1eL+v22edmz39o9OW6m
 6M7KvKySX+/mz3u47EJ/6YI8tmumU4uf3dvMmhxU9OL1J9MnExmEhUz89cPvz3eduHB515xt
 v5RYijMSDbWYi4oTARJ9rYoBAwAA
X-CMS-MailID: 20190711105525eucas1p1b4f0f8bf4bd05483c785e54e109275ae
X-Msg-Generator: CA
X-RootMTR: 20190711092756epcas1p44e6b9d76d69652eaac039fafde75723e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190711092756epcas1p44e6b9d76d69652eaac039fafde75723e
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
 <20190710152720.GR15868@phenom.ffwll.local>
 <CGME20190711092756epcas1p44e6b9d76d69652eaac039fafde75723e@epcas1p4.samsung.com>
 <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562842527;
 bh=IAVycDmPIRNWjC1+QKPqn0lYsTXCDWV/uL4QaMcrbYM=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=GXeYvAWYMYeMGrQwx5WdAZ1SURHw3WtMXXed7hK2xDZiuILXYGgB2nwYxRSfcZ1RS
 Tf4tb+pG5ESKmzOZiNeJ9XJJRRdOeC+r3vWcmGnSFDh/oG0g5R6wqrLyNIs2bLvTc4
 WJep5eMwHBBBK73So/wba6kcy+sqmaWC5krdRA8E=
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

T24gMTEuMDcuMjAxOSAxMToyNywgUGhpbGlwcGUgQ09STlUgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+
Cj4KPiBPbiA3LzEwLzE5IDU6MjcgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIEZyaSwg
SnVsIDA1LCAyMDE5IGF0IDEyOjQxOjAzUE0gKzAwMDAsIFBoaWxpcHBlIENPUk5VIHdyb3RlOgo+
Pj4gSGkgT2xpdmllciwKPj4+IGFuZCBtYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4KPj4+IEdv
b2QgdG8gaGF2ZSB0aGUgYXVkaW8gZ3JhcGggY2FyZCBzdXBwb3J0LCBsb29rcyBvay4KPj4+IFJl
dmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgo+PiBTaW5j
ZSB5b3UgaGF2ZSBkcm0tbWlzYyBjb21taXQgcmlnaHRzIEknbSBhc3N1bWluZyB5b3UncmUgZ29p
bmcgdG8gcHVzaAo+PiB0aGlzIHRvby4gQ29ycmVjdD8KPj4gLURhbmllbAo+IFJlZ2FyZGluZyB0
aGlzIHBhdGNoIGluIHBhcnRpY3VsYXIsIHRoZXJlIGlzIHN0aWxsIG1pc3NpbmcgYW4gYWNrZWQt
YnkgCj4gZnJvbSBhICJicmlkZ2UiIG1haW50YWluZXIuIEFsc28gaXQgY291bGQgYmUgbmljZSB0
byB3YWl0IGZvciB0aGUgCj4gcmV2aWV3ZWQtYnkgZnJvbSBKaXJ5IGFzIGl0IGtub3dzIHdlbGwg
dGhpcyBzaWkgZHJpdmVyIGFuZCBzZW50IHJlY2VudGx5IAo+IGdvb2QgcGF0Y2hlcyBvbiBpdCAo
YWxyZWFkeSBtZXJnZWQpLgo+Cj4gV2l0aCB0aGF0LCBCZW5qYW1pbiBvciBJIChvciBhIGJyaWRn
ZSBtYWludGFpbmVyKSBjYW4gcHVzaCB0aGlzIHBhdGNoICsgCj4gdGhlIHNlcmllIG5hbWVkICJk
cm0vYnJpZGdlOiBzaWk5MDJ4OiBmaXggYXVkaW8gbWNsayBtYW5hZ2VtZW50IiBhcyBJIAo+IHRo
aW5rIGl0IGlzIGJldHRlciB0byBwdXNoIHRoaXMgc2VyaWUgKmJlZm9yZSogdGhpcyBwYXRjaC4K
Pgo+IFRoYW5rcywKPiBQaGlsaXBwZSA6LSkKCgpBY2tlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5o
YWpkYUBzYW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
