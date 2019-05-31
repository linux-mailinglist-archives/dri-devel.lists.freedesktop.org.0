Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1296D30F6D
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 15:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C682689483;
	Fri, 31 May 2019 13:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79E989483
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:59:04 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190531135903euoutp015397706be0a1de9cd2a56a50978b3732~jyTkccw2u1523615236euoutp01S
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 13:59:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190531135903euoutp015397706be0a1de9cd2a56a50978b3732~jyTkccw2u1523615236euoutp01S
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190531135902eucas1p139dac526976986fbb302ee46bb09dd45~jyTkFgmpm2731527315eucas1p1K;
 Fri, 31 May 2019 13:59:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1B.6B.04325.62331FC5; Fri, 31
 May 2019 14:59:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190531135901eucas1p15b2684dbfbdf04ebf5c077388e0c67cb~jyTjSuG9I3203332033eucas1p1Q;
 Fri, 31 May 2019 13:59:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190531135901eusmtrp10bdd96c09c6727809d52e91667e6028b~jyTjR_43W2415824158eusmtrp1M;
 Fri, 31 May 2019 13:59:01 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-f0-5cf133260820
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.19.04140.52331FC5; Fri, 31
 May 2019 14:59:01 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190531135901eusmtip15413005f9fbc5cf4822cece349c5bd20~jyTin_-hp1881718817eusmtip1V;
 Fri, 31 May 2019 13:59:01 +0000 (GMT)
Subject: Re: [PATCH v8 0/6] drm/bridge: sii902x: HDMI-audio support and some
 fixes
To: Jyri Sarha <jsarha@ti.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <0d627548-0b53-6da3-8468-9bfa2d66cca4@samsung.com>
Date: Fri, 31 May 2019 15:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djPc7pqxh9jDE5Okra4cvEQk8X8I+dY
 La58fc9m0d3ZwWrROXEJu8Wsjz9YLf7v2cFusX7+LTYHDo8Nn5vYPGZ3zGT12LSqk83jfvdx
 Jo/jN7YzeXzeJBfAFsVlk5Kak1mWWqRvl8CV0dKqVHCTo6J5xTP2BsZ3bF2MnBwSAiYSU5vW
 ANlcHEICKxglFja2sUA4Xxgltj46xApSJSTwmVGi830NTMf6q21QHcsZJe5NPQ7lvGWU+Plr
 L1A7B4ewQIjEvo/aIA0iAlUSB1ruM4LYzAJpEqc6F4OtZhPQlPi7+SaYzStgJ/H73F52EJtF
 QFXi4+J/YHFRgQiJ+8c2sELUCEqcnPmEBcTmFDCUWLP4CzPETHmJ7W/nQNniEreezGcCuUdC
 YBe7xL0z51ggrnaR6LhxEOpnYYlXx7ewQ9gyEqcn90DV1EvcX9HCDNHcAfT+hp3MEAlricPH
 L7KCPMYMdPX6XfoQYUeJtZ+2MYGEJQT4JG68FYS4gU9i0rbpzBBhXomONiGIakWJ+2e3Qg0U
 l1h64SvbBEalWUg+m4Xkm1lIvpmFsHcBI8sqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2M
 wJR0+t/xrzsY9/1JOsQowMGoxMM7QehjjBBrYllxZe4hRgkOZiUR3r8vPsQI8aYkVlalFuXH
 F5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYOSeNds858tsn9sRdqks0zk3
 u9cevLXMt/PvIvu/enPMMqeoeM+w7OM9kLB5/XmBktWzFrJcXOIVsteO+X/I/FmWMaJtxRpz
 rz1Zodd27psSp+O6PXLrri92fGgVwhL1ia0h6Kpgh+riWMtQIe36rUV77IyNwpTWV+mrndJI
 OnO+REdd2bkyVImlOCPRUIu5qDgRACNGvyVFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7qqxh9jDPZNMLC4cvEQk8X8I+dY
 La58fc9m0d3ZwWrROXEJu8Wsjz9YLf7v2cFusX7+LTYHDo8Nn5vYPGZ3zGT12LSqk83jfvdx
 Jo/jN7YzeXzeJBfAFqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Ka
 k1mWWqRvl6CX0dKqVHCTo6J5xTP2BsZ3bF2MnBwSAiYS66+2AdlcHEICSxklpkzYwQKREJfY
 Pf8tM4QtLPHnWhdU0WtGiXlnb7N2MXJwCAuESOz7qA1SIyJQJbFywzZWEJtZIE1iwv/DzBD1
 LYwSr55dYQRJsAloSvzdfBNsM6+AncTvc3vZQWwWAVWJj4v/gcVFBSIkzrxfwQJRIyhxcuYT
 MJtTwFBizeIvzBAL1CX+zLsEZctLbH87B8oWl7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsY
 RVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC43DbsZ9bdjB2vQs+xCjAwajEwztB6GOMEGtiWXFl
 7iFGCQ5mJRHevy8+xAjxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjBF5JXEG5oamltYGpob
 mxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYHRYvWIC96xJRt4X2fetsJtQu+KZ2tRZ
 +qnxm6KelJq6iH/IaVVJcrOYw9Ly54HLoTd/G3IlTkxfrLsz8aCoc9vOgldGs2aaCdx8rvKr
 0z7Cdu3DCu2XSrrV4qncWpLFrPm/c+I79rMqZgrNP5AjOUd4ovG1hErZ19oldWuLzjS3Kv1T
 3ZQ1T4mlOCPRUIu5qDgRAE3KyC/ZAgAA
X-CMS-MailID: 20190531135901eucas1p15b2684dbfbdf04ebf5c077388e0c67cb
X-Msg-Generator: CA
X-RootMTR: 20190527134816epcas1p1498005cdec8554f27e15281095d4958d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190527134816epcas1p1498005cdec8554f27e15281095d4958d
References: <CGME20190527134816epcas1p1498005cdec8554f27e15281095d4958d@epcas1p1.samsung.com>
 <cover.1558964241.git.jsarha@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559311143;
 bh=JS6URQoijRo1UAIgaBda5hR8uXLuh/laBLVUAx4Z8fQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=QoH+zszmRdy2AzlVHrZXph/QVZCtJ89G/u7il6zyYD/RxVeP/ZFQddhiCx7TdxP2w
 Fem0ZM3Yb3IqDyxETO3VWz7UfCCTnfv1amXM3/wTYrJ5CFnccDFjNeEI26UnjQpLti
 8xO1eeGRxSNa///m1dVE4JL5KcsC4ViZiKvAu0IE=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDUuMjAxOSAxNTo0NywgSnlyaSBTYXJoYSB3cm90ZToKPiBJIHRoaW5rIHRoZXNlIHNo
b3VsZCBiZSByZWFkeSBmb3IgYXBwbHlpbmcgdG8gZHJtLW1pc2MuCj4KPiBDaGFuZ2VzIHNpbmNl
IHY3Ogo+ICAtIERlYmFzZWQgb24gdG9wIG9mIHRoZSBsYXN0cyBkcm0tbWlzYy1uZXh0IGFuZCB0
ZXN0ZWQKPiAgLSAiZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpaTkwMng6IEFkZCBIRE1JIGF1ZGlv
IGJpbmRpbmdzIgo+ICAgIC0gRHJvcHBlZCBvZmYgIm9yIGhpZ2hlciB0byBhdm9pZCBjb25mbGlj
dCB3aXRoIHZpZGVvIHBvcnRzIgo+ICAgICAgYW5kIGFkZGVkICJSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4iCj4KPiBUaGVyIHByZXZpb3VzIHJvdW5kOgo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA5MTkxNzMvCj4KPiBKeXJpIFNhcmhhICg1
KToKPiAgIGRybS9icmlkZ2U6IHNpaTkwMng6IFNldCBvdXRwdXQgbW9kZSB0byBIRE1JIG9yIERW
SSBhY2NvcmRpbmcgdG8gRURJRAo+ICAgZHJtL2JyaWRnZTogc2lpOTAyeDogcGl4ZWwgY2xvY2sg
dW5pdCBpcyAxMGtIeiBpbnN0ZWFkIG9mIDFrSHoKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBz
aWk5MDJ4OiBSZW1vdmUgdHJhaWxpbmcgd2hpdGUgc3BhY2UKPiAgIGR0LWJpbmRpbmdzOiBkaXNw
bGF5OiBzaWk5MDJ4OiBBZGQgSERNSSBhdWRpbyBiaW5kaW5ncwo+ICAgZHJtL2JyaWRnZTogc2lp
OTAyeDogSW1wbGVtZW50IEhETUkgYXVkaW8gc3VwcG9ydAo+Cj4gVG9taSBWYWxrZWluZW4gKDEp
Ogo+ICAgZHJtL2JyaWRnZTogc2lpOTAyeDogYWRkIGlucHV0X2J1c19mbGFncwo+Cj4gIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dCAgICAgICB8ICA0MiArLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyAgICAgICAgICAgICAgfCA0ODggKysrKysrKysr
KysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTIyIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4KUXVldWVkIHRvIGRybS1taXNjLW5leHQuCgotLQpSZWdhcmRzCkFuZHJ6ZWoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
