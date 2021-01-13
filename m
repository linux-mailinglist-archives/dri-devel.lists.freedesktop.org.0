Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551592F4D97
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD3C6EA61;
	Wed, 13 Jan 2021 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FDC6EA5F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m4so2390243wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRcivOWCu86KtmbW2EK6Np9SsvS7JZY4Xqa/qkwVtkE=;
 b=t1ER4nwN/WPM6fNnm/Mdum0Pojlr01P78z/COYqJ1z5HyIHjWoDRfik8SQHtBQqxQK
 YmiySxijr8E0W29ccNGw29mWFYTILvz8yqxd4Jhjz4xgCEkubT+0KFcPLzD/bqSuhqOv
 bwbne25dLdz4tncYRuqLl24YT+dNFgIwqI2SBJY9J4cgkiSXbIrT5qKhC9+mgB4yvQc0
 udbu5Cayvxz6NRQyXKyHcIRbULqdBiGQkpmclevO2khhsi+G7TZ0owLOrYnOEnlNsCCt
 PsWXGjmGYEWJlNT1uNBNNRB3QkWWj1iQNibwkHhjoWky2+41zMmhl3Ve1ioMsvWRW5MO
 3aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRcivOWCu86KtmbW2EK6Np9SsvS7JZY4Xqa/qkwVtkE=;
 b=MTvPfOnLUae51bHTbPyAfuKTEstlKrJP2jGhyF4eA7FSlPSPmZpAdcxCCpVXZ4rT0w
 IJpYUm2qhXreMjP6QVWtU7H0RyjBaf9Q3rKzVxW39ysTZ5VsJlyGtjR1NKdQ+rWrvUkk
 l32xiqkeyOzqYZ2ZTpg0Egk9T3EQ0SXA4p5megXxAgjBCy3t/JUo8eQvz+V1qkfzeHdN
 uHjz4liYrg/AI2UKCPxpwcYXJEyC33l61LcT39OGlBOJGPkRvBjzmEVoRaM4J+66HCFS
 G0H1YABQuFWeZMuQPPYe8CpVpt1JaC1V9b8sbgcRbyuL6wtfE5Q+Ps/B7NYLcNt5PZMz
 XEIA==
X-Gm-Message-State: AOAM533qW4rF45SAAw22NKvDEdeRduS+Y8YvHQYSqVktJw7IT08dHFxU
 dKa7SWc4BGZXlT3q6h75ccUZrA==
X-Google-Smtp-Source: ABdhPJySPsgzKgHkiIcO4ZfvmXeUEmf0jtG+A5MVr9yGI+9UHHrTEsVD5G/gBIMGMpLdJt4RrmnaQg==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr3033393wrv.54.1610549442170; 
 Wed, 13 Jan 2021 06:50:42 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/31] video: fbdev: tdfxfb: Remove unused variable 'tmp'
Date: Wed, 13 Jan 2021 14:49:57 +0000
Message-Id: <20210113145009.1272040-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Hannu Mallat <hmallat@cc.hut.fi>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philip Edelbrock <phil@netroedge.com>,
 Frodo Looijaard <frodol@dds.nl>, "Mark D. Studebaker" <mdsxyz123@yahoo.com>,
 Ralph Metzler <rjkm@thp.uni-koeln.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi90ZGZ4ZmIuYzogSW4gZnVuY3Rpb24g4oCYYXR0X291dGLigJk6CiBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L3RkZnhmYi5jOjIwOToxNjogd2FybmluZzogdmFyaWFibGUg4oCYdG1w
4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogIkd1
c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+CkNjOiBIYW5udSBNYWxs
YXQgPGhtYWxsYXRAY2MuaHV0LmZpPgpDYzogRnJvZG8gTG9vaWphYXJkIDxmcm9kb2xAZGRzLm5s
PgpDYzogUGhpbGlwIEVkZWxicm9jayA8cGhpbEBuZXRyb2VkZ2UuY29tPgpDYzogUmFscGggTWV0
emxlciA8cmprbUB0aHAudW5pLWtvZWxuLmRlPgpDYzogIk1hcmsgRC4gU3R1ZGViYWtlciIgPG1k
c3h5ejEyM0B5YWhvby5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNj
OiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3RkZnhmYi5jIHwg
NCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi90ZGZ4ZmIuYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvdGRmeGZiLmMKaW5kZXggZjA1NmQ4MGY2MzU5Zi4uNjdlMzdhNjJiMDdjMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi90ZGZ4ZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3RkZnhmYi5jCkBAIC0yMDYsOSArMjA2LDcgQEAgc3RhdGljIGlubGluZSB1OCBjcnRfaW5i
KHN0cnVjdCB0ZGZ4X3BhciAqcGFyLCB1MzIgaWR4KQogCiBzdGF0aWMgaW5saW5lIHZvaWQgYXR0
X291dGIoc3RydWN0IHRkZnhfcGFyICpwYXIsIHUzMiBpZHgsIHU4IHZhbCkKIHsKLQl1bnNpZ25l
ZCBjaGFyIHRtcDsKLQotCXRtcCA9IHZnYV9pbmIocGFyLCBJUzFfUik7CisJdmdhX2luYihwYXIs
IElTMV9SKTsKIAl2Z2Ffb3V0YihwYXIsIEFUVF9JVywgaWR4KTsKIAl2Z2Ffb3V0YihwYXIsIEFU
VF9JVywgdmFsKTsKIH0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
