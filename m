Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E980562BC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 08:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921386E29B;
	Wed, 26 Jun 2019 06:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D66E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:55:34 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190626065532epoutp0380b1c11618274f70f2aec84515903c1f~rrTNxsN561097610976epoutp03t
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:55:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190626065532epoutp0380b1c11618274f70f2aec84515903c1f~rrTNxsN561097610976epoutp03t
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190626065529epcas1p20cae8d7775b1307460331c0fa489397c~rrTLNV4A52618126181epcas1p2C;
 Wed, 26 Jun 2019 06:55:29 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 72.90.04142.ED6131D5; Wed, 26 Jun 2019 15:55:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190626065525epcas1p45b5c504d059578137602504b3c03f572~rrTH7BQmH0344903449epcas1p4V;
 Wed, 26 Jun 2019 06:55:25 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190626065525epsmtrp1840072c9041aff1f8b611be3ae388f34~rrTH6RO3I2597425974epsmtrp1K;
 Wed, 26 Jun 2019 06:55:25 +0000 (GMT)
X-AuditID: b6c32a36-ce1ff7000000102e-14-5d1316de4a63
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C6.D1.03662.DD6131D5; Wed, 26 Jun 2019 15:55:25 +0900 (KST)
Received: from [10.240.175.117] (unknown [10.240.175.117]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190626065525epsmtip208591286474dbc2569e73418f0993fc5~rrTHmS7mb0717507175epsmtip2X;
 Wed, 26 Jun 2019 06:55:25 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] drm/exynos: trigger build of all modules
To: Sam Ravnborg <sam@ravnborg.org>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <d6d15ef0-cd30-7e20-152a-a869ddee8473@samsung.com>
Date: Thu, 27 Jun 2019 00:54:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625045935.GA23161@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmnu49MeFYgy1v1Cx6z51ksnjadZHZ
 4srX92wWK77MZLfof/ya2eL8+Q3sFmeb3rBbrPi5ldFixuSXbA6cHjtn3WX32LSqk81j+7cH
 rB73u48zeSyZdpXNo2/LKsYAtqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3Ml
 hbzE3FRbJRefAF23zBygs5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BZYFesWJ
 ucWleel6yfm5VoYGBkamQIUJ2RlX7/EUPBGuOP1oMWMDY5tAFyMnh4SAicSRAwvZuxi5OIQE
 djBKdHUvZwVJCAl8YpT4+LIYIvGNUWLPuxNsMB1zFj5khkjsZZR41/oaynnPKLHt9DsmkCph
 AReJ3gXTmEFsEQFliePnr7GCFDEL7GSSeHF+BtgoNgFViYkr7oPZvAJ2Ej3vtjKC2CxA8Sv3
 JoLFRQUiJC5v2cUIUSMocXLmExYQm1PASGLeiT9gNrOAuMStJ/OZIGx5ieats8EukhD4zSYx
 b/oFVoi7XSRWnL7IAmELS7w6voUdwpaSeNnfBmWXSzx79wyohgPIrpH4NrcCwjSWuLgiBcRk
 FtCUWL9LH6JYUWLn77mMEFv5JN597WGFqOaV6GgTgihRkjh28QYjhC0hcWHJRGgYekicaN/C
 NoFRcRaSv2Yh+WUWkl9mISxewMiyilEstaA4Nz212LDACDmqNzGC06uW2Q7GRed8DjEKcDAq
 8fA2yAvFCrEmlhVX5h5ilOBgVhLhXZooECvEm5JYWZValB9fVJqTWnyI0RQY7BOZpUST84Gp
 P68k3tDUyNjY2MLE0MzU0FBJnDee+2aMkEB6YklqdmpqQWoRTB8TB6dUA+Oq/AC7hjBXEYFH
 nn0ia/S3n/p0b/r/yC87+9sKL38Q1P3+dT+nhf636X3xP/o2sdWxXrjn+n+eq/juF6+eFsX/
 5yn58+iZsYWU5feDVR4zV7zoivUXuHrr2JciZa3XcqLR7Yu/feD0KdokPM1j874Dz298fZnj
 y3LT783Rk/fPfG9+td148dO1SizFGYmGWsxFxYkAfYfnLcUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO5dMeFYg/tLTCx6z51ksnjadZHZ
 4srX92wWK77MZLfof/ya2eL8+Q3sFmeb3rBbrPi5ldFixuSXbA6cHjtn3WX32LSqk81j+7cH
 rB73u48zeSyZdpXNo2/LKsYAtigum5TUnMyy1CJ9uwSujKv3eAqeCFecfrSYsYGxTaCLkZND
 QsBEYs7Ch8xdjFwcQgK7GSV2vJ7L0sXIAZSQkNiylQPCFJY4fLgYouQto8SDG0cZQXqFBVwk
 ehdMYwaxRQSUJY6fv8YKUsQssJNJ4u7724wQHY3MEjfnNTGBVLEJqEpMXHGfDcTmFbCT6Hm3
 FWwSC1D8yr2JYHFRgQiJvrbZUDWCEidnPmEBsTkFjCTmnfgDZjMLqEv8mXeJGcIWl7j1ZD4T
 hC0v0bx1NvMERqFZSNpnIWmZhaRlFpKWBYwsqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLz
 czcxgqNKS2sH44kT8YcYBTgYlXh4G+SFYoVYE8uKK3MPMUpwMCuJ8C5NFIgV4k1JrKxKLcqP
 LyrNSS0+xCjNwaIkziuffyxSSCA9sSQ1OzW1ILUIJsvEwSnVwGh6wvjSz+Rubi6D/6/P7G7b
 JW56d+WtrV6Xnud9WFo45ffVm18b/7IYnji6wVG3M+TbxsULA/JKrRdfM92m1dP4IqzqXlrS
 /tigA8eFV3I6euhzcdmyft3e3CgaeKqJt9ylUYpzXoe7396QYp1/FXW9wdphr2Y9e35twZma
 j0+c5m08/erl0hdKLMUZiYZazEXFiQB7fv9CpgIAAA==
X-CMS-MailID: 20190626065525epcas1p45b5c504d059578137602504b3c03f572
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190624152954epcas3p33b627481994f3ce1e57f8664b6f51b30
References: <20190622115623.16314-1-sam@ravnborg.org>
 <20190622115623.16314-3-sam@ravnborg.org>
 <CAAQKjZPqunjVctjFJdwJMEmz7DHT8mDgMQ-_a3sw6BGO9K2q2w@mail.gmail.com>
 <CGME20190624152954epcas3p33b627481994f3ce1e57f8664b6f51b30@epcas3p3.samsung.com>
 <20190624152944.GA20945@ravnborg.org>
 <c11d3bf6-0e01-80bb-7d06-9df566389f01@samsung.com>
 <20190625045935.GA23161@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561532132;
 bh=+CxQlY4jpoyohl9JHZSdAngvv3t42RoKS5p1UrVoVYo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=La/V4SdCCHXf42wa+VH1E7zXY0Vjt4wl0u3NRADsQyjPJ36fKxee7oD2vlCo9MnXj
 vqTAUAbJOuzSeluZ2vSYNthE0zRcTrmg9KRm4yaqPmChTpDvxdXca21vxwQDTolKjd
 YjPJMGJEn8MmO4Sq9R03VH21FqdKw0jUweSlY+mk=
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gMTkuIDYuIDI1LiDsmKTtm4QgMTo1OSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+
IEhpIElua2kuCj4gCj4+PiBBbHBoYSBvZnRlbiBuZWVkcyBvbmUgdG8gcHVsbCBpbiB2bWFsbG9j
LmggLSB3aGVyZSBhbGwgb3RoZXIKPj4+IGFyY2hpdGVjdHVyZXMgZ2V0IGl0IGluZGlyZWN0IHZp
YSBvdGhlciBoZWFkZXJzLgo+Pj4gSSBoYXZlIG5ldmVyIGJvdGhlcmVkIHRvIGZpbmQgb3V0IHdo
eSBhbHBhIG5lZWRzIG1vcmUgaGVhZGVycyBmaWxlcywKPj4+IGJ1dCBJIGFsd2F5cyBtYWtlIHN1
cmUgdG8gdGVzdCB0aGluZ3MgdXNpbmcgYWxwaGEgc28gMC1kYXkgZG8gbm90IHllbGwgYXQgbWUu
Cj4+Cj4+IEkgY291bGRuJ3Qgc2VlIGFueSB3YXJuaW5nIG1lc3NhZ2Ugd2hpbGUgYnVpbGRpbmcg
eW91ciBwYXRjaCBhZnRlciBkcm9wcGluZyBhYm92ZSBjaGFuZ2UuCj4+IENvdWxkIHlvdSBjaGVj
ayBpdCBhZ2FpbiBvbiB0b3Agb2YgYmVsb3cgZ2l0IHJlcG8uPwo+PiAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RhZWlua2kvZHJtLWV4eW5vcy5naXQgZXh5
bm9zLWRybS1uZXh0Cj4+Cj4+IEknbSBnb2luZyB0byByZXF1ZXN0IEdJVC1QVUxMIGFzIHNvb24g
YXMgeW91IGdldCBiYWNrIHRvIG1lLgo+IAo+IFdpdGggdGhlIENPTVBJTEVfVEVTVCBwYXRjaCwg
YnV0IHdpdGhvdXQgdGhlIGV4dHJhIGZpeCBJIGdldDoKPiAKPiAgIENDIFtNXSAgZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2Lm8KPiAvaG9tZS9zYW0va2VybmVsL2RybS1l
eHlub3MvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmM6IEluIGZ1bmN0
aW9uIOKAmGV4eW5vc19kcm1fZmJkZXZfdXBkYXRl4oCZOgo+IC9ob21lL3NhbS9rZXJuZWwvZHJt
LWV4eW5vcy9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYzo5NDo0MDog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHZtYXDigJk7IGRpZCB5
b3UgbWVhbiDigJhibWFw4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KPiAgIGV4eW5vc19nZW0tPmt2YWRkciA9ICh2b2lkIF9faW9tZW0gKikgdm1hcChleHlub3Nf
Z2VtLT5wYWdlcywgbnJfcGFnZXMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm1h
cAo+IC9ob21lL3NhbS9rZXJuZWwvZHJtLWV4eW5vcy9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZmJkZXYuYzo5NTo1OiBlcnJvcjog4oCYVk1fTUFQ4oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmFZNX01QWOKAmT8KPiAg
ICAgIFZNX01BUCwgcGdwcm90X3dyaXRlY29tYmluZShQQUdFX0tFUk5FTCkpOwo+ICAgICAgXn5+
fn5+Cj4gICAgICBWTV9NUFgKPiAvaG9tZS9zYW0va2VybmVsL2RybS1leHlub3MvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmM6OTU6NTogbm90ZTogZWFjaCB1bmRlY2xh
cmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0
IGFwcGVhcnMgaW4KPiAvaG9tZS9zYW0va2VybmVsL2RybS1leHlub3MvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmM6IEluIGZ1bmN0aW9uIOKAmGV4eW5vc19kcm1fZmJk
ZXZfZGVzdHJveeKAmToKPiAvaG9tZS9zYW0va2VybmVsL2RybS1leHlub3MvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmM6MjQzOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBmdW5jdGlvbiDigJh2dW5tYXDigJk7IGRpZCB5b3UgbWVhbiDigJhpb3VubWFw
4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgIHZ1bm1hcChl
eHlub3NfZ2VtLT5rdmFkZHIpOwo+ICAgXn5+fn5+Cj4gICBpb3VubWFwCj4gY2MxOiBzb21lIHdh
cm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gCj4gCj4gVGhpcyBpcyB3aXRoIGEgZnJl
c2hseSBwdWxsZWQgdHJlZSBmcm9tIGRybS1leHlub3MuZ2l0IGV4eW5vcy1kcm0tbmV4dAo+IAo+
IFRoZSB3YXJuaW5nIG9ubHkgYXBwZWFyIGlmIHlvdSBidWlsZCBmb3IgYWxwaGEuCj4gU28gdGhl
IGV4dHJhIGZpeCBpcyBpbmRlZWQgbmVlZGVkLiBCdXQgYWx3YXlzIGdvb2QgdG8gZG91YmxlIGNo
ZWNrIC0KPiB0aGFua3MgZm9yIGFza2luZy4KClRoYW5rcyBmb3IgY2hlY2ssCklua2kgRGFlCgo+
IAo+IE5vdGU6Cj4gTXkgZ2NjIHZlcnNpb24gZm9yIGFscGhhOgo+ICQgYWxwaGEtbGludXgtZ251
LWdjYyAtLXZlcnNpb24KPiBhbHBoYS1saW51eC1nbnUtZ2NjIChVYnVudHUgOC4zLjAtNnVidW50
dTEpIDguMy4wCj4gCj4gCVNhbQo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
