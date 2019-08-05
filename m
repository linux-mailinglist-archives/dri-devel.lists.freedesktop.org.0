Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9848148E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027086E332;
	Mon,  5 Aug 2019 08:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0466E332
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:59:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so78591815ljc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 01:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXkqTVhXO6MuFFjVCLi4lBLWx6BlFlZJVWVgTuZAEY4=;
 b=NtECxSFTq8WRRdxkTX7j/Hx6EgvFDSMiDEGPEpteCAyHDIH5+y9rS3bkXFgakNOqnQ
 7JcZFUAghHP0d4SdJ9rJ+mcy1/f2NFEi4Jix4pyqxhKxQlbXReffugAkTOfPnCKXnTUd
 O/hq3RogsdBJFDVmQmzJk6oE2LxwxURbcAHUEDLH/izQMg2H9iJ4OBCyEdrLAGjI17li
 i0v3emGjvhBfrcZuoSaCyFskZpgZqKvCbT1+jwu9cHy1O3NFSiETf6ji55lOQD3hcEps
 gUIyc2xVrXhlgtGMemR/pkbKWDWXU+AW46fEfpAX/mMk2auxMBmwWsVoDKi7uiWD3tHL
 KlJQ==
X-Gm-Message-State: APjAAAV/mtIw4i/rJmkggus9ZxhsqvYNTrscDFOJSgLDQJ5xDz0a4MWo
 ScZuArfwLhATVsC2uC95HIDuzw==
X-Google-Smtp-Source: APXvYqwbuwVFOcYZ+tW4JlcKxLgpwbyuG/DAzlJI56u1tKKPW2NO6e7CH6quIqpkbqZgdu0KsK69jg==
X-Received: by 2002:a2e:534a:: with SMTP id t10mr38483547ljd.109.1564995546767; 
 Mon, 05 Aug 2019 01:59:06 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id b20sm234500lfc.17.2019.08.05.01.59.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 01:59:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Daniel Tang <dt.tangr@gmail.com>,
	Fabian Vogt <fabian@ritter-vogt.de>
Subject: [PATCH 2/4 v2] drm/panel: simple: Add TI nspire panel bindings
Date: Mon,  5 Aug 2019 10:58:45 +0200
Message-Id: <20190805085847.25554-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805085847.25554-1-linus.walleij@linaro.org>
References: <20190805085847.25554-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXkqTVhXO6MuFFjVCLi4lBLWx6BlFlZJVWVgTuZAEY4=;
 b=Ba7QAWM2Evl4Pc4fPtC/POrJ4FhEhiepLZMIk4k/Jf6H4nfgT+MI5OG45ZGSdcv755
 H2P3RmWgBKtQhwYQ83e0djlFVDjf4wxYMObX9mcMV2fBTv5n1rjVivL+60qap0XXNSU6
 /LgzC00XNxT/HS6mPk5/AEuqQHVpVdfDX8ra02QjPmCSIEtANfRQs9zrhxEeAjfLDt1q
 tBJjnis5YTgkKttRZvNl1dQoNstj3Pm17uZEEqNaHeF7jj3fN1Un4hVybpPdobQRc/sc
 yS3L6Q+6afMC1lCyqmzXa64ipIj1SNVbp9s6M2955b2Csb4HkNKQAPkvqOPwTZ5yK6Mz
 oWLg==
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmdzIGZvciB0aGUgVEkgTlNQSVJFIHNpbXBsZSBkaXNwbGF5IHBhbmVscy4KCkNj
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VMb2cgdjEtPnYyOgotIE5ldyBw
YXRjaCBhcyBiaW5kaW5ncyBhcmUgcmVxdWlyZWQKLSBMZXQncyB1c2UgWUFNTAotLS0KIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sICAgICB8IDM2ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdGks
bnNwaXJlLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC90aSxuc3BpcmUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZmE4MTYwMmE5MjJhCi0tLSAvZGV2L251bGwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdGksbnNwaXJl
LnlhbWwKQEAgLTAsMCArMSwzNiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjArIE9SIFgxMSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2Rpc3BsYXkvcGFuZWwvdGksbnNwaXJlLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFRleGFzIEluc3Ry
dW1lbnRzIE5TUElSRSBEaXNwbGF5IFBhbmVscworCittYWludGFpbmVyczoKKyAgLSBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBh
dGlibGU6CisgICAgb25lT2Y6CisgICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAg
ICAgICAgICAgICAgLSB0aSxuc3BpcmUtY3gtbGNkLXBhbmVsCisgICAgICAgICAgICAgIC0gdGks
bnNwaXJlLWNsYXNzaWMtbGNkLXBhbmVsCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKwor
YWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBwYW5l
bCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAidGksbnNwaXJlLWN4LWxjZC1wYW5lbCI7CisgICAg
ICAgIHBvcnRzIHsKKyAgICAJICAgIHBvcnQgeworICAgICAgICAgICAgICAgIHBhbmVsX2luOiBl
bmRwb2ludCB7CisgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcGFkcz47
CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
