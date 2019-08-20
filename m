Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04596CB0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6616E8B3;
	Tue, 20 Aug 2019 23:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142E26E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:06:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d85so100478pfd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IcvzzFr1yUCqUm7igC+fhVBaiFn8HJOuskJ5pNSj2cg=;
 b=Wrau0KhlAMtM7mb2+WAAXnFMlpoqoCSEO/ux8tro96P6VU0YvurZXHMdWxMWwYORU7
 yrI4c2pjF89GTYLnWDBJvl8A4Rh+6or8HuIych8vH08/mbLbxlvGLa/P+r4f3FXjggfk
 S+8hSWKVcphA6QqInhIOQNhtI8KfMWmsZfTvXwWtSqRja88TgW0UqoKQartJ6uEH4wiI
 atpOsXJua+pnmeJPia2zKpbpmkdDYFzurqa7iBjgSWBe12Dt4CreKXyCVHynn/cKXLie
 wJ6OIfoMfLScHc/zFZ0vt/m2snCT1VD4Q3DdWQy4XcaGBsEkJ061k6emZnF+Ks0R6f52
 H1Ew==
X-Gm-Message-State: APjAAAUaYF3Kj+re5np9FYvT0VfTEllHCD+kqnMjzr2KTkJ2+/h91QBA
 CUv3G2R5XosGbV3xHAWzgA2/Eg==
X-Google-Smtp-Source: APXvYqwhPnpN+NIoIIfhZvjoBsWXfZaXDVMAu7KdrUCnG//Qro9vlYsd9RANeyEKSV9ZPwGORsOy6w==
X-Received: by 2002:a63:5b23:: with SMTP id p35mr26142289pgb.366.1566342397025; 
 Tue, 20 Aug 2019 16:06:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 q4sm27564747pff.183.2019.08.20.16.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:06:36 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 05/25] drm: kirin: Remove out_format from ade_crtc
Date: Tue, 20 Aug 2019 23:06:06 +0000
Message-Id: <20190820230626.23253-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820230626.23253-1-john.stultz@linaro.org>
References: <20190820230626.23253-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IcvzzFr1yUCqUm7igC+fhVBaiFn8HJOuskJ5pNSj2cg=;
 b=s6WQ7sISarwjn/LoXRuWTs7T9mI5glGbXZ8EsPI3bJI84uER1hU+D4STDBevGNYS3Z
 eOvv5irY6DvPeWzChsKAuakSVEFkiW8fIPj9iEVuzTxRkakHzBvVbJl0FlVpnSJenv9d
 oUJ9gN9hBHJudtKn5GBt22PjFXTs1PV+hJA8u6D32MuR5+IQjqNaFWUvr7EnYQyDfM4e
 gRcM1L8/KdxdVssB84zN+ICvvYZKBrcOQUwjy8cozJJY6u/J9LfaZoSSyXmW9cieqa08
 AwWuH+bjNzMQG0fL+nLfeolv/+EHIUXxixtM7d/daNtzOmFYkW4AB5qLThiEB2YXp4Ay
 CTgg==
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

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgb3V0X2Zvcm1hdApmaWVsZCBp
biB0aGUgc3RydWN0IGFkZV9jcnRjLCB3aGljaCB3YXMgb25seSBldmVyIHNldCB0bwpMRElfT1VU
X1JHQl84ODguCgpUaHVzIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgZmllbGQgYW5kIGluc3RlYWQg
ZGlyZWN0bHkgdXNlcwpMRElfT1VUX1JHQl84ODguCgpDYzogUm9uZ3JvbmcgWm91IDx6b3Vyb25n
cm9uZ0BnbWFpbC5jb20+CkNjOiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29u
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6
IFhpbmxpYW5nIExpdSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpSZXZpZXdlZC1ieTog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBYdSBZaVBpbmcg
PHh1eWlwaW5nQGhpc2lsaWNvbi5jb20+Cltqc3R1bHR6OiByZXdvcmRlZCBjb21taXQgbWVzc2Fn
ZV0KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgfCA5ICsr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9h
ZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCmlu
ZGV4IDQ1MzUxOTM0ZDkxOS4uNjVmMWE1N2Y3MzA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwpAQCAtNjAsNyArNjAsNiBAQCBzdHJ1Y3Qg
YWRlX2NydGMgewogCXN0cnVjdCBhZGVfaHdfY3R4ICpjdHg7CiAJc3RydWN0IHdvcmtfc3RydWN0
IGRpc3BsYXlfcmVzZXRfd3E7CiAJYm9vbCBlbmFibGU7Ci0JdTMyIG91dF9mb3JtYXQ7CiB9Owog
CiBzdHJ1Y3QgYWRlX3BsYW5lIHsKQEAgLTM4MywxMSArMzgyLDEwIEBAIHN0YXRpYyBpcnFyZXR1
cm5fdCBhZGVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIAlyZXR1cm4gSVJRX0hB
TkRMRUQ7CiB9CiAKLXN0YXRpYyB2b2lkIGFkZV9kaXNwbGF5X2VuYWJsZShzdHJ1Y3QgYWRlX2Ny
dGMgKmFjcnRjKQorc3RhdGljIHZvaWQgYWRlX2Rpc3BsYXlfZW5hYmxlKHN0cnVjdCBhZGVfaHdf
Y3R4ICpjdHgpCiB7Ci0Jc3RydWN0IGFkZV9od19jdHggKmN0eCA9IGFjcnRjLT5jdHg7CiAJdm9p
ZCBfX2lvbWVtICpiYXNlID0gY3R4LT5iYXNlOwotCXUzMiBvdXRfZm10ID0gYWNydGMtPm91dF9m
b3JtYXQ7CisJdTMyIG91dF9mbXQgPSBMRElfT1VUX1JHQl84ODg7CiAKIAkvKiBlbmFibGUgb3V0
cHV0IG92ZXJsYXkgY29tcG9zaXRvciAqLwogCXdyaXRlbChBREVfRU5BQkxFLCBiYXNlICsgQURF
X09WTFlYX0NUTChPVVRfT1ZMWSkpOwpAQCAtNTE0LDcgKzUxMiw3IEBAIHN0YXRpYyB2b2lkIGFk
ZV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCX0KIAogCWFkZV9z
ZXRfbWVkaWFub2NfcW9zKGN0eCk7Ci0JYWRlX2Rpc3BsYXlfZW5hYmxlKGFjcnRjKTsKKwlhZGVf
ZGlzcGxheV9lbmFibGUoY3R4KTsKIAlhZGVfZHVtcF9yZWdzKGN0eC0+YmFzZSk7CiAJZHJtX2Ny
dGNfdmJsYW5rX29uKGNydGMpOwogCWFjcnRjLT5lbmFibGUgPSB0cnVlOwpAQCAtMTAyNCw3ICsx
MDIyLDYgQEAgc3RhdGljIGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAljdHggPSAmYWRlLT5jdHg7CiAJYWNydGMgPSAmYWRlLT5hY3J0YzsKIAlhY3J0Yy0+
Y3R4ID0gY3R4OwotCWFjcnRjLT5vdXRfZm9ybWF0ID0gTERJX09VVF9SR0JfODg4OwogCiAJcmV0
ID0gYWRlX2R0c19wYXJzZShwZGV2LCBjdHgpOwogCWlmIChyZXQpCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
