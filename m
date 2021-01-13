Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3442F4D9D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76C06EA62;
	Wed, 13 Jan 2021 14:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5D66EA62
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a12so2392953wrv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdRuSJvii4mKY/Efrp+W2ecV3k/kYMixGrJ5X2aYPPE=;
 b=h7CCOaMRu/KwDp4FkMru0iAXzhcqDT8Zgx3TFkmqeQ+lFmQabkd31QQ+lufeDRUy3X
 LtVPTgu8/Zqp1FSR8BAvO7dZtJzfFJCxlVtW1Nocwnb68P37FSE+be5cVVaNK5Tt8JCU
 9w0Ph8RfNh92LMTOPQay3rdqNK2k+J9YHe1s4Pc7Cfwul+RTcoi4Ud5EHifbnQv/CgAl
 HXLZdEt7o50147fxcADWLOPX90H4PF4f7epdHBvT72f7b/PpYAha9w6yexNN/IIcz2uN
 fnQb+ZapvvgV5yFNpXtWjyjgqG+ixxGtM9qn4DjB5lbBlmDCcef1Kbvt5M9KefOQMbJJ
 FfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdRuSJvii4mKY/Efrp+W2ecV3k/kYMixGrJ5X2aYPPE=;
 b=cJAxdU2kqecmfgFAYtddy9+o62Um1rwHRzsXdkbpcjgKlTUpJ0UiDX8pCbqRDD0Xg7
 2e+bw+vYT9RznnULogSjQU2vVL7eziS1bGw4og2fPCXQ++wwkwrKaaCrOC7a0YG6P/Ei
 NFRj4L6KYyQTHdZir7LSlj72wQWhNIlCytsmdVIv64kvKgvpStUkc1qRbQaAmE5Ki2Mn
 o5ppb0poEkBTqMOSQrRPISoanpPrYCwsHaCc8iLva9EgHRLd0LlR7jGABItySWB/RfxZ
 +LDLDU/Q8c55XV4+iAjVh1AEZPH6Tr/LNdzHkmsB3dPQMD6eseFACfPQsGfcfBVflSS9
 2TwA==
X-Gm-Message-State: AOAM532gPu/yHqRz/KYKf2s7Rd619l9A6GaZaf19CFKZf/ZjrL/KGbil
 SA43bgU/0dNF1dmP9l4vkrq+jg==
X-Google-Smtp-Source: ABdhPJyuIlFTIENDUMPlw5lomJPJtWMdNwJG+DPzaqlFIAPWPUczY5LQd4LCs7FSNVgCvZWujNH+Hw==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr2937092wrw.379.1610549444578; 
 Wed, 13 Jan 2021 06:50:44 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/31] video: fbdev: sstfb: Mark 3 debug variables as
 __maybe_unused
Date: Wed, 13 Jan 2021 14:49:59 +0000
Message-Id: <20210113145009.1272040-22-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Urs Ganse <ursg@uni.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alan Cox <alan@redhat.com>,
 Paul Mundt <lethal@chaoticdreams.org>, Ghozlane Toumi <gtoumi@laposte.net>,
 Alex Dewar <alex.dewar90@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIG9ubHkgdXNlZCBpZiBTU1RfREVCVUdfRlVOQyBpcyBzZXQuCgpEZWNsYXJlIHRo
ZW0gdW5kZXIgdGhlIHNhbWUgY2xhdXNlIGFzIHRoZWlyIHVzZS4KCkZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvdmlkZW8vZmJkZXYvc3N0
ZmIuYzogSW4gZnVuY3Rpb24g4oCYc3N0X2RldGVjdF9pY3PigJk6CiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3NzdGZiLmM6OTM0OjI2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhuX2NsazFfYuKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy92aWRlby9m
YmRldi9zc3RmYi5jOjkzNDoxNjogd2FybmluZzogdmFyaWFibGUg4oCYbl9jbGswXzfigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvc3N0ZmIuYzo5MzQ6Njogd2FybmluZzogdmFyaWFibGUg4oCYbl9jbGswXzHigJkgc2V0
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBBbGV4IERld2Fy
IDxhbGV4LmRld2FyOTBAZ21haWwuY29tPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogR2hvemxhbmUgVG91bWkgPGd0b3VtaUBsYXBv
c3RlLm5ldD4KQ2M6IEphbWVzIFNpbW1vbnMgPGpzaW1tb25zQGluZnJhZGVhZC5vcmc+CkNjOiBQ
YXVsIE11bmR0IDxsZXRoYWxAY2hhb3RpY2RyZWFtcy5vcmc+CkNjOiBVcnMgR2Fuc2UgPHVyc2dA
dW5pLmRlPgpDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPgpDYzogQWxhbiBDb3ggPGFs
YW5AcmVkaGF0LmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxp
bnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc3N0ZmIuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3N0ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3N0
ZmIuYwppbmRleCBjMDVjZGFiZWIxMWMyLi5iODgxM2EwYjYzYjFkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L3NzdGZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zc3RmYi5j
CkBAIC05MzEsNyArOTMxLDcgQEAgc3RhdGljIGludCBzc3RfZGV0ZWN0X2ljcyhzdHJ1Y3QgZmJf
aW5mbyAqaW5mbykKIHsKIAlzdHJ1Y3Qgc3N0ZmJfcGFyICpwYXIgPSBpbmZvLT5wYXI7CiAJaW50
IG1fY2xrMF8xLCBtX2NsazBfNywgbV9jbGsxX2I7Ci0JaW50IG5fY2xrMF8xLCBuX2NsazBfNywg
bl9jbGsxX2I7CisJaW50IF9fbWF5YmVfdW51c2VkIG5fY2xrMF8xLCBfX21heWJlX3VudXNlZCBu
X2NsazBfNywgX19tYXliZV91bnVzZWQgbl9jbGsxX2I7CiAJaW50IGk7CiAKIAlmb3IgKGkgPSAw
OyBpPDU7IGkrKyApIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
