Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2A3500BE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9D46EA93;
	Wed, 31 Mar 2021 12:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C526EA93
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 12:57:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210331125733euoutp015c07e73dc5e8607771a97c89fb4332de~xbrJyTEGE0147201472euoutp01T
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 12:57:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210331125733euoutp015c07e73dc5e8607771a97c89fb4332de~xbrJyTEGE0147201472euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617195453;
 bh=E+50nPi92rcl3hljpyDUpd1FVTuCqD754gCHI9pihaM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=YAv+jY7rZrD4EaHOCchxSEVJ6HYZVAydwQ/EYnYsEgJojrzSShQ48PMNVmHNzhJep
 Q/88NxAzSGccT0vMscXSe63KipA6eEKcK+lvKHelha6XTnXHBrmD3R3nY6SBrYHw0n
 rCTwYOxHW+OwkV7fLBHXrUH/7rBRNWG0G3oRbiNI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210331125733eucas1p1230face2263cc6d2af1f7259a5e3d380~xbrJcnxfq0319403194eucas1p1I;
 Wed, 31 Mar 2021 12:57:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id F2.84.09444.DB174606; Wed, 31
 Mar 2021 13:57:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210331125733eucas1p2b08ba4483bda84a25aab33fe61cb7078~xbrJC1w4q1235812358eucas1p2n;
 Wed, 31 Mar 2021 12:57:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210331125733eusmtrp12892e4a13d242ef921030c17fde7d04f~xbrJCQNmz2344623446eusmtrp1g;
 Wed, 31 Mar 2021 12:57:33 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-9c-606471bd7d9e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CB.13.08705.CB174606; Wed, 31
 Mar 2021 13:57:33 +0100 (BST)
Received: from localhost (unknown [106.210.131.79]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210331125732eusmtip17632fa3c8a3c76e036f35a335df1b194~xbrIg1IW01007610076eusmtip1U;
 Wed, 31 Mar 2021 12:57:32 +0000 (GMT)
Message-ID: <ba8f5a59-e428-ab21-23b9-0a7e650f532c@samsung.com>
Date: Wed, 31 Mar 2021 14:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0)
 Gecko/20100101 Thunderbird/88.0
Subject: Re: [PATCH v4 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
Content-Language: en-GB
To: Adrien Grassein <adrien.grassein@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210331114919.370053-2-adrien.grassein@gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42LZduznOd29hSkJBn+7ZSwedF9ktHj9bzqL
 xZWv79kcmD12zrrL7nG/+ziTx8ent1gCmKO4bFJSczLLUov07RK4Mt5fusdSMF2i4tabl8wN
 jMuFuxg5OSQETCRWr1/N2sXIxSEksIJR4v3+D+wQzhdGiY6nW5ghnM+MEkfmd7DDtCzteMwI
 YgsJLGeUuLGPBaLoBaPEls8fmUASvAJ2Ektu9bKB2CwCqhKb/mxlh4gLSpyc+YQFxBYVSJBY
 dWM5WL2wQJTEwdb7YPXMAuISTV9WsoLYIgL6Euc6PrNCxG0lpm5aywxiswloSvzdfBOsnlPA
 QWLTy2VMEDXyEs1bZ4NdLSGwlkPi1pZeZoirXSTWrmhmg7CFJV4d3wL1jYzE6ck9LBB2vcT9
 FS1QzR2MEls37IRqtpa4c+4XUDMH0AZNifW79CHCjhJLHu1lBwlLCPBJ3HgrCHEDn8SkbdOZ
 IcK8Eh1tQhDVihL3z26FGigusfTCV7YJjEqzkEJlFpLvZyH5ZhbC3gWMLKsYxVNLi3PTU4uN
 8lLL9YoTc4tL89L1kvNzNzECE8npf8e/7GBc/uqj3iFGJg7GQ4wSHMxKIrzCBxIThHhTEiur
 Uovy44tKc1KLDzFKc7AoifMmbVkTLySQnliSmp2aWpBaBJNl4uCUamBaf0ZBT2Llh0Nqy1qV
 doYzTyjx3z6h9NOWxm1lzt6TjNofTReKD413k0pPWtMiGbjtXdvuG+cbkzw5t0VZqYcm79kZ
 bvPNQsNUeOWSjSIVwtZ7d02Sn2o5b71q0Wkv76Cf/mLm63PZrj65l6dp5rfSYj/3/OWvQgO2
 TVzMNbM3YWXHT4eimoU/Lc7qLjm60dc3+mTcFM87oSeOvN0W9TN+ZuGkrXY+D+3L32w9kBSx
 7r3ZoS6zWQVN00qZI5Zc+1Kv/ZtpJYNQJ2Ng7nHFoJf2XI0l5QWiZUcT5iz5MrWuU+3kxh2B
 DhczmJ5/fmfAk6bkOmuV2wquPSHPq17Ms4r7x8E7d0vL+ecbQ5SWTzyoxFKckWioxVxUnAgA
 o4zbdZMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsVy+t/xu7p7C1MSDCYcZLJ40H2R0eL1v+ks
 Fle+vmdzYPbYOesuu8f97uNMHh+f3mIJYI7SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
 NDaPtTIyVdK3s0lJzcksSy3St0vQy3h/6R5LwXSJiltvXjI3MC4X7mLk5JAQMJFY2vGYsYuR
 i0NIYCmjxOv7f1kgEuISu+e/ZYawhSX+XOtigyh6xihx/fsrdpAEr4CdxJJbvWwgNouAqsSm
 P1uh4oISJ2c+ARskKpAgcfbDPCYQW1ggSuJg632wemagBU1fVrKC2CIC+hLnOj6zQsRtJaZu
 WssMsewko8T3yxfBEmwCmhJ/N98Ea+YUcJDY9HIZE0SDmUTX1i5GCFteonnrbOYJjEKzkNwx
 C8m+WUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwerYd+7l5B+O8Vx/1DjEy
 cTAeYpTgYFYS4RU+kJggxJuSWFmVWpQfX1Sak1p8iNEUGBgTmaVEk/OB8ZtXEm9oZmBqaGJm
 aWBqaWasJM67de6aeCGB9MSS1OzU1ILUIpg+Jg5OqQYmOY6bL4+lJ+iLSt9oT9MXZ/5ol7z7
 hODO3XMUWIJ6D67Ye/dPpdbZtZFOy6QjX3R65/67+b22PMv94J4X6jtjWOd21r4z+tblP80v
 8gTzvS/SrX7bTR2nM87YwSvIxb7GOrTi3ofQKBf3Q1dlP3aJ8zPMlX503342577ehZt3iLre
 sAx+0Fy8aeYL/syXJ70OH647kL/yx8r7J1Qy6kRmiPZYaVY5+O2rjln849BL1pZDR3avSU9h
 0f67zuI9p0XSV6cN0+u+VC54xnSpbHPS82JVdZ3A6onOefdXKU3R230/zuK7w5+jSrPXbYk5
 eZelm43tNjMnx4mLW5aItXt3vQ/lUvh9pmrV1aX1CQV1SizFGYmGWsxFxYkACaMlBycDAAA=
X-CMS-MailID: 20210331125733eucas1p2b08ba4483bda84a25aab33fe61cb7078
X-Msg-Generator: CA
X-RootMTR: 20210331114933eucas1p10c9dd909be58d7c78799c8a38c45ddba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210331114933eucas1p10c9dd909be58d7c78799c8a38c45ddba
References: <20210331114919.370053-1-adrien.grassein@gmail.com>
 <CGME20210331114933eucas1p10c9dd909be58d7c78799c8a38c45ddba@eucas1p1.samsung.com>
 <20210331114919.370053-2-adrien.grassein@gmail.com>
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
Cc: dan.carpenter@oracle.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAzMS4wMy4yMDIxIG/CoDEzOjQ5LCBBZHJpZW4gR3Jhc3NlaW4gcGlzemU6Cj4gU29t
ZSBpc3N1ZXMgd2hlcmUgZm91bmQgZHVyaW5nIHN0YXRpYyBhbmFseXNpcyBvZiB0aGlzIGRyaXZl
ci4KCgpTdWJqZWN0IHNob3VsZCBkZXNjcmliZSB3aGF0IGhhcyBiZWVuIGZpeGVkLCBkZXNjcmlw
dGlvbiB3aHkuIElmIHRoZXJlIAppcyBtdWx0aXBsZSBkaWZmZXJlbnQgaXNzdWVzIG1heWJlIHBh
dGNoIHNwbGl0IHdvdWxkIGJlIGJldHRlci4KCgo+Cj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50
ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IERhbiBDYXJwZW50
ZXIgIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWRyaWVuIEdy
YXNzZWluIDxhZHJpZW4uZ3Jhc3NlaW5AZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9sb250aXVtLWx0ODkxMmIuYyB8IDI3ICsrKysrKysrKysrKysrKy0tLS0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDg5MTJiLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ4OTEyYi5jCj4gaW5kZXggNjE0OTE2
MTViYWQwLi40YzhkNzkxNDIyNjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9sb250aXVtLWx0ODkxMmIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1
bS1sdDg5MTJiLmMKPiBAQCAtNjIxLDcgKzYyMSw4IEBAIHN0YXRpYyBpbnQgbHQ4OTEyX3BhcnNl
X2R0KHN0cnVjdCBsdDg5MTIgKmx0KQo+ICAgewo+ICAgCXN0cnVjdCBncGlvX2Rlc2MgKmdwX3Jl
c2V0Owo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IGx0LT5kZXY7Cj4gLQlpbnQgcmV0ID0gMDsK
PiArCWludCByZXQ7Cj4gKwlpbnQgZGF0YV9sYW5lczsKPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUg
KnBvcnRfbm9kZTsKPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50Owo+ICAgCj4gQEAg
LTYzNSwxMyArNjM2LDE2IEBAIHN0YXRpYyBpbnQgbHQ4OTEyX3BhcnNlX2R0KHN0cnVjdCBsdDg5
MTIgKmx0KQo+ICAgCWx0LT5ncF9yZXNldCA9IGdwX3Jlc2V0Owo+ICAgCj4gICAJZW5kcG9pbnQg
PSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfYnlfcmVncyhkZXYtPm9mX25vZGUsIDAsIC0xKTsKPiAt
CWlmIChJU19FUlIoZW5kcG9pbnQpKSB7Cj4gLQkJcmV0ID0gUFRSX0VSUihlbmRwb2ludCk7Cj4g
LQkJZ290byBlbmQ7Cj4gLQl9Cj4gKwlpZiAoIWVuZHBvaW50KQo+ICsJCXJldHVybiAtRU5PREVW
Owo+ICAgCj4gLQlsdC0+ZGF0YV9sYW5lcyA9IG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVtcyhl
bmRwb2ludCwgImRhdGEtbGFuZXMiKTsKPiArCWRhdGFfbGFuZXMgPSBvZl9wcm9wZXJ0eV9jb3Vu
dF91MzJfZWxlbXMoZW5kcG9pbnQsICJkYXRhLWxhbmVzIik7Cj4gICAJb2Zfbm9kZV9wdXQoZW5k
cG9pbnQpOwo+ICsJaWYgKGRhdGFfbGFuZXMgPCAwKSB7Cj4gKwkJZGV2X2VycihsdC0+ZGV2LCAi
JXM6IEJhZCBkYXRhLWxhbmVzIHByb3BlcnR5XG4iLCBfX2Z1bmNfXyk7Cj4gKwkJcmV0dXJuIGRh
dGFfbGFuZXM7Cj4gKwl9Cj4gKwlsdC0+ZGF0YV9sYW5lcyA9IGRhdGFfbGFuZXM7Cj4gICAKPiAg
IAlsdC0+aG9zdF9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKGRldi0+b2Zfbm9kZSwg
MCwgLTEpOwo+ICAgCWlmICghbHQtPmhvc3Rfbm9kZSkgewo+IEBAIC02NTgsMTkgKzY2MiwyMiBA
QCBzdGF0aWMgaW50IGx0ODkxMl9wYXJzZV9kdChzdHJ1Y3QgbHQ4OTEyICpsdCkKPiAgIAl9Cj4g
ICAKPiAgIAlsdC0+aGRtaV9wb3J0ID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHBvcnRfbm9kZSk7Cj4g
LQlpZiAoSVNfRVJSKGx0LT5oZG1pX3BvcnQpKSB7Cj4gKwlpZiAoIWx0LT5oZG1pX3BvcnQpIHsK
PiAgIAkJZGV2X2VycihsdC0+ZGV2LCAiJXM6IEZhaWxlZCB0byBnZXQgaGRtaSBwb3J0XG4iLCBf
X2Z1bmNfXyk7Cj4gLQkJcmV0ID0gUFRSX0VSUihsdC0+aGRtaV9wb3J0KTsKPiAtCQlvZl9ub2Rl
X3B1dChsdC0+aG9zdF9ub2RlKTsKPiAtCQlnb3RvIGVuZDsKPiArCQlyZXQgPSAtRU5PREVWOwo+
ICsJCW9mX25vZGVfcHV0KHBvcnRfbm9kZSk7Cj4gKwkJZ290byBlcnJfZnJlZV9ob3N0X25vZGU7
Cj4gICAJfQo+ICAgCj4gICAJaWYgKCFvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShwb3J0X25vZGUs
ICJoZG1pLWNvbm5lY3RvciIpKSB7Cj4gICAJCWRldl9lcnIobHQtPmRldiwgIiVzOiBGYWlsZWQg
dG8gZ2V0IGhkbWkgcG9ydFxuIiwgX19mdW5jX18pOwo+ICsJCW9mX25vZGVfcHV0KHBvcnRfbm9k
ZSk7Cj4gICAJCXJldCA9IC1FSU5WQUw7Cj4gKwkJZ290byBlcnJfZnJlZV9ob3N0X25vZGU7CgpN
YXliZSBiZXR0ZXIgd291bGQgYmUgdG8gcHV0IG9mX25vZGVfcHV0KHBvcnRfbm9kZSkgYWZ0ZXIg
CmVycl9mcmVlX2hvc3Rfbm9kZSBsYWJlbCAtIG9mX25vZGVfcHV0KE5VTEwpIGRvZXMgbm90aGlu
Zy4KCj4gICAJfQo+ICAgCj4gICAJb2Zfbm9kZV9wdXQocG9ydF9ub2RlKTsKPiArCXJldHVybiAw
Owo+ICAgCj4gICBlbmQ6Cj4gICAJcmV0dXJuIHJldDsKClRoaXMgbGFiZWwgYW5kIGNvZGUgY2Fu
IGJlIHJlbW92ZWQsIGFtIEkgcmlnaHQ/CgpBZnRlciByZWFkaW5nIHRoZSBib2R5IEkga25vdyB3
aGF0IHRoZSBwYXRjaCBkb2VzLCBzbyBJIGNhbiBwcm9wb3NlIHRoZSAKc3ViamVjdCwgd2hhdCBh
Ym91dCAiZml4IGluY29ycmVjdCBoYW5kbGluZyBvZiBvZl8qIHJldHVybiB2YWx1ZXMiLgoKQW5k
IHBsZWFzZSBtYWtlIGRlc2NyaXB0aW9uIG1vcmUgZGVzY3JpcHRpdmUgOikKCldpdGggdGhhdCBm
aXhlZCB5b3UgY2FuIGFkZCBteToKClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgoKUmVnYXJkcwpBbmRyemVqCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
