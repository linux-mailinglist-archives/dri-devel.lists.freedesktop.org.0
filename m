Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C9E3108
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 13:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047E86E2F3;
	Thu, 24 Oct 2019 11:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00A16E2E3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 11:43:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g3so6651520lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 04:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y6qwseFf3sOEzysjfxOCeatUxazVlV6E5726z4gpfTk=;
 b=J7uES+4Du0W21oqztZD3lNBRgtqvIwF+k2mdKq8DmPm3dpj6bfAteYVFo+jlJQpeRB
 gZwZNgwod4t2tQWGQi2I8y5sMFShDnhNFSB6tnuPvPHt4hcv1taI4wXYMtBWmNbhV2OY
 RcSm11eyl7iCd61q/mRtUIu/HdEOKCrGEmMMiALZbOVvMWhxK/i0Ai3qzUpFugILhq2c
 XIQO2Xz+4dNTPxRLaa4DYyX54lgx9T9tBx1/M+vj/jf/RrRq8TNEqClxC8cijCI3IqCq
 f6AMX/0sCVfPPeg52ooUq0B6iNs4yZ9DViCZyAf7I/IZaZRyJ03VwOCFG8+p0g7YWUDW
 QKyw==
X-Gm-Message-State: APjAAAUQmH1aPowElOsm8ELcbcS4aAxsl37e2xYJ7nHv30S+JMEYvCJu
 ZEXEpJ90+AbQUGUxp6LZgvwJusYck4o=
X-Google-Smtp-Source: APXvYqwApy6iTTlUo7LyKjHSge1hqKfP9JTwipM9xBhCzAcimzQLZisjM3ga4wJey8II3bDv8+mD1A==
X-Received: by 2002:a19:651b:: with SMTP id z27mr24607041lfb.117.1571917392144; 
 Thu, 24 Oct 2019 04:43:12 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id e14sm4001846ljb.75.2019.10.24.04.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:43:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Thu, 24 Oct 2019 13:43:04 +0200
Message-Id: <20191024114305.15581-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024114305.15581-1-linus.walleij@linaro.org>
References: <20191024114305.15581-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y6qwseFf3sOEzysjfxOCeatUxazVlV6E5726z4gpfTk=;
 b=dN9+UiU2TiIaFv1ECG8dz2AKCpyynB8QkW7md/WXneHG+ISMq7AOoyaWnBLRx6PmAY
 wXWWnF3wjJYAdwfg3HzJfX9UwYP9NvatBJyQpbjP/e+Tuc7RJbuqP9ArqxbPjtwGNikj
 tFn26MVd/P/b7ieBc3YSzBJV8fdanYQ2Zv4qzqR8TctDjFINFboEs6WGkCJa4sS2H0Hq
 02QOjA6Xds3Gcpjct994FJ8a2Nhqp8byEzloxr+5qdwusSGfrh3Daj52ZfgFAx9cUUBf
 AXtxTJn2f6upA6wyfmm32/YAowtwNgXf2IJgpqk4DysQdfOWhpHtPts87nW8wC3Rj1+W
 sMfw==
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgU29ueSBBQ1g0MjRBS1AgcGFu
ZWwuCkxldCdzIHVzZSBZQU1MLgoKQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClNpZ25l
ZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNo
YW5nZUxvZyB2My0+djQ6Ci0gQWRqdXN0IHRvIGFkanVzdGVkIERTSSBiaW5kaW5ncy4KQ2hhbmdl
TG9nIHYyLT52MzoKLSBQdXQgdGhlIGV4YW1wbGUgaW5zaWRlIGEgZHNpLWNvbnRyb2xsZXIgc28g
d2UgaGF2ZSBhIGNvbXBsZXRlCiAgZXhhbXBsZSB0aGF0IHZlcmlmaWVzIHRvIHRoZSBEU0kgcGFu
ZWwgZ2VuZXJpYyBiaW5kaW5nLgpDaGFuZ2VMb2cgdjEtPnYyOgotIFN1Z2dlc3QgYSBzdGFuZC1h
bG9uZSBZQU1MIGJpbmRpbmdzIGZpbGUgZm9yIERTSSBwYW5lbHMgaW4KICBhIHNlcGFyYXRlIHBh
dGNoLCBhbmQgdXNlIHRoYXQgdG8gcmVmZXJlbmNlIHRoZQogIGJvb2xlYW4gImVuZm9yY2Utdmlk
ZW8tbW9kZSIgYXR0cmlidXRlIGZvciBEU0kgcGFuZWxzCi0tLQogLi4uL2Rpc3BsYXkvcGFuZWwv
c29ueSxhY3g0MjRha3AueWFtbCAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55
YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvc29ueSxhY3g0MjRha3AueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5hMmY0OWI5YTU5NTgKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFj
eDQyNGFrcC55YW1sCkBAIC0wLDAgKzEsNDkgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55
YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCisKK3RpdGxlOiBTb255IEFDWDQyNEFLUCA0IiA0ODB4ODY0IEFNT0xFRCBwYW5lbAorCitt
YWludGFpbmVyczoKKyAgLSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+
CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIworICAtICRyZWY6IC4uL2Rz
aS1jb250cm9sbGVyLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29u
c3Q6IHNvbnksYWN4NDI0YWtwCisgIHJlZzogdHJ1ZQorICBwb3J0OiB0cnVlCisgIHJlc2V0LWdw
aW9zOiB0cnVlCisgIHZkZGktc3VwcGx5OgorICAgICBkZXNjcmlwdGlvbjogcmVndWxhdG9yIHRo
YXQgc3VwcGxpZXMgdGhlIHZkZGkgdm9sdGFnZQorICBlbmZvcmNlLXZpZGVvLW1vZGU6IHRydWUK
KworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHBvcnQKKyAgLSByZXNl
dC1ncGlvcworICAtIHBvd2VyLXN1cHBseQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
KworZXhhbXBsZXM6CisgIC0gfAorICAgIGRzaS1jb250cm9sbGVyQDAgeworICAgICAgICBjb21w
YXRpYmxlID0gImZvbyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgcGFuZWxAMCB7CisgICAgICAgICAgICBjb21wYXRp
YmxlID0gInNvbnksYWN4NDI0YWtwIjsKKyAgICAgICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAg
ICAgIHZkZGktc3VwcGx5ID0gPCZmb28+OworICAgICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmZv
b19ncGlvIDAgR1BJT19BQ1RJVkVfTE9XPjsKKyAgICAgICAgfTsKKyAgICB9OworCisuLi4KXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
