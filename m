Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F524B8BDA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9BB6F588;
	Fri, 20 Sep 2019 07:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3E6F573
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 02:10:47 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190920021045epoutp03de4734d236dd00cf23872da9ac87ae51~GA5HcMkXV3145131451epoutp03_
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 02:10:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190920021045epoutp03de4734d236dd00cf23872da9ac87ae51~GA5HcMkXV3145131451epoutp03_
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190920021044epcas1p456ae70086bdc748066c96bee0121b3c1~GA5GhxHXm0843308433epcas1p4X;
 Fri, 20 Sep 2019 02:10:44 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.156]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 46ZHHj38ZszMqYkn; Fri, 20 Sep
 2019 02:10:41 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 68.03.04085.125348D5; Fri, 20 Sep 2019 11:10:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190920021040epcas1p193b15a76e074718a86591a2b0b69a7e5~GA5DQNChY1069910699epcas1p14;
 Fri, 20 Sep 2019 02:10:40 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190920021040epsmtrp2897a8efb4075311bf995d18ecf926bbe~GA5DPVNqs1689516895epsmtrp2m;
 Fri, 20 Sep 2019 02:10:40 +0000 (GMT)
X-AuditID: b6c32a39-d03ff70000000ff5-e7-5d843521246a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 43.C6.03638.025348D5; Fri, 20 Sep 2019 11:10:40 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190920021040epsmtip2b139c5483721235e7252c36c0827e747~GA5DA_R9v3129031290epsmtip2k;
 Fri, 20 Sep 2019 02:10:40 +0000 (GMT)
Subject: Re: [RFC PATCH v2 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2e49bd2c-e074-038b-f8a2-7dd8dea4a9af@samsung.com>
Date: Fri, 20 Sep 2019 11:15:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919142236.4071-2-a.swigon@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIJsWRmVeSWpSXmKPExsWy7bCmga6iaUuswdP9ohaHjm1lt7g/r5XR
 YuOM9awW84+cY7W48vU9m8X0vZvYLCbdn8Bicf78BnaLFXc/slpsenyN1eLyrjlsFp97jzBa
 zDi/j8li7ZG77Ba3G1ewWcyY/JLNQcBj06pONo871/awedzvPs7ksXlJvcfGdzuYPA6+28Pk
 0bdlFaPH501yARxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkou
 PgG6bpk5QB8oKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgosC/SKE3OLS/PS9ZLz
 c60MDQyMTIEKE7Iz5nw4xFpwQ7Hi+LzfTA2M96S6GDk5JARMJH7dnc3WxcjFISSwg1Fi34v1
 rBDOJ0aJPa3nmSCcb4wSW6fMYYdp6Wo+DFW1l1Hi9Zw2ZgjnPaPErnlzWECqhAWiJM7d/QiW
 EBH4zyhxetlKsBZmgU4mid/Pd7CCVLEJaEnsf3GDDcTmF1CUuPrjMSOIzStgJ/Hy5mygGg4O
 FgFViQ9/9EDCogIREp8eHGaFKBGUODnzCdgyTgFLiYUr/oPZzALiEreezGeCsOUlmrfOZoY4
 +xi7xM0tChC2i8TB5w1Q7whLvDq+BcqWkvj8bi8bhF0tsfLkEXDISAh0MEps2X+BFSJhLLF/
 6WQmkNuYBTQl1u/ShwgrSuz8PZcRYi+fxLuvPWDnSwjwSnS0CUGUKEtcfnCXCcKWlFjc3sk2
 gVFpFpJvZiH5YBaSD2YhLFvAyLKKUSy1oDg3PbXYsMAUObo3MYKTt5blDsZj53wOMQpwMCrx
 8CqUN8cKsSaWFVfmHmKU4GBWEuGdY9oUK8SbklhZlVqUH19UmpNafIjRFBjWE5mlRJPzgZkl
 ryTe0NTI2NjYwsTQzNTQUEmc1yO9IVZIID2xJDU7NbUgtQimj4mDU6qBMfr0aa0Zb1imx0qq
 2wmefHw3c42V6J4eq5+/ipTTFwR8/GCtsm5C+dTVl5Xbtz+JdzymlpTEt3nZxW3vul6Hck90
 bp0r9iPXaYZ29M5DXRX9vQxH3tmkCj8VWMqzr+Lp56QNyjYdkus1pf8f/bgucdK2GceVXHtZ
 BeYUTM8P9dHemXpCwHnWdCWW4oxEQy3mouJEAFuHcu/0AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsWy7bCSvK6CaUuswc+LKhaHjm1lt7g/r5XR
 YuOM9awW84+cY7W48vU9m8X0vZvYLCbdn8Bicf78BnaLFXc/slpsenyN1eLyrjlsFp97jzBa
 zDi/j8li7ZG77Ba3G1ewWcyY/JLNQcBj06pONo871/awedzvPs7ksXlJvcfGdzuYPA6+28Pk
 0bdlFaPH501yARxRXDYpqTmZZalF+nYJXBlzPhxiLbihWHF83m+mBsZ7Ul2MnBwSAiYSXc2H
 WbsYuTiEBHYzSsxtb2CDSEhKTLt4lLmLkQPIFpY4fLgYouYto8ShngWsIDXCAlES5+5+ZAZJ
 iAj8Z5R42HaMEcRhFuhkkli85QcL3Ni1D/+BtbAJaEnsf3EDbAW/gKLE1R+PGUFsXgE7iZc3
 Z7OCrGMRUJX48EcPJCwqECFxeMcsqBJBiZMzn7CA2JwClhILV/wHs5kF1CX+zLvEDGGLS9x6
 Mp8JwpaXaN46m3kCo/AsJO2zkLTMQtIyC0nLAkaWVYySqQXFuem5xYYFRnmp5XrFibnFpXnp
 esn5uZsYwXGspbWD8cSJ+EOMAhyMSjy8CuXNsUKsiWXFlbmHGCU4mJVEeOeYNsUK8aYkVlal
 FuXHF5XmpBYfYpTmYFES55XPPxYpJJCeWJKanZpakFoEk2Xi4JRqYFzVmZqw+lDfSbdjcez/
 +f5GNTIEhTpUqVfx1ncvMlg6i2OmZLtKdr2idbhEmUF01LFZ3J7PuOJfv61+XC8buXKd9ZT2
 xgL1hhUHBZ7kN/yT7r5x41jndwtOo+DHb59OyFDo2bJyio1Ec4iW5v+KqS/ONHhsf73vyNmH
 t+NrJzAzv0q06zjQpMRSnJFoqMVcVJwIACnIrprfAgAA
X-CMS-MailID: 20190920021040epcas1p193b15a76e074718a86591a2b0b69a7e5
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190919142322eucas1p24bc477ee6e1bcd65546c305d55af097d
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142322eucas1p24bc477ee6e1bcd65546c305d55af097d@eucas1p2.samsung.com>
 <20190919142236.4071-2-a.swigon@samsung.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568945445;
 bh=k66SEUb+iu7MrIzYXta2w01qjBxjiVzLnojDwgfMr/I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ApHqF90FwJ0ssVzMkCEAamefBjzdlEbKSdZ6/MJ8OXsOeZ0X+GfA7w9OmB229pijj
 uba3LOF1WA8H5KgeiKETCP9vUQE1rCgESh1r0kgpPs2b3gT/iEQDF0dtL70aZ28uNz
 y/LCXP68nI1wiPV+6ukqJQYLU3yOJ7/xW4nBt6XA=
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
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>,
 b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 myungjoo.ham@samsung.com, leonard.crestez@nxp.com, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBcyBJIGFscmVhZHkgcmVwbGllZCBvbiB2MSwgcGF0Y2gxLzIvMyBjbGVhbi11cCBjb2Rl
CmZvciByZWFkYWJpbGl0eSB3aXRob3V0IGFueSBiZWhhdmlvciBjaGFuZ2VzLiAKCkkgdGhpbmsg
dGhhdCB5b3UgYmV0dGVyIHRvIG1lcmdlIHBhdGNoMS8yLzMgdG8gb25lIHBhdGNoLgoKT24gMTku
IDkuIDE5LiDsmKTtm4QgMTE6MjIsIEFydHVyIMWad2lnb8WEIHdyb3RlOgo+IEZyb206IEFydHVy
IMWad2lnb8WEIDxhLnN3aWdvbkBwYXJ0bmVyLnNhbXN1bmcuY29tPgo+IAo+IFRoaXMgcGF0Y2gg
YWRkcyBhIG5ldyBzdGF0aWMgZnVuY3Rpb24sIGV4eW5vc19idXNfcHJvZmlsZV9pbml0KCksIGV4
dHJhY3RlZAo+IGZyb20gZXh5bm9zX2J1c19wcm9iZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFy
dHVyIMWad2lnb8WEIDxhLnN3aWdvbkBwYXJ0bmVyLnNhbXN1bmcuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jIHwgOTIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYyBiL2Ry
aXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMKPiBpbmRleCAyOWY0MjI0Njk5NjAuLjc4ZjM4Yjdm
YjU5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jCj4gKysrIGIv
ZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYwo+IEBAIC0yODcsMTIgKzI4Nyw2MiBAQCBzdGF0
aWMgaW50IGV4eW5vc19idXNfcGFyc2Vfb2Yoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgCXJl
dHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgZXh5bm9zX2J1c19wcm9maWxlX2luaXQo
c3RydWN0IGV4eW5vc19idXMgKmJ1cywKPiArCQkJCSAgIHN0cnVjdCBkZXZmcmVxX2Rldl9wcm9m
aWxlICpwcm9maWxlKQo+ICt7Cj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBidXMtPmRldjsKPiAr
CXN0cnVjdCBkZXZmcmVxX3NpbXBsZV9vbmRlbWFuZF9kYXRhICpvbmRlbWFuZF9kYXRhOwo+ICsJ
aW50IHJldDsKPiArCj4gKwkvKiBJbml0aWFsaXplIHRoZSBzdHJ1Y3QgcHJvZmlsZSBhbmQgZ292
ZXJub3IgZGF0YSBmb3IgcGFyZW50IGRldmljZSAqLwo+ICsJcHJvZmlsZS0+cG9sbGluZ19tcyA9
IDUwOwo+ICsJcHJvZmlsZS0+dGFyZ2V0ID0gZXh5bm9zX2J1c190YXJnZXQ7Cj4gKwlwcm9maWxl
LT5nZXRfZGV2X3N0YXR1cyA9IGV4eW5vc19idXNfZ2V0X2Rldl9zdGF0dXM7Cj4gKwlwcm9maWxl
LT5leGl0ID0gZXh5bm9zX2J1c19leGl0Owo+ICsKPiArCW9uZGVtYW5kX2RhdGEgPSBkZXZtX2t6
YWxsb2MoZGV2LCBzaXplb2YoKm9uZGVtYW5kX2RhdGEpLCBHRlBfS0VSTkVMKTsKPiArCWlmICgh
b25kZW1hbmRfZGF0YSkgewo+ICsJCXJldCA9IC1FTk9NRU07Cj4gKwkJZ290byBlcnI7Cj4gKwl9
Cj4gKwlvbmRlbWFuZF9kYXRhLT51cHRocmVzaG9sZCA9IDQwOwo+ICsJb25kZW1hbmRfZGF0YS0+
ZG93bmRpZmZlcmVudGlhbCA9IDU7Cj4gKwo+ICsJLyogQWRkIGRldmZyZXEgZGV2aWNlIHRvIG1v
bml0b3IgYW5kIGhhbmRsZSB0aGUgZXh5bm9zIGJ1cyAqLwo+ICsJYnVzLT5kZXZmcmVxID0gZGV2
bV9kZXZmcmVxX2FkZF9kZXZpY2UoZGV2LCBwcm9maWxlLAo+ICsJCQkJCQlERVZGUkVRX0dPVl9T
SU1QTEVfT05ERU1BTkQsCj4gKwkJCQkJCW9uZGVtYW5kX2RhdGEpOwo+ICsJaWYgKElTX0VSUihi
dXMtPmRldmZyZXEpKSB7Cj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gYWRkIGRldmZyZXEg
ZGV2aWNlXG4iKTsKPiArCQlyZXQgPSBQVFJfRVJSKGJ1cy0+ZGV2ZnJlcSk7Cj4gKwkJZ290byBl
cnI7Cj4gKwl9Cj4gKwo+ICsJLyoKPiArCSAqIEVuYWJsZSBkZXZmcmVxLWV2ZW50IHRvIGdldCBy
YXcgZGF0YSB3aGljaCBpcyB1c2VkIHRvIGRldGVybWluZQo+ICsJICogY3VycmVudCBidXMgbG9h
ZC4KPiArCSAqLwo+ICsJcmV0ID0gZXh5bm9zX2J1c19lbmFibGVfZWRldihidXMpOwo+ICsJaWYg
KHJldCA8IDApIHsKPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgZGV2ZnJlcS1l
dmVudCBkZXZpY2VzXG4iKTsKPiArCQlnb3RvIGVycjsKPiArCX0KPiArCj4gKwlyZXQgPSBleHlu
b3NfYnVzX3NldF9ldmVudChidXMpOwo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlkZXZfZXJyKGRl
diwgImZhaWxlZCB0byBzZXQgZXZlbnQgdG8gZGV2ZnJlcS1ldmVudCBkZXZpY2VzXG4iKTsKPiAr
CQlnb3RvIGVycjsKPiArCX0KPiArCj4gK2VycjoKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4g
IHN0YXRpYyBpbnQgZXh5bm9zX2J1c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAJc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZSwgKm5vZGU7Cj4gIAlzdHJ1Y3QgZGV2ZnJlcV9k
ZXZfcHJvZmlsZSAqcHJvZmlsZTsKPiAtCXN0cnVjdCBkZXZmcmVxX3NpbXBsZV9vbmRlbWFuZF9k
YXRhICpvbmRlbWFuZF9kYXRhOwo+ICAJc3RydWN0IGRldmZyZXFfcGFzc2l2ZV9kYXRhICpwYXNz
aXZlX2RhdGE7Cj4gIAlzdHJ1Y3QgZGV2ZnJlcSAqcGFyZW50X2RldmZyZXE7Cj4gIAlzdHJ1Y3Qg
ZXh5bm9zX2J1cyAqYnVzOwo+IEBAIC0zMzQsNDUgKzM4NCw5IEBAIHN0YXRpYyBpbnQgZXh5bm9z
X2J1c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKHBhc3NpdmUp
Cj4gIAkJZ290byBwYXNzaXZlOwo+ICAKPiAtCS8qIEluaXRpYWxpemUgdGhlIHN0cnVjdCBwcm9m
aWxlIGFuZCBnb3Zlcm5vciBkYXRhIGZvciBwYXJlbnQgZGV2aWNlICovCj4gLQlwcm9maWxlLT5w
b2xsaW5nX21zID0gNTA7Cj4gLQlwcm9maWxlLT50YXJnZXQgPSBleHlub3NfYnVzX3RhcmdldDsK
PiAtCXByb2ZpbGUtPmdldF9kZXZfc3RhdHVzID0gZXh5bm9zX2J1c19nZXRfZGV2X3N0YXR1czsK
PiAtCXByb2ZpbGUtPmV4aXQgPSBleHlub3NfYnVzX2V4aXQ7Cj4gLQo+IC0Jb25kZW1hbmRfZGF0
YSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqb25kZW1hbmRfZGF0YSksIEdGUF9LRVJORUwp
Owo+IC0JaWYgKCFvbmRlbWFuZF9kYXRhKSB7Cj4gLQkJcmV0ID0gLUVOT01FTTsKPiArCXJldCA9
IGV4eW5vc19idXNfcHJvZmlsZV9pbml0KGJ1cywgcHJvZmlsZSk7Cj4gKwlpZiAocmV0IDwgMCkK
PiAgCQlnb3RvIGVycjsKPiAtCX0KPiAtCW9uZGVtYW5kX2RhdGEtPnVwdGhyZXNob2xkID0gNDA7
Cj4gLQlvbmRlbWFuZF9kYXRhLT5kb3duZGlmZmVyZW50aWFsID0gNTsKPiAtCj4gLQkvKiBBZGQg
ZGV2ZnJlcSBkZXZpY2UgdG8gbW9uaXRvciBhbmQgaGFuZGxlIHRoZSBleHlub3MgYnVzICovCj4g
LQlidXMtPmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZShkZXYsIHByb2ZpbGUsCj4g
LQkJCQkJCURFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORCwKPiAtCQkJCQkJb25kZW1hbmRfZGF0
YSk7Cj4gLQlpZiAoSVNfRVJSKGJ1cy0+ZGV2ZnJlcSkpIHsKPiAtCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBhZGQgZGV2ZnJlcSBkZXZpY2VcbiIpOwo+IC0JCXJldCA9IFBUUl9FUlIoYnVzLT5k
ZXZmcmVxKTsKPiAtCQlnb3RvIGVycjsKPiAtCX0KPiAtCj4gLQkvKgo+IC0JICogRW5hYmxlIGRl
dmZyZXEtZXZlbnQgdG8gZ2V0IHJhdyBkYXRhIHdoaWNoIGlzIHVzZWQgdG8gZGV0ZXJtaW5lCj4g
LQkgKiBjdXJyZW50IGJ1cyBsb2FkLgo+IC0JICovCj4gLQlyZXQgPSBleHlub3NfYnVzX2VuYWJs
ZV9lZGV2KGJ1cyk7Cj4gLQlpZiAocmV0IDwgMCkgewo+IC0JCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGVuYWJsZSBkZXZmcmVxLWV2ZW50IGRldmljZXNcbiIpOwo+IC0JCWdvdG8gZXJyOwo+IC0J
fQo+IC0KPiAtCXJldCA9IGV4eW5vc19idXNfc2V0X2V2ZW50KGJ1cyk7Cj4gLQlpZiAocmV0IDwg
MCkgewo+IC0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHNldCBldmVudCB0byBkZXZmcmVxLWV2
ZW50IGRldmljZXNcbiIpOwo+IC0JCWdvdG8gZXJyOwo+IC0JfQo+ICAKPiAgCWdvdG8gb3V0Owo+
ICBwYXNzaXZlOgo+IAoKCi0tIApCZXN0IFJlZ2FyZHMsCkNoYW53b28gQ2hvaQpTYW1zdW5nIEVs
ZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
