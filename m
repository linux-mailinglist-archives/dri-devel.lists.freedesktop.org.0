Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F256F115992
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 00:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FBE6FAA8;
	Fri,  6 Dec 2019 23:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908EB6FAA7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 23:14:57 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id b15so7684888ila.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 15:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgzAFB+zH8GlVojyTVFAow6dMpgwdrzIFhrdEHUtvhg=;
 b=tp24Ea7OUM9PsJeFxsUBBan1JgccrXTPCq+Ct4qPs/E3mFY53BXuaEcjO1kwyw+h/O
 Pj0rW3jvDi8pCpSZPmAwhT2vmxhCWGME5HmgfggGsuX5p7pSnv/10uY6kFo0QJ+5VtMi
 w136I4tpFk+CuPm91+cWpB5c+8P02+AOg5KitMA/f9nEQy51vq21t3zg+9kUJrOQZmP7
 sKYYOOQ5o0q7+zogC5EyPJDy0uGiThWNShOsPM/I8kWg7e3mjFskGVAhG2rUmJtblYAO
 hG7WdEfoWT8Ec8oAa/DquNqTwZOXb1eS9ufTAQDBCP26tx2MVhV2p+/JeF15par00yt8
 YPNQ==
X-Gm-Message-State: APjAAAX/nNuu/WLkyVyU2jgGu0QyNLOHMlKPYP9X/EEMfuib9woyzNus
 oI6MylXnHKlPvsocQYMZbjM8s7OGbxI=
X-Google-Smtp-Source: APXvYqwsQs11WhvacrvMTbUHKumnGg/DXD8ql0+dQvEU8SGQm6P6c+S8z35CBbHMIFitiO9F7uITRQ==
X-Received: by 2002:a92:cf52:: with SMTP id c18mr16802212ilr.44.1575674096396; 
 Fri, 06 Dec 2019 15:14:56 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Dec 2019 15:14:56 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/msm/dpu: Remove unnecessary NULL checks
Date: Fri,  6 Dec 2019 16:13:44 -0700
Message-Id: <20191206161137.2.I3e20091f213b47dfa888bc2f528509d84d19c743@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OgzAFB+zH8GlVojyTVFAow6dMpgwdrzIFhrdEHUtvhg=;
 b=nsIITrocRHSetuaCgKu6s2C8xayl6Q5U5QuN0tQkjiMBXf/22zQ0Oy//9Xu9MWCty2
 yc8AMl720Dpjg2XaZaV2/kpE/sVz+RkudZ9qSIjdYAehIgapE3ky5KufYM8aE+sHzuW1
 uNagLcHcb+6YLBLMsg9FuwWL3Bvs3/dlCS+yU=
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bruce Wang <bzwang@chromium.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHB1X2NydGNfbWl4ZXIubG1fY3RsIHdpbGwgbmV2ZXIgYmUgTlVMTCwgc28gZG9uJ3QgYm90aGVy
IGNoZWNraW5nCgpTaWduZWQtb2ZmLWJ5OiBEcmV3IERhdmVucG9ydCA8ZGRhdmVucG9ydEBjaHJv
bWl1bS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMg
fCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5j
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwppbmRleCBmMTk3ZGNl
NTQ1NzYuLmI5ZWQ4Mjg1YWIzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
Y3J0Yy5jCkBAIC0xOTcsOCArMTk3LDggQEAgc3RhdGljIHZvaWQgX2RwdV9jcnRjX2JsZW5kX3Nl
dHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlEUFVfREVCVUcoIiVzXG4iLCBkcHVfY3J0Yy0+
bmFtZSk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgY3N0YXRlLT5udW1fbWl4ZXJzOyBpKyspIHsKLQkJ
aWYgKCFtaXhlcltpXS5od19sbSB8fCAhbWl4ZXJbaV0ubG1fY3RsKSB7Ci0JCQlEUFVfRVJST1Io
ImludmFsaWQgbG0gb3IgY3RsIGFzc2lnbmVkIHRvIG1peGVyXG4iKTsKKwkJaWYgKCFtaXhlcltp
XS5od19sbSkgeworCQkJRFBVX0VSUk9SKCJpbnZhbGlkIGxtIGFzc2lnbmVkIHRvIG1peGVyXG4i
KTsKIAkJCXJldHVybjsKIAkJfQogCQltaXhlcltpXS5taXhlcl9vcF9tb2RlID0gMDsKQEAgLTEx
MTUsOCArMTExNSw2IEBAIHN0YXRpYyBpbnQgX2RwdV9kZWJ1Z2ZzX3N0YXR1c19zaG93KHN0cnVj
dCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKIAkJbSA9ICZjc3RhdGUtPm1peGVyc1tpXTsKIAkJ
aWYgKCFtLT5od19sbSkKIAkJCXNlcV9wcmludGYocywgIlx0bWl4ZXJbJWRdIGhhcyBubyBsbVxu
IiwgaSk7Ci0JCWVsc2UgaWYgKCFtLT5sbV9jdGwpCi0JCQlzZXFfcHJpbnRmKHMsICJcdG1peGVy
WyVkXSBoYXMgbm8gY3RsXG4iLCBpKTsKIAkJZWxzZQogCQkJc2VxX3ByaW50ZihzLCAiXHRtaXhl
cjolZCBjdGw6JWQgd2lkdGg6JWQgaGVpZ2h0OiVkXG4iLAogCQkJCW0tPmh3X2xtLT5pZHggLSBM
TV8wLCBtLT5sbV9jdGwtPmlkeCAtIENUTF8wLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
