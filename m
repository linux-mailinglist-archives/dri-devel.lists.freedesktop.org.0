Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6592AB6A
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 19:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876CA89548;
	Sun, 26 May 2019 17:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B868F89247;
 Sun, 26 May 2019 17:35:45 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 188so12675082ljf.9;
 Sun, 26 May 2019 10:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7jHEs5RhzbiMluVrA2O22womiRoVJprYdjFgPKPifMg=;
 b=KYYIRhgRfv32t/QoCJZBV2eDeTu5FCxKxP24QqSA+JKa/fclz7uXFGN8wWuDc0ytR/
 nHoQal27H84tEeXetdpqZPmpBjapFLat9qh2Ng5SiBvuNweY8yw+edT8rwgPRgVM0Art
 su6OHbk8E/YpjHEZSE28Pk27hNU3oTNhvgULrVZJgAjkIqrRJGMS18hVrfqTI3SdGWs+
 Vj+RYt9Zsu5hlEBBy8RVXfu16eA3ukO7KFCXx+WKUkT9kdfLyRrViBFaYFbn+4A5qty7
 OlokbpyUa+vQJdJhizywr2VyoHlPxJzzoNmWZdqljDVj4Gz037kypX8tcO3QANrAWUn2
 ny0g==
X-Gm-Message-State: APjAAAVW+CmeU7KoR7TZyR+G0rHG3vJ69hU6Qn1+orGoh/zWhpluHyls
 oPpELyMb/GJr16OfIf1RQCdJ7+Qj
X-Google-Smtp-Source: APXvYqxK2HZRfvk3QuO7PCHS7h9HhpbMnAV9h3V06196YGq34oajAydfCp1ECBuWuHLtA0f5I8QFWg==
X-Received: by 2002:a2e:81d9:: with SMTP id s25mr19221196ljg.139.1558892143937; 
 Sun, 26 May 2019 10:35:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n9sm1774489ljj.10.2019.05.26.10.35.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 10:35:43 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm: make drm/drm_auth.h self contained
Date: Sun, 26 May 2019 19:35:29 +0200
Message-Id: <20190526173535.32701-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526173535.32701-1-sam@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jHEs5RhzbiMluVrA2O22womiRoVJprYdjFgPKPifMg=;
 b=bkjslSwzLnC5HXsx9tvX41i+X+xtYQm2ILyLJqL0Dd2aBkk1ENfU8I+dHb7zQjBCJI
 HuNhMEba1hXvAfLk5NHzbrGqCZaoqNMZqxhL3vIfqnK3pL+nBo8teXo7TeWuiAwZi0Qa
 N5XUiwv21YWRgF9/V/UtCkIfazyrdel2gh/7/zuk/1Yxv3pWc4MvaRex0OAxvjOm54xG
 HZfP1Gh4GavEKvmBJEUp0efiD6ARWa0+YSl59bItEoOpwol8G+Ri85sReXhseuERMVll
 14B1gHN7sbchswm8njqKgjp/WSpX2jswunvUn5AU0q2x4QDgRBXTvyhBbTnIo/FXC9lE
 aKoA==
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
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgaW5jbHVkZS9kcm0vZHJtX2F1dGguaCB0byBpbmNsdWRl
Cm90aGVyIGZpbGVzIGp1c3QgdG8gbGV0IGl0IGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KLS0tCiBpbmNsdWRlL2RybS9kcm1fYXV0aC5oIHwgMTEgKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2F1dGguaCBiL2luY2x1ZGUvZHJtL2RybV9hdXRoLmgKaW5kZXggODcx
MDA4MTE4YmFiLi42YmY4YjJiNzg5OTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9hdXRo
LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2F1dGguaApAQCAtMSwzICsxLDYgQEAKKyNpZm5kZWYg
X0RSTV9BVVRIX0hfCisjZGVmaW5lIF9EUk1fQVVUSF9IXworCiAvKgogICogSW50ZXJuYWwgSGVh
ZGVyIGZvciB0aGUgRGlyZWN0IFJlbmRlcmluZyBNYW5hZ2VyCiAgKgpAQCAtMjUsOCArMjgsMTIg
QEAKICAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICAqLwogCi0jaWZuZGVmIF9E
Uk1fQVVUSF9IXwotI2RlZmluZSBfRFJNX0FVVEhfSF8KKyNpbmNsdWRlIDxsaW51eC9pZHIuaD4K
KyNpbmNsdWRlIDxsaW51eC9rcmVmLmg+CisjaW5jbHVkZSA8bGludXgvd2FpdC5oPgorCitzdHJ1
Y3QgZHJtX2ZpbGU7CitzdHJ1Y3QgZHJtX2h3X2xvY2s7CiAKIC8qCiAgKiBMZWdhY3kgRFJJMSBs
b2NraW5nIGRhdGEgc3RydWN0dXJlLiBPbmx5IGhlcmUgaW5zdGVhZCBvZiBpbiBkcm1fbGVnYWN5
LmggZm9yCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
