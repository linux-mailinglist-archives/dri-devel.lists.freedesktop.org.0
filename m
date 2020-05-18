Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019831D7003
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 06:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E93889F27;
	Mon, 18 May 2020 04:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F1489F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:57:55 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200518045753epoutp04f3fe6396cdf23a40eb1b97af2228702d~QBo2TJpkH1753317533epoutp04w
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:57:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200518045753epoutp04f3fe6396cdf23a40eb1b97af2228702d~QBo2TJpkH1753317533epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589777873;
 bh=yXsv8E1UntL9w1yd6e3W4jd0T8az3NOcCVGgczve9cc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=lVBOR01lgLflIMcFFpRh309pL5HTgmD2d26fNkO0LnXboNzUifrP8lKPaZfwYU8XS
 MDxeNxTE2xvfM7BlyR8RWWQ+E3RcVOnqzLCr6DLJWxYaIm4vBoafSIlmYBXxEP+ZRT
 AiS2hZQr+bDJJUUDIsr6JxeT/ukDVqPJHVWqQyKA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200518045753epcas1p4974859cbf57fe76717106ee6eb293745~QBo17sfA_0101801018epcas1p4m;
 Mon, 18 May 2020 04:57:53 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49QRbM0Zr6zMqYkZ; Mon, 18 May
 2020 04:57:51 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.9C.04744.9C512CE5; Mon, 18 May 2020 13:57:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200518045744epcas1p360f8997a14d2bab7e54155110f13c95d~QBouP3Ch61602316023epcas1p39;
 Mon, 18 May 2020 04:57:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200518045744epsmtrp2a233aa89076c88460ae637179cf7d1a9~QBouPIGHR1924719247epsmtrp2v;
 Mon, 18 May 2020 04:57:44 +0000 (GMT)
X-AuditID: b6c32a38-26bff70000001288-b5-5ec215c9439b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 52.A3.25866.8C512CE5; Mon, 18 May 2020 13:57:44 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200518045744epsmtip2b3f624f7bca58b9777f65f2f4c9ae392~QBouGo5LT0827608276epsmtip2e;
 Mon, 18 May 2020 04:57:44 +0000 (GMT)
Subject: Re: [PATCH 3/3] drm/exynos-vidi: convert platform driver to use
 dev_groups
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <8050fc74-ae7e-c50f-274a-88d546460d1b@samsung.com>
Date: Mon, 18 May 2020 14:03:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200517193655.3895087-3-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRzGeXfOjjNbHOdlf/bFdWAfLMyd5uwUWgu1Bg0SKlDLy8Ed1Nzl
 cM4mGgSVGLWiNCtq3fzQqAyLaklGN40cZhctSwvUKAsLUciEssva2THy2+99eP7vw/N/XxWm
 OUjoVFUuDye4WAdFLMDbH6amp/UkdZUY97xLZAZmpgjmzqsRBTM+0o8zT/dMxDAnmj8TFqW1
 wz8cYx09EFJYDwVbUT5WVJ1VybF2TtBzrnK3vcpVkU1t2FSaU2rONNJp9EpmBaV3sU4um8q1
 5aetq3JEMil9DevwRqR8VhSp9NVZgtvr4fSVbtGTTXG83cGv5JeJrFP0uiqWlbudq2ijcbk5
 Yiyrrmz7EMe3a2tv7H+C70K/ND4UqwIyAxrawsiHFqg05C0Ek4+eEfLhK4KXf44jyaUhpxE0
 BFJ8SBWd+NS4VvbcRvB94tKcZwrB+2ZM4gRyC7T7z+ISJ5I2GArPEhJj5O7IpW1FEhOkAZou
 jkZ1Nbkarp71KSTGI3qoo18pZSWRBdA7w8qWeOg5OYZLcixpgWCvTb5RC2/HzilkToH6m6cw
 uddMDLS80cmcC4ePtc/pCfAlFIyRWQfTk3ejdYGsR9B0olchH/YhGP4wiMsuE9wPNCukYIxM
 hau302V5MXT8PIPk4EUwOXNQKa9HDfv2zu2Wgu7+ISQzQN/5JkK2WCF8xtGIFvvnFfPPa+Of
 18b/P7cF4a0omeNFZwUn0nzG/He+jqI/cQlzC915ZutCpApRC9V9RZ0lGiVbI9Y5uxCoMCpR
 XTh9r0SjtrN1OzjBXSp4HZzYhcyRtTdhuqRyd+RfuzyltHm5yWRiMuhMM01TWvWxQUeJhqxg
 PVw1x/Gc8G9OoYrV7ULBQcMAuva4/+cBY8rmnb9eEONbUz/9cMQn12jzhrcayO7Z+MbiB5Y+
 piAcCGXVzgpjw76Flh6jlw8UltlC27tbv8UlnDY+D46tz92YmfO2Yc3vK3XdyUzczst7m49q
 +aXFR4LhP6HXHzvrldac4gsjeSMGk2HUJeTtztvWUniewsVKll6CCSL7Fw5dWA2fAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSvO4J0UNxBlcvmVlc+fqezWLP1XtM
 Fi/uXWSxONv0ht1ixuSXbA6sHjtn3WX3uN99nMmjb8sqxgDmKC6blNSczLLUIn27BK6MtY+5
 C7aJV2zuPMPSwPhHqIuRg0NCwETi2QTHLkYuDiGBHYwS005vYIOIS0hs2coBYQpLHD5c3MXI
 CVTyllHizowiEFtYIFRi26x5LCC2iICPxI3/v9hAxjALNDNKzLn1gRli5kmgmZdnM4JUsQmo
 SkxccZ8NxOYVsJNYP6+LCcRmAYof33mRFcQWFYiQeL79BiNEjaDEyZlPWECO4BRwkNhy2gck
 zCygLvFn3iVmCFtc4taT+UwQtrxE89bZzBMYhWYh6Z6FpGUWkpZZSFoWMLKsYpRMLSjOTc8t
 Niwwykst1ytOzC0uzUvXS87P3cQIjgQtrR2Me1Z90DvEyMTBeIhRgoNZSYQ38vO+OCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8X2ctjBMSSE8sSc1OTS1ILYLJMnFwSjUwKX6Nvu4jxy3PHs38
 3KmoPl5794mYcsWlN+71LBIQFm7yNOBI63slkVlfdrX6e4T5m5c/hQ3WzPvJeffBj5fL22KL
 89UVNbwmde+yebto4oelRyQubNry8mioWtQhHq0N8oc7Fz83mv7q1K0Z1/w596zc/jt7N9vE
 W1Wn88/8jdPQjj3Hdm71uU2c+pGW7+03va3auLmlufr1jAOaV4712v87qcF1Suphz4Hktct/
 C9cfrtE/oBjau/pDbH/uZ4Z5e2+99Tokl7Pr/pI5T60W5Jwqmse138lc7PennyYb5T+svf42
 SKtj4f6o11kz/jkvmbn1RkoAX/dhx9cHLe835tevTX55THl2K2ffg97flo5KLMUZiYZazEXF
 iQDKtjy28wIAAA==
X-CMS-MailID: 20200518045744epcas1p360f8997a14d2bab7e54155110f13c95d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200517193951epcas1p172859704e4f4cbd8c3bb0d193d6215a6
References: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
 <CGME20200517193951epcas1p172859704e4f4cbd8c3bb0d193d6215a6@epcas1p1.samsung.com>
 <20200517193655.3895087-3-emil.l.velikov@gmail.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1haWwsCgoyMC4gNS4gMTguIOyYpOyghCA0OjM27JeQIEVtaWwgVmVsaWtvdiDsnbQo6rCA
KSDsk7Qg6riAOgo+IFBsYXRmb3JtIGRyaXZlcnMgbm93IGhhdmUgdGhlIG9wdGlvbiB0byBoYXZl
IHRoZSBwbGF0Zm9ybSBjb3JlIGNyZWF0ZQo+IGFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBh
dHRyaWJ1dGUgZmlsZXMuICBTbyB0YWtlIGFkdmFudGFnZSBvZiB0aGF0Cj4gYW5kIGRvIG5vdCBy
ZWdpc3RlciAiYnkgaGFuZCIgYSBzeXNmcyBmaWxlLgo+IAo+IENjOiBJbmtpIERhZSA8aW5raS5k
YWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5n
LmNvbT4KPiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KPiBDYzog
S3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1p
bC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+IC0tLQo+IENvbXBpbGUgdGVzdGVkIG9ubHkuIFBsZWFz
ZSB0ZXN0IGxvY2FsbHkgYW5kIG1lcmdlIHRocm91Z2ggeW91ciB0cmVlLgoKVGhhbmtzIGZvciB0
YWtpbmcgY2FyZSBvZiB0aGlzLiBUZXN0ZWQgYW5kIHdvcmtlZCB3ZWxsIGxpa2UgYmVsb3csCiMg
ZWNobyAxID4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2V4eW5vcy1kcm0tdmlkaS9jb25uZWN0aW9u
CiMgbW9kZXRlc3QgLU0gZXh5bm9zIC12IC1zIDkxQDg5OjE5MjB4MTA4MCAtcyA3N0A1NDoxNDQw
eDI1NjAKc2V0dGluZyBtb2RlIDE5MjB4MTA4MC02MEh6QFhSMjQgb24gY29ubmVjdG9ycyA5MSwg
Y3J0YyA4OQpzZXR0aW5nIG1vZGUgMTQ0MHgyNTYwLTYwSHpAWFIyNCBvbiBjb25uZWN0b3JzIDc3
LCBjcnRjIDU0CmZyZXE6IDYwLjIySHoKZnJlcTogNTAuNDRIegpmcmVxOiA1OS43OEh6CmZyZXE6
IDUwLjAwSHoKZnJlcTogNTkuNzdIegpmcmVxOiA1MC4wMEh6CgpQcy4gOTEgaXMgY29ubmVjdG9y
IElEIG9mIGV4eW5vcy1kcm0tdmlkaQoKCk1lcmdlZC4KClRoYW5rcywKSW5raSBEYWUKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV92aWRpLmMgfCAyNiArKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV92aWRpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fdmlkaS5j
Cj4gaW5kZXggMjgyNDY3MTIxNjk5Li5lNTY2MmJkY2JiZGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3ZpZGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV92aWRpLmMKPiBAQCAtMjE0LDYgKzIxNCwxMiBAQCBzdGF0aWMg
c3NpemVfdCB2aWRpX3N0b3JlX2Nvbm5lY3Rpb24oc3RydWN0IGRldmljZSAqZGV2LAo+ICBzdGF0
aWMgREVWSUNFX0FUVFIoY29ubmVjdGlvbiwgMDY0NCwgdmlkaV9zaG93X2Nvbm5lY3Rpb24sCj4g
IAkJCXZpZGlfc3RvcmVfY29ubmVjdGlvbik7Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGF0dHJpYnV0
ZSAqdmlkaV9hdHRyc1tdID0gewo+ICsJJmRldl9hdHRyX2Nvbm5lY3Rpb24uYXR0ciwKPiArCU5V
TEwsCj4gK307Cj4gK0FUVFJJQlVURV9HUk9VUFModmlkaSk7Cj4gKwo+ICBpbnQgdmlkaV9jb25u
ZWN0aW9uX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LCB2b2lkICpkYXRhLAo+ICAJ
CQkJc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpCj4gIHsKPiBAQCAtNDM5LDcgKzQ0NSw2IEBA
IHN0YXRpYyBpbnQgdmlkaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7
Cj4gIAlzdHJ1Y3QgdmlkaV9jb250ZXh0ICpjdHg7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2Owo+IC0JaW50IHJldDsKPiAgCj4gIAljdHggPSBkZXZtX2t6YWxsb2MoZGV2LCBz
aXplb2YoKmN0eCksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFjdHgpCj4gQEAgLTQ1MywyMyArNDU4
LDcgQEAgc3RhdGljIGludCB2aWRpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY3R4KTsKPiAgCj4gLQlyZXQgPSBk
ZXZpY2VfY3JlYXRlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfY29ubmVjdGlvbik7Cj4gLQlpZiAocmV0
IDwgMCkgewo+IC0JCURSTV9ERVZfRVJST1IoZGV2LAo+IC0JCQkgICAgICAiZmFpbGVkIHRvIGNy
ZWF0ZSBjb25uZWN0aW9uIHN5c2ZzLlxuIik7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4g
LQlyZXQgPSBjb21wb25lbnRfYWRkKGRldiwgJnZpZGlfY29tcG9uZW50X29wcyk7Cj4gLQlpZiAo
cmV0KQo+IC0JCWdvdG8gZXJyX3JlbW92ZV9maWxlOwo+IC0KPiAtCXJldHVybiByZXQ7Cj4gLQo+
IC1lcnJfcmVtb3ZlX2ZpbGU6Cj4gLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoZGV2LCAmZGV2X2F0dHJf
Y29ubmVjdGlvbik7Cj4gLQo+IC0JcmV0dXJuIHJldDsKPiArCXJldHVybiBjb21wb25lbnRfYWRk
KGRldiwgJnZpZGlfY29tcG9uZW50X29wcyk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgdmlkaV9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiBAQCAtNDk0LDUgKzQ4Myw2IEBA
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdmlkaV9kcml2ZXIgPSB7Cj4gIAkuZHJpdmVyCQk9IHsK
PiAgCQkubmFtZQk9ICJleHlub3MtZHJtLXZpZGkiLAo+ICAJCS5vd25lcgk9IFRISVNfTU9EVUxF
LAo+ICsJCS5kZXZfZ3JvdXBzID0gdmlkaV9ncm91cHMsCj4gIAl9LAo+ICB9Owo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
