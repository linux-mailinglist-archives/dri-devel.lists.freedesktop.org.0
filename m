Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866A19F0F3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD446E2BE;
	Mon,  6 Apr 2020 07:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD12389BFD
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586078544;
 bh=LPWQ7SziA4eoJv2nsD+mwWWiIDzRTTmjMOUxFZ2RzRI=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=CarO/Lyay95bKYONmhhgrpg6tP6aZ1tGWgi+7FA5g+3mICGy3KUjTNUEzOjbqWNu4
 qfnSqc54o9itnfnjYL9Ab5Pq5v0TvE/PIKDJq2IOXVs0l9VYlwarJbbxhPJsLlAMHM
 nLXEapI8pBME4TiwW0qA5ZPLlPggkSWo5/kyhU6Q=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lheqz-1iyajM38m9-00msy1; Sun, 05
 Apr 2020 11:16:45 +0200
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam
 <festevam@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/imx: imx-tve: Delete an error message in imx_tve_bind()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <eb87043b-1881-da68-ba28-35406b6594ed@web.de>
Date: Sun, 5 Apr 2020 11:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:6qsXH7NcfUP3dj9efSiFBR4IvcL7RBxJ4jGCoOyyG98pKa+sZK2
 VDjdSbAjhvo+fzFl1CSrzhEJC55RX//yxW/Km3ZOMKjU2fZyg7b7eM4cmDpjeGZAiHKobZf
 qS/2pHly1EUkiR/8GDog3ZzDLm5jDjRfGTf3LFu320T5lE44ii//3tfkxHR/S8hjRSBGZff
 KrrH5OKrRP8xZE58awTpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DDxxJuuQYRY=:YruBwY5P7jTEK2LqscizE7
 XFjE8NV/40DCp2VZTUT8L0dQTyKqBTwkZY5Fh/g5TdnUoGADZ/A4OEaRy24ezkcfwGZtVbU4Q
 zYTbbGTT7ID8G6PvLgu6+ASjDYe45aC9j/t27yEFx+cncHqMJJfpfYkEJmtE/trKeJiNTjySc
 Fnklrc8Eqpw9WeAu4oo38nj2lY5pcTKcOYc5CBM71pJxZ7njrGNQqywP+BeCziiGM3Rc9bhzo
 vlBa3z1w6ganZ1fyTUYZkoZPlae8UthDqaBK27z/ZClw23eNhSMCy1Je/DsYWe2togJwyINYu
 xrhiSZ+bLfU0YbydHRv0Ei4hjFrNzowcmfF8WbS1vlZlsgkASb2nCX9onwnAN+P5NUaaqybvj
 oBr796pILL+mep07gDzpxk3vm4hW5PrqOLLCvf/SUIalKKbU/QqAqlkgIWrmuIMgIGqYfSyyb
 Sj4yYPWi4zEZMPi/2jfw/WQwwUBetETRaDywE7a33HHGvGGBgqjYLpvJJORNXhVa3zr/VK7sC
 KDsd357C87Wblk0RtMKkhUsoftqCZWFCBZTnDFP6wvqVUv0Fp9s6e5jllvbkU04mtP/1S3xZK
 Ne55MhMXbKqeIgrtgCLAXBcIJfABU2mxTHYztTs/NkpT3KAi0/FLEBFE9Pq4bKAvqidP4KXtE
 oww1Dtx1f4fvA2WxMupP9PDVthRXFl5ciNY6tMbUes+YfyrbOXJxZ7xmkMe5aFEFvO/zuh3lE
 MgYTD+IVf9/ldp2fxKn8e9us16EQAR7iSxAOI10reIi0IRYogw/CZUwcvhVOGEgZ+yh3LG9hg
 mkgREAd+ar86If5vDhYZYQ2h8R0WVqspFIZ3AqsZYyPGosKXMlNF1jM69TzE5Is4xZFCEHHWJ
 xLnbyUzodoGQ8cLc4Re2Pdesh2EhSLffT6ktVTMvqU6p+2UpufzVxcVpSzKODhhEtAe+9nCZg
 FUzHinfT9xuZtD9YnKAS024KzITB8+dveOCaqE1ecCmSXW897U7Sd8wlBSjhailmCTjbfEBKR
 HhDHWY9iUitfVzuyAXxZNz9dOBZWiPHJ6PIkh9D3h3yY0pHJw34jhrHjHNcWdMxjd2ULrMDDU
 RHPICGe6zXYmkSPjlQdnw3ccbVrfLpcrTjPQghbQ4fNWyREEEgFniT6GNGoSO+fsOHAFmD5KQ
 N2V4U0zrlWwZwqUQ8L5BIxKPkLDVyhyXx6JWWCew43plcw+tr4jR5shD0Ru06CJzBRvHg6XfG
 K8+0j0DBa+iwzmLmU
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTdW4sIDUgQXByIDIwMjAgMTE6MDE6NDkgKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IGEgcmVkdW5k
YW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgaW4gdGhlCmNhbGxpbmcgZnVu
Y3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC10dmUuYyB8IDQgKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lt
eC9pbXgtdHZlLmMKaW5kZXggNWJiZmFhMmNkMGY0Li4yM2FkYmI4MThkOTIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgv
aW14LXR2ZS5jCkBAIC01OTgsMTAgKzU5OCw4IEBAIHN0YXRpYyBpbnQgaW14X3R2ZV9iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCX0K
CiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAoaXJxIDwgMCkgewotCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgaXJxXG4iKTsKKwlpZiAoaXJxIDwgMCkKIAkJcmV0
dXJuIGlycTsKLQl9CgogCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCBpcnEs
IE5VTEwsCiAJCQkJCWlteF90dmVfaXJxX2hhbmRsZXIsIElSUUZfT05FU0hPVCwKLS0KMi4yNi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
