Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE396CAF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553CF6E8B2;
	Tue, 20 Aug 2019 23:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DE36E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:06:36 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bj8so227299plb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sMMNrNPEyr5ojRnGMae00OuNvWMz/twMj42dMKt7nWI=;
 b=KVdBPo+bMpLIaW9Lyoj/fky5kPFMD9GLlEnmmf+0iKSDvJlbOe2JhH33AwScHvADFj
 XSBSD4JvsCK5FNE1WwnjAF9202ppWoKEL1NWgPz2hnbXRSWg8TqXZdf2GXl8wTNAnweX
 Q2C8SjiRhp5TT68BwUdMH+fq84Vug6PhCirC6MLwUM/pT0Zt4CWbn1QN1Wfy6BR+xO4r
 AVygh1AdjG3knsbnkMs2mfDD8Y9knLpiC7WS+MUr29KLzUTS/miCn1uCMQ7D589JUS69
 E2NQ06RBJPpZmsVKIahxvd1hFKEDolPXu8HXokjpUN8p079Mt6TEfCUNweuC77OplUR1
 0G6Q==
X-Gm-Message-State: APjAAAWxGG25B4t/c8TxtptRwdNTnwSfQ8jEj0q2xDd4NSB/zs67XQ3i
 riW9CXnhOtNXRQwl2I56E8sQFg==
X-Google-Smtp-Source: APXvYqxvBHkagafXH1CnZDG8/J2NJtGYyNSNZb9XstBXBy84ZynIq7jqLkNKO8FL/LW4w2k+JTFkdA==
X-Received: by 2002:a17:902:1105:: with SMTP id
 d5mr31408400pla.197.1566342395612; 
 Tue, 20 Aug 2019 16:06:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:34 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 04/25] drm: kirin: Remove uncessary parameter indirection
Date: Tue, 20 Aug 2019 23:06:05 +0000
Message-Id: <20190820230626.23253-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sMMNrNPEyr5ojRnGMae00OuNvWMz/twMj42dMKt7nWI=;
 b=IB7XgmYvkwQEJtHZlzt4hH6T5NopJkfBoayNv/GodStcZXxTvSt35M0eDDE9K3LV2X
 t34RV1DW6QSCYi7l5B5gjU/nC/lzfgqYLQUgPK/FHUm7Q90eU6Xs99OSlhMpSBUAFZu/
 Yimi+ol1E2NCdt3K/+oziOzE6uaD+OHWte422JmbCriql6H9kOHQKD/tsCDvM56LPSqq
 xcAGaApq98JTw0Q04lqdwrHP703sVt3Vds/7vEiDMpD3keehlJIiDsFeg+/lMwH4ucqu
 0nxmOsfgPHJW/SjDgWdvnebrKFcXAhGduTdxDSkzdCzBM1GIttYl8RXIDDS2rgs60whC
 iuUg==
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
