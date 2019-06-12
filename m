Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AAB41D6F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6F89363;
	Wed, 12 Jun 2019 07:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54789341
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:18:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190612071807euoutp02a4c1efed9a3005f71c53d04eb5c3ed75~nYk8AwAIT0224602246euoutp02F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:18:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190612071807euoutp02a4c1efed9a3005f71c53d04eb5c3ed75~nYk8AwAIT0224602246euoutp02F
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190612071806eucas1p24457744ce55feb071aaada8e3fa3c118~nYk7cTv962271322713eucas1p2p;
 Wed, 12 Jun 2019 07:18:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C1.5A.04377.E27A00D5; Wed, 12
 Jun 2019 08:18:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190612071806eucas1p29bbe929b1df18938ce355e9f63320ce1~nYk6x4tin1127011270eucas1p24;
 Wed, 12 Jun 2019 07:18:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190612071805eusmtrp2dd48ceed9f5cd27bd15669b50836115e~nYk6iy9VE2761027610eusmtrp2i;
 Wed, 12 Jun 2019 07:18:05 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-8b-5d00a72e2f49
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8D.9A.04146.D27A00D5; Wed, 12
 Jun 2019 08:18:05 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190612071805eusmtip2609a10c68b1a6cffa2e792a4a0929d3f~nYk54NAEO1398613986eusmtip2W;
 Wed, 12 Jun 2019 07:18:05 +0000 (GMT)
Subject: Re: [PATCH v1 0/2] dw-mipi-dsi: add power on & off optional phy ops
 and update stm
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Nickey Yang
 <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8fad125a-54f2-7cca-fa01-5d7098930d62@samsung.com>
Date: Wed, 12 Jun 2019 09:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUiTYRzHfXwPX0ez12ntV1rhosAoTRF66KKi4wUhCvpDKrOVL54z2zyy
 /lC6nHaQGppzmYRDEY+aTptkXtg61JJy2eVM14FhUh61atnmu8j/Pr/v8/0dX3gYQmKnFjNx
 SSm8MkmeKKNFZON9W++aoAq3yLU9fUvwpd6H7vi29THCpzse0XimMY/Az6fGHTT8mcI5eeUe
 WD9ipvCzZi2Nc81WCpfaayis+/UF4aGznyhcaTMg3N3fRuLsnHP0FpZrmS4jOaPmrQdXoi6m
 uDfmuzTXND1EcZYLJneuvjyTKy/spzm7ppXkmsylBNd+L4R7/6OF4Cb0S/eI94s2RvOJcWm8
 MnjzYVHst4/PqORx+kT267ceWaiGykWeDLBhUPFh0MEiRsJWIhjuN9BCMYlg9OsAKRQTCL5l
 dxL/WuxjtYTwUIFA+1Lnco0huHOt21EwjA8bCbrhWd2X1VLQrv0+u5BmA8Fe/5J2spjdDO3P
 G2ankuwK6DI+QU5ewEbApFGPBI83PCy2kk72ZHeCfnhidg7BLoMzhhJCYCm8st5wdy4D9joD
 Ay9KXem2w6OmQg+BfWDU1OBif5gxOhucnAmWyrOE0KxGYLhldOXcAJ2mPsqZhnBcXdccLMhb
 YWzERjhlYL1gYMxbuMEL8huLXLIY1OclgjsALD0G10Ap6J5O0YKFg4sWvysoQDMnpGZOMM2c
 YJr/J5QhsgpJ+VSVIoZXhSbx6UEquUKVmhQTdPSYQo8cn/LxH9PkHdT8+0gHYhkkmyduK5o5
 KKHkaaoMRQcChpD5ikMT3CIl4mh5xkleeSxKmZrIqzqQH0PKpOJTbkMHJGyMPIVP4PlkXvnv
 1Z3xXJyF8goUmdSVtbZ3y8fTjTGHyifUpl0Gm7++ZGbo3pRuNw6vjl/t+6BWWxUbrFjYik2d
 p+n11ZlRihUZWdGcOu7m4ekuS11d2M/iqU2B1vH7V2ukg10RqwoX7d0RWlBRG2+XmG0jvn3q
 jKZBN+m28PmGtJ8Hy9ZdLiLyNQPHE1a27pORqlh5yCpCqZL/BTswG1+QAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42I5/e/4PV3d5QyxBn9ea1v0njvJZLHxyWlG
 i6ZDp9gs/m+byGxx5et7IOvRa1aLzolL2C02Pb7GanF51xw2i65rT1gt5v1dy2qx9Pc7RosH
 LS9YLVb83MpocebqARaL9s5WNgcBj73fFrB47Jx1l91jdsdMVo871/aweWz/9oDV4373cSaP
 zUvqPZZMu8rm8XfWfhaP7dfmMXsc3Gfo8fTHXmaPz5vkAnij9GyK8ktLUhUy8otLbJWiDS2M
 9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DI+Pb/MWvCeraL99l32Bsa1rF2MnBwS
 AiYSf9+uY+5i5OIQEljKKLH4zHIWiIS4xO75b5khbGGJP9e62CCKXjNKdFxpBOrm4BAWiJVY
 +ogFJC4isIBVou1qLyNE0UxGibcnHoN1swloSvzdfJMNxOYVsJM4eGULWJxFQFXi6M7zjCC2
 qECExOxdDSwQNYISJ2c+AbM5BdwkNj36DHYqs4C6xJ95l5ghbHmJ5q2zoWxxiVtP5jNNYBSc
 haR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwCWw79nPzDsZLG4MP
 MQpwMCrx8B6Y/j9GiDWxrLgy9xCjBAezkgivUTZDrBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJL
 iSbnAxNUXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRs4VXmUz
 Tgu8fNGyLfboae8wq7AHl+12LPa/v6haM+naCulNs00PWGpznzN9s2md8ManpyNaanXNbANU
 9N+yZGo8vBv1+bqvoDx3q5t/biVLSJzCP+Nu1mkS+WqFKybYCjalZrqb7xDvEP2l/TQ8vPLa
 7bm3J3g2bWs0DGc5eCJ0dnUz59ZOJZbijERDLeai4kQARRSawBgDAAA=
X-CMS-MailID: 20190612071806eucas1p29bbe929b1df18938ce355e9f63320ce1
X-Msg-Generator: CA
X-RootMTR: 20190527102219epcas2p20eaad1cb2849841d8b0c3dbc8d0b2e99
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190527102219epcas2p20eaad1cb2849841d8b0c3dbc8d0b2e99
References: <CGME20190527102219epcas2p20eaad1cb2849841d8b0c3dbc8d0b2e99@epcas2p2.samsung.com>
 <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560323887;
 bh=Ib2hOUBwsOQPwhivWkswJDbQOGHqTT29bt2JNeyXdfM=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=MIIdtvuaP9oxdVbZEg1DbiOmlpKuRvd/xM99a1KFJ0RDPrkp7PNIQooNFTNS4i7C1
 n6OdoU4ny4H9GKh47xgPRq1FSUWmcDTv5qk2FlNi61vFMBAG6TyEmEfAgV0MCHDVwn
 uXV30KwKlzxFfiZ1R7mHxO6OBLyO9wpFJpKAlGPk=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDUuMjAxOSAxMjoyMSwgWWFubmljayBGZXJ0csOpIHdyb3RlOgo+IFRoZXNlIHBhdGNo
ZXMgZml4IGEgYnVnIGNvbmNlcm5pbmcgYW4gYWNjZXNzIGlzc3VlIHRvIGRpc3BsYXkgY29udHJv
bGVyIChsdGRjKQo+IHJlZ2lzdGVycy4KPiBJZiB0aGUgcGh5c2ljYWwgbGF5ZXIgb2YgdGhlIERT
SSBpcyBzdGFydGVkIHRvbyBlYXJseSB0aGVuIHRoZSBmaWZvIERTSSBhcmUgZnVsbAo+IHZlcnkg
cXVpY2tseSB3aGljaCBpbXBsaWVzIGx0ZGMgcmVnaXN0ZXIncyBhY2Nlc3MgaGFuZyB1cC4gVG8g
YXZvaWQgdGhpcwo+IHByb2JsZW0sIGl0IGlzIG5lY2Vzc2FyeSB0byBzdGFydCB0aGUgRFNJIHBo
eXNpY2FsIGxheWVyIG9ubHkgd2hlbiB0aGUgYnJpZGdlCj4gaXMgZW5hYmxlLgo+Cj4gWWFubmlj
ayBGZXJ0csOpICgyKToKPiAgIGRybS9icmlkZ2Uvc3lub3BzeXM6IGRzaTogYWRkIHBvd2VyIG9u
L29mZiBvcHRpb25hbCBwaHkgb3BzCj4gICBkcm0vc3RtOiBkc2k6IGFkZCBwb3dlciBvbi9vZmYg
cGh5IG9wcwo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2ku
YyB8ICA4ICsrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMg
ICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrLQo+ICBpbmNsdWRlL2RybS9icmlkZ2Uv
ZHdfbWlwaV9kc2kuaCAgICAgICAgICAgICAgfCAgMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IC0tCj4gMi43LjQKPgo+Cj4KUXVldWVk
IGJvdGggcGF0Y2hlcyB0byBkcm0tbWlzYy1uZXh0LgoKLS0KUmVnYXJkcwpBbmRyemVqCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
