Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C22B0D35
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F346E3C6;
	Thu, 12 Nov 2020 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99276E3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so7171644wrx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GSQeWTdjtKHE/snC/M+vXh/C2LESCnHy86BMb0+s4p4=;
 b=wZ6DK6QT/0jgXl86gYHoNbMa2HFabOJWNjlDe3eubw/4ODuekBAeMhKInFvqDGoeVA
 9GMpX6S8jUDnsdPAmyqUBDezSM3GZecQrtoX28rTAEB59O4wK8at1IfmwWuHOoDor4M0
 HMyq4J4Jh4Qi/F2xnEMmUJa1cB5WVuzgp+dIq00AYW3uz03TwSkMqLb/Xu9CY6aTfKHh
 VJkHxIOKy2+LjQXf+9F35I2U0uPVSRD/8pg33OAk1QvuCLBlk2VxvVp4jBRBk4HNAvGG
 xMPHmsyRLBbEAQUMNVH6Y2Z/M8LKSkU8wv7uaIrjjFsSYzHNCNtYLxWg+iOViFQkQLEx
 jnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSQeWTdjtKHE/snC/M+vXh/C2LESCnHy86BMb0+s4p4=;
 b=S/3YsHexTqwF9Dv1gzplp4+zTVaZvfxm436OHWeYyoVk88Pxe/ghVK608O53EVIFCB
 vhK+zc1uASocRXZ/32yzS3Z279lS4yTKu5Lq3301FpeFM7IEUTNNPhbrDyNng42ZMyF4
 yLY9hL57rzCCEyIYZ5NBVuu3pWKZhxOkFIRcZG3sQ5UjkuYf7q8p4eQzufdzHcP33r1J
 qr4PsY5Lp3TXT8Pz2EykaeZSeuGgA+VMJx92M6DDq3VE82YAb4MWN2FDnAJ1BqSdlH7c
 EQn4WqXvvcYFMMR/OkwWNtxdZNPVxG8tv9w0lNsnrltiXl6TRDcvjVgVzirHFOjakc0z
 mJcQ==
X-Gm-Message-State: AOAM5339oS5m/hkDGvA+RtnFyAN1wGy0E84GYqOeugl1F9wCrwmrXnvU
 +nUxEJXzT8xA5Nhb1bkQVJUlRw==
X-Google-Smtp-Source: ABdhPJz0SXmRR7WXNORCYuzPoVjb21fRYelsIwYMJmXAYPuhl4rAfkBemy13imRn4RCkwQN9WIwZEw==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr1095430wrp.186.1605207679555; 
 Thu, 12 Nov 2020 11:01:19 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/30] drm/atmel-hlcdc/atmel_hlcdc_plane: Staticise local
 function 'atmel_hlcdc_plane_setup_scaler()'
Date: Thu, 12 Nov 2020 19:00:25 +0000
Message-Id: <20201112190039.2785914-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmM6MjgzOjY6IHdhcm5pbmc6
IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYXRtZWxfaGxjZGNfcGxhbmVfc2V0dXBfc2Nh
bGVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNv
bT4KQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4K
Q2M6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3Bs
YW5lLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hs
Y2RjX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxh
bmUuYwppbmRleCA0MDgwMGVjNTcwMGE4Li4yZDUwMmQyM2FiMTJkIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYwpAQCAtMjgwLDggKzI4MCw4
IEBAIGF0bWVsX2hsY2RjX3BsYW5lX3NjYWxlcl9zZXRfcGhpY29lZmYoc3RydWN0IGF0bWVsX2hs
Y2RjX3BsYW5lICpwbGFuZSwKIAkJCQkJICAgIGNvZWZmX3RhYltpXSk7CiB9CiAKLXZvaWQgYXRt
ZWxfaGxjZGNfcGxhbmVfc2V0dXBfc2NhbGVyKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxh
bmUsCi0JCQkJICAgIHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGUpCitzdGF0
aWMgdm9pZCBhdG1lbF9obGNkY19wbGFuZV9zZXR1cF9zY2FsZXIoc3RydWN0IGF0bWVsX2hsY2Rj
X3BsYW5lICpwbGFuZSwKKwkJCQkJICAgc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lX3N0YXRlICpz
dGF0ZSkKIHsKIAljb25zdCBzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXJfZGVzYyAqZGVzYyA9IHBs
YW5lLT5sYXllci5kZXNjOwogCXUzMiB4ZmFjdG9yLCB5ZmFjdG9yOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
