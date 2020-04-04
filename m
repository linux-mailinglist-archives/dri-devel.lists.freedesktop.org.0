Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA7519F0F9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07BF6E2CA;
	Mon,  6 Apr 2020 07:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Sat, 04 Apr 2020 20:05:40 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503D26E176
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586030732;
 bh=u0HX4xbmqfEdTZ1hP/+DNk9j+UG65ePaIyUcT+Ekhz4=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=fGDqdg3BXHM496CsaJbIj/aJZHs+dJv7lcft8CVWy3zs4/3gGNOTagxpLHYuUPIRv
 igotMOIofnlNhR7lrI1lKUF95biuNKaiZAfkomDSIIFJ9w6/pyEFtAuj0HH83bKk3N
 WMxTyhZDWVPXAjG0So3BJSZhmgnhTUs8QK/Y6JR8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.132.181.229]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfAoO-1iwTe20d4a-00ok4i; Sat, 04
 Apr 2020 22:00:14 +0200
To: dri-devel@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Stefan Agner <stefan@agner.ch>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/fsl-dcu: Delete an error message in fsl_dcu_drm_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1c108582-ba46-153e-7975-f6cfd82d57c6@web.de>
Date: Sat, 4 Apr 2020 22:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:GTi0Cb4NKnPjWt6umO7/+f6Fxu3Hs4u1rbtisl4UQ4p52MEsq6G
 VQ4Z25lUXH3LrjEwSww08x3TMYpPPY9oCyeoQqsm+oSEnrxo8o+eC7Z4Y43CHqReCyi7M05
 AbLsxh69FQ9WCCkPO5veanBCSsfpesnRqtrpiFES8uXVjDJpaiVgxP+nHoBeCsw8dkCq4kM
 lm+biDdb/1U3r+9OTlo+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tl/XCKCWJ+8=:6MbQIvkkYWxaStBK3xT9yI
 1x+IX5UNcM7ubD9nCio/xxDMPNxAS9QEG7lroop/A7BeBp3Wzrq31IN0lyAm2IX9haQho9Vw4
 gHTzTEWvNb08OZoyZZdJNhv2fUb38E0VRR9TkIUwYnYM6CzIBk6xnQL3NyUCV0pQ+jGT6t3Ak
 75jF2NHEJfydOhRTV7P5l49Gol6J+HbhZ28QZ2MKLSsN43JjJpOXNzhgdEFQC0LeJR8hagmDU
 F444/nfzMKnubnd6sIH40U+36DofrXxh6JX+tE3VlOljyoSIW52UJF8zmt/2T91qPAAvELKVn
 49wBsWofJQUOqoRimbq0H6brpUaQyj9n92BnyPMNOnYCIrSEe+mVLt7ea0+zR/7jfqvttLuIE
 Ync8x7ik1slvm0fBCK6iuuZIYI4toLrYYzlMKaAZb+XFbj0+j4udoyyGWSfzc+2CThvLazLbI
 F922DIVaOf6TpTgrIxvR+D5bJosxM3nvmeNjjhcCSbbtLCD90reYIqpzyNNlMFsWqjrdg+Urn
 Tn75Phpxv7DJuCXgRHaX0BKDPpPzdREO9XKhxivbj31vOYxaObORJ7w8K3lMr9DUSqUpHg8Vo
 BUkgfx/0eH7qJ/4EqmGNomS1IzBqb7VTGcKep/+BG0rS4ui88GnBHRa2xl9QH2KaZBkilSR9k
 Hc2yKHRkp2OyfUVmsuew2mT5PCjKGobkgkwls2Mj6fRVkS78qmd/0FDubE9669FzNucLZgy7W
 7hTo7NKYG3HNsK4esX7JblPR13YNs+ayK6J76cvpC0MwmOxxP3B5exvFUlvP1agNd8k5ExlKs
 A18AKE04WER3i/Fnpx+/Gs8pyRvp5JjfYCiF8nb8DBMy0tV+Y1onsqPQMkIIwRzv7WyFSV8Sh
 VlGiEybVDwyPDRPJilzCSP50HXb/HdlnhQTtLK40VKt9Kmg3WTA+OpLL7hcW0kT6Lx4RkQ4+h
 /BY63wcTQu1NuHyknQheaO8DCin011rJ2WzZs2PSihAxtnVqU/4+8SAcAFT7rR+0g/Ahwl6a7
 yPkbP2ZdAscaRnHqfx1jytkiIJ708xln+IVf8rnUdXA2FJeFnqm+Tn9miEh/Slg6sq5+5bEye
 pzbA2x2SKN7lVz5r7wQKUzXRhtEJAh2iElLPSTXrIDzftuLA9n5xWz+my3olTn6IhkzUI9xSR
 uVWmf7dZm+a4ZZpXwxWvVqBi0WlJ/P2Kfy+qQHpqz9aPZMGplkADaBRV34Hv/rgHlCdNc5Rqr
 W6jppeYPSmkCF4NzW
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
OiBTYXQsIDQgQXByIDIwMjAgMjE6NTQ6MzEgKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IGEgcmVkdW5k
YW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgaW4gdGhlCmNhbGxpbmcgZnVu
Y3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9k
cnYuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMKaW5kZXggZjE1
ZDJlNzk2N2EzLi45ZThjZTA3NzRkYjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9mc2wt
ZGN1L2ZzbF9kY3VfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9k
Y3VfZHJtX2Rydi5jCkBAIC0yNjgsMTAgKzI2OCw4IEBAIHN0YXRpYyBpbnQgZnNsX2RjdV9kcm1f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl9CgogCWZzbF9kZXYtPmlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Ci0JaWYgKGZzbF9kZXYtPmlycSA8IDApIHsKLQkJ
ZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IGlycVxuIik7CisJaWYgKGZzbF9kZXYtPmlycSA8
IDApCiAJCXJldHVybiBmc2xfZGV2LT5pcnE7Ci0JfQoKIAlmc2xfZGV2LT5yZWdtYXAgPSBkZXZt
X3JlZ21hcF9pbml0X21taW8oZGV2LCBiYXNlLAogCQkJJmZzbF9kY3VfcmVnbWFwX2NvbmZpZyk7
Ci0tCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
