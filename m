Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1CB4803
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3056EAA9;
	Tue, 17 Sep 2019 07:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DF06E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 10:17:51 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id z12so8009334pgp.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PJ/ShQsrUGGVLGf5sF+r2ZlQaLCSUA41BnpUcnDvl+M=;
 b=umMPedWUBJKYJ/8VqszxNDJbVe9yDrx63DaeoIXAYWRx6DVnQvZ+KRGwwW5++m/7WS
 B0n8Zz5CbWF0F0EX0y76/rSl9V/fiBH/Z8Rce3dQgrNuqqdo9hyCuhqBOI8dzsiRtfQM
 Ef9cpaFWDepcC7sM7nT/+ag5BAIuSriM1aP4V2+quMcSBrcGamperQM+DaFbqyko0OGo
 xNpQaLx2bOtORdQvozig71xME9tWS0CYMEhnEzWPNF4da+Z6AhC5RPV3I621EyG5AFOy
 L/M++dFRY7qH+D2h2gzxVfLCdin0bdAUmpwNf5OPkWERjV3DQbWI+Pj6klwmJVm3cysE
 g9dg==
X-Gm-Message-State: APjAAAXICR2GN/UWUdv4HS6kzus8awSvTXtJM52cU5AZzF2VomretRsx
 O2ON5b3s4XDgo6Uzg2BvS91/144Cs0y/fvj5K0mmgQ==
X-Google-Smtp-Source: APXvYqx4kKzN64FiMLCBMPW136oA8uvDVU591I/CzY79ycr+6Wtm7qVso4xcu0KdfW11yyEBlcyeFfdBexZwZzKEqys=
X-Received: by 2002:a62:2702:: with SMTP id n2mr39629100pfn.73.1568629071475; 
 Mon, 16 Sep 2019 03:17:51 -0700 (PDT)
MIME-Version: 1.0
From: Jerry Han <jerry.han.hq@gmail.com>
Date: Mon, 16 Sep 2019 18:17:40 +0800
Message-ID: <CA+quO7+tmHScjXFKooDZ0=fejgfAO=e+HBJv0FAPcmR6HYz8wQ@mail.gmail.com>
Subject: [PATCH 3/9] [v10, 3/9] drm/panel:Add Boe Himax8279d MIPI-DSI LCD panel
To: ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Derek Basehore <dbasehore@chromium.org>, Rock wang <rock_wang@himax.com.cn>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="00000000000097158b0592a8eab0"
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PJ/ShQsrUGGVLGf5sF+r2ZlQaLCSUA41BnpUcnDvl+M=;
 b=GuL6UoM1zJ6csp8OYuRwb/If8qYzLtKCgSiWRl8uhsTBJEiEx0FN6psmxasoHvwm2E
 GTSsrbovW4hHeYEOJk0hnczEhtrlFb5RowJbUJzWzkKPIU91ZhkTe0wftIdJPEvBgB7b
 ki9awzAt6/FWLiWFP9ohQEPeZ/0TWbst/t64DcqeVb4wYvSfjQignaQ+6h4oma5qhvV3
 CVA4dOnclCweuQMt/hxKbe4zS2jR8ZfjNdzLYoD1K2Vu0BmjUhDSEGJcJkZ8SGIYvBQ9
 1jHaE7gY0UKsOx4nHEzF35T/MHRhXn9/pHTRXPbKQSktw2RNIQmQryLrHgzhSHpPlD0D
 r7vg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000097158b0592a8eab0
Content-Type: text/plain; charset="UTF-8"



--00000000000097158b0592a8eab0
Content-Type: application/octet-stream; 
	name="0003-v10-3-9-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pa.patch"
Content-Disposition: attachment; 
	filename="0003-v10-3-9-drm-panel-Add-Boe-Himax8279d-MIPI-DSI-LCD-pa.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k0m9896y0>
X-Attachment-Id: f_k0m9896y0

RnJvbSAwZmFjOGFhZGM0OWFjNzk4OTQxNGM2ZDIyOGMxMTA0MjdmZTQxNzk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZXJyeSBIYW4gPGplcnJ5Lmhhbi5ocUBnbWFpbC5jb20+CkRh
dGU6IE1vbiwgMTYgU2VwIDIwMTkgMTY6NDY6NDUgKzA4MDAKU3ViamVjdDogW1BBVENIIDMvOV0g
W3YxMCwzLzldIGRybS9wYW5lbDogQWRkIEJvZSBIaW1heDgyNzlkIE1JUEktRFNJIExDRAogcGFu
ZWwKClN1cHBvcnQgQm9lIEhpbWF4ODI3OWQgOC4wIiAxMjAweDE5MjAgVEZUIExDRCBwYW5lbCwg
aXQgaXMgYSBNSVBJIERTSQpwYW5lbC4KClYzOgotIFJlbW92ZSB1bm5lY2Vzc2FyeSBkZWxheXMg
aW4gc2VuZGluZyBpbml0aWFsaXphdGlvbiBjb21tYW5kcyAoSml0YW8gU2hpKQoKVjI6Ci0gVXNl
IFNQRFggaWRlbnRpZmllciAoU2FtKQotIFVzZSBuZWNlc3NhcnkgaGVhZGVyIGZpbGVzIHJlcGxh
Y2UgZHJtUC5oIChTYW0pCi0gRGVsZXRlIHVubmVjZXNzYXJ5IGhlYWRlciBmaWxlcyAjaW5jbHVk
ZSA8bGludXgvZXJyLmg+IChTYW0pCi0gU3BlY2lmaWVzIGEgR1BJT3MgYXJyYXkgdG8gY29udHJv
bCB0aGUgcmVzZXQgdGltaW5nLAogICAgaW5zdGVhZCBvZiByZWFkaW5nICJkc2ktcmVzZXQtc2Vx
dWVuY2UiIGRhdGEgZnJvbSBEVFMgKFNhbSkKLSBEZWxldGUgYmFja2xpZ2h0X2Rpc2FibGUoKSBm
dW5jdGlvbiB3aGVuIGFscmVhZHkgZGlzYWJsZWQgKFNhbSkKLSBVc2UgZGV2bV9vZl9maW5kX2Jh
Y2tsaWdodCgpIHJlcGxhY2Ugb2ZfZmluZF9iYWNrbGlnaHRfYnlfbm9kZSgpIChTYW0pCi0gTW92
ZSB0aGUgbmVjZXNzYXJ5IGRhdGEgaW4gdGhlIERUUyB0byB0aGUgY3VycmVudCBmaWxlLAogICAg
bGlrZSBwb3JjaCwgZGlzcGxheV9tb2RlIGFuZCBJbml0IGNvZGUgZXRjLiAoU2FtKQotIEFkZCBj
b21wYXRpYmxlIGRldmljZSAiYm9lLGhpbWF4ODI3OWQxMHAiIChTYW0pCgpWMToKLSBTdXBwb3J0
IEJvZSBIaW1heDgyNzlkIDguMCIgMTIwMHgxOTIwIFRGVCBMQ0QgcGFuZWwsIGl0IGlzIGEgTUlQ
SSBEU0kKICAgIHBhbmVsLgoKU2lnbmVkLW9mZi1ieTogSmVycnkgSGFuIDxoYW54dTVAaHVhcWlu
LmNvcnAtcGFydG5lci5nb29nbGUuY29tPgpDYzogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0
ZWsuY29tPgpDYzogTmljayBTYW5kZXJzIDxuc2FuZGVyc0Bnb29nbGUuY29tPgpDYzogWUggTGlu
IDx5dWVoZXJuZ2xAY2hyb21pdW0ub3JnPgpDYzogUm9jayB3YW5nIDxyb2NrX3dhbmdAaGltYXgu
Y29tLmNuPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtaGltYXg4Mjc5ZC5j
IHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1o
aW1heDgyNzlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLWhpbWF4ODI3OWQu
YwppbmRleCA4MzZhOWNiYzU4OTEuLjYwZjVmOGJmMmUxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWJvZS1oaW1heDgyNzlkLmMKQEAgLTExOSw4ICsxMTksOSBAQCBzdGF0aWMg
aW50IHBhbmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJCQkJZXJyKTsK
IAkJCQlnb3RvIHBvd2Vyb2ZmOwogCQkJfQotCQkJdXNsZWVwX3JhbmdlKChjbWQtPmRhdGFbMF0p
ICogMTAwMCwKLQkJCQkgICAgKDEgKyBjbWQtPmRhdGFbMF0pICogMTAwMCk7CisJCQlpZiAoY21k
LT5kYXRhWzBdKQorCQkJCXVzbGVlcF9yYW5nZSgoY21kLT5kYXRhWzBdKSAqIDEwMDAsCisJCQkJ
CSAgICAoMSArIGNtZC0+ZGF0YVswXSkgKiAxMDAwKTsKIAkJfQogCX0KIApAQCAtMTg3LDggKzE4
OCwxMCBAQCBzdGF0aWMgaW50IHBhbmVsX3ByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
CiAJCQkJCWVycik7CiAJCQkJZ290byBwb3dlcm9mZjsKIAkJCX0KLQkJCXVzbGVlcF9yYW5nZShj
bWQtPmRhdGFbMF0gKiAxMDAwLAotCQkJCSAgICAoMSArIGNtZC0+ZGF0YVswXSkgKiAxMDAwKTsK
KworCQkJaWYgKGNtZC0+ZGF0YVswXSkKKwkJCQl1c2xlZXBfcmFuZ2UoY21kLT5kYXRhWzBdICog
MTAwMCwKKwkJCQkJICAgICgxICsgY21kLT5kYXRhWzBdKSAqIDEwMDApOwogCQl9CiAJfQogCi0t
IAoyLjE3LjEKCg==
--00000000000097158b0592a8eab0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--00000000000097158b0592a8eab0--
