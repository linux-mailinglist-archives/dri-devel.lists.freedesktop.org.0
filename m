Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CAE30FBEB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8445B6EE3B;
	Thu,  4 Feb 2021 18:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686AC6EE3B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:49:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210204184942euoutp0156d83a67c989e6a4065cb27c74add83f~gn-6cwTB13207832078euoutp01J
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:49:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210204184942euoutp0156d83a67c989e6a4065cb27c74add83f~gn-6cwTB13207832078euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612464582;
 bh=wH+MwNpTr7oYcZ0xHHYd52OT1ll3Vch+G7dRTSp+KgY=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=BNokGwe+AsErgR5iMopkPQAOSiCewufXxZoU0L9mciQ2ohsn9CXyHDmbQSHfejwCD
 cZQyPiWFPpqs0Dp5dK5iZ7dbcWMtpAqe2RM1rfaHQ76kSb3AAZgwRXbD+d/iLm5Kbx
 GSh1ekP23pmxZrojIE+wgKTib09ZrnHTaDk4uDyw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210204184942eucas1p1488f15f701f972f4620d508e6181f2b6~gn-6EgchO0320603206eucas1p1U;
 Thu,  4 Feb 2021 18:49:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.79.45488.5C14C106; Thu,  4
 Feb 2021 18:49:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210204184940eucas1p2eef7a2425aeb06584776b0aaa956c722~gn-4-oTYr0449804498eucas1p2L;
 Thu,  4 Feb 2021 18:49:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210204184940eusmtrp2aa41e1328e6a1720c10664d2c28f63be~gn-4_5doF2361923619eusmtrp2s;
 Thu,  4 Feb 2021 18:49:40 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-54-601c41c5d9bc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5D.F6.16282.4C14C106; Thu,  4
 Feb 2021 18:49:40 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210204184940eusmtip1b4b42074430fccd85fe57ae50c6e4094~gn-4ZQplK0753607536eusmtip1U;
 Thu,  4 Feb 2021 18:49:40 +0000 (GMT)
Message-ID: <d5d8ad95-dd45-2959-d84c-c23a452db644@samsung.com>
Date: Thu, 4 Feb 2021 19:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH] drm: bridge: adv7511: Add set_jack handler
Content-Language: en-GB
To: Jun Nie <jun.nie@linaro.org>, john.stultz@linaro.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210119044157.3801598-1-jun.nie@linaro.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djP87pHHWUSDNbNtbLoPXeSyeLKxUNM
 Fk0db1ktmlqnMFtMffiEzeLK1/dsFmd+61osefKQ3eLV4V2MFq17j7A7cHls+NzE5vHqqqPH
 5b5eJo9NqzrZPO5c28Pmsf3bA1aP+93HmTy+nZnIEsARxWWTkpqTWZZapG+XwJWx5vkn9oLr
 AhUPdj5mamBcz9vFyMkhIWAicWjaa8YuRi4OIYEVjBIPPp9hhXC+MEpMPb+BBcL5zCixecZk
 VpiW9q3XoBLLGSUWzVvIBuG8Z5T4de4aI0gVr4CdxJbVPUwgNouAikTj6WksEHFBiZMzn4DZ
 ogIJEhs6N4PVCAvYS5x4tgVsA7OAuETTl5VgtoiAhcTWU9fYQRYwC1xjlNg0+SdYgk1AU+Lv
 5ptsIDangJXEtMVrWSCa5SWat85mBmmQEGjnlGidNocF4m4XiS2LH0H9ICzx6vgWdghbRuL/
 zvlMEHa9xP0VLVDNHYwSWzfsZIZIWEvcOfcLaBsH0AZNifW79CHCjhJbm4+ygoQlBPgkbrwV
 hLiBT2LStunMEGFeiY42IYhqRYn7Z7dCDRSXWHrhK9sERqVZSMEyC8n7s5B8Mwth7wJGllWM
 4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBCez0v+NfdzCuePVR7xAjEwfjIUYJDmYlEd7E
 NqkEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ry7tq6JFxJITyxJzU5NLUgtgskycXBKNTB1VP1l
 SWeJWDOHY7aXTJS5ke8K/c6f95RyjlgwTH1X57Ot4YiY0o7D3yVP9v5InvT/zpyTuiHXj+Qe
 albKmJr1PLYztMJ1pa2hntSxlJ2ce2R/NMWxTYm6dJD7ycptfw0U5px4fcSuR1ho2v212tZT
 o+48brv8VhiowqEmafuy1R8ZXCysTpzernhzp2afVM3ku4d+V8Vcf/+Jh9lQ/P+nazEzIpfM
 /n/GgDGtOeWC884j3vdKV8yKSf1+gdHqOssM0VOf03Yun35D9tHKPenFV29rdCrUsImwv9RK
 XR/8MHXtzheT2nfvl7v2MOA5b6C66Dl/95t9ZbGuqtNWP1noJ+8R/e7v1d1v97WbvrJRYinO
 SDTUYi4qTgQAa3xzEM8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7pHHGUSDE7+NbboPXeSyeLKxUNM
 Fk0db1ktmlqnMFtMffiEzeLK1/dsFmd+61osefKQ3eLV4V2MFq17j7A7cHls+NzE5vHqqqPH
 5b5eJo9NqzrZPO5c28Pmsf3bA1aP+93HmTy+nZnIEsARpWdTlF9akqqQkV9cYqsUbWhhpGdo
 aaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex5vkn9oLrAhUPdj5mamBcz9vFyMkhIWAi
 0b71GksXIxeHkMBSRolL94+zQSTEJXbPf8sMYQtL/LnWxQZR9JZRYt3tb6wgCV4BO4ktq3uY
 QGwWARWJxtPTWCDighInZz4Bs0UFEiQm978GGyosYC9x4tkWsF5moAVNX1aC2SICFhJbT11j
 B1nALHANaMGfyVDbehkl7s9exQ5SxSagKfF3802wSZwCVhLTFq9lgZhkJtG1tYsRwpaXaN46
 m3kCo9AsJIfMQrJwFpKWWUhaFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiM2W3Hfm7Z
 wbjy1Ue9Q4xMHIyHGCU4mJVEeBPbpBKEeFMSK6tSi/Lji0pzUosPMZoCQ2Mis5Rocj4waeSV
 xBuaGZgamphZGphamhkrifOaHFkTLySQnliSmp2aWpBaBNPHxMEp1cDE5/YpuXzRVjMOxfvv
 z9kdapCeu1XOWn7ut5kCaQ/5wl8EC/197rrQ7JZp903R1bNvNB7dfkLf7rXyrbCFRn21ah5P
 nc/u32mcdr9ogvofeTul6lzLHcfz/pzL8dX/qJvrErv3vLdgOoNw67nfGiqzC05cn9vcYfW9
 /0LuTzELy7k67I4xlnu+/XnH27UkbR7b47Yf2244/wt9uPtia7L56RXzrxyS3tDRk8VzOfxn
 w5nlHca/z0V21f00eVgz94D9tBPp0yN6N8+5GFcW9038jn+z3HHBk71K03V5jRj5U7fnCi4X
 e3Ppv9H91L4EjqlxjF0T7La95qzTDjjqwBhQ8Du+z9Rj81J71aAy/UNKLMUZiYZazEXFiQAT
 dkLtYgMAAA==
X-CMS-MailID: 20210204184940eucas1p2eef7a2425aeb06584776b0aaa956c722
X-Msg-Generator: CA
X-RootMTR: 20210119083817eucas1p2076a221a3d70372fb1a7dc55ed9b2ac3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210119083817eucas1p2076a221a3d70372fb1a7dc55ed9b2ac3
References: <CGME20210119083817eucas1p2076a221a3d70372fb1a7dc55ed9b2ac3@eucas1p2.samsung.com>
 <20210119044157.3801598-1-jun.nie@linaro.org>
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
Cc: architt@codeaurora.org, kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, broonie@kernel.org, bogdan.togorean@analog.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAxOS4wMS4yMDIxIG/CoDA1OjQxLCBKdW4gTmllIHBpc3plOgo+IFdpdGggY29tbWl0
IDU1YzVjYzYzYWIsIHRoZSBoZG1pX2NvZGVjX3NldF9qYWNrKCkgd2lsbCByZXBvcnQgdW5zdXBw
b3J0Cj4gZmFpbHVyZSBpZiBzZXRfamFjayBoYW5kbGVyIGlzIG1pc3NpbmcuIEFkZCBzZXRfamFj
ayBoYW5kbGVyIHRvIHJlc29sdmUKPiB0aGlzIGZhaWx1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
dW4gTmllIDxqdW4ubmllQGxpbmFyby5vcmc+Cj4gLS0tCj4gICAuLi4vZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMgICAgfCAyNyArKysrKysrKysrKysrKy0tLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYwo+IGluZGV4IGYx
MDFkZDI4MTliNS4uMTZkZTFhOGNhN2EwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jCj4gQEAgLTIxNywyMiArMjE3LDM1IEBAIHN0YXRp
YyBpbnQgYWR2NzUxMV9oZG1pX2kyc19nZXRfZGFpX2lkKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVu
dCAqY29tcG9uZW50LAo+ICAgCXJldHVybiAtRUlOVkFMOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBp
bnQgYWR2NzUxMV9oZG1pX2kyc19ob29rX3BsdWdnZWRfY2Ioc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhLAo+ICsJCQkJCSAgICBoZG1pX2NvZGVjX3BsdWdnZWRfY2IgZm4sCj4gKwkJCQkJ
ICAgIHN0cnVjdCBkZXZpY2UgKmNvZGVjX2RldikKPiArewo+ICsJc3RydWN0IGFkdjc1MTEgKmFk
djc1MTEgPSBkYXRhOwo+ICsJYm9vbCBwbHVnZ2VkID0gYWR2NzUxMS0+Y29ubmVjdG9yLnN0YXR1
cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKCk1heWJlIHNvbWUgbG9ja2luZywgdG8g
cHJvdGVjdCBhY2Nlc3MgdG8gYWR2NzUxMS0+Y29ubmVjdG9yLnN0YXR1cy4KCj4gKwo+ICsJZm4o
Y29kZWNfZGV2LCBwbHVnZ2VkKTsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBoZG1pX2NvZGVjX29wcyBhZHY3NTExX2NvZGVjX29wcyA9IHsKPiAgIAkuaHdf
cGFyYW1zCT0gYWR2NzUxMV9oZG1pX2h3X3BhcmFtcywKPiAgIAkuYXVkaW9fc2h1dGRvd24gPSBh
dWRpb19zaHV0ZG93biwKPiAgIAkuYXVkaW9fc3RhcnR1cAk9IGF1ZGlvX3N0YXJ0dXAsCj4gICAJ
LmdldF9kYWlfaWQJPSBhZHY3NTExX2hkbWlfaTJzX2dldF9kYWlfaWQsCj4gLX07Cj4gLQo+IC1z
dGF0aWMgY29uc3Qgc3RydWN0IGhkbWlfY29kZWNfcGRhdGEgY29kZWNfZGF0YSA9IHsKPiAtCS5v
cHMgPSAmYWR2NzUxMV9jb2RlY19vcHMsCj4gLQkubWF4X2kyc19jaGFubmVscyA9IDIsCj4gLQku
aTJzID0gMSwKPiAtCS5zcGRpZiA9IDEsCj4gKwkuaG9va19wbHVnZ2VkX2NiID0gYWR2NzUxMV9o
ZG1pX2kyc19ob29rX3BsdWdnZWRfY2IsCj4gICB9Owo+ICAgCj4gICBpbnQgYWR2NzUxMV9hdWRp
b19pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGFkdjc1MTEgKmFkdjc1MTEpCj4gICB7
Cj4gKwlzdHJ1Y3QgaGRtaV9jb2RlY19wZGF0YSBjb2RlY19kYXRhID0gewoKCkkgdGhpbmsgY29u
c3QgbW9kaWZpZXIgc2hvdWxkIGJlIE9LIGhlcmUuCgoKUmVnYXJkcwoKQW5kcnplagoKCj4gKwkJ
Lm9wcyA9ICZhZHY3NTExX2NvZGVjX29wcywKPiArCQkubWF4X2kyc19jaGFubmVscyA9IDIsCj4g
KwkJLmkycyA9IDEsCj4gKwkJLnNwZGlmID0gMSwKPiArCQkuZGF0YSA9IGFkdjc1MTEsCj4gKwl9
Owo+ICsKPiAgIAlhZHY3NTExLT5hdWRpb19wZGV2ID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVy
X2RhdGEoZGV2LAo+ICAgCQkJCQlIRE1JX0NPREVDX0RSVl9OQU1FLAo+ICAgCQkJCQlQTEFURk9S
TV9ERVZJRF9BVVRPLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
