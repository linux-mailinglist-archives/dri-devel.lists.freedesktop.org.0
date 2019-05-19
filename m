Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0084226FB
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4098916D;
	Sun, 19 May 2019 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C508916D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:20:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y19so8442495lfy.5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 07:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e7AnEl+sTa5CZ3787NmnwKOXoYZg2C++bC2zllDWaWE=;
 b=MwZT85lYwPH27gfPGYx1RLF9ZaJMx0VG5hMw3jaAmDupnue2i9ar88TknH4hDaE0+G
 Bg2298UcDudQ/9/1C66SOjlO9uES701sBnNKWkaiV9e5BcMQovLAcY/TUgD6OoRewZtf
 fDMxHv9T9b75ku9Ps03ZP1lfECMbWcSDJcM6witx7utQicey6RzO50xQ23Xhp8gMMTHM
 57BxKb5l9f2i5adzIPLf6fk3MjDKsVOvXykiYF//GzA2azf8sisImXICxeLVV/pQv+uG
 /vrQ1T2ptICTOI/m/iwEjwG2Q211LIKJqV6+nKhzLo9ZTzBMp0WEVmU1l4oYk31nv9ot
 Gczg==
X-Gm-Message-State: APjAAAWB/OaXDp3MgAV8eta8VU6q2pINnUsSMQxCKa+wKYBFVPAl7ZIK
 +XI9r6xTadPkJ5UfFXHm9bhLFAnC
X-Google-Smtp-Source: APXvYqxvaiqdt+BUxCIz6zDrgFdJlCQSPxIC2Ac7rK2Lure7mPNLAYG/l4qfPs7KPthj4yeM7pXiAg==
X-Received: by 2002:a19:a5ca:: with SMTP id o193mr8434818lfe.89.1558275653469; 
 Sun, 19 May 2019 07:20:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 d5sm3231786lji.85.2019.05.19.07.20.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 07:20:53 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 04/06] drm: make drm_internal.h self-contained
Date: Sun, 19 May 2019 16:20:34 +0200
Message-Id: <20190519142036.22861-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519142036.22861-1-sam@ravnborg.org>
References: <20190519142036.22861-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7AnEl+sTa5CZ3787NmnwKOXoYZg2C++bC2zllDWaWE=;
 b=qjXiFpWC94pbrNy49Ya7rdSdvXXRQOCYDnKUmJVmIn6Ie8EWAl68JdaHT+ZrmpAUK/
 CqziQ8Pf+LqOViDv1LiVycKYd26yUzzONqhVR2EC6vsK1aF16/10yo2lkoEaAcbhYxNb
 sTrWBjnycaVUISrKejSOk5F56sfR/qK/c4SISpKwiv8mFTh7qIZfF2HedvXZhEVKAnXo
 1WcuCUaais8pwM74HUWv/NvIw89VJMqSrTJdj/WBw8Zt4YWjRDmPlL3etlbDJi+ZYcPq
 1xUVK+1j9+KhUTTxdqGH/N6br3piq8RTnIHYo7Z5A+r+1uDj59XQpA1FtQEW557VU5tn
 Zj3Q==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2ludGVybmFsLmggdG8gaW5jbHVkZSBvdGhlcgpm
aWxlcyBqdXN0IHRvIGxldCBpdCBidWlsZAoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ludGVybmFsLmggfCAxMCArKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5h
bC5oCmluZGV4IGU2MjgxZDlmOWM4Ny4uNzZiZDRiODFjNWIxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ludGVybmFsLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pbnRlcm5h
bC5oCkBAIC0yOCw4ICsyOCwxNiBAQAogCiAjZGVmaW5lIERSTV9JRl9WRVJTSU9OKG1haiwgbWlu
KSAobWFqIDw8IDE2IHwgbWluKQogCi1zdHJ1Y3QgZHJtX3ByaW1lX2ZpbGVfcHJpdmF0ZTsKK3N0
cnVjdCBkZW50cnk7CiBzdHJ1Y3QgZG1hX2J1ZjsKK3N0cnVjdCBkcm1fY29ubmVjdG9yOworc3Ry
dWN0IGRybV9jcnRjOworc3RydWN0IGRybV9mcmFtZWJ1ZmZlcjsKK3N0cnVjdCBkcm1fZ2VtX29i
amVjdDsKK3N0cnVjdCBkcm1fbWFzdGVyOworc3RydWN0IGRybV9taW5vcjsKK3N0cnVjdCBkcm1f
cHJpbWVfZmlsZV9wcml2YXRlOworc3RydWN0IGRybV9wcmludGVyOwogCiAvKiBkcm1fZmlsZS5j
ICovCiBleHRlcm4gc3RydWN0IG11dGV4IGRybV9nbG9iYWxfbXV0ZXg7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
