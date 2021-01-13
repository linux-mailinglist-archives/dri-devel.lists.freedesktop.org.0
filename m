Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23542F45D8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D7D6E0D2;
	Wed, 13 Jan 2021 08:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D566E0AF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t30so1092989wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4npnZBZUdB9VpRylBzLja8pV22PiHGoMVGeBjYnlKk=;
 b=ITSzPdTHABER1VheL/3HTMsa+peAOHNXWe9qQVNaliJwdCllNgkrjqNGUnnUoW1L8f
 TdK83gGX3FP7vDXmcFOgJx7vm9TGReb81hw6E4oTH2UM1IL3zW+q4gHPxvPDvd5AjKLm
 Gs+Fq4hVcFU/+NCK9s027XGyClxfE7KC/iXRoIU7sHz+fsTZAVPw6tV+wEsphAIL4kdI
 vHHXbjRGuiWVqmI3Q42dhbmNicEJpdsE38hcFJOwBPnn4jEboyFgMChQtAy+mNGDRQjX
 oTNmSqc/Gg8k9NpklmMiKL/QTj+29a6HQsHmlyC25nwS1XH3rQt7Qi7xdVTyOam0d9fo
 bzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4npnZBZUdB9VpRylBzLja8pV22PiHGoMVGeBjYnlKk=;
 b=bZNC8ijmwbaSyNB/peOG0Ky88XOPcNkjdfjF+FSnyw4uZZ9QjMYDLkaRS8W7KP9Hy3
 W/VqQkwPRB+IBWNDFLCBTdiMoogGenACplf7IJk244+EEXm9bYMPUAaai2rY2ZLRGW7c
 F/60v5NOn7kPutrpuMq5PM1tNDYg+tkle8nJbv8UOQjGZjQKI6VAVzM5H0N38zWSzbFz
 ruDmh76OPgDXCpJNWYfaaP6cPhmmJLfuYU1H2NaW3SL9BdNoCTsgYHrKPAf8POEsWb8T
 Gdc2AhKjK1tikNykpqx9RrekuHWspUO4+0S6QTN/ZgR9c1eMbMRzXzJJ2WADBo+Nzhxh
 zUvA==
X-Gm-Message-State: AOAM531iaacs2W9UWezZOtnEJbUa3wHUXMAPqk0muITUcXSR3xpOROBU
 WDStzzdjMMjZxhXasIS15BhbYQ==
X-Google-Smtp-Source: ABdhPJyl/Qhbk6jkk5C3J8WRijqVE/SpDxKAue04bKado0wqe6IdXSv6///j096igmmNz7SjwqECMQ==
X-Received: by 2002:adf:f989:: with SMTP id f9mr1164742wrr.299.1610525312650; 
 Wed, 13 Jan 2021 00:08:32 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/30] drm/nouveau/dispnv50/disp: Include header containing
 our prototypes
Date: Wed, 13 Jan 2021 08:07:52 +0000
Message-Id: <20210113080752.1003793-31-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjI1OTk6MTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhudjUwX2Rpc3BsYXlfY3JlYXRl4oCZIFstV21pc3Npbmct
cHJvdG90eXBlc10KCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggODA5YTliMjBhNjg5OS4uZDgyOTY1ODkzYjZiYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtNjgsNiArNjgsOCBA
QAogCiAjaW5jbHVkZSA8c3ViZGV2L2Jpb3MvZHAuaD4KIAorI2luY2x1ZGUgIm52NTBfZGlzcGxh
eS5oIgorCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBFVk8gY2hhbm5lbAogICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
