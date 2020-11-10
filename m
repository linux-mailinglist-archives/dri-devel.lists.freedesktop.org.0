Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31012AE45A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E377089D66;
	Tue, 10 Nov 2020 23:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0A89D60
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:47:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s30so660446lfc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFh/nhcwrF/c3LgZHhdLXiie2alaqfhVgce5eQpdRHk=;
 b=SVOdJook6lyRlymtqkNVft9OI32xfV6qDjHZroYCvEw6pjPKgNrxqKJ15DKV0Xf9Hw
 223YRkoekys/xGVZEnW5jp7eNTI70Yobtnm2XbC3vbU22lCEcWhfi0WP6w/R05xjPIHe
 jV4Awr0fhMD2V+2ytKr8stPRzDaM5/i9hyA5+nwc5MnMa2Rv57UoHFoGbdVLDoFE6UCE
 IpaOCoXhTVL07fjtivvTpfojiFk9HBKI3s+VpD37/RVcDbaGQz2QgBI6gnVfxRW4Bm/5
 kEYbcZtNE2UkPc8SLvvaBgl2MuAY/KoS6W9DLTn1Bd8zEu7vnReTC7O1HWQ/Qj7m66Wd
 sasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFh/nhcwrF/c3LgZHhdLXiie2alaqfhVgce5eQpdRHk=;
 b=uby/IIhqBcWvPRTGF6kbkmCv/LFmN5F3CZcnYcxNhwCbJ9b3D2cm7x2nYAIOIOFlnS
 qTvU5nWuoqINCfctQzzG/2F0QsSmzXVS4LHu3ygVOhJYgK8sjFlphGDF9Bo/HoujO/Sx
 sTeqcYE9Pe/usJ3DxKw/x+ICvKuuq3IbW7e/ZRJdvQK96EdTnEjfLJKL8yMgFr6D8/uy
 DTsgSJWGGz9/z5gj1sHlRE8VjrLniZtN4VPazoAWhKqBFQvZYiBKdp2UGZnfPexsgHrc
 q1osTiLwbEvLu4Hw0pTODKoAJQeWU9NnMBci/IC3mDHuYrtTIrwjkKt6764XXilco2Yl
 6Mtw==
X-Gm-Message-State: AOAM532/ot84SI4+IS6xrZp2JleW9a8reuhnw0TY0qp8AIS5/WfZ/hfq
 ceq6kzBfs7AIK3k5ydfs6YZQEQ==
X-Google-Smtp-Source: ABdhPJzfo5AkE8LkBZ3fFazuUZ1IBl9VUHKaBvUJJ5qjsl3/Rji2qIKp4UeMewI4Pryg5Ahlz/ve+Q==
X-Received: by 2002:ac2:568b:: with SMTP id 11mr7560047lfr.397.1605052026854; 
 Tue, 10 Nov 2020 15:47:06 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y65sm39883lff.73.2020.11.10.15.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:47:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 5/5] drm/panel: s6e63m0: Set up some display info
Date: Wed, 11 Nov 2020 00:46:53 +0100
Message-Id: <20201110234653.2248594-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110234653.2248594-1-linus.walleij@linaro.org>
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29weSBvdmVyIHRoZSB3aWR0aC9oZWlnaHQgaW4gbWlsbGltZXRlcnMgdG8gdGhlCihzb21ld2hh
dCByZWR1bmRhbnQpIGRpc3BsYXkgaW5mbywgYW5kIHNldCB1cCB0aGUKYnVzIGZvcm1hdCBhbmQg
YnVzIGZsYWdzIGZvciB0aGUgZGlzcGxheS4KCldoZW4gdXNlZCBhcyBEUEkgdGhpcyBkaXNwbGF5
IHJlcXVpcmVzIERFIHRvIGJlCmFjdGl2ZSBsb3cgYW5kIHBpeGVsIGRhdGEgdG8gYmUgb3V0cHV0
IG9uIHRoZQpuZWdhdGl2ZSBlZGdlLiBJdCBtaWdodCBiZSB0aGF0IGl0IHdhcyBwcmV2aW91c2x5
CnVzZWQgd2l0aCBhIGRpc3BsYXkgY29udHJvbGxlciB0aGF0IGVpdGhlciBkb2VzCm5vdCBzdXBw
b3J0IHRoZXNlIHNldHRpbmdzIG9yIHdhcyBoYXJkY29kZWQgdG8gdXNlCnRoZXNlIGFzIGRlZmF1
bHQuIFRoaXMgaW5mb3JtYXRpb24gY29tZXMgZnJvbSB0aGUKc291cmNlIGNvZGUgb2YgdGhlIFNh
bXN1bmcgR1QtSTkwNzAgbW9iaWxlIHBob25lLgoKQ2M6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhh
bkBnZXJob2xkLm5ldD4KQ2M6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdt
YWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAu
YyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jCmluZGV4IDNlZWU2N2Uy
ZDg2YS4uMjEwZTcwZGEzYTE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2Ftc3VuZy1zNmU2M20wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNh
bXN1bmctczZlNjNtMC5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8bGludXgvZ3Bpby9j
b25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jl
Z3VsYXRvci9jb25zdW1lci5oPgorI2luY2x1ZGUgPGxpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaD4K
IAogI2luY2x1ZGUgPHZpZGVvL21pcGlfZGlzcGxheS5oPgogCkBAIC00MTAsNiArNDExLDcgQEAg
c3RhdGljIGludCBzNmU2M20wX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAkJ
CSAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqbW9kZTsKKwlzdGF0aWMgY29uc3QgdTMyIGJ1c19mb3JtYXQgPSBNRURJQV9C
VVNfRk1UX1JHQjg4OF8xWDI0OwogCiAJbW9kZSA9IGRybV9tb2RlX2R1cGxpY2F0ZShjb25uZWN0
b3ItPmRldiwgJmRlZmF1bHRfbW9kZSk7CiAJaWYgKCFtb2RlKSB7CkBAIC00MTksNiArNDIxLDEz
IEBAIHN0YXRpYyBpbnQgczZlNjNtMF9nZXRfbW9kZXMoc3RydWN0IGRybV9wYW5lbCAqcGFuZWws
CiAJCXJldHVybiAtRU5PTUVNOwogCX0KIAorCWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLndpZHRo
X21tID0gbW9kZS0+d2lkdGhfbW07CisJY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uaGVpZ2h0X21t
ID0gbW9kZS0+aGVpZ2h0X21tOworCWRybV9kaXNwbGF5X2luZm9fc2V0X2J1c19mb3JtYXRzKCZj
b25uZWN0b3ItPmRpc3BsYXlfaW5mbywKKwkJCQkJICZidXNfZm9ybWF0LCAxKTsKKwljb25uZWN0
b3ItPmRpc3BsYXlfaW5mby5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfTE9XIHwKKwkJRFJN
X0JVU19GTEFHX1BJWERBVEFfRFJJVkVfTkVHRURHRTsKKwogCWRybV9tb2RlX3NldF9uYW1lKG1v
ZGUpOwogCiAJbW9kZS0+dHlwZSA9IERSTV9NT0RFX1RZUEVfRFJJVkVSIHwgRFJNX01PREVfVFlQ
RV9QUkVGRVJSRUQ7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
