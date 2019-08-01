Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121967D3E2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EF96E358;
	Thu,  1 Aug 2019 03:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587FC6E354
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:19 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k189so14225610pgk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WjHqeb4FH0iNPLGVjtm/IuQE2HpCUqPIHkrvBOle06A=;
 b=HLh0rm0vsL4ffPHnL5g5KaJR3xYheiIR6btKty0x2XUJ9g/MNzg81wsHFirIT684DA
 P0l8hd8R1dL/uJARBaaSJsknfrM+OFncjzV4CChwe6Wbz3hNNMzLR0KoOSv5OSjr8A0M
 IqECslwIsNSnJvcX2JaDu6nzLDqjkkIaD4+h7+kXWAZ0SQ4nr65dk3ldOs/D3i6WuYyT
 9jO2Gl/n6jvH1gkZlSjyVmOKmw8vj/7X7Zi7cpO/yc7kk4jl90G8L6pE8r4Fvm9fHtkg
 tTg8XFsH2EWn6EL+auEDCHBdkPzX75z4ERcMqe4Awhy8gV+TqYcfVFaHcOV8BjliQGJ+
 ogrw==
X-Gm-Message-State: APjAAAUn1tqCW3yF/8ZzJPMZL1X6RXT6srYLr/r+j/aK8ZqhAF25oEbL
 o7PnubvtwswAw5jVGqea0FN1Mw==
X-Google-Smtp-Source: APXvYqyVvZeMN6yRDkQ4uJom/1mFt8PdcwoWOHTKKQIAhsK+H2xzvml2+Hg38NdQbaAZeqmJIa0zMQ==
X-Received: by 2002:a65:6497:: with SMTP id e23mr112657820pgv.89.1564631118292; 
 Wed, 31 Jul 2019 20:45:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:17 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 21/26] drm: kirin: Rename plane_init and crtc_init
Date: Thu,  1 Aug 2019 03:44:34 +0000
Message-Id: <20190801034439.98227-22-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WjHqeb4FH0iNPLGVjtm/IuQE2HpCUqPIHkrvBOle06A=;
 b=zr0/ngFt5h5LHU72dl+EtYw2C13wCz8o1t7dZMhdyUVncveQH7+C+i5FhpQD7uH03n
 /jIlvAzXiSVskXqndgi4tjf0TksEDwJJOzk44IMe27eMSWRiMfMyHSZpJYs8kKSFL23X
 OdcQh+IUi+060D487nmTDlDzz6iXtLb6P63tMjbSjzkEQ34dKDLpR3jtDFz4ty7UU79d
 zecB7/VA0b4oc7whmXb37/mD7m+1gRLLZPMrOXCzXl9dow5nM/qZ0As6xg3KNddln4pa
 kpSqieLfnQ4DCgTXp+dzk1BxOVGqkYHfWxeLfV8QnOWJBbMHU1Y3NPzDwakC48jNrn3I
 9CUg==
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
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVuYW1lcwphZGVfY3J0Yy9wbGFuZV9pbml0IGtp
cmluX3BsYW5lL2NydGNfaW5pdCwgYXMgdGhleSB3aWxsIGxhdGVyIGJlCm1vdmVkIHRvIGtpcmlu
IGRybSBkcnYgYW5kIHNoYXJlZCB3aXRoIHRoZSBraXJpbjk2MCBoYXJkd2FyZQpzdXBwb3J0LgoK
Q2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5nQGhpc2lsaWNv
bi5jb20+Cltqc3R1bHR6OiByZXdvcmRlZCBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTog
Sm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgfCAxMSArKysrKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCmluZGV4IDY2NDM0YzBjY2U2
ZS4uMGJkY2FjOTgxZDhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluL2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmlu
L2tpcmluX2RybV9hZGUuYwpAQCAtNTcxLDcgKzU3MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2NydGNfZnVuY3MgYWRlX2NydGNfZnVuY3MgPSB7CiAJLmRpc2FibGVfdmJsYW5rCT0gYWRl
X2NydGNfZGlzYWJsZV92YmxhbmssCiB9OwogCi1zdGF0aWMgaW50IGFkZV9jcnRjX2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9jcnRjICpjcnRjLAorc3RhdGljIGludCBr
aXJpbl9kcm1fY3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKIAkJCSBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkKIHsKIAlzdHJ1Y3QgZGV2aWNl
X25vZGUgKnBvcnQ7CkBAIC04OTIsOCArODkyLDkgQEAgc3RhdGljIHN0cnVjdCBkcm1fcGxhbmVf
ZnVuY3MgYWRlX3BsYW5lX2Z1bmNzID0gewogCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9h
dG9taWNfaGVscGVyX3BsYW5lX2Rlc3Ryb3lfc3RhdGUsCiB9OwogCi1zdGF0aWMgaW50IGFkZV9w
bGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBraXJpbl9wbGFuZSAqa3Bs
YW5lLAotCQkJICBlbnVtIGRybV9wbGFuZV90eXBlIHR5cGUpCitzdGF0aWMgaW50IGtpcmluX2Ry
bV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCisJCQkJc3RydWN0IGtpcmluX3Bs
YW5lICprcGxhbmUsCisJCQkJZW51bSBkcm1fcGxhbmVfdHlwZSB0eXBlKQogewogCWludCByZXQg
PSAwOwogCkBAIC0xMDI0LDEzICsxMDI1LDEzIEBAIHN0YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWVsc2UKIAkJCXR5cGUgPSBEUk1fUExBTkVf
VFlQRV9PVkVSTEFZOwogCi0JCXJldCA9IGFkZV9wbGFuZV9pbml0KGRldiwga3BsYW5lLCB0eXBl
KTsKKwkJcmV0ID0ga2lyaW5fZHJtX3BsYW5lX2luaXQoZGV2LCBrcGxhbmUsIHR5cGUpOwogCQlp
ZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAl9CiAKIAkvKiBjcnRjIGluaXQgKi8KLQlyZXQgPSBh
ZGVfY3J0Y19pbml0KGRldiwgJmtjcnRjLT5iYXNlLAorCXJldCA9IGtpcmluX2RybV9jcnRjX2lu
aXQoZGV2LCAma2NydGMtPmJhc2UsCiAJCQkJJmFkZS0+cGxhbmVzW2FkZV9kcml2ZXJfZGF0YS5w
cmltX3BsYW5lXS5iYXNlKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
