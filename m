Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7214965D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91776E87D;
	Sat, 25 Jan 2020 15:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7115572A36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 11:22:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200124112223euoutp01952a8b2a9437f9333f42831a1c3460e4~szsvF_V793148531485euoutp01b
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 11:22:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200124112223euoutp01952a8b2a9437f9333f42831a1c3460e4~szsvF_V793148531485euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579864943;
 bh=7gGcPJwJd/puSj7LZi16us9UvxlBRcOghdJ+QKXKrdE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pZ0rpTIS6sDqs+F8M9CASenDSK2Jm+FYkBUmW3uWYeson5ULWEp3T+4BP36CCZtDb
 0iXPLNYoSorJ+tsKIfdeNQRGgkpmrB2WqxlHBSwJ/ivwpddc20Zgm/KpcfXKPJNXWw
 WxhinfSC8B5hPs3bfxynLSYnwndIqeKaVqxXFrBo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200124112223eucas1p12ce3c0b8be44a47331317961f80efc9f~szsu5wh0u3241032410eucas1p1C;
 Fri, 24 Jan 2020 11:22:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id C9.A8.60698.F63DA2E5; Fri, 24
 Jan 2020 11:22:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200124112223eucas1p1ff581c051a056b7517655a3eb9ec68de~szsuZclkv2709327093eucas1p1w;
 Fri, 24 Jan 2020 11:22:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200124112223eusmtrp1e4b8f1c165f594e10570ca50f4a6e1a1~szsuYtXfM0086800868eusmtrp1f;
 Fri, 24 Jan 2020 11:22:23 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-9c-5e2ad36f1c56
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 87.FC.08375.F63DA2E5; Fri, 24
 Jan 2020 11:22:23 +0000 (GMT)
Received: from AMDC3555 (unknown [106.120.51.67]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200124112222eusmtip2758daabb6f8219629e4888f27bc2e161~szstqcurH1453014530eusmtip2O;
 Fri, 24 Jan 2020 11:22:22 +0000 (GMT)
Message-ID: <669f89cddb185db7412a4012427fb5ccbaae2652.camel@samsung.com>
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 24 Jan 2020 12:22:22 +0100
In-Reply-To: <747a1c94-8eee-f46a-fcc7-d111cd9df70d@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm27nsuNz6mlFvFl1WEUlpocGBLrMLcggiRQzp6sqDRm7WTkvn
 j9IsSy01JTIVL2Flq1BXhlmayVDRdMhEK7VR64LW7OK16LZ5FvbveZ73ed7ne+FjCGUn5csc
 1h3n9TpNnIqWkQ+av1tXx9v89q/58mIZW51fSbG9ox8otsTSSbHdY59p9kq9mWZz7Tkka7VW
 SdmKga8Ua3b0UKytrohmRy5aEJtvbZCwdy0DUrYvpYJm8/MG6eCZnNmUTnP9PY9pzp7ZIuHu
 lZ/iqodrJVzWfRPiRswLQ6W7ZRui+bjDJ3h9wKYoWazNMkkeLcOJbxwrktEZeQbyYgAHQX3K
 ZSIDyRglrkBg7y2WiGQUwdhLGxLJCIKSohH6X2SiK9szuIkg91OpVCTvXa6fZ5HbJcccWNNt
 UwkfvBcKJu1SN6axGjr6xqc6ZuNvCDrKC6dWEdiC4OP4W9LtIvFyaM6rIdzYC2+CoeI+qdi9
 CpxtWS4P42qYBb9qfdwygRdBak3h1BWAnVLIyXYSon8btBWlSkTsA0Mt9z17FkB73gVSxAK8
 e2inxHAyAvMNiye8Hvo7f9DuMgKvhMq6AFHeDDUTmRK3DFgBz52zxDcoIPfBFUKU5XA+TSlC
 FdRdVYhBgNO3ezy7OegqT6dy0JKC6VsK/rulYLq1FBEmNJc3CNoYXgjU8Qn+gkYrGHQx/ofi
 tWbk+mXtv1vGalHDz4NNCDNI5S1vzFi5X0lpTghGbRMChlDNlqNdLkkerTEm8fr4A3pDHC80
 ofkMqZorD7w2uE+JYzTH+SM8f5TX/5tKGC/fZBR5qdGKXiqeRnyY0R8WscfvTag1cfuh891R
 T0Kc2leBrVWjscHzfw0b6qJ3SBM3PvKtjnz2J7P9k3XRrVJSgXTPjoU6Ux2OrcFo7bjJGWZ8
 nW3D19PWBekTTMacO8sg5BLhrZ53uTVhTtnJgInwxfXrz4XvUS/daZSpJxu3JDnfqkghVrPW
 j9ALmr9Pu97MYQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7r5l7XiDOZcZLXYOGM9q8X1L89Z
 LeYfOcdqceXrezaL6Xs3sVlMuj+BxeL8+Q3sFivufmS12PT4GqvF5V1z2Cw+9x5htJhxfh+T
 xdojd9ktbjeuYLOYMfklmwO/x6ZVnWwed67tYfO4332cyWPzknqPje92MHn0bVnF6PF5k1wA
 e5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexuUj
 P1gKFgpUPHqs3sDYwtvFyMkhIWAi8f1iP2MXIxeHkMBSRomfU9ayQiQkJD6uvwFlC0v8udbF
 BlH0hFHi26apjCAJXgEPifOdl9lAbGGBGIlZP+6zg9hsAvYSZ29/YwJpEBH4zChxeNEnFhCH
 WeAoo8SzExBVLAKqEscmb2UGsTkF7CRezbvNDrHiE6PE3/l3mUASzAKaEq3bf7ND3KEj8fZU
 H9AkDqDVghJ/dwhDlMhLNG+dzTyBUXAWko5ZCFWzkFQtYGRexSiSWlqcm55bbKhXnJhbXJqX
 rpecn7uJERin24793LyD8dLG4EOMAhyMSjy8Er2acUKsiWXFlbmHGCU4mJVEeBnDgEK8KYmV
 ValF+fFFpTmpxYcYTYH+mcgsJZqcD0wheSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1Kz
 U1MLUotg+pg4OKUaGCVWL7+stiLm/LNlh0KSAir8bIv8L/8yfBJisa5Uz6Nx+nUtyfvuGjsa
 LmZnyk24Iv+7a2Gsw8bVnIveXV7AnDT9Y1incJmMoGTKXLkLsR+MF8VvfzD90lTPNt9k2ZlW
 xc+dtvav3xGuxGbraO56PfK7q17IPAGpux0/UrNseA//vz69suZZlRJLcUaioRZzUXEiAMAO
 xRfpAgAA
X-CMS-MailID: 20200124112223eucas1p1ff581c051a056b7517655a3eb9ec68de
X-Msg-Generator: CA
X-RootMTR: 20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com>
 <747a1c94-8eee-f46a-fcc7-d111cd9df70d@linaro.org>
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIDIwMjAtMDEtMjIgYXQgMTg6NTQgKzAyMDAsIEdlb3JnaSBEamFrb3Ygd3Jv
dGU6Cj4gSGkgQXJ0dXIsCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRpbnVvdXMgd29yayBv
biB0aGlzLgo+IAo+IE9uIDEyLzIwLzE5IDEzOjU2LCBBcnR1ciDFmndpZ2/FhCB3cm90ZToKPiA+
IFRoaXMgcGF0Y2ggYWRkcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgdG8gdGhlIEV4eW5vczQ0
MTIgRFQ6Cj4gPiAgIC0gZXh5bm9zLGludGVyY29ubmVjdC1wYXJlbnQtbm9kZTogdG8gZGVjbGFy
ZSBjb25uZWN0aW9ucyBiZXR3ZWVuCj4gPiAgICAgbm9kZXMgaW4gb3JkZXIgdG8gZ3VhcmFudGVl
IFBNIFFvUyByZXF1aXJlbWVudHMgYmV0d2VlbiBub2RlczsKPiAKPiBJcyB0aGlzIERUIHByb3Bl
cnR5IGRvY3VtZW50ZWQgc29tZXdoZXJlPyBJIGJlbGlldmUgdGhhdCB0aGVyZSBzaG91bGQgYmUg
YSBwYXRjaAo+IHRvIGRvY3VtZW50IGl0IHNvbWV3aGVyZSBpbiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvIGJlZm9yZSB1c2luZyBpdC4KCkl0IHdpbGwgYmUgZG9jdW1lbnRlZCBp
biBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVzLnR4
dAppbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiA+ICAgLSAjaW50ZXJjb25uZWN0LWNlbGxzOiByZXF1
aXJlZCBieSB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yay4KPiA+IAo+ID4gTm90ZSB0aGF0ICNp
bnRlcmNvbm5lY3QtY2VsbHMgaXMgYWx3YXlzIHplcm8gYW5kIG5vZGUgSURzIGFyZSBub3QKPiA+
IGhhcmRjb2RlZCBhbnl3aGVyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdv
xYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlu
b3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaQo+ID4gaW5kZXggNGNlM2Q3N2E2NzA0Li5kOWQ3MGVh
Y2ZjYWYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9p
ZC1jb21tb24uZHRzaQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJv
aWQtY29tbW9uLmR0c2kKPiA+IEBAIC05MCw2ICs5MCw3IEBACj4gPiAgJmJ1c19kbWMgewo+ID4g
IAlleHlub3MscHBtdS1kZXZpY2UgPSA8JnBwbXVfZG1jMF8zPiwgPCZwcG11X2RtYzFfMz47Cj4g
PiAgCXZkZC1zdXBwbHkgPSA8JmJ1Y2sxX3JlZz47Cj4gPiArCSNpbnRlcmNvbm5lY3QtY2VsbHMg
PSA8MD47Cj4gPiAgCXN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4gIAo+ID4gQEAgLTEwNiw2
ICsxMDcsOCBAQAo+ID4gICZidXNfbGVmdGJ1cyB7Cj4gPiAgCWV4eW5vcyxwcG11LWRldmljZSA9
IDwmcHBtdV9sZWZ0YnVzXzM+LCA8JnBwbXVfcmlnaHRidXNfMz47Cj4gPiAgCXZkZC1zdXBwbHkg
PSA8JmJ1Y2szX3JlZz47Cj4gPiArCWV4eW5vcyxpbnRlcmNvbm5lY3QtcGFyZW50LW5vZGUgPSA8
JmJ1c19kbWM+Owo+ID4gKwkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+Owo+ID4gIAlzdGF0dXMg
PSAib2theSI7Cj4gPiAgfTsKPiA+ICAKPiA+IEBAIC0xMTYsNiArMTE5LDggQEAKPiA+ICAKPiA+
ICAmYnVzX2Rpc3BsYXkgewo+ID4gIAlleHlub3MscGFyZW50LWJ1cyA9IDwmYnVzX2xlZnRidXM+
Owo+ID4gKwlleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlID0gPCZidXNfbGVmdGJ1cz47
Cj4gPiArCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4gPiAgCXN0YXR1cyA9ICJva2F5IjsK
PiA+ICB9OwoKLS0gCkFydHVyIMWad2lnb8WEClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQK
U2Ftc3VuZyBFbGVjdHJvbmljcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
