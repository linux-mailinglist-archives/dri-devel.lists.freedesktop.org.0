Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DA185CF9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF3B6E1A3;
	Sun, 15 Mar 2020 13:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505FF6E1A3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:10 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g12so15627529ljj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XpTic8bHFV4I2QRBLLyv5Etu38BCHVfgf52KExnVTHY=;
 b=aGT9u9LwB7v2ZdTjUHmtOiQvrzOKN/N+YS1NEIbrIkZaK0KGfiNf4mE6vi6QL0JJQr
 lo4NjwMwCGnECd7symMBrYLtOjJN4+TiFLiW0Ipc3yfs/M2uiDsB2S+eACosjcMsp4XL
 wUUYjD6G+Bla06Q0QgOJlT+yibhJQlNO6yvOI81gn/uUtgzf/xk80DjO+GHNhsxOL67i
 eIMQLhvl+KbncWjiraiRQO9RKWdmJ3ihVq/qsSt0AxQeYIYqCNKNcSLLAGYK1kR6pWNa
 VjMUkMECbtqobX22JvYR9FDCypmp27L0+m3ARx/93vSntX6rJsq1H4TXReDdLiPBAGKS
 FP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XpTic8bHFV4I2QRBLLyv5Etu38BCHVfgf52KExnVTHY=;
 b=WzMcbnyqqdS5+RI/Bz0MNX7DDhF3I8dcKTomn87GUbQ4YE+naWhps7vztrWsEPNs3E
 5EaSfCdC1vonZjT+T2r1Xa+Wd2caCAfN9WLs9n+LD3Mm8ui1d+wjFwlOzxR+OIKJmEuB
 2OfPRsARWiDbn5ZbhS3kW06WlVvCLFQPDzv6g7qRGGRX98ShPTpxaQFrC0ZDIsbO7Iv9
 bjLilDnMSyjMXbYj/Hnlr6Bjvj4Jiy+wwVxbWNOVSG47++8PawKvM3JZSbvN1cFvO/mW
 yRpNhpq0J9nC2bJokcgwAPry759PA/p7YcF2ZJOddF93REQQYoD9oq2MWjDXzhzSMY8u
 ZsEQ==
X-Gm-Message-State: ANhLgQ2d9oxcFaxb1DBxc/nbgQXQamyxlzlMAyIKmv7wW/6p3Me9MoUq
 OOmhrEVsZ3UwPtzkbP6Acw8mhi3W8Ec=
X-Google-Smtp-Source: ADFU+vs7RfZvDNQqHBt03aZvYEYM1TFpw6pNdW4Vncu222rT0CwpTUFR2i865Gq0liUDqaX3wFXI4Q==
X-Received: by 2002:a05:651c:288:: with SMTP id
 b8mr1882259ljo.98.1584279908314; 
 Sun, 15 Mar 2020 06:45:08 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:45:07 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 19/36] dt-bindings: display: convert rocktech,
 jh057n00900 to DT Schema
Date: Sun, 15 Mar 2020 14:43:59 +0100
Message-Id: <20200315134416.16527-20-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogIkd1aWRv
IEfDvG50aGVyIiA8YWd4QHNpZ3hjcHUub3JnPgpDYzogUHVyaXNtIEtlcm5lbCBUZWFtIDxrZXJu
ZWxAcHVyaS5zbT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+
CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFu
ZWwvcm9ja3RlY2gsamgwNTduMDA5MDAudHh0ICAgIHwgMjMgLS0tLS0tLS0KIC4uLi9kaXNwbGF5
L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnlhbWwgICB8IDU3ICsrKysrKysrKysrKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcm9ja3RlY2gsamgwNTduMDA5MDAudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgw
NTduMDA5MDAueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAw
LnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTM3MmM1ZDg0Njk1Li4wMDAwMDAw
MDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcm9ja3RlY2gsamgwNTduMDA5MDAudHh0CisrKyAvZGV2L251bGwKQEAgLTEsMjMgKzAsMCBA
QAotUm9ja3RlY2ggamgwNTduMDA5MDAgNS41IiA3MjB4MTQ0MCBURlQgTENEIHBhbmVsCi0KLVJl
cXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6IHNob3VsZCBiZSAicm9ja3RlY2gsamgw
NTduMDA5MDAiCi0tIHJlZzogRFNJIHZpcnR1YWwgY2hhbm5lbCBvZiB0aGUgcGVyaXBoZXJhbAot
LSByZXNldC1ncGlvczogcGFuZWwgcmVzZXQgZ3BpbwotLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2Yg
dGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCi0tIHZjYy1zdXBwbHk6
IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSB2Y2Mgc3VwcGx5IHZv
bHRhZ2UuCi0tIGlvdmNjLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJv
dmlkZXMgdGhlIGlvdmNjIHN1cHBseQotICB2b2x0YWdlLgotCi1FeGFtcGxlOgotCi0JJm1pcGlf
ZHNpIHsKLQkJcGFuZWxAMCB7Ci0JCQljb21wYXRpYmxlID0gInJvY2t0ZWNoLGpoMDU3bjAwOTAw
IjsKLQkJCXJlZyA9IDwwPjsKLQkJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKLQkJCXJlc2V0
LWdwaW9zID0gPCZncGlvMyAxMyBHUElPX0FDVElWRV9MT1c+OwotCQkJdmNjLXN1cHBseSA9IDwm
cmVnXzJ2OF9wPjsKLQkJCWlvdmNjLXN1cHBseSA9IDwmcmVnXzF2OF9wPjsKLQkJfTsKLQl9Owpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcm9ja3RlY2gsamgwNTduMDA5MDAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnlhbWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi44Mjc0MTdiYmZmNjMKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9y
b2NrdGVjaCxqaDA1N24wMDkwMC55YW1sCkBAIC0wLDAgKzEsNTcgQEAKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTduMDA5MDAueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogUm9ja3RlY2ggamgwNTduMDA5MDAgNS41IiA3MjB4MTQ0MCBURlQgTENEIHBhbmVs
CisKK21haW50YWluZXJzOgorICAtIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CisK
K2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIworCitwcm9wZXJ0aWVzOgorICBj
b21wYXRpYmxlOgorICAgIGNvbnN0OiByb2NrdGVjaCxqaDA1N24wMDkwMAorCisgIHJlZzogdHJ1
ZQorICByZXNldC1ncGlvczogdHJ1ZQorICBiYWNrbGlnaHQ6IHRydWUKKworICB2Y2Mtc3VwcGx5
OgorICAgIGRlc2NyaXB0aW9uOiBUaGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgdGhlIHZjYyBz
dXBwbHkgdm9sdGFnZQorCisgIGlvdmNjLXN1cHBseToKKyAgICBkZXNjcmlwdGlvbjogVGhlIHJl
Z3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBpb3ZjYyBzdXBwbHkgdm9sdGFnZQorCityZXF1aXJl
ZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gcmVzZXQtZ3Bpb3MKKyAgLSBiYWNrbGln
aHQKKyAgLSB2Y2Mtc3VwcGx5CisgIC0gaW92Y2Mtc3VwcGx5CisKK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2dwaW8vZ3Bpby5oPgorCisgICAgZHNpIHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworCisgICAgICAgIHBhbmVsQDAgeworICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJyb2NrdGVjaCxqaDA1N24wMDkwMCI7CisgICAgICAgICAgICBy
ZWcgPSA8MD47CisgICAgICAgICAgICBiYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CisgICAgICAg
ICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbzMgMTMgR1BJT19BQ1RJVkVfTE9XPjsKKyAgICAgICAg
ICAgIHZjYy1zdXBwbHkgPSA8JnJlZ18ydjhfcD47CisgICAgICAgICAgICBpb3ZjYy1zdXBwbHkg
PSA8JnJlZ18xdjhfcD47CisgICAgICAgIH07CisgICAgfTsKKworLi4uCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
