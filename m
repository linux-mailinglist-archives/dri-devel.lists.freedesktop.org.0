Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9F19F0EC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDAC6E2B0;
	Mon,  6 Apr 2020 07:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649B6E1E0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586086496;
 bh=xwgpbDc2i7sOHvO6OXNvOwVtlSJZvaKRRVhhOgOw6e4=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=EnNmHyxAEpM+FltqdN+dEx3CYjKYdQI/XfUr7DdDPS3W5gV6p418tEzg19KZzf6/0
 N84JFVTs59iJ7+OKjS3dc2ZqiihhSygUs5NduqafQVAP4ER+N+vuspljX5iIKACvPR
 4FXbrx9qfTwtdftEYHt+ZE4/I3ADJBSm8w+R49Uo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MCImL-1jTcH03eIz-009AQY; Sun, 05
 Apr 2020 13:34:55 +0200
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/omap: dmm_tiler: Delete an error message in
 omap_dmm_probe()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <89420027-bf29-3322-9d1d-f77cf4a8c35d@web.de>
Date: Sun, 5 Apr 2020 13:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:4CxUfNqhpzmv6gG2pCqJJGZvLUsPyzJ+y+jwgT4J8iz8av8uz/o
 XVjwm/dVXfSKKSe81t3Tb0UXHI1lcp302eB8/TLVdk5KcZrY1LV0sSNSWXSeWjq6/ws7ju/
 SzEgIjAJX8UVDoxFFXqikqvGhVwBcRrRgf176hqSn+N9EOq38M5YCFn6a5knRsCCZSjnGmA
 P9bZqiMNb7ykiiYb+Godg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2anMHRmEp2Q=:aT8BVr5L/ylamjccJEABly
 19Xhu65Kz3873BkXCHtFiBN8yxvE4qbdNEFHCEDUs9AEq9mVe7hmK40VsSVBqoa8l9Br1IDAH
 nTrdwfxI9zdE30mf+NhN5sQm6rdtXTl6bO7v3n5/DANJ/BlpAbgMo2XSBuk6bMsV3EusDjmIW
 oGtAsITu08TugULpj0Ai2axb0yuhG6bO6Dj0OvimVOCQjdiMuw+FoFNpUrK7jt79CoX9oZgRP
 ootr1IBzcpe2VuBxWVfNNxnuppRjh1n158epDmqwQeZI0Do3cAXsLtaCRPf7ianIjimkbaMEl
 p15p5yh61rlpGUDFHhrr34WAWTtTJvRXKWsuTNY61/Yw5p8008gWmRGE67juzXQa1Uqhqre2E
 +rwHObP8Zak+GhRRmciOuYn+oEtgWwJZh0kxai63d6Z/hQUm0gFua+i8rA0axlEA+DniMRpy6
 Xz/HDNiOt94TvWHflk65ylFsQ5Fy9UmXdJgUhJyRCrdasi4J1n+rFnq5NxgHrmAv3NPu7Pp4K
 cgym5T4dO2ksJYISVfUXJW/KLuw7PSSah/llFsbL6mzKkIpyAqzVB+oIpgU6aAvsFbM1QJ/PA
 xA6io68ZZr0FMMA4FC86HEKwcvVWQd3saPapDWrEP92YGB2eHGKi1ligpnWMeJ4ipl1nHTQ03
 PgJgVMcoZsh4lba6sjpL30ajPaheYxA5wjCP52iGYeP4nnTKRty/kLizaDJsCLttlAsQtfSlu
 eFlA2yR3gqHUZtehJDYSefymluG/RMu3iUyW7kl3ldh2yC13RdkP5ehMr2kF+WjAbD5fG3ENG
 n1PfbuEkcA95lD2k3u9B/94JXEdrQO4VNu2FgrloPBn7efJlMoAATzJWN9PyQ6fY42Udy2RFE
 GsOT7uTuv/RR9m1aDGbleJcpcl9lVnl/w2D+nZkrZ+6FKXE+zO/se4Dvp/kThfNqushu84tGD
 OiS9F9ka8eu/vokXiy0Ucnrjp7sOcy6jBpNJXYWPvGySoeCxW6MOaZM5chE9SbG5VLxGy51Nk
 evUOFW5Zb2zj0lcqMptBF4aXbVPjmrU+xbQg3pIBYrk387qOAAZrOldBLw4rah16ixEIcsM9F
 3cOSir8rHrZ+SqBtjpuhweAFi5KbJ0ZXLOJsaRAjRUSlm81wVCORWBWa6LKFiOkHeMvSnDQIp
 zRqStZC5lm7gPmSs7/3jQPNEEt/0OK/UNfLJ6ZKocB2tD82R+VdPkT8kr2rfYJt8EMH1rWgIG
 y8bKnczwzBer6CAvy
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
OiBTdW4sIDUgQXByIDIwMjAgMTM6MzE6MTYgKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IGEgcmVkdW5k
YW50IG1lc3NhZ2UgZm9yIHRoZSBleGNlcHRpb24gaGFuZGxpbmcgaW4gdGhlCmNhbGxpbmcgZnVu
Y3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxl
ci5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMKaW5kZXggNDJlYzUx
YmI3YjFiLi42MzU1M2U5NzIwN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZG1tX3RpbGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1f
dGlsZXIuYwpAQCAtODIwLDEwICs4MjAsOCBAQCBzdGF0aWMgaW50IG9tYXBfZG1tX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKIAl9CgogCW9tYXBfZG1tLT5pcnEgPSBwbGF0Zm9y
bV9nZXRfaXJxKGRldiwgMCk7Ci0JaWYgKG9tYXBfZG1tLT5pcnEgPCAwKSB7Ci0JCWRldl9lcnIo
JmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCBJUlEgcmVzb3VyY2VcbiIpOworCWlmIChvbWFwX2Rt
bS0+aXJxIDwgMCkKIAkJZ290byBmYWlsOwotCX0KCiAJb21hcF9kbW0tPmRldiA9ICZkZXYtPmRl
djsKCi0tCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
