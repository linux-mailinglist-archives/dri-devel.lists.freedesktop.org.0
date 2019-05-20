Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E9265E4
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C20189AB6;
	Wed, 22 May 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994D68928B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:59:02 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 622303E8D7;
 Mon, 20 May 2019 08:59:00 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robh+dt@kernel.org,
	lee.jones@linaro.org
Subject: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
Date: Mon, 20 May 2019 04:58:46 -0400
Message-Id: <20190520085846.22320-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1558342741;
 bh=Xgy3+Rs3yBvZB0BUXAIyl2U75vWOzK4nucJwFwG9y2o=;
 h=From:To:Cc:Subject:Date:From;
 b=FUo5HUbTH+MqwO7mv9H2UE6JE1Sw2F8UVEDBoN+IxsVWDh5m9P5Ab0zxNHG9foqtj
 olCdm1bIrFG8JpiNW0bUFdGMKcEHtgLUvdPv/dg0f5OHVNQ2cmNIeI6Rtssn/XNhZP
 dY0Z915b7AkymZkdCxWHtrd6AX+cLnqC/KZZasJA=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICcjYWRkcmVzcy1jZWxscycgYW5kICcjc2l6ZS1jZWxscycgcHJvcGVydGllcyB3ZXJlIG5v
dCBkZWZpbmVkIGluCnRoZSBsbTM2MzBhIGJpbmRpbmdzIGFuZCB3b3VsZCBjYXVzZSB0aGUgZm9s
bG93aW5nIGVycm9yIHdoZW4KYXR0ZW1wdGluZyB0byB2YWxpZGF0ZSB0aGUgZXhhbXBsZXMgYWdh
aW5zdCB0aGUgc2NoZW1hOgoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
YmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LmV4YW1wbGUuZHQueWFtbDoKJyNhZGRyZXNzLWNl
bGxzJywgJyNzaXplLWNlbGxzJyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOgonXmxl
ZEBbMDFdJCcsICdwaW5jdHJsLVswLTldKycKCkNvcnJlY3QgdGhpcyBieSBhZGRpbmcgdGhvc2Ug
dHdvIHByb3BlcnRpZXMuCgpXaGlsZSB3ZSdyZSBoZXJlLCBtb3ZlIHRoZSB0aSxsaW5lYXItbWFw
cGluZy1tb2RlIHByb3BlcnR5IHRvIHRoZQpsZWRAWzAxXSBjaGlsZCBub2RlcyB0byBjb3JyZWN0
IHRoZSBmb2xsb3dpbmcgdmFsaWRhdGlvbiBlcnJvcjoKCkRvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0Lnlh
bWw6CmxlZEAwOiAndGksbGluZWFyLW1hcHBpbmctbW9kZScgZG9lcyBub3QgbWF0Y2ggYW55IG9m
IHRoZSByZWdleGVzOgoncGluY3RybC1bMC05XSsnCgpGaXhlczogMzJmY2I3NWM2NmEwICgiZHQt
YmluZGluZ3M6IGJhY2tsaWdodDogQWRkIGxtMzYzMGEgYmluZGluZ3MiKQpTaWduZWQtb2ZmLWJ5
OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KUmVwb3J0ZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ci0tLQogLi4uL2xlZHMvYmFja2xpZ2h0L2xtMzYz
MGEtYmFja2xpZ2h0LnlhbWwgICAgIHwgMjAgKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFj
a2xpZ2h0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbAppbmRleCA0ZDYxZmUwYTk4YTQuLmYwODU1ZTI0
OGFlNSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
YmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKQEAg
LTIzLDE2ICsyMywxNyBAQCBwcm9wZXJ0aWVzOgogICByZWc6CiAgICAgbWF4SXRlbXM6IDEKIAot
ICB0aSxsaW5lYXItbWFwcGluZy1tb2RlOgotICAgIGRlc2NyaXB0aW9uOiB8Ci0gICAgICBFbmFi
bGUgbGluZWFyIG1hcHBpbmcgbW9kZS4gSWYgZGlzYWJsZWQsIHRoZW4gaXQgd2lsbCB1c2UgZXhw
b25lbnRpYWwKLSAgICAgIG1hcHBpbmcgbW9kZSBpbiB3aGljaCB0aGUgcmFtcCB1cC9kb3duIGFw
cGVhcnMgdG8gaGF2ZSBhIG1vcmUgdW5pZm9ybQotICAgICAgdHJhbnNpdGlvbiB0byB0aGUgaHVt
YW4gZXllLgotICAgIHR5cGU6IGJvb2xlYW4KKyAgJyNhZGRyZXNzLWNlbGxzJzoKKyAgICBjb25z
dDogMQorCisgICcjc2l6ZS1jZWxscyc6CisgICAgY29uc3Q6IDAKIAogcmVxdWlyZWQ6CiAgIC0g
Y29tcGF0aWJsZQogICAtIHJlZworICAtICcjYWRkcmVzcy1jZWxscycKKyAgLSAnI3NpemUtY2Vs
bHMnCiAKIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiXmxlZEBbMDFdJCI6CkBAIC03Myw2ICs3NCwx
MyBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICAgICAgbWluaW11bTogMAogICAgICAgICBtYXhp
bXVtOiAyNTUKIAorICAgICAgdGksbGluZWFyLW1hcHBpbmctbW9kZToKKyAgICAgICAgZGVzY3Jp
cHRpb246IHwKKyAgICAgICAgICBFbmFibGUgbGluZWFyIG1hcHBpbmcgbW9kZS4gSWYgZGlzYWJs
ZWQsIHRoZW4gaXQgd2lsbCB1c2UgZXhwb25lbnRpYWwKKyAgICAgICAgICBtYXBwaW5nIG1vZGUg
aW4gd2hpY2ggdGhlIHJhbXAgdXAvZG93biBhcHBlYXJzIHRvIGhhdmUgYSBtb3JlIHVuaWZvcm0K
KyAgICAgICAgICB0cmFuc2l0aW9uIHRvIHRoZSBodW1hbiBleWUuCisgICAgICAgIHR5cGU6IGJv
b2xlYW4KKwogICAgIHJlcXVpcmVkOgogICAgICAgLSByZWcKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
