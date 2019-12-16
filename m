Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157411FFC6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745016E434;
	Mon, 16 Dec 2019 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081E6E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:50:44 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20191216005041epoutp03a8e598e1e51d491130e3210b215914a3~gs7De3hKi1925919259epoutp03-
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:50:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20191216005041epoutp03a8e598e1e51d491130e3210b215914a3~gs7De3hKi1925919259epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576457441;
 bh=YR5okB+wE/Z5Q0Ri2lb11HOcE/emcjAXckc5wfCRTkM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XOPq0lxAwbPpQHlGcJgrna7HHs/ksNYwLWgyWsTD4uLJw2YCNtXzdZe4Zg+2rp1xV
 3GvUXiq4NNd2jrHUbFsISZ8kLDfshVntR8tgXRAubsq1qOZRgVXobxkprMjlHoU593
 xGzX1MnbiM5hs7fzJH2lQbC9HwANMJdJh566N3a8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191216005041epcas1p1b0ae2eebb1b374c2dd9c60594bab86c0~gs7DN11mb1634216342epcas1p1A;
 Mon, 16 Dec 2019 00:50:41 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47bjPB5KS0zMqYkZ; Mon, 16 Dec
 2019 00:50:38 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.B7.57028.6D4D6FD5; Mon, 16 Dec 2019 09:50:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191216005030epcas1p191ea4419b39728833efab03c75ce42cc~gs64xzxfP1857218572epcas1p1w;
 Mon, 16 Dec 2019 00:50:30 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191216005030epsmtrp23c57b205909841b728479d74b61e75e1~gs64xBc4f1502215022epsmtrp2T;
 Mon, 16 Dec 2019 00:50:30 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-98-5df6d4d6d0e3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 57.AA.06569.6D4D6FD5; Mon, 16 Dec 2019 09:50:30 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191216005029epsmtip22675afefb21a12808597f328abc97c95~gs64cAA_w2795427954epsmtip2h;
 Mon, 16 Dec 2019 00:50:29 +0000 (GMT)
Subject: Re: [RFC PATCH v2 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
From: Chanwoo Choi <cw00.choi@samsung.com>
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Organization: Samsung Electronics
Message-ID: <61a0b84c-9154-81f6-717c-b0b684b98830@samsung.com>
Date: Mon, 16 Dec 2019 09:57:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <f0453b39-fd05-9824-ee24-39b6bd587876@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRmVeSWpSXmKPExsWy7bCmru61K99iDVqWalvcn9fKaLFxxnpW
 i/lHzrFaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xYq7H1ktNj2+xmpxedccNovPvUcYLWac38dk
 sfbIXXaL240r2CxmTH7J5sDvsWlVJ5vHnWt72Dzudx9n8ti8pN5j47sdTB59W1YxenzeJBfA
 HpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0t5JC
 WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLJArzgxt7g0L10vOT/XytDAwMgUqDAh
 O2PvpcmMBbMVKrpeLWVpYGyV7GLk4JAQMJGY3hbXxcjFISSwg1Hi8tNrLBDOJ0aJp2t2skI4
 3xglGmYfZ+xi5ATrePVwHxNEYi+jxItlp5khnPeMEjuPb2MCqRIWSJe43vkJzGYT0JLY/+IG
 G0iRiMB/RonTy1aCzWUWOMYosffOTxaQKn4BRYmrPx6D7eAVsJPonLmGGcRmEVCVWPGsG6xG
 VCBM4uS2FqgaQYmTM5+AxTkF7CXaFu8Aq2cWEJe49WQ+E4QtL9G8dTbYeRIC+9glJh9+ww7x
 hIvEuqVT2CBsYYlXx7dAxaUkPr/bCxWvllh58ggbRHMHo8SW/RdYIRLGEvuXTmYChR+zgKbE
 +l36EGFFiZ2/5zJCLOaTePe1hxUSxLwSHW1CECXKEpcf3GWCsCUlFrd3sk1gVJqF5J1ZSF6Y
 heSFWQjLFjCyrGIUSy0ozk1PLTYsMESO702M4FStZbqDcco5n0OMAhyMSjy8DtnfYoVYE8uK
 K3MPMUpwMCuJ8KZqf44V4k1JrKxKLcqPLyrNSS0+xGgKDO2JzFKiyfnAPJJXEm9oamRsbGxh
 YmhmamioJM7L8eNirJBAemJJanZqakFqEUwfEwenVAMjx/99vLOm9MWFbH15YLqjyCy2c49C
 N6/ji1qWbfPy7Te23IusuW7XQ8QifompNgR/c6qw2ntnlcgOq4O8201szZ+u1N92R87FXMWo
 aEWxkGPQN+uJO6wz/m0JYEvu4f1j/6xL6KWb4ro9odHqM4rzlvA4yQjZBfz7aVd6x7K5clGp
 4/VvlX5KLMUZiYZazEXFiQA48xwr6wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSvO61K99iDRZd4bK4P6+V0WLjjPWs
 FvOPnGO1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2ixV3P7JabHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFnMmPySzYHfY9OqTjaPO9f2sHnc7z7O5LF5Sb3Hxnc7mDz6tqxi9Pi8SS6A
 PYrLJiU1J7MstUjfLoErY++lyYwFsxUqul4tZWlgbJXsYuTkkBAwkXj1cB8TiC0ksJtR4tYU
 I4i4pMS0i0eZuxg5gGxhicOHi7sYuYBK3jJKzDvZzApSIyyQLnG98xNYL5uAlsT+FzfYQIpE
 BP4zSjxsO8YI4jALHGOU+LhiPStE+wdGicVzHzKDtPALKEpc/fGYEcTmFbCT6Jy5BizOIqAq
 seJZNwuILSoQJrFzyWMmiBpBiZMzn4DFOQXsJdoW7wCrZxZQl/gz7xKULS5x68l8JghbXqJ5
 62zmCYzCs5C0z0LSMgtJyywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgTH
 rJbWDsYTJ+IPMQpwMCrx8Dpkf4sVYk0sK67MPcQowcGsJMKbqv05Vog3JbGyKrUoP76oNCe1
 +BCjNAeLkjivfP6xSCGB9MSS1OzU1ILUIpgsEwenVAPjku6G8598Zwdt/vx14t8357YGhF7b
 9orhRcMascDwpFOTKtblia67cmhJ9VrdW++TnJe1zqgKuZ9742REh2Cv2Jzmr3x2lXm781Mj
 ojW+an1zYBPVjT5UXf5SOj1P22fhZqVTfgKrTe93nXI6fdl8Y0DIaiGvJNE1Aat2c0+ZvGL2
 puv95mt0lFiKMxINtZiLihMBTBV6KtUCAAA=
X-CMS-MailID: 20191216005030epcas1p191ea4419b39728833efab03c75ce42cc
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190919142329eucas1p299762f99dd55a5d625633ceec84219f9
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142329eucas1p299762f99dd55a5d625633ceec84219f9@eucas1p2.samsung.com>
 <20190919142236.4071-9-a.swigon@samsung.com>
 <f0453b39-fd05-9824-ee24-39b6bd587876@samsung.com>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 myungjoo.ham@samsung.com, leonard.crestez@nxp.com, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpQbGVhc2UgaWdub3JlIHNlY29uZCByZXBseS4gSXQgaXMgbXkgbWlzdGFrZQp0byBzZW5k
IHRoZSBkdXBsaWNhdGUgbWVzc2FnZSBiZWNhdXNlIG9mIG15IGNvbXBhbnkgZmlyZXdhbGwgaXNz
dWUuCgpSZWdhcmRzLApDaGFud29vIENob2kKCk9uIDEyLzE2LzE5IDk6NTUgQU0sIENoYW53b28g
Q2hvaSB3cm90ZToKPiBIaSwKPiAKPiBPbiA5LzE5LzE5IDExOjIyIFBNLCBBcnR1ciDFmndpZ2/F
hCB3cm90ZToKPj4gRnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3Vu
Zy5jb20+Cj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0d28gZmllbGRzIHRvIHRoZSBFeHlub3M0NDEy
IERUUzoKPj4gICAtIHBhcmVudDogdG8gZGVjbGFyZSBjb25uZWN0aW9ucyBiZXR3ZWVuIG5vZGVz
IHRoYXQgYXJlIG5vdCBpbiBhCj4+ICAgICBwYXJlbnQtY2hpbGQgcmVsYXRpb24gaW4gZGV2ZnJl
cTsKPj4gICAtICNpbnRlcmNvbm5lY3QtY2VsbHM6IHJlcXVpcmVkIGJ5IHRoZSBpbnRlcmNvbm5l
Y3QgZnJhbWV3b3JrLgo+Pgo+PiBQbGVhc2Ugbm90ZSB0aGF0ICNpbnRlcmNvbm5lY3QtY2VsbHMg
aXMgYWx3YXlzIHplcm8gYW5kIG5vZGUgSURzIGFyZSBub3QKPj4gaGFyZGNvZGVkIGFueXdoZXJl
LiBUaGUgYWJvdmUtbWVudGlvbmVkIHBhcmVudC1jaGlsZCByZWxhdGlvbiBpbiBkZXZmcmVxCj4+
IG1lYW5zIHRoYXQgdGhlcmUgaXMgYSBzaGFyZWQgcG93ZXIgbGluZSAoJ2RldmZyZXEnIHByb3Bl
cnR5KS4gVGhlICdwYXJlbnQnCj4+IHByb3BlcnR5IG9ubHkgc2lnbmlmaWVzIGFuIGludGVyY29u
bmVjdCBjb25uZWN0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5z
d2lnb25AcGFydG5lci5zYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBhcmNoL2FybS9ib290L2R0cy9l
eHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaSB8IDEgKwo+PiAgYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDQxMi5kdHNpICAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwo+PiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpCj4+IGluZGV4IGVhNTVmMzc3ZDE3Yy4uYmRkNjFh
ZTg2MTAzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9p
ZC1jb21tb24uZHRzaQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9p
ZC1jb21tb24uZHRzaQo+PiBAQCAtMTA2LDYgKzEwNiw3IEBACj4+ICAmYnVzX2xlZnRidXMgewo+
PiAgCWRldmZyZXEtZXZlbnRzID0gPCZwcG11X2xlZnRidXNfMz4sIDwmcHBtdV9yaWdodGJ1c18z
PjsKPj4gIAl2ZGQtc3VwcGx5ID0gPCZidWNrM19yZWc+Owo+PiArCXBhcmVudCA9IDwmYnVzX2Rt
Yz47Cj4gCj4gQXMgSSBtZW50aW9uZWQgb24gb3RoZXIgcGF0Y2gsCj4gSSdtIG5vdCBzdXJlIHRv
IHVzZSAncGFyZW50JyBwcm9wZXJ0eSBmb3IgdGhpcyBkcml2ZXIuCj4gSWYgcG9zc2libGUsIHdl
IGJldHRlciB0byB1c2UgdGhlIHN0YW5kYXJkIHdheSBsaWtlIE9GIGdyYXBoCj4gaW4gb3JkZXIg
dG8gbWFrZSB0aGUgdHJlZSBiZXR3ZWVuIGJ1c2VzLiBFeGNlcHQgZm9yIG1ha2luZwo+IHRoZSBj
b25uZWN0aW9uIGJldHdlZW4gdGhlIGJ1c2VzIHdpdGggJ3BhcmVudCcsIGxvb2tzIGdvb2QgdG8g
bWUuCj4gCj4+ICAJc3RhdHVzID0gIm9rYXkiOwo+PiAgfTsKPj4gIAo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNDQxMi5kdHNpCj4+IGluZGV4IGQyMGRiMmRmZThlMi4uYTcwYTY3MWFjYWNkIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKPj4gKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCj4+IEBAIC0zOTAsNiArMzkwLDcgQEAKPj4gIAkJ
CWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJVl9ETUM+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVz
IjsKPj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19kbWNfb3BwX3RhYmxlPjsKPj4g
KwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
Owo+PiAgCQl9Owo+PiAgCj4+IEBAIC0zOTgsNiArMzk5LDcgQEAKPj4gIAkJCWNsb2NrcyA9IDwm
Y2xvY2sgQ0xLX0RJVl9BQ1A+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPj4gIAkJCW9w
ZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19hY3Bfb3BwX3RhYmxlPjsKPj4gKwkJCSNpbnRlcmNv
bm5lY3QtY2VsbHMgPSA8MD47Cj4+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgCQl9Owo+
PiAgCj4+IEBAIC00MDYsNiArNDA4LDcgQEAKPj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJ
Vl9DMkM+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPj4gIAkJCW9wZXJhdGluZy1wb2lu
dHMtdjIgPSA8JmJ1c19kbWNfb3BwX3RhYmxlPjsKPj4gKwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMg
PSA8MD47Cj4+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgCQl9Owo+PiAgCj4+IEBAIC00
NTksNiArNDYyLDcgQEAKPj4gIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJVl9HREw+Owo+PiAg
CQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1
c19sZWZ0YnVzX29wcF90YWJsZT47Cj4+ICsJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+
PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gIAkJfTsKPj4gIAo+PiBAQCAtNDY3LDYgKzQ3
MSw3IEBACj4+ICAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZfR0RSPjsKPj4gIAkJCWNsb2Nr
LW5hbWVzID0gImJ1cyI7Cj4+ICAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfbGVmdGJ1
c19vcHBfdGFibGU+Owo+PiArCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKPj4gIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICAJCX07Cj4+ICAKPj4gQEAgLTQ3NSw2ICs0ODAsNyBAQAo+
PiAgCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfQUNMSzE2MD47Cj4+ICAJCQljbG9jay1uYW1lcyA9
ICJidXMiOwo+PiAgCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2Rpc3BsYXlfb3BwX3Rh
YmxlPjsKPj4gKwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4+ICAJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwo+PiAgCQl9Owo+PiAgCj4+IEBAIC00ODMsNiArNDg5LDcgQEAKPj4gIAkJCWNs
b2NrcyA9IDwmY2xvY2sgQ0xLX0FDTEsxMzM+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsK
Pj4gIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19mc3lzX29wcF90YWJsZT47Cj4+ICsJ
CQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
Pj4gIAkJfTsKPj4gIAo+PiBAQCAtNDkxLDYgKzQ5OCw3IEBACj4+ICAJCQljbG9ja3MgPSA8JmNs
b2NrIENMS19BQ0xLMTAwPjsKPj4gIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7Cj4+ICAJCQlvcGVy
YXRpbmctcG9pbnRzLXYyID0gPCZidXNfcGVyaV9vcHBfdGFibGU+Owo+PiArCQkJI2ludGVyY29u
bmVjdC1jZWxscyA9IDwwPjsKPj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICAJCX07Cj4+
ICAKPj4gQEAgLTQ5OSw2ICs1MDcsNyBAQAo+PiAgCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfU0NM
S19NRkM+Owo+PiAgCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKPj4gIAkJCW9wZXJhdGluZy1wb2lu
dHMtdjIgPSA8JmJ1c19sZWZ0YnVzX29wcF90YWJsZT47Cj4+ICsJCQkjaW50ZXJjb25uZWN0LWNl
bGxzID0gPDA+Owo+PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gIAkJfTsKPj4gIAo+Pgo+
IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
