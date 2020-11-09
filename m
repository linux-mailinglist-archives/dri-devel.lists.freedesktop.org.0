Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0052AAF4B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 03:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012F5892BB;
	Mon,  9 Nov 2020 02:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A414892BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:17:10 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201109021708epoutp01fb035822a451647dbe8e442d15fbdc47~FtVc4u0ES2015320153epoutp01D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:17:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201109021708epoutp01fb035822a451647dbe8e442d15fbdc47~FtVc4u0ES2015320153epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604888228;
 bh=98GZRyuKZsV0z3X9CzbeAQ1NOTPcGikzawpswfMjRjc=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=GEkabMt9nULdBAH3WFcM/e/qC8lC/mwPu+748I17jYTBk3dUsB6X4+bRP8WuWAbQv
 cnXhFQWrNSyAyR+ZOc8wqi3HioulB197PpH36YEW04KOuejrH0Gnc68YkE/69q9gYv
 FolznBWNk01O4v47a5JP7RJb703MGaxBl31dybTw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201109021708epcas1p238aa301213a7fbb24cb0cf778320b4ed~FtVcsc-ye1403714037epcas1p2x
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:17:08 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.156]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CTvl568D0zMqYkf for
 <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:17:05 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 0D.F5.10463.A96A8AF5; Mon,  9 Nov 2020 11:16:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201109021658epcas1p48d71333681627824e6bd088109f0baac~FtVTeUGh42891828918epcas1p4X
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:16:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201109021658epsmtrp22d1dd44288d8914caf1de680d04fb744~FtVTdwh-O2088620886epsmtrp2g
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:16:58 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-62-5fa8a69a8756
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.4B.13470.A96A8AF5; Mon,  9 Nov 2020 11:16:58 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201109021658epsmtip1f5f51c73eb9192820663b5f385e3f9cf~FtVTStk0r1576415764epsmtip19
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:16:58 +0000 (GMT)
Subject: Re: [PATCH v2 02/16] drm/exynos: remove in_bridge_node from exynos_dsi
To: dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <704a2420-daa1-9c6f-22ae-1d3c98cf1af1@samsung.com>
Date: Mon, 9 Nov 2020 11:24:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201107221904.GB1052534@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOKsWRmVeSWpSXmKPExsWy7bCmru6sZSviDa6dM7K48vU9mwOjx/3u
 40wBjFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlA
 U5UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BZYFesWJucWleel6yfm5VoYGBkam
 QIUJ2RnH+nczF+xlq9jZd46lgfEQaxcjJ4eEgIlE44XlLCC2kMAORom1vwW7GLmA7BlMEm/f
 /GWDcOYwSfxvnc8I09G0cCk7RGIvo8TPb3uYIJypTBJLW3YzgVQJCwRK3NvbzAxiiwgoS/yd
 uAqsm01AVWLiivtsIDavgJ3Ek6cXwGpYBFQkVi+YDnaHqECExPHuyewQNYISJ2c+AYtzAm1e
 2PwTrJ5ZQFzi1pP5TBC2vETz1tnMIEdICGxjlzj0az3QMg4gx0Xi2PoQiKuFJV4d38IOYUtJ
 fH63lw2ivplRYuKM00wQTgejxN3H11kgqowl9i+dzAQyiFlAU2L9Ln2IsKLEzt9zGSEW80m8
 +9rDCrGLV6KjTQiiREni2MUb0NCSkLiwZCIbRImHRM+xQEhYfWaUeHOknX0Co8IsJG/OQvLa
 LCSvzUI4YgEjyypGsdSC4tz01GLDAhPk2N7ECE5xWhY7GOe+/aB3iJGJg/EQowQHs5IIb4vL
 sngh3pTEyqrUovz4otKc1OJDjKbAgJ/ILCWanA9Msnkl8YamRsbGxhYmhmamhoZK4rx/tDvi
 hQTSE0tSs1NTC1KLYPqYODilGpjyU390r72n6x/Ffet2cPXBiqoFR72KHh9MPcW3Juf09Slt
 nDd3e109W9Osdc78/yaXolk6ysfXH+ooOzd7je3s9sSKv42BP6OyY+8c4Xg3WSntx7u+Czrm
 iU5rli34u/3grQmPXwfsyxK5/p7jA4vzmxeHY+51MU/lT+g/LM/0y6zvNNPBFw7PmPKYxfP+
 mElXX1U9qON9b0rBbmGzA6d8Iw2nbD1w3abyfvvSJ65mVVeuS35fd7SfLXXDKm6VWcnvHDxN
 Vpx7U8VZO/fqsq7p3goLHh702GIUcqp1rmnMNRvZ9qVMxfwxsdOMEgR+zg05L+R29b1J6TWH
 WyqTix7wy+qbrGGb3aUb5Mt7/lqLEktxRqKhFnNRcSIAlBDo0foDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSnO6sZSviDRat5re48vU9mwOjx/3u
 40wBjFFcNimpOZllqUX6dglcGcf6dzMX7GWr2Nl3jqWB8RBrFyMnh4SAiUTTwqXsXYxcHEIC
 uxklHq36y9LFyAGUkJDYspUDwhSWOHy4GKJkMpNE6/oz7CC9wgKBEvf2NjOD2CICyhJ/J65i
 hCj6zCjRuHIPC0iCTUBVYuKK+2wgNq+AncSTpxfAGlgEVCRWL5gOViMqECHRcv8PO0SNoMTJ
 mU/A4pxAxy1s/glWzyygLvFn3iUoW1zi1pP5TBC2vETz1tnMExgFZyFpn4WkZRaSlllIWhYw
 sqxilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/dxAgOXS3NHYzbV33QO8TIxMF4iFGCg1lJ
 hLfFZVm8EG9KYmVValF+fFFpTmrxIUZpDhYlcd4bhQvjhATSE0tSs1NTC1KLYLJMHJxSDUze
 0wuP/o84s3q6zdLUGTNWSaaybH28/Lll+Fzfs9ZTciUfpHO82fbjRfKN8yfN9zW31qpNkbqt
 H/ivnKH4o8BP9U/8u092759p98REdH+hkyrTxjuJH/wX55UZ3viitPPI5MLor4XNbtmflpUI
 M3iuyVsWn+u4b/2x6/n8Gju15kfr37A/abzz8YGQWdVa0oIrFJtcUuc3qx3o36emwNi6bZ7k
 4z0fK7NqGLuvlT5dFHu9LtHzfeyTJFkTrd3NKw+ErBexrwnls9z6fp9OqpvB5q27LYxeVYY/
 N0rfFslSKnt/27vXnZF/e57w/P+5kSfl6zaJjOd8K33kv1322bkzvUlgs/rpiJ7d55fvXyum
 xFKckWioxVxUnAgARTHtw8wCAAA=
X-CMS-MailID: 20201109021658epcas1p48d71333681627824e6bd088109f0baac
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201107221911epcas1p1acedc3961678ab80dad45a890718818f
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-3-m.tretter@pengutronix.de>
 <CGME20201107221911epcas1p1acedc3961678ab80dad45a890718818f@epcas1p1.samsung.com>
 <20201107221904.GB1052534@ravnborg.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMTEuIDguIOyYpOyghCA3OjE57JeQIFNhbSBSYXZuYm9yZyDsnbQo6rCAKSDsk7Qg6riA
Ogo+IE9uIEZyaSwgU2VwIDExLCAyMDIwIGF0IDAzOjUzOjU5UE0gKzAyMDAsIE1pY2hhZWwgVHJl
dHRlciB3cm90ZToKPj4gV2UgZG8gbm90IG5lZWQgdG8ga2VlcCBhIHJlZmVyZW5jZSB0byB0aGUg
aW5fYnJpZGdlX25vZGUsIGJ1dCB3ZSBjYW4KPj4gc2ltcGx5IGRyb3AgaXQsIG9uY2Ugd2UgZm91
bmQgYW5kIGF0dGFjaGVkIHRoZSBwcmV2aW91cyBicmlkZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgVHJldHRlciA8bS50cmV0dGVyQHBlbmd1dHJvbml4LmRlPgo+IFJldmlld2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4gTm90ZTogSSBleHBlY3QgZXh5
bm9zIHBlb3BsZSB0byBwaWNrIGl0IHVwLgoKQ2xlYW51cCBwYXRjaCBzbyBwaWNrZWQgaXQgdXAu
CgpUaGFua3MsCklua2kgRGFlCgo+IAo+IAlTYW0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9wcm90ZWN0Mi5maXJlZXllLmNvbS92
MS91cmw/az0wYmE4YTc3Zi01NDMzOWU2Ni0wYmE5MmMzMC0wMDBiYWJmZjM3OTMtZmYzMDIwZWFh
NmMxNjE0OSZxPTEmZT1lYWRmNjQ5MC04NmVmLTQ2MWUtYjM5YS04OTJlM2FlYzAxOTQmdT1odHRw
cyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRy
aS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
