Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286095145
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448A6E45B;
	Mon, 19 Aug 2019 23:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191066E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:32 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id g2so2086626pfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sMMNrNPEyr5ojRnGMae00OuNvWMz/twMj42dMKt7nWI=;
 b=p2GqAmxU5ghE40Lc6MkiqzBaglcKMYtbg88OMFyPbngnlu/yyioXkZ0mziH6dpo/8E
 ewSDhOWX3ooiUSwQZV/TY+BiGjQP0v0y/cMr3sGEJBJjCwqhC060J+f8z93fWdyJJXYy
 CNnJHIVTQuGlc5Q/V3xoaTiCQXQd9sdNWI9I6FzWJwUavng6rCFSnOpKKFYfZirUbvTK
 U0CcFdUvfXPzSc7oIRXKHZ9GVGv+xi9SswbWgRmukelWetPT1uNNzARYcKb+X0du+ecD
 esWtkp8PgVHt4AB3seQP3JFCbbR7Nm4MieK9PYE8qHauc8SbvIQ98saDJVOArObc2jSf
 PC5Q==
X-Gm-Message-State: APjAAAW06j114t/Hc+z+AobyWxFLz7d11tn0SNOyyqcJ+wMoREN9iwFe
 rTX4+bCPSBvW9U/LKGfmWR5TCA==
X-Google-Smtp-Source: APXvYqwb1NlOHGixTVWfKWtPeGyyczgYsv1+r1jQRk7O0IlMpAWvAHx5RA2P2qeq/kAH+R2FQKrW1Q==
X-Received: by 2002:a65:6458:: with SMTP id s24mr21839142pgv.158.1566255811461; 
 Mon, 19 Aug 2019 16:03:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:30 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/25] drm: kirin: Remove uncessary parameter indirection
Date: Mon, 19 Aug 2019 23:03:00 +0000
Message-Id: <20190819230321.56480-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sMMNrNPEyr5ojRnGMae00OuNvWMz/twMj42dMKt7nWI=;
 b=v1pVzeLVL4i2QM63LjdIG16cVunIA1wDrcWnGZLbSWTLQuViS6sU6eb1I4/agTCUDc
 t+ZtZed/2TMX58/fHKD78fEnRgbm335xveJAkCf4IuL/CxHn5fjilap0t8YkgZxLj0qe
 0bUhKZ5dwWZ0IdOmoETmqGDVV+rLoDNfdFgfidefk3MkiePU1eBGttWbh1PujCbR+A1u
 dR+mi7XMVr3BzexefjBdeM4Q3RhFtJT5LpJZWYnvW/OimWUTcNTYpKGLdLnhwwHTQjKH
 8Rw5PJSi5pDJnKmKfkR7Vsm7n+MME4k4sIfpwYhJi5DVvKW126bvgv0PgVOxqlviKzFT
 /Sdg==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKSW4gYSBmZXcgZnVuY3Rp
b25zLCB3ZSBwYXNzIGluIGEgc3RydWN0IGFkZV9jcnRjLCB3aGljaCB3ZSBvbmx5CnVzZSB0byBn
ZXQgdG8gdGhlIHVuZGVybHlpbmcgc3RydWN0IGFkZV9od19jdHguCgpUaHVzIHRoaXMgcGF0Y2gg
cmVmYWN0b3JzIHRoZSBmdW5jdGlvbnMgdG8ganVzdCB0YWtlIHRoZQpzdHJ1Y3QgYWRlX2h3X2N0
eCBkaXJlY3RseS4KCkNjOiBSb25ncm9uZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6
IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpBY2tlZC1ieTogWGlubGlhbmcgTGl1IDx6Lmxp
dXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlzaWxpY29u
LmNvbT4KW2pzdHVsdHo6IHJld29yZGVkIGNvbW1pdCBtZXNzYWdlXQpTaWduZWQtb2ZmLWJ5OiBK
b2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyB8IDEyICsrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCmluZGV4IGQ5NzIzNDI1Mjdi
OC4uNDUzNTE5MzRkOTE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluL2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L2tpcmluX2RybV9hZGUuYwpAQCAtMjEwLDExICsyMTAsMTAgQEAgc3RhdGljIHZvaWQgYWRlX3Nl
dF9waXhfY2xrKHN0cnVjdCBhZGVfaHdfY3R4ICpjdHgsCiAJYWRqX21vZGUtPmNsb2NrID0gY2xr
X2dldF9yYXRlKGN0eC0+YWRlX3BpeF9jbGspIC8gMTAwMDsKIH0KIAotc3RhdGljIHZvaWQgYWRl
X2xkaV9zZXRfbW9kZShzdHJ1Y3QgYWRlX2NydGMgKmFjcnRjLAorc3RhdGljIHZvaWQgYWRlX2xk
aV9zZXRfbW9kZShzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4LAogCQkJICAgICBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqbW9kZSwKIAkJCSAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFkal9t
b2RlKQogewotCXN0cnVjdCBhZGVfaHdfY3R4ICpjdHggPSBhY3J0Yy0+Y3R4OwogCXZvaWQgX19p
b21lbSAqYmFzZSA9IGN0eC0+YmFzZTsKIAl1MzIgd2lkdGggPSBtb2RlLT5oZGlzcGxheTsKIAl1
MzIgaGVpZ2h0ID0gbW9kZS0+dmRpc3BsYXk7CkBAIC0zMDEsOSArMzAwLDggQEAgc3RhdGljIHZv
aWQgYWRlX3Bvd2VyX2Rvd24oc3RydWN0IGFkZV9od19jdHggKmN0eCkKIAljdHgtPnBvd2VyX29u
ID0gZmFsc2U7CiB9CiAKLXN0YXRpYyB2b2lkIGFkZV9zZXRfbWVkaWFub2NfcW9zKHN0cnVjdCBh
ZGVfY3J0YyAqYWNydGMpCitzdGF0aWMgdm9pZCBhZGVfc2V0X21lZGlhbm9jX3FvcyhzdHJ1Y3Qg
YWRlX2h3X2N0eCAqY3R4KQogewotCXN0cnVjdCBhZGVfaHdfY3R4ICpjdHggPSBhY3J0Yy0+Y3R4
OwogCXN0cnVjdCByZWdtYXAgKm1hcCA9IGN0eC0+bm9jX3JlZ21hcDsKIAogCXJlZ21hcF91cGRh
dGVfYml0cyhtYXAsIEFERTBfUU9TR0VORVJBVE9SX01PREUsCkBAIC01MTUsNyArNTEzLDcgQEAg
c3RhdGljIHZvaWQgYWRlX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAJCQlyZXR1cm47CiAJfQogCi0JYWRlX3NldF9tZWRpYW5vY19xb3MoYWNydGMpOworCWFkZV9z
ZXRfbWVkaWFub2NfcW9zKGN0eCk7CiAJYWRlX2Rpc3BsYXlfZW5hYmxlKGFjcnRjKTsKIAlhZGVf
ZHVtcF9yZWdzKGN0eC0+YmFzZSk7CiAJZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOwpAQCAtNTQ1
LDcgKzU0Myw3IEBAIHN0YXRpYyB2b2lkIGFkZV9jcnRjX21vZGVfc2V0X25vZmIoc3RydWN0IGRy
bV9jcnRjICpjcnRjKQogCiAJaWYgKCFjdHgtPnBvd2VyX29uKQogCQkodm9pZClhZGVfcG93ZXJf
dXAoY3R4KTsKLQlhZGVfbGRpX3NldF9tb2RlKGFjcnRjLCBtb2RlLCBhZGpfbW9kZSk7CisJYWRl
X2xkaV9zZXRfbW9kZShjdHgsIG1vZGUsIGFkal9tb2RlKTsKIH0KIAogc3RhdGljIHZvaWQgYWRl
X2NydGNfYXRvbWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKQEAgLTU1OCw3ICs1NTYs
NyBAQCBzdGF0aWMgdm9pZCBhZGVfY3J0Y19hdG9taWNfYmVnaW4oc3RydWN0IGRybV9jcnRjICpj
cnRjLAogCiAJaWYgKCFjdHgtPnBvd2VyX29uKQogCQkodm9pZClhZGVfcG93ZXJfdXAoY3R4KTsK
LQlhZGVfbGRpX3NldF9tb2RlKGFjcnRjLCBtb2RlLCBhZGpfbW9kZSk7CisJYWRlX2xkaV9zZXRf
bW9kZShjdHgsIG1vZGUsIGFkal9tb2RlKTsKIH0KIAogc3RhdGljIHZvaWQgYWRlX2NydGNfYXRv
bWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
