Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB79AD3C0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C2489885;
	Mon,  9 Sep 2019 07:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195C6894C1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 15:52:06 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.90]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1i39de3QNm-0050ua; Sun, 08
 Sep 2019 17:46:28 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
Subject: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM driver
 instead of firmware."
Date: Sun,  8 Sep 2019 17:44:53 +0200
Message-Id: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:8SS2m039FZNDDpUlAdXTSHBal6u5+ujaEtxV4T1c3m87WsiWPbb
 nyfhBWj3eZScVg5xk3v6P65yl3Qcc+sNzVQNDYFzbWY9z61kGwjaU9rkHg7xTLUVfOd5qLt
 4iZ5YPEPVod6zIFHiNBxkUea52dqThXP8AhrTbRAEd6R0wJh/otCLINEOIn24Kbj0bmbT1d
 LIEB9T6Ww3qBlBezldbtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/lNEL3G1xVY=:QGo4lhUosV2wQ4ScDJYSyO
 7764j9HL0lwyFSTiC5IM2TQu7sm2WwM/t/31W83BuoWhvVQsssxvs+x6hP1WRP+Aw+zV7noSY
 mzV5h2RMJ5dtL/DDkgjb+xU+yJ2wSmqM8f+dJoRu8LRhwJVE7tThoPJlDcLRw/1zznEheAgM+
 dQyxjyt8DBF3rIWMtRqk6Jqq0PbbyOZMZQaGtvE967FDfgcGemG0dpNeCPw1FnY1XmkMh5Uzn
 GmD5UjIvB1Rx/78HsjrHbaI/8MMgNMxlXMlpKCgG97bxRoaCac1DUbNqSznWoKkL/LUuUCTlS
 zMvVnHOet2ooiSpGxAKv45hjWkn8yjHc3KfWSv4qDCPB0obgPMAhsoWhPoL7ANBOeY8xWVGFL
 J+mm0lmb7/6V0CXPcWBI1peya5I6ssHQPBMF62TqQfcUK7eYuNPIthzZqR/ND50ZgYpLWLxLS
 rS/rzNbcOE10YwSoHs+wuM4WvqA6nf9iuLcvE/2eeLXrBxTApH3M7iI6XN2qi0eujD+YOWQ3y
 CPOgYmPb7XPYV0dDM+A7vKJdh6jX6kJ27XSHkm7Nm1mCIKrdyB27jgLYi4dZTG7KxM1bTDMCq
 N2c4L7MFDhw2WKE1UlFT+kGvYWNXd/imhapNz+P0TvtMAj8imll8oGnVzecvHy+wiaQt3PaZX
 aMtss8nMmRHcfvtfrfd0jQlIP7CUkt8/uE/Sirthp58RMOD4QU0mJ4/vRMLgo4W2w5CkSZEtd
 WuRE7yy1o8w6nEi4532ORJn33+c5kEqMH/SW6Utmg/cjQ62RaBMBcde3kxtZDTvP0nTpYVnwP
 NltYx7BdeqaTe5dzxEZYP1XounWrhwnp/7y8GpH+KH6iPQzkDUADNvgm/d1XwRT4FK7HIteMN
 G/uBxNPGpqnQy5+V8tH3ToqlJUA6ViAvSte2txM4Q31gHRRjoHiJtHD4dj+Y5c+sMlXAorJU/
 dUWPqvnyrEQX80Pmci1WYY1SqFtadYAQDcoUl1QTMpf5nta25Kw9YREMnYYsCu05gJGz8FJ8c
 9buotNPi6SlXqKK5STwMCMObObWafbuo/PPYph1cPJGL4hux9452SOOdmT1b+wXCmIeE6Jzkj
 ZyMWc7Qe3MXAyvNss7zgrzI5HQ83oSCON+3SXuJKUbr6bWNZojMM8DaHNPlQXD6CRUKLiJc+B
 1EI1eCo1j1gGYdG0hjasegQjfJL+iYC2oAPZUVpugMr1QEoRX5bSQU2r/o0+smX1MMSxw=
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1567957925;
 bh=SFrQS2AE6buvSq2XcNrsQJ4HnzDculs7JE6sErBescQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Tgvgd927GNu1Yxj7N2kDohgSc9m6dqC2vWkdyXD7WyumMXcnalDXNHBTRDa6jlhB2
 aW72+KcD8X0ol+gIM7DNmsx5ImDY8RHconeeCggUIr0uRBekHjGkRERcJ5Q957zcs2
 V4SlzInVth4yrZ6c5IUpgzFfHsLz2RlUNF5kRBcw=
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
Cc: stable@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgcmVsZWFzZSBvZiB0aGUgbmV3IEJDTTI4MzUgUE0gZHJpdmVyIHRoZXJlIGhhcyBiZWVu
IHNldmVyYWwgcmVwb3J0cwpvZiBWM0QgcHJvYmluZyBpc3N1ZXMuIFRoaXMgaXMgY2F1c2VkIGJ5
IHRpbWVvdXRzIGR1cmluZyBwb3dlcmluZy11cCB0aGUKR1JBRlggUE0gZG9tYWluOgoKICBiY20y
ODM1LXBvd2VyOiBUaW1lb3V0IHdhaXRpbmcgZm9yIGdyYWZ4IHBvd2VyIE9LCgpJIHdhcyBhYmxl
IHRvIHJlcHJvZHVjZSB0aGlzIHJlbGlhYmxlIG9uIG15IFJhc3BiZXJyeSBQaSAzQisgYWZ0ZXIg
c2V0dGluZwpmb3JjZV90dXJibz0xIGluIHRoZSBmaXJtd2FyZSBjb25maWd1cmF0aW9uLiBTaW5j
ZSB0aGVyZSBhcmUgbm8gaXNzdWVzCnVzaW5nIHRoZSBmaXJtd2FyZSBQTSBkcml2ZXIgd2l0aCB0
aGUgc2FtZSBzZXR1cCwgdGhlcmUgbXVzdCBiZSBhbiBpc3N1ZQppbiB0aGUgQkNNMjgzNSBQTSBk
cml2ZXIuCgpVbmZvcnR1bmF0ZWx5IHRoZXJlIGhhc24ndCBiZWVuIG11Y2ggcHJvZ3Jlc3MgaW4g
aWRlbnRpZnlpbmcgdGhlIHJvb3QgY2F1c2UKc2luY2UgSnVuZSAobW9zdGx5IGluIHRoZSBsYWNr
IG9mIGRvY3VtZW50YXRpb24pLCBzbyBpIGRlY2lkZWQgdG8gc3dpdGNoCmJhY2sgdW50aWwgdGhl
IGlzc3VlIGluIHRoZSBCQ00yODM1IFBNIGRyaXZlciBpcyBmaXhlZC4KCkxpbms6IGh0dHBzOi8v
Z2l0aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzA0NgpGaXhlczogZTFkYzJiMmUx
YmVmICgiIEFSTTogYmNtMjgzeDogU3dpdGNoIFYzRCBvdmVyIHRvIHVzaW5nIHRoZSBQTSBkcml2
ZXIgaW5zdGVhZCBvZiBmaXJtd2FyZS4iKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW4gV2FocmVuIDx3YWhyZW5zdEBnbXgubmV0PgotLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL2JjbTI4MzUtcnBpLmR0c2kgfCA0ICsrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2Jj
bTI4M3guZHRzaSAgICAgfCA0ICstLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4MzUt
cnBpLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9iY20yODM1LXJwaS5kdHNpCmluZGV4IDZjNmE3
ZjYuLmI5MDllM2IgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4MzUtcnBpLmR0
c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYmNtMjgzNS1ycGkuZHRzaQpAQCAtNjcsNiArNjcs
MTAgQEAKIAlwb3dlci1kb21haW5zID0gPCZwb3dlciBSUElfUE9XRVJfRE9NQUlOX1VTQj47CiB9
OwoKKyZ2M2QgeworCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJQSV9QT1dFUl9ET01BSU5fVjNE
PjsKK307CisKICZ2ZWMgewogCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJQSV9QT1dFUl9ET01B
SU5fVkVDPjsKIAlzdGF0dXMgPSAib2theSI7CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9iY20yODN4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9iY20yODN4LmR0c2kKaW5kZXggMmQx
OTFmYy4uYjIzODU2NyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYmNtMjgzeC5kdHNp
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4M3guZHRzaQpAQCAtMyw3ICszLDYgQEAKICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9iY20yODM1LWF1eC5oPgogI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2dwaW8vZ3Bpby5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2lycS5oPgotI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3NvYy9iY20yODM1LXBtLmg+Cgog
LyogZmlybXdhcmUtcHJvdmlkZWQgc3RhcnR1cCBzdHVicyBsaXZlIGhlcmUsIHdoZXJlIHRoZSBz
ZWNvbmRhcnkgQ1BVcyBhcmUKICAqIHNwaW5uaW5nLgpAQCAtMTIxLDcgKzEyMCw3IEBACiAJCQkj
aW50ZXJydXB0LWNlbGxzID0gPDI+OwogCQl9OwoKLQkJcG06IHdhdGNoZG9nQDdlMTAwMDAwIHsK
KwkJd2F0Y2hkb2dAN2UxMDAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJicmNtLGJjbTI4MzUtcG0i
LCAiYnJjbSxiY20yODM1LXBtLXdkdCI7CiAJCQkjcG93ZXItZG9tYWluLWNlbGxzID0gPDE+Owog
CQkJI3Jlc2V0LWNlbGxzID0gPDE+OwpAQCAtNjQxLDcgKzY0MCw2IEBACiAJCQljb21wYXRpYmxl
ID0gImJyY20sYmNtMjgzNS12M2QiOwogCQkJcmVnID0gPDB4N2VjMDAwMDAgMHgxMDAwPjsKIAkJ
CWludGVycnVwdHMgPSA8MSAxMD47Ci0JCQlwb3dlci1kb21haW5zID0gPCZwbSBCQ00yODM1X1BP
V0VSX0RPTUFJTl9HUkFGWF9WM0Q+OwogCQl9OwoKIAkJdmM0OiBncHUgewotLQoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
