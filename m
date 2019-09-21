Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F693BAE1B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1456E10A;
	Mon, 23 Sep 2019 06:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1445E6E075
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 18:20:59 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.64.44]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MAvGa-1iJPUT36k0-009v4y; Sat, 21
 Sep 2019 20:20:25 +0200
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Philippe Cornu <philippe.cornu@st.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/bridge/synopsys: dsi: Use
 devm_platform_ioremap_resource() in __dw_mipi_dsi_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <e0d7b7d7-3e89-8b3f-04ed-0b14806e66f7@web.de>
Date: Sat, 21 Sep 2019 20:20:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:/X5KSMYfk/y84AhbFArCNipUfcIqSR5iWevq/uIhXNqC3wOtX/m
 GNs5JyUPr25PmxwhO6/pi2z+47h1ZiD01UqE1/gd/idvfZp4svdI/0bTRbewif2ZYOa7q0Z
 mjD5As+bci/qG/FyAlfwbjxdYbIXXfDDKZqMFtCiAXp9OrHeMZZ/SwXfSBXYzZ28Lfakyuz
 QKz8exAhD7iTKsVysQCBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:teElU5MMyxs=:W/i7Ym1W9SHfwEjXpO4QQg
 /MTSSib2zlx2KV96suXxIoWwYpUCs666C8W4IyYtNtros1AhbXmgd3nIc7LfijulzB6RNMR65
 +ihjgSOHcsQg8SVv6IHEM1cevUvc64b2QBzN9kqq5m3Vxdji9+Ct3/TY2fNYqw+2edVsq0di9
 ra6ehb1Kyl4MJzNZ0DIgv/UbcMNMAM0Y/rmrtUDIWi7l4X6SHyC8n6x0exVKdOXZ7e3bOSqWU
 PxYbODMhd3rvT9aBP+Yr5bDkzkhmRY2cG9pZzsuUfn5oQDx44LCLJIkngY1Wx+zr28BpXssKF
 UDEivMCG7cv+DgIQ6UfZsaS4EImAjHFQcCPvtKGH9qhRfKntK2LOEgohfnvrTLtAncnSuxqwn
 jZqBwkFzDm8E5zpqBcP3h6GkkBILJnNk8WnMjg4DksOWA0wJKaJwF9tHiR51IvUxxtpH5MMiC
 GUAyB10jq3x65IukJn/UA2sN4Zy6SDa3DiN5H5OxEeqDfKfNPi5spZj7CNrqIzdYLCfuANjfJ
 qPLnMFj/7LzQJZA48MD4kOTxGCrv1phtfxIbtA/iSFyqJe7+MXx6YEhSaf/UJzZ/OA3PEpJ9i
 Xl09otpZgugMqBFAkimp0BtpTVhfgMqRt4Fzuzgaiw5FJilWsWCIyfSg2dOR+fyLkYP5v1x2q
 BZz3KZX2aUHJgBnU38+8V1mvdwwRJreDyhrQ3d1xYiEQ6mzXtfn27LAeojMrSIP8LRHdjBwpd
 L+D3bQCuGUP0O7+Vv6T6DW1KyhPsL2H3a1yNXQa6LgFkq/OV70iQ1CA2x4BU5JoEf2dne+2Gl
 1379uWnFh2Bv0k5Iirp6fntlfWk7+/WZBOPgThOhvwZV35LxpnIIXg2ZDY6eZ+XnrczuB8pNI
 NZMpWFzUVz/me/7eWy/RGy3xjjZbblCSCh+fiKrRjgfxtaR3aK/n19E6N6RcLL1D6AQ7MVxoJ
 op/47SoTe1LKeg56EOADgTShjwmvL1++9LkN+elzMUD4QE8IDKgu1Di+wHS+OBWYc8+XH/04T
 Rd3t4fueWJyoyr8OhFHthVhMLIX7oEgzzH8CarmG8bsLIwjHU5Iawp4cTkUYyy8C379XM9JNw
 PmULOrExJMV7t0DxF+apR15atBrZx86iLxIPEjIq19/bEqeafcLzPHvZBY8wb2Iah95z+7pEJ
 G16MKEukDvZUhfebtlEAsRdinqC83+1fOKM6MwL8h0d3jPCL6rHKNCCrMj/WlzyByx5gtZyoa
 ISPDYQFOGIsGQ6N8zLZNSawka79dasf9BLjhvGdyvA29tbA40J8U5z+x4Yvw=
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1569090026;
 bh=JbHXXipkDs96r6sC02uR3t1qJZ+VGIW8Ril0kxJ0PzY=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=ZW3oouM1CrAGJuOPrNyHS9MFGdNV0IPOac4UxXC3tp9PWb41uLH31nfS8wp0WNLQX
 vZTttsTfsVwNjuDe+nl8HwcAWUqsNAPKIETBhoZmiZvoeEdf3BBzSjsrOchFVbWQ+2
 Zbo7DWPiFgdoHsAmXCHkbFbzw2BJdpTy+omWHXG8=
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTYXQsIDIxIFNlcCAyMDE5IDIwOjA0OjA4ICswMjAwCgpTaW1wbGlmeSB0aGlzIGZ1bmN0aW9u
IGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBmdW5jdGlvbi4KClRoaXMg
aXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2ln
bmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDcg
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2ku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwppbmRleCA2
NzU0NDJiZmMxYmQuLjZhZGExNDlhZjllZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctbWlwaS1kc2kuYwpAQCAtOTgxLDcgKzk4MSw2IEBAIF9fZHdfbWlwaV9kc2lf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmcGRldi0+ZGV2OwogCXN0cnVjdCByZXNldF9jb250cm9sICphcGJfcnN0OwogCXN0cnVjdCBk
d19taXBpX2RzaSAqZHNpOwotCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCWludCByZXQ7CgogCWRz
aSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZHNpKSwgR0ZQX0tFUk5FTCk7CkBAIC05OTcs
MTEgKzk5Niw3IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKIAl9CgogCWlmICghcGxhdF9kYXRhLT5iYXNlKSB7Ci0JCXJlcyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Ci0JCWlmICghcmVzKQotCQkJcmV0
dXJuIEVSUl9QVFIoLUVOT0RFVik7Ci0KLQkJZHNpLT5iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291
cmNlKGRldiwgcmVzKTsKKwkJZHNpLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291
cmNlKHBkZXYsIDApOwogCQlpZiAoSVNfRVJSKGRzaS0+YmFzZSkpCiAJCQlyZXR1cm4gRVJSX1BU
UigtRU5PREVWKTsKCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
