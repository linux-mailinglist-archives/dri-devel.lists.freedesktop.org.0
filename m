Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F10359C32
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1515C6E8EE;
	Fri, 28 Jun 2019 12:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164F6E8EE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:59:12 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628125910euoutp013b3ca3c168197d78456d509d8449ef06~sXjSdRZB50197401974euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:59:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190628125910euoutp013b3ca3c168197d78456d509d8449ef06~sXjSdRZB50197401974euoutp01K
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190628125910eucas1p202669bfbbad1a9ea55c66706559f1029~sXjR2wB1i1911519115eucas1p2u;
 Fri, 28 Jun 2019 12:59:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 90.6A.04377.D1F061D5; Fri, 28
 Jun 2019 13:59:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628125909eucas1p272b6e6e36732ce575b70772b67ae7c6c~sXjRBheKx2972129721eucas1p2v;
 Fri, 28 Jun 2019 12:59:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190628125909eusmtrp2b41c12b64b7e42d74f7267a2c892ddd1~sXjQzVFZ20722007220eusmtrp2h;
 Fri, 28 Jun 2019 12:59:09 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-e9-5d160f1dc589
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.44.04140.C1F061D5; Fri, 28
 Jun 2019 13:59:08 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190628125908eusmtip1476c57280886b316413bd8d2c64e41ee~sXjQN785u0811308113eusmtip1c;
 Fri, 28 Jun 2019 12:59:08 +0000 (GMT)
Subject: Re: [PATCH 02/12] backlight: gpio: use a helper variable for
 &pdev->dev
To: Bartosz Golaszewski <brgl@bgdev.pl>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <f6095658-8d23-c30e-7d50-b1555e9dd3e5@samsung.com>
Date: Fri, 28 Jun 2019 14:59:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625163434.13620-3-brgl@bgdev.pl>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTURztvq89V9PnNHfVPmBkYpFaRjzMpKLy/VFhghCK5KzX1Pxqz4/M
 P9LIaRMrKyuH5jRJW6RrC81pBRu5zFRCMbPMgUYf5EzngsCP3J6S/53fPed3zj2XS6JiK+5H
 pmRks4oMWZqUEGKtXX/7dmz08EkIfemg6dmatxhttLYS9LtfowK6vtCHHnRMEXTTbJWA/moY
 R+gxx2tA355rRGj9+BBOv7n2G6cHjNUE/apch+wXMVPDxQLmwdAnnGlXjwoYvfYqwcxc78aZ
 z0OdBDNWZkEYQ8MlxjLchjB2/aZoYZww4gyblpLLKkIiE4XJjpoRkGVGL7zQ+RaCeUQF3EhI
 7YbK5o8CFRCSYqoJwMYPNowfZgGc/qZD+MEOYGW/CqyslE/bcZ5oBLDUurismgRQea8Odaq8
 qBhYfvW+K8SbCoSa5i8uEUq9RuGPgceEkyCocFhRonXZiqhI2PL0O+7EGBUAtU/sLqP11Ek4
 1qXDeY0n7K6awJzYjQqDDUMzrgCUksCRidplvBm2TVajzjBIFZGw2Dy4RJBLwyFouryFr+AF
 f1qeCXi8AS621yK8vhnA+dLvy8ttS89xa4HgVXuh2fIedxqhVBBsMYbwxweg7Z4J4/3d4fCk
 J38Hd3iz9S7KH4tgqVLMq7dC3UMdsRKran+E3gBS9apm6lVt1KvaqP/nagCmBRI2h0uXs9yu
 DDYvmJOlczkZ8uDTmel6sPTvehYss8+BcS7JBCgSSNeJNEKfBDEuy+Xy000AkqjUW+Tb550g
 Fp2R5V9kFZmnFDlpLGcC/iQmlYgK1ljjxZRcls2eY9ksVrHCIqSbXyEos3gwlePmo1IDqUmd
 /3HEfaJEknVl41o2NKy2q9r2JzqG23A4bmAsJjHPwxbUzQaeL+g5uG9P7qU7vfGGw2ZJfES4
 0qzSOYo0oL+io0m+3f/28U51naQhFdTfNCZVvYzVaKMCOM0JJZJacWTbMX3s2Y66XnVU/4GQ
 4EMWTCzFuGTZzm2ogpP9A1lGc0xzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xu7oy/GKxBlu/W1t8mXuKxWLXg21s
 Fmfe3GW3WNQgZnHl63s2ixVfZrJbPN38mMni/tejjBZT/ixnstj0+BqrxYm+D6wWl3fNYbPY
 37uByYHX4/2NVnaPxddus3rsnHWX3WPTqk42j0/9J1k97lzbw+Zxv/s4k8fmJfUex29sZ/L4
 vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5B
 L+Pr3FuMBYeZK/ZukGxg/MvUxcjJISFgItH78TNrFyMXh5DAUkaJjj+vGbsYOYASMhLH15dB
 1AhL/LnWxQZR85pRYtPHlWDNwgJBEr2d88BsEQF1iQXr7jGBFDELHGeWWPhiClTHekaJ5m1/
 WUCq2ASsJCa2r2IEsXkF7CTWb3zBCmKzCKhKrFr7mRnEFhWIkDjzfgULRI2gxMmZT8BsTgFj
 iSXXPoFtYwba9mfeJWYIW1zi1pP5UHF5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0
 ODc9t9hIrzgxt7g0L10vOT93EyMwvrcd+7llB2PXu+BDjAIcjEo8vAu4xGKFWBPLiitzDzFK
 cDArifBKnhOJFeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YOrJK4k3NDU0t7A0NDc2Nzaz
 UBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAKDSj0/hlUG7WJFmH4hO3F6yyqpP7USy1vErx
 ePmO12pfLqfOdF3ImaMstOFfo6m10TqJDbM93rz7JLxY8oLxHz6Py4XMXb8Wssufc3qnqvvN
 lktD9NuKJ4za+0JZGQKkvkzzS1m8zOA73/4sz/igmg0xeRlsU4Q2ML/d+fd2+IH9Qi+yf/k4
 KLEUZyQaajEXFScCADLzI24FAwAA
X-CMS-MailID: 20190628125909eucas1p272b6e6e36732ce575b70772b67ae7c6c
X-Msg-Generator: CA
X-RootMTR: 20190625163459epcas1p39631966dbd7acbbbb1f905b18e41a2d7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190625163459epcas1p39631966dbd7acbbbb1f905b18e41a2d7
References: <20190625163434.13620-1-brgl@bgdev.pl>
 <CGME20190625163459epcas1p39631966dbd7acbbbb1f905b18e41a2d7@epcas1p3.samsung.com>
 <20190625163434.13620-3-brgl@bgdev.pl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561726750;
 bh=8Hd3VfBJL+xbiJrjQF90ePIZxnBEv9M00xB5/OAyKPM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FMI3ixGUI4k6ZAc1G+bgJMwhHYv20vjSnzYHzs92j8SSQ3JyQVEbpd/cBJ8jS0xti
 2YEwFH6azYkpaqoDsuXfZSGsjWfWLA3/9KdDiEGAa9mijDRPNevB0qTnidcyVJ4lJM
 IilhMVjZmVbdX6tM4Rry90VASWPCZ9rmKPZM4dus=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMTkgNjozNCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IAo+IEluc3Rl
YWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlhYmxl
IGZvcgo+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+CgpSZXZpZXdl
ZC1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29t
PgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZE
IEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
