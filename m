Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF72B4DB7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824CD6E9F9;
	Mon, 16 Nov 2020 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249206E9F7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so33593wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDDB7TiTj4Jx/yTpGVCS2uqUdyiewZ4Ioe8JHQpewVc=;
 b=CpSZkmo/j2Y34JQwmQr2gL++XO1KYPcKHx6aqjTMLngU/acwN4t98DrtpoEAR+uHeA
 LEd2aN+YIEqfjA8qJitJOl7OQDlvxN+ELOtvUyVfK6NYEUWOZlChIVs4nqcg9elGQehe
 Mlbh/kBNojHRJE8HUO/6j3KiFXWV/lY/H0EeqDJEMCmSSqc8uetWdcK7KC1SKun3LNfM
 OsAvUf3KGN8GI1Q88IWDJ4JqQ4UIzj7/9UKQN0rkBTAyNfaB9AD252Kp8BTqLX7Ree6o
 9Df3tJOHKVus3QnMsM1RqTTwVDZxjAWbtxLYFmHOymQolEp5oB4vsX1J35OYld7qBk2A
 gtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDDB7TiTj4Jx/yTpGVCS2uqUdyiewZ4Ioe8JHQpewVc=;
 b=Kg6faPN7vKavaTsKLc0L+SbbBTXFaJWP0IudXcny/AEz8nYfeP9u3fyL6D9GskqXO2
 TFSfPZwYp2e0K7FYmU/rv3fTQ1EtGrE3pLQ9ap3g8mrpFgvh8SMdD7CR4ynFj/Z26qAg
 OGRPTx2ArkdimCh8lj/nl9elhf8JNzWh/Vpl2kUTvZiMNuvvAKTUqW9hgZ170pids4MQ
 QkkPgwjdGCmPXkFshzlfEfoB1ZK0n+pjQJN+wfwNwQokkZELzg4BIXz8jn5T6oGweqE6
 pYkh1EheYt1OQWWH+bvCCA+9bzsd6y2xxImauRPPIiSPkpfOCQ8kwqLXxNYMJ5zQgGCi
 vIig==
X-Gm-Message-State: AOAM531JeaISoUi9LnEYnyyhFW2awE7BtgkKy5ev/5vZd6YU7Wy+uaud
 EQufw0S/lczJTnj5u9dtHY1V5Q==
X-Google-Smtp-Source: ABdhPJxPbxCum/XYvUgQugDBX75aEbB+JJYQEqSRBMPO4F/I/vRzV1yTYp53NsEEXN/uJBkrtTjG5Q==
X-Received: by 2002:a1c:1fcc:: with SMTP id
 f195mr10459841wmf.121.1605548498820; 
 Mon, 16 Nov 2020 09:41:38 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/42] drm/meson/meson_vclk: Make two local functions static
Date: Mon, 16 Nov 2020 17:40:44 +0000
Message-Id: <20201116174112.1833368-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYzoxMzQ6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhtZXNvbl92aWRfcGxsX3NldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jOjQ5MDo2OiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmG1lc29uX2hkbWlfcGxsX3NldF9wYXJhbXPigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+CkNjOiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KQ2M6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1i
eTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNs
ay5jCmluZGV4IDBlYjg2OTQzYTM1ODguLjJhODIxMTllYjU4ZWQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX3ZjbGsuYwpAQCAtMTMxLDcgKzEzMSw3IEBAIGVudW0gewogCVZJRF9QTExfRElWXzE1
LAogfTsKIAotdm9pZCBtZXNvbl92aWRfcGxsX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCB1
bnNpZ25lZCBpbnQgZGl2KQorc3RhdGljIHZvaWQgbWVzb25fdmlkX3BsbF9zZXQoc3RydWN0IG1l
c29uX2RybSAqcHJpdiwgdW5zaWduZWQgaW50IGRpdikKIHsKIAl1bnNpZ25lZCBpbnQgc2hpZnRf
dmFsID0gMDsKIAl1bnNpZ25lZCBpbnQgc2hpZnRfc2VsID0gMDsKQEAgLTQ4Nyw5ICs0ODcsOSBA
QCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBwbGxfb2RfdG9fcmVnKHVuc2lnbmVkIGludCBv
ZCkKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0cnVj
dCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAotCQkJICAgICAgIHVuc2lnbmVkIGlu
dCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAotCQkJICAgICAgIHVuc2lnbmVkIGludCBvZDIsIHVu
c2lnbmVkIGludCBvZDMpCitzdGF0aWMgdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0
cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAorCQkJCSAgICAgIHVuc2lnbmVk
IGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAorCQkJCSAgICAgIHVuc2lnbmVkIGludCBvZDIs
IHVuc2lnbmVkIGludCBvZDMpCiB7CiAJdW5zaWduZWQgaW50IHZhbDsKIAotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
