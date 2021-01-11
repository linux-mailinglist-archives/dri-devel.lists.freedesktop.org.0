Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE512F1EE3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E894897E3;
	Mon, 11 Jan 2021 19:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33E89E2B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m5so904218wrx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EFjJaIHLraEHMpMPczN8JeHzaX7KeAA32v4O8bA3nIs=;
 b=B81lzbUzyymnyb48hbSnQQI2PtxDs6gsJmfEjcDaH7g9cHki4LflvmO41nwnsg/fUl
 0V0WtXyIZSCNKqRtbDvgDUBpdU679lL6Yw2pgaygMHcluXrxnM65ZzviW6ezl6TMVB+A
 bo8991Bf4Mff2Rfro+9fVbBC7fjvCYPVaJkvd6EcuTkOePXBWVDzotexB50kciYdSelY
 RlgBYLtIqrHaTxZEo65SXoEQy+FzPAMkFvAk2pADCpn8+At8WnnnmqAUf1RZPaBfMuuF
 YkK8RdkeZGvQ1e8DYBlvp2jSl9ckzY9zdNgMKfgIlYg+Tp8Kppz+tgX9tsb5wuAMdleo
 3z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EFjJaIHLraEHMpMPczN8JeHzaX7KeAA32v4O8bA3nIs=;
 b=RiY+qJUQ3Wwr7rWKDieC+Ory3DgmQkygKZvbI0ykawnXuXZg45mFtH1W6JpS6xo8zV
 5wQhE7H8CUNAqXpKozWIb+mVWgkcNvlfQa7fGKzoAklEOPLS9wWYkp+3p4yQ2YtprMyB
 0E4Pr7/rT2DRbDFL+wp3SY3hwg089uP81jD6Lilooxfv/k1FuMupws5kdt6u0rE0yGYL
 Ypl4hEe9ChN4/b9a1S2PWUpPIyUKVp/JKTZDIzXzNRnSrkO68If8g2eVSfYQGdXndok8
 KkznhfiQhTFJpFJhrsPiYFIel4XJAXZjZMo6uRhXrRnFVgTD1EgxtNhPn2BIBvMZBYH7
 WUeg==
X-Gm-Message-State: AOAM531l8hN9ohKxHHhGmWQ9tr1dooYLoej7bcQur8Dv4ucDs7Wogcia
 8QjMuC2YfkaaytqaJtNZKV5I2A==
X-Google-Smtp-Source: ABdhPJx2y/C1Gm7lZtAhN+h6CLxajvnAHhLrj7A8KWiS3YKr9+4FIAbPlnE/ud+bnMAVlg7CPOQZ1A==
X-Received: by 2002:adf:d085:: with SMTP id y5mr605031wrh.41.1610392790177;
 Mon, 11 Jan 2021 11:19:50 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/amd/display/dc/dce120/dce120_resource: Staticify
 local functions
Date: Mon, 11 Jan 2021 19:19:01 +0000
Message-Id: <20210111191926.3688443-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNl
LmM6NDI2OjMyOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTEyMF9v
cHBfY3JlYXRl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jOjQ0MDoxNzogd2Fy
bmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkY2UxMjBfYXV4X2VuZ2luZV9jcmVh
dGXigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmM6NDc4OjIwOiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTEyMF9pMmNfaHdfY3JlYXRl4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBBbnRob255IEtvbyA8QW50aG9u
eS5Lb29AYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
ZTEyMC9kY2UxMjBfcmVzb3VyY2UuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTIwL2RjZTEyMF9yZXNvdXJjZS5jCmluZGV4IGYxZTNkMjg4OGVh
Y2MuLmM2NWU0ZDEyNWM4ZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYwpAQCAtNDIzLDcgKzQyMyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZGNlMTEwX2Nsa19zcmNfbWFzayBjc19tYXNrID0gewogCQlDU19D
T01NT05fTUFTS19TSF9MSVNUX0RDRV8xMTIoX01BU0spCiB9OwogCi1zdHJ1Y3Qgb3V0cHV0X3Bp
eGVsX3Byb2Nlc3NvciAqZGNlMTIwX29wcF9jcmVhdGUoCitzdGF0aWMgc3RydWN0IG91dHB1dF9w
aXhlbF9wcm9jZXNzb3IgKmRjZTEyMF9vcHBfY3JlYXRlKAogCXN0cnVjdCBkY19jb250ZXh0ICpj
dHgsCiAJdWludDMyX3QgaW5zdCkKIHsKQEAgLTQzNyw3ICs0MzcsNyBAQCBzdHJ1Y3Qgb3V0cHV0
X3BpeGVsX3Byb2Nlc3NvciAqZGNlMTIwX29wcF9jcmVhdGUoCiAJCQkgICAgIGN0eCwgaW5zdCwg
Jm9wcF9yZWdzW2luc3RdLCAmb3BwX3NoaWZ0LCAmb3BwX21hc2spOwogCXJldHVybiAmb3BwLT5i
YXNlOwogfQotc3RydWN0IGRjZV9hdXggKmRjZTEyMF9hdXhfZW5naW5lX2NyZWF0ZSgKK3N0YXRp
YyBzdHJ1Y3QgZGNlX2F1eCAqZGNlMTIwX2F1eF9lbmdpbmVfY3JlYXRlKAogCXN0cnVjdCBkY19j
b250ZXh0ICpjdHgsCiAJdWludDMyX3QgaW5zdCkKIHsKQEAgLTQ3NSw3ICs0NzUsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRjZV9pMmNfbWFzayBpMmNfbWFza3MgPSB7CiAJCUkyQ19DT01NT05f
TUFTS19TSF9MSVNUX0RDRTExMChfTUFTSykKIH07CiAKLXN0cnVjdCBkY2VfaTJjX2h3ICpkY2Ux
MjBfaTJjX2h3X2NyZWF0ZSgKK3N0YXRpYyBzdHJ1Y3QgZGNlX2kyY19odyAqZGNlMTIwX2kyY19o
d19jcmVhdGUoCiAJc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKIAl1aW50MzJfdCBpbnN0KQogewot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
