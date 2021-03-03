Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C732B82B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C646E8FB;
	Wed,  3 Mar 2021 13:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B06E406
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o16so6405693wmh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQfVByDMubjxteIKJEZ6P0NR+Mqv9ZNp4le53NfYrp8=;
 b=iMTh4dk09sGxqAE/qzSGNAZyvWAptULs+nQCYT2OtIn3+7m0+6HrnZE1aUNidOxkd1
 HmBXyCE2zeEgjrHTRb3VZSeT3uOaMbsogo1LT36zL6TJcnQSaeedSmHxTVD7t846xMCV
 eDdK6AYjTARDjg8E/gMjAKx0AYRKmz5xxP6aPwaFs9bQtLq/cDZ+1G8tJCD8Sw6/+Si1
 oWKD8iQuNbtQnxKs9XREiEA3GzeA3/ge0ObQRTj0uRHSotea1Ndx9pvJUsW1OI6UJwh1
 m8FyDR4OSbUUM46rq97np9+8LfZYnGxDKtK3Vl0ooMSjZ2eHgo1Le9Z/NLIU8vnm9XBF
 UUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQfVByDMubjxteIKJEZ6P0NR+Mqv9ZNp4le53NfYrp8=;
 b=R5kzTsz1tbBzXshdZY+KcSCu/FcJWPwT5pbIuQwnwX2BxVlhZ4Ast/DzB1OPLfz0lZ
 91jmj5MSbhWLLIPE8WqEDd2ztFSbUdraunDIKGkN71XJmnULY6r1h6HpyIKGkcFjj66j
 c/ar1xCH4sO77Cli5jj33aVTnTH14p3A/QFK7lM1ci6tY0kYpiZaRWsk5/xk2rMs3NN9
 OkdtVEFWn8tjC1zoj+UBl420DwC7prvLfRboRnCvforvuo/7Kn23PtlIj3XgueGhp23/
 e6jR/zvhQ9GJNzig9fiUtB5bjlHyK18RIB3HhEp7DmMaQNn0HjsxkyRK6giiSA18e4aL
 dOcA==
X-Gm-Message-State: AOAM532ipoNjYUTPidTmcuZVEU/BEOXvC4V7JGRTsLhTGLE4gOd61N7R
 bhrMmnvYYk+tPMJJJzBELbA/Pg==
X-Google-Smtp-Source: ABdhPJzyUy+S8ulahsuVr/azQFNR9h4YD/I4Ad0ABeYj4bYvn2eB4B03dDyZjVZiwtN1lHjN0zcxjA==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr9079631wma.167.1614779030643; 
 Wed, 03 Mar 2021 05:43:50 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/53] drm/nouveau/dispnv50/disp: Include header containing
 our prototypes
Date: Wed,  3 Mar 2021 13:42:45 +0000
Message-Id: <20210303134319.3160762-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggODI4ZjQ4ZDViZGQ0ZS4uY2QxNjQzMTQyMjE5OCAx
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
