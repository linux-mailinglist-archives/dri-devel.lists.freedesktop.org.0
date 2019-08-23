Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687229A85F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 09:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9F86E03F;
	Fri, 23 Aug 2019 07:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0980D6E03F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:14:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 62so6367677lfa.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 00:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnDL8S0nYFPZuOGkV7hWvantVpmZ1rr6sKUqGh/Qang=;
 b=XgFEC4f1Kx1urdI1B8EDvB5FLixak2Q7SWGGMHjDIHDjiWhl0WuJQzerT8nhsV0dsr
 UAjFFROaiWMhCl/sfKtA4x7Jhx727n75Ly61EcnKmXvwk6zyubQme5DabbimurkM1m4h
 4q2O+b/uWjpn7VMS9FNrYM9TCUxVb4UvGvttyk9qDCh6ME44LCYOy6Kil7TBg6/fye/B
 /UOl8cpm23xYhLIbJSSXeCZ1rhvaJ0tW/Ra0Zm8RHxwe5Sm6ziyJXJiYn0ngiL8reLR/
 LQGWwmC8AgKYvKMh04DKIhlDxrknyEXJADwDJHFDiKBm0qfmHKzHzatr4pCJJe8/IPzy
 Z0xQ==
X-Gm-Message-State: APjAAAUYp9OAopARVXBB6Xd8EKqYhIghxi4+T7X4CxaNe/k7OrekIMCf
 Uz5EGviEs8Q4+cvfxgk9HYUptZMbzMQ=
X-Google-Smtp-Source: APXvYqz2Zvq7MNQVB42tAcYJVPQ1nSI8t5nqPcSa3zDpvbk2eY8bX/DL5PpbQDxNNhHTirZYu3iqYw==
X-Received: by 2002:a05:6512:50f:: with SMTP id
 o15mr990933lfb.63.1566544474967; 
 Fri, 23 Aug 2019 00:14:34 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id m21sm482721ljj.48.2019.08.23.00.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:14:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/sti: Include the right header
Date: Fri, 23 Aug 2019 09:14:28 +0200
Message-Id: <20190823071428.6155-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnDL8S0nYFPZuOGkV7hWvantVpmZ1rr6sKUqGh/Qang=;
 b=C4F3CA9BIwRT6cG0lrQu03QQ7T17Ti/u+9GOwkz/EafvkLjriBsK5KwuThbRK8v9Fk
 XwbVT3YmNPxrNXxmzFRlPRw5qwSjYpucf7Cpg4DS99HOlO58tKslDrZFeBQmFWtVGImu
 YCzoS4JAiTXMuK4+jnLP6dhrum522zYnK9Sr+sI2Eykvwre/GxXIXXAwgTQ/12D2gino
 Oss2NJFKC8pP7IEphCpSDljubqhbMjqBSQr4pd3WM6tinppk2/1Q3EtayWeXOUm3qt9a
 I4gTq2M0P5RY9Ntr4kn9tiid2ff/eJ5T9+ySpO2pV7yIAxrPr4q9peawF7fyLhflhjyb
 mCCQ==
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
Cc: Vincent Abriou <vincent.abriou@st.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0aV9oZG1pLmMgZmlsZSBpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+IGRlc3BpdGUgbm90
IGV2ZW4KdXNpbmcgYW55IEdQSU9zLgoKV2hhdCBpdCBkb2VzIHVzZSBpcyBkZXZtX2lvcmVtYXBf
bm9jYWNoZSgpIHdoaWNoIGNvbWVzIGZyb20KPGxpbnV4L2lvLmg+IGltcGxpY2l0bHkgYnkgaW5j
bHVkaW5nIHRoYXQgaGVhZGVyLgoKRml4IHRoaXMgdXAgYnkgaW5jbHVkaW5nIHRoZSByaWdodCBo
ZWFkZXIgaW5zdGVhZC4KCkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRA
bGluYXJvLm9yZz4KQ2M6IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+ClNp
Z25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3RpL3N0aV9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKaW5kZXgg
ZjAzZDYxN2VkYzRjLi40ZjFhYWYyMjJjYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dGkvc3RpX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMKQEAgLTks
NyArOSw3IEBACiAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgogI2luY2x1ZGUgPGxpbnV4L2hk
bWkuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlv
Lmg+CisjaW5jbHVkZSA8bGludXgvaW8uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgogCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
