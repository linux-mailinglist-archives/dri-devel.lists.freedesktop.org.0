Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A636228E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29CA6EC12;
	Fri, 16 Apr 2021 14:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB0D6EC0A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id f8so32555906edd.11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDdT4/+XKsblVJiSEV/Ng5U9nFlFYwJI7t0KAgT17Jc=;
 b=GVXZ4RlJwFsNGButwNcLJWso5eM3oO2t1LugQa1WxR7somr6EYngKqt9MGvUfV0Z8W
 spo/YFrOR3/L+OL4pExz+ObuFTvVaxlIwmaIYA6w3hQK7rnf1tuA96FZQMF6en7epBdG
 HpQumRcb3VUt6TsG4HUTHHw6OwUnu9wtDWEl1lVrgbbd9I1wJZ7j2BCeaLZvHtCd21MF
 QcxYTguRaX2CL4McdxAzZ7TpfuM1e86es6aqUz0ESVv2F9jwl8aBqiuJlQKp9418pQBZ
 xWyM1V3MfTcLYKsGQMcnArnMB8vwHKUbkBPB5DwJKigdjWREp1b/yeg+2tt1gZBQWZSs
 cuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDdT4/+XKsblVJiSEV/Ng5U9nFlFYwJI7t0KAgT17Jc=;
 b=ZndHp2DNA13ECCdXmzRkEWgHhjJN3DaQ+sOfVtQvWKrHxoFVesT/WZQnHL5vW7XfGQ
 Sc/ATxf2pBH/ovcjw6p/78/kBYlcF5Tg/NPRdFYB1eCDo6lSU91cdlmshaZ2jHx1WAvd
 bQCy6f4W1OW9Y85j3JXn1fNNhdXAPXdh8FhstByCzFyFy7+yX5vUGKQV7Ni6VkvaQOuy
 Vx3ofUk9InSr3AOaAnhnuLTC4n6NelUx+MDBK7YrAegJP5H1C8tcXjoqsd8cukBIvFdT
 6J4tfci1PnJB9YUt+1HlKgDaBGvzOF2uANp95V6s1JhNiSV60Gb8jUBzv5dOLYaQ9FgB
 bB2w==
X-Gm-Message-State: AOAM532wx9JhqzR+3VgLg7SwC2ABGPiPc5A0DEEotShVQSklNFZBqLpw
 mv/iVffK1ZhussspJQfa6cziXw==
X-Google-Smtp-Source: ABdhPJzotflJvZTB2ll/FcWUU6QTmhzLk1MA/Yw8TC9PpImJipTW60OTtbwHhoYkTSqbc7cvA17dTw==
X-Received: by 2002:a05:6402:27d3:: with SMTP id
 c19mr10448067ede.129.1618583864278; 
 Fri, 16 Apr 2021 07:37:44 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/nouveau/dispnv50/disp: Include header containing
 our prototypes
Date: Fri, 16 Apr 2021 15:36:58 +0100
Message-Id: <20210416143725.2769053-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggMzUxZjk1NDk4OTUzMC4uNDkwNWVkNTg0ZmY0OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtNjgsNiArNjgsOCBA
QAogCiAjaW5jbHVkZSA8c3ViZGV2L2Jpb3MvZHAuaD4KIAorI2luY2x1ZGUgIm52NTBfZGlzcGxh
eS5oIgorCiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBFVk8gY2hhbm5lbAogICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqLwotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
