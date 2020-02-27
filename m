Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA717138A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E106EC66;
	Thu, 27 Feb 2020 08:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E06EC5F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 08:58:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200227085820euoutp01451af87a33e23ba1692676d8cbb20830~3Nqqax5Pm2716027160euoutp01x
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 08:58:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200227085820euoutp01451af87a33e23ba1692676d8cbb20830~3Nqqax5Pm2716027160euoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582793900;
 bh=qyf3f/4GPxGaihzml6Xs74mg5QxZbnvyO1n5g/vXoio=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Kgbbc3jAsyGxhEq/PfDMyzAU4Rfe6s8HLfZk3jsoylak6Gz+xWKcXqiYtx54QZC2Q
 9YgvmvjQW3f2S+saZq1ArjH14dLYe4j9mveNCogYlTzdq0Rue8xG8xdnQisgb7Szdb
 fM3AnNZeYWiQSgHWRyTFaPr0jVsPGeCbe3Tmlo+Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200227085820eucas1p2946723ec5017c334e4179f0857d65a8b~3NqqG1eNx0113001130eucas1p2F;
 Thu, 27 Feb 2020 08:58:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B9.DC.61286.BA4875E5; Thu, 27
 Feb 2020 08:58:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200227085819eucas1p205cbe0921a5711c2967e1e6bbca2e151~3NqpoiXQe3259732597eucas1p2-;
 Thu, 27 Feb 2020 08:58:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200227085819eusmtrp292e2bc4033f73a05eefc88d2428e0f63~3Nqpn7xQL1945219452eusmtrp2S;
 Thu, 27 Feb 2020 08:58:19 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-18-5e5784ab48c6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 6B.66.07950.BA4875E5; Thu, 27
 Feb 2020 08:58:19 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200227085819eusmtip2e3b4d906f8248118a379ff2787c57084~3NqpS-LVX3065630656eusmtip2H;
 Thu, 27 Feb 2020 08:58:19 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: dsi: fix workaround for the legacy clock name
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <93f7a68a-580e-9e1b-27fa-35726a34a12f@samsung.com>
Date: Thu, 27 Feb 2020 09:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220123012.19179-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djPc7prWsLjDLZ8Z7LYOGM9q8WVr+/Z
 LGac38dksfbIXXaLGZNfsjmwetzvPs7k0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBlzf55g
 LuiSqjiyZhtbA2OTWBcjJ4eEgInE/Cn7GLsYuTiEBFYwSnTvnsQO4XxhlOjfe40ZwvnMKDH/
 /2ZmmJbFz6awQSSWM0ps2fKKCcJ5yyixefFJoCp2DmGBAInlBiD1IgKlEnP/H2MHsZkFkiR2
 rupkBbHZBDQl/m6+yQZi8wrYSdxa/QXMZhFQlVhwZjnYLlGBCIlp2/8xQtQISpyc+YQFxOYE
 qj+2aj4zxEx5ieats6FscYlbT+YzQdzZzy7RtSmwi5EDyHaRWPhWAyIsLPHq+BZ2CFtG4v9O
 mPJ6ifsrWsD+lRDoYJTYumEn1L/WEnfO/WIDmcMMdPP6XfoQYUeJlwevs0CM55O48VYQ4gI+
 iUnbpjNDhHklOtqEIKoVJe6f3Qo1UFxi6YWvbBMYlWYh+WsWkl9mIfllFsLeBYwsqxjFU0uL
 c9NTiw3zUsv1ihNzi0vz0vWS83M3MQKTyul/xz/tYPx6KekQowAHoxIPr0RCWJwQa2JZcWXu
 IUYJDmYlEd6NX0PjhHhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliSmp2aWpBaBJNl
 4uCUamCcUvZxJf/USZOrikuCn3yoP6hypdXayv2d1LYH3583Vqx49Uh1+6rX5zU5n/inFzcv
 nlQkfGDCsR8eUnmGQsE/WOrbVliwLt3RuyH1Q61EzIu57o07c47UxvjeeZyaKLfmr4LzvvBn
 1s0lu/N7Wxx02K/L2H/iOb1k2fYVTMoZ204+mPtL+aaMEktxRqKhFnNRcSIA2DL5PSYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7qrW8LjDC5+l7bYOGM9q8WVr+/Z
 LGac38dksfbIXXaLGZNfsjmwetzvPs7k0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
 eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlzf55gLuiSqjiyZhtbA2OTWBcjJ4eE
 gInE4mdT2LoYuTiEBJYySuw6e5sRIiEusXv+W2YIW1jiz7UuqKLXjBJ/Dk9lAUkIC/hJHN5x
 nA3EFhEolXjVfx+omYODWSBJYt8lBYj6iYwSa1ftBKthE9CU+Lv5JpjNK2AncWv1FzCbRUBV
 YsGZ5WDLRAUiJB5PbGeEqBGUODnzCdguTqD6Y6vmg9UwC6hL/Jl3CcqWl2jeOhvKFpe49WQ+
 0wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqNp27GfW3Yw
 dr0LPsQowMGoxMNbkBQWJ8SaWFZcmXuIUYKDWUmEd+PX0Dgh3pTEyqrUovz4otKc1OJDjKZA
 z01klhJNzgdGel5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsa4
 T7Ya0rwMC9ZzvqmP8Gjcs3qNf+mjW9HBi0/9Pr3gssr2M79Pni6M3rQ1IX+aSoXdJ0+d2YuO
 7pTkmFtjqH8ge+e9tZoaAVsvvJliJ7Pi0crvUXFKzg+6xVJ25y60jY15YD3vjvmt2bY+O/Yq
 Wc77tqXZvYKXl/0C71wxzsrp3Mo/RDNrHmxVYinOSDTUYi4qTgQA+X3RWrwCAAA=
X-CMS-MailID: 20200227085819eucas1p205cbe0921a5711c2967e1e6bbca2e151
X-Msg-Generator: CA
X-RootMTR: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
References: <CGME20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18@eucas1p2.samsung.com>
 <20200220123012.19179-1-m.szyprowski@samsung.com>
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
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAuMDIuMjAyMCAxMzozMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiBXcml0aW5nIHRv
IHRoZSBidWlsdC1pbiBzdHJpbmdzIGFycmF5cyBkb2Vzbid0IHdvcmsgaWYgZHJpdmVyIGlzIGxv
YWRlZAo+IGFzIGtlcm5lbCBtb2R1bGUuIFRoaXMgaXMgYWxzbyBjb25zaWRlcmVkIGFzIGEgYmFk
IHBhdHRlcm4uIEZpeCB0aGlzIGJ5Cj4gYWRkaW5nIGEgY2FsbCB0byBjbGtfZ2V0KCkgd2l0aCBs
ZWdhY3kgY2xvY2sgbmFtZS4gVGhpcyBmaXhlcyBmb2xsb3dpbmcKPiBrZXJuZWwgb29wcyBpZiBk
cml2ZXIgaXMgbG9hZGVkIGFzIG1vZHVsZToKPgo+IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBh
Z2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBiZjA0Nzk3OAo+ICBwZ2QgPSAocHRydmFs
KQo+ICBbYmYwNDc5NzhdICpwZ2Q9NTkzNDQ4MTEsICpwdGU9NTkwM2M2ZGYsICpwcHRlPTU5MDNj
NjVmCj4gIEludGVybmFsIGVycm9yOiBPb3BzOiA4MGYgWyMxXSBTTVAgQVJNCj4gIE1vZHVsZXMg
bGlua2VkIGluOiBtYyBleHlub3Nkcm0oKykgYW5hbG9naXhfZHAgcnRjX3MzYyBleHlub3NfcHBt
dSBpMmNfZ3Bpbwo+ICBDUFU6IDEgUElEOiAyMTIgQ29tbTogc3lzdGVtZC11ZGV2ZCBOb3QgdGFp
bnRlZCA1LjYuMC1yYzItbmV4dC0yMDIwMDIxOSAjMzI2Cj4gIHZpZGVvZGV2OiBMaW51eCB2aWRl
byBjYXB0dXJlIGludGVyZmFjZTogdjIuMDAKPiAgSGFyZHdhcmUgbmFtZTogU2Ftc3VuZyBFeHlu
b3MgKEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkKPiAgUEMgaXMgYXQgZXh5bm9zX2RzaV9wcm9iZSsw
eDFmMC8weDM4NCBbZXh5bm9zZHJtXQo+ICBMUiBpcyBhdCBleHlub3NfZHNpX3Byb2JlKzB4MWRj
LzB4Mzg0IFtleHlub3Nkcm1dCj4gIC4uLgo+ICBQcm9jZXNzIHN5c3RlbWQtdWRldmQgKHBpZDog
MjEyLCBzdGFjayBsaW1pdCA9IDB4KHB0cnZhbCkpCj4gIC4uLgo+ICBbPGJmMDNjZjE0Pl0gKGV4
eW5vc19kc2lfcHJvYmUgW2V4eW5vc2RybV0pIGZyb20gWzxjMDliMWNhMD5dIChwbGF0Zm9ybV9k
cnZfcHJvYmUrMHg2Yy8weGE0KQo+ICBbPGMwOWIxY2EwPl0gKHBsYXRmb3JtX2Rydl9wcm9iZSkg
ZnJvbSBbPGMwOWFmY2I4Pl0gKHJlYWxseV9wcm9iZSsweDIxMC8weDM1MCkKPiAgWzxjMDlhZmNi
OD5dIChyZWFsbHlfcHJvYmUpIGZyb20gWzxjMDlhZmY3ND5dIChkcml2ZXJfcHJvYmVfZGV2aWNl
KzB4NjAvMHgxYTApCj4gIFs8YzA5YWZmNzQ+XSAoZHJpdmVyX3Byb2JlX2RldmljZSkgZnJvbSBb
PGMwOWIwMjU0Pl0gKGRldmljZV9kcml2ZXJfYXR0YWNoKzB4NTgvMHg2MCkKPiAgWzxjMDliMDI1
ND5dIChkZXZpY2VfZHJpdmVyX2F0dGFjaCkgZnJvbSBbPGMwOWIwMmRjPl0gKF9fZHJpdmVyX2F0
dGFjaCsweDgwLzB4YmMpCj4gIFs8YzA5YjAyZGM+XSAoX19kcml2ZXJfYXR0YWNoKSBmcm9tIFs8
YzA5YWRlMDA+XSAoYnVzX2Zvcl9lYWNoX2RldisweDY4LzB4YjQpCj4gIFs8YzA5YWRlMDA+XSAo
YnVzX2Zvcl9lYWNoX2RldikgZnJvbSBbPGMwOWFlZmQ4Pl0gKGJ1c19hZGRfZHJpdmVyKzB4MTMw
LzB4MWU4KQo+ICBbPGMwOWFlZmQ4Pl0gKGJ1c19hZGRfZHJpdmVyKSBmcm9tIFs8YzA5YjBkNjQ+
XSAoZHJpdmVyX3JlZ2lzdGVyKzB4NzgvMHgxMTApCj4gIFs8YzA5YjBkNjQ+XSAoZHJpdmVyX3Jl
Z2lzdGVyKSBmcm9tIFs8YmYwMzg1NTg+XSAoZXh5bm9zX2RybV9pbml0KzB4ZTgvMHgxMWMgW2V4
eW5vc2RybV0pCj4gIFs8YmYwMzg1NTg+XSAoZXh5bm9zX2RybV9pbml0IFtleHlub3Nkcm1dKSBm
cm9tIFs8YzAzMDJmYTg+XSAoZG9fb25lX2luaXRjYWxsKzB4NTAvMHgyMjApCj4gIFs8YzAzMDJm
YTg+XSAoZG9fb25lX2luaXRjYWxsKSBmcm9tIFs8YzAzZGQwMmM+XSAoZG9faW5pdF9tb2R1bGUr
MHg2MC8weDIxMCkKPiAgWzxjMDNkZDAyYz5dIChkb19pbml0X21vZHVsZSkgZnJvbSBbPGMwM2Ri
ZjQ0Pl0gKGxvYWRfbW9kdWxlKzB4MWMwYy8weDIzMTApCj4gIFs8YzAzZGJmNDQ+XSAobG9hZF9t
b2R1bGUpIGZyb20gWzxjMDNkYzg1Yz5dIChzeXNfZmluaXRfbW9kdWxlKzB4YWMvMHhiYykKPiAg
WzxjMDNkYzg1Yz5dIChzeXNfZmluaXRfbW9kdWxlKSBmcm9tIFs8YzAzMDEwMDA+XSAocmV0X2Zh
c3Rfc3lzY2FsbCsweDAvMHg1NCkKPiAgRXhjZXB0aW9uIHN0YWNrKDB4ZDk3OWJmYTggdG8gMHhk
OTc5YmZmMCkKPiAgLi4uCj4gIC0tLVsgZW5kIHRyYWNlIGRiMTZlZmUwNWZhYWI0NzAgXS0tLQo+
Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcu
Y29tPgoKCldoeSBkaWQgaXQgd29ya2VkIHdpdGggYnVpbGQtaW4gZHJpdmVyIHJlbWFpbnMgbXlz
dGVyeS4KCgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4K
CsKgLS0KUmVnYXJkcwpBbmRyemVqCgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2RzaS5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2RzaS5jCj4gaW5kZXggMzM2MjhkODVlZGFkLi4wOGE4Y2UzZjQ5OWMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCj4gQEAgLTE3ODcsOSArMTc4NywxMCBAQCBz
dGF0aWMgaW50IGV4eW5vc19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgCQlkc2ktPmNsa3NbaV0gPSBkZXZtX2Nsa19nZXQoZGV2LCBjbGtfbmFtZXNbaV0pOwo+ICAJ
CWlmIChJU19FUlIoZHNpLT5jbGtzW2ldKSkgewo+ICAJCQlpZiAoc3RyY21wKGNsa19uYW1lc1tp
XSwgInNjbGtfbWlwaSIpID09IDApIHsKPiAtCQkJCXN0cmNweShjbGtfbmFtZXNbaV0sIE9MRF9T
Q0xLX01JUElfQ0xLX05BTUUpOwo+IC0JCQkJaS0tOwo+IC0JCQkJY29udGludWU7Cj4gKwkJCQlk
c2ktPmNsa3NbaV0gPSBkZXZtX2Nsa19nZXQoZGV2LAo+ICsJCQkJCQkJT0xEX1NDTEtfTUlQSV9D
TEtfTkFNRSk7Cj4gKwkJCQlpZiAoIUlTX0VSUihkc2ktPmNsa3NbaV0pKQo+ICsJCQkJCWNvbnRp
bnVlOwo+ICAJCQl9Cj4gIAo+ICAJCQlkZXZfaW5mbyhkZXYsICJmYWlsZWQgdG8gZ2V0IHRoZSBj
bG9jazogJXNcbiIsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
