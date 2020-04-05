Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4C19F104
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C3C6E2DC;
	Mon,  6 Apr 2020 07:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048AA6E1E0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 11:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586087587;
 bh=Hf4QxDJCmHNBC6qlSFJzT9L1HKYEOwOMt1vEf6j5cJw=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=pIRrSGvHQcfnjtElTYwW1zasDm+Urd5HgsRN78o3ClwwHheLSmpdLn2aDeWAnrrqa
 +vsyb3S6G1vG9O8G/4lzkyayt0BxeGEWCz+S8bvInWH0hjWU2Qzdq1OWROuAW5tz/C
 FrFn1T4rGFspd8DtlZ/Hfb1rnl4E8A9ULmlQgUR0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LyUsk-1jI9Kv2HRu-015rIK; Sun, 05
 Apr 2020 13:53:07 +0200
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/sun4i: tcon: Delete an error message in
 sun4i_tcon_init_irq()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5a6cf5a7-3f27-5425-4d6a-550a17bc51e3@web.de>
Date: Sun, 5 Apr 2020 13:53:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:fRn43AcuPne3w02+4J5nGpQ+T+/hv1B5xzV9Kf7jxpytGr5Ec0U
 HYjgiJaebLmqmwzT8SprLl882GW95mkMbmSYkymx17hmNYoWlWqpRzsz0k33MMHrsnR7ro+
 6z2vpmbxYywrRv23IRXno7QE6k4fJL042z5wbUgXlzW+VYWDIHrvvnkToKTF/5swvrorQ/s
 xbOIABzeZnCvI85fIsauA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pMH/DhgRn9g=:66FP+HvR5j6VW2hmFwM7Ot
 QRSvi93K/sbowoUi+T9hr9P8K/1JlQjSjJZNc1B9jEMZjJ+83ItEIsNwLSN2ly3hDYrN0m8oK
 wKhUK6uRWPtALKs0kkHBGlW0fz4d0m/xNe09HHnlB32KiW1VXKWfJ9cV20hUf5Iav01Chqt3+
 QohXdvHSA5cWe31mj9/ISb+iYs1isjeNWSRTg/OT9bhEAS1bTYO17ZsLHhf23SBoDwV0CDIDM
 N7+gYDM2+IoFEY/1BjDJalJrC6wxTFy5hA5O/sSrvgDQqc7bEXbcNRwWpuJFW0Rlrvbm1AUyg
 s6M41duQ9RPU6f2FTgm7GN0HAXosF776F1izeRupAPFRt9Pj5JEPLhtapx0brwiEwAoKOUpDe
 RkilvZ7PMespS8FfQiqU7LFEQx26TWTfp405b/zuyA9/MK8eaRDVOtxOQF0eX1p68vNX8cRY5
 iuj9wwHOvJqTu/n5SMv8PfG6XMtgisq8R0x47qdOx2XHEpAQ/ANNb03ESSrwc7Xqa/GXLcMG9
 ANjuxQ98xq4PpxbH2YeTUiCRHFwlVKJWZfcZAszqJPdHFBJ42q9JdxF4lG2JHV5p/I+quJlG4
 QozyzId5W8bZKmUxJztGrcYUSTDz4cCoChUk2Qj7QhUHBX0DSrsYCN+Km3TCASodGnMffcA1C
 yMRPrE125xGP6OYoUrWRVOi3iqTtQ6l1ra+f8qf/o1ukxr1biYfqZ9dkEjrt0XGfd4QhBCqi5
 VfkD7zljgT43p6RRFGb/U3ESqmurds8sbYKsNqykAhkEulDsNhvTTEMj3T28rCWFInrYOEtlN
 1XXLiAjh+mhElTP1zaVd2YMWojqFBjFg4xTA1y62ArpsqDnQ7+fSAN2c2pPL1zBOa0wegT4SD
 cwLsu4m4bLiQl/APUEV699P4d3KbE9k3TFG35M5TRSuI23CF093QcMh4SWWn6pVbZHv19344s
 Ld1MG7y1Fz1si8ocRcCiwhydQWT4gbXAWKx8W1HzWIr3LFCCrU1a6ORfMLBXz8K7JgEH3NUC9
 qRPwelRILsjOxDjqtZReP9HYF2X4KbI8mftROYt1MlOMcgIv9acjMzzFUF+tsoY9JmcbwhQ3Y
 A7J7P5chX30gCSkST35Lq99tNZAq/zTcwJgpum3uE8RpfK3OPtja6/2YRVE19oLS5SlfuGE8Q
 TG613XLKR01QZU6Dwf5zNwMHCyKxMYikc8jHDtV7j62dixWj7eIFpSlm+9Y7jwOHPco1KoiWq
 ioWs55lKV4KsOGx8Z
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
OiBTdW4sIDUgQXByIDIwMjAgMTM6NDU6NTMgKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IGEgcmVkdW5k
YW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgaW4gdGhlCmNhbGxpbmcgZnVu
Y3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jIHwg
NCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKaW5kZXggNjI0NDM3YjI3Y2RjLi4zNTliNTZlNDNi
ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwpAQCAtODEyLDEwICs4MTIsOCBAQCBz
dGF0aWMgaW50IHN1bjRpX3Rjb25faW5pdF9pcnEoc3RydWN0IGRldmljZSAqZGV2LAogCWludCBp
cnEsIHJldDsKCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAoaXJxIDwg
MCkgewotCQlkZXZfZXJyKGRldiwgIkNvdWxkbid0IHJldHJpZXZlIHRoZSBUQ09OIGludGVycnVw
dFxuIik7CisJaWYgKGlycSA8IDApCiAJCXJldHVybiBpcnE7Ci0JfQoKIAlyZXQgPSBkZXZtX3Jl
cXVlc3RfaXJxKGRldiwgaXJxLCBzdW40aV90Y29uX2hhbmRsZXIsIDAsCiAJCQkgICAgICAgZGV2
X25hbWUoZGV2KSwgdGNvbik7Ci0tCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
