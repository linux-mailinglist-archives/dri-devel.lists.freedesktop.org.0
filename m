Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2652F45C2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB6A89FEA;
	Wed, 13 Jan 2021 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D03D89F45
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d13so1039129wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xdwLDrcWYKJZSMYMYuV8riE8ORgcBnhB0CHa1Q/JBs=;
 b=FrwgrjKbVxt3s7pvTRS7s+XO01JRsO9XZYJHRIrzN6pluG3wMDB1Q/zF5eAgINfD5m
 RFBF7is2Nd1xdqHRGNGA/83nam7awxbCz5WzRe6K2JPtLxALiOUcqafRk5ffZ+N+EPLS
 ekCBhJvOuHkTndHv+9B7EE0zHCswpCoLDO8kZrc51wWWeWTYwmynloBfUQKEYJpQgCnp
 UEIPrnCJ0CxXXncxIGQSZPDTyg3azKpfqjcySttB1j7+C9klBZTczEAqTmBmmCsO7LN6
 pEC7tTfH8PbvCsAjD7q/AOyR6vA5aWyeIPdEiaCDsflyT1/Ry2lYfJdFst6an0ArQqYJ
 Yzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xdwLDrcWYKJZSMYMYuV8riE8ORgcBnhB0CHa1Q/JBs=;
 b=dJACWUqmpWMZdKm/LsOWDWQjaDkJd9FVpVQqmpDypMfunt5HhnTggxae4SAH/zzRfk
 bgWlsgJYrRnXkx/F+5AJOTvLzzDIecBwqg91gXsCNhpy0It6lyB7J8aHZVnn0Sxnlqpn
 17HCazjLKvae5aRhXbFYTdyLTTMZX5TOsWVBC+NTMYB8RyI89Dpznv1Y0jQU402gJd0v
 cO3e5LZDeWk+M4ZHWDW1BzUzUeml5H5j+4k2oV0ttqSKyTy1gzCZrtmFt1RRooW7F2TF
 IsG+H1lQt5fdGst7SgOwUA+sm1DYokBGzZiuGgCGAAlBYL7Xbbns1Chx9qcS3KIVlJhN
 QPzQ==
X-Gm-Message-State: AOAM532FKL7NiNm0Qo1dq8EJE6u0ixxIy+wUQmkMoJHWwc3cGxtDHW12
 oAyMBXl0c0xK/eB3RX0FRJZBjQ==
X-Google-Smtp-Source: ABdhPJwkjOkvuLucehpAKBBj0JktW+lR9glrfph7izxG8rzbGe0A5bRWnqXrrWYnYK4ilSl5EQhwdA==
X-Received: by 2002:adf:ec41:: with SMTP id w1mr1217792wrn.12.1610525285003;
 Wed, 13 Jan 2021 00:08:05 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/30] drm/amd/display/dc/core/dc_link: Remove unused variable
 'status'
Date: Wed, 13 Jan 2021 08:07:29 +0000
Message-Id: <20210113080752.1003793-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYzogSW4gZnVu
Y3Rpb24g4oCYcXVlcnlfaGRjcF9jYXBhYmlsaXR54oCZOgogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYzo1OTk6Mjg6IHdhcm5pbmc6IHZhcmlh
YmxlIOKAmHN0YXR1c+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jCmluZGV4IGY0YTIwODhhYjE3OTIuLjhjY2RhOGI5YWMyZWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAgLTU5Niw4ICs1
OTYsNiBAQCBzdGF0aWMgdm9pZCBxdWVyeV9oZGNwX2NhcGFiaWxpdHkoZW51bSBzaWduYWxfdHlw
ZSBzaWduYWwsIHN0cnVjdCBkY19saW5rICpsaW5rKQogCWRjX3Byb2Nlc3NfaGRjcF9tc2coc2ln
bmFsLCBsaW5rLCAmbXNnMjIpOwogCiAJaWYgKHNpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZ
X1BPUlQgfHwgc2lnbmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVF9NU1QpIHsKLQkJZW51
bSBoZGNwX21lc3NhZ2Vfc3RhdHVzIHN0YXR1cyA9IEhEQ1BfTUVTU0FHRV9VTlNVUFBPUlRFRDsK
LQogCQltc2cxNC5kYXRhID0gJmxpbmstPmhkY3BfY2Fwcy5iY2Fwcy5yYXc7CiAJCW1zZzE0Lmxl
bmd0aCA9IHNpemVvZihsaW5rLT5oZGNwX2NhcHMuYmNhcHMucmF3KTsKIAkJbXNnMTQubXNnX2lk
ID0gSERDUF9NRVNTQUdFX0lEX1JFQURfQkNBUFM7CkBAIC02MDUsNyArNjAzLDcgQEAgc3RhdGlj
IHZvaWQgcXVlcnlfaGRjcF9jYXBhYmlsaXR5KGVudW0gc2lnbmFsX3R5cGUgc2lnbmFsLCBzdHJ1
Y3QgZGNfbGluayAqbGluaykKIAkJbXNnMTQubGluayA9IEhEQ1BfTElOS19QUklNQVJZOwogCQlt
c2cxNC5tYXhfcmV0cmllcyA9IDU7CiAKLQkJc3RhdHVzID0gZGNfcHJvY2Vzc19oZGNwX21zZyhz
aWduYWwsIGxpbmssICZtc2cxNCk7CisJCWRjX3Byb2Nlc3NfaGRjcF9tc2coc2lnbmFsLCBsaW5r
LCAmbXNnMTQpOwogCX0KIAogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
