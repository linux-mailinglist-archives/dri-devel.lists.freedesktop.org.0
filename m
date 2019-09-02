Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93606A54F4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BC289C49;
	Mon,  2 Sep 2019 11:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAA089C49
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:32:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j16so13643044wrr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4al9KjlAWfyU0dfyS71pK6V4IgdXLpnLn90yuCTWTrI=;
 b=M1Mssnvg8SZz2Nf/FkItkRo/xzLSKHAZDDXie3xwOEpdTz0sjeTSbG5UzIP+Z1l9ye
 L7RCeeEuHVG62QWBEIZxpi+3toWCab3cIAIdXG6vMqs/rFX/+3bUVhurXODmGJpb5dA+
 Jtv94H3FPMML3U68B6jXxRqGuAfThJ5s/5EoQhvho/EW1/5kdzNWVcB+pwx/7uCOodto
 YfZukNFZC0ZA7KpJDUIJWQseYQdX6ymBja21//yRY1ox32/7Zhz3weAWbYuUL8C/Dch2
 KqtsMWgOkRFwrTZNKaFlDd/BUzUrCTSe6rs2rT2C12kkFs2btr8B+xa8MnAZslSt/N7l
 Yycw==
X-Gm-Message-State: APjAAAVjzX+kutOn59gEnkIZRLBIG6vFKRvhx97focWOCL1PwUpJOfci
 ia/5C3Vx0XGZYak5dAB/4Iy0c0DI
X-Google-Smtp-Source: APXvYqwqOfqVEH3x9KugBJN2DkbierddWw+Uav+SAD7ndw++I7guE7iqvuh4kbBuTBzBMy88S8t+Fw==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr31828901wru.349.1567423928526; 
 Mon, 02 Sep 2019 04:32:08 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id y3sm29091303wmg.2.2019.09.02.04.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:32:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/21] drm/bridge: tc358767: Use DP nomenclature
Date: Mon,  2 Sep 2019 13:31:21 +0200
Message-Id: <20190902113121.31323-22-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4al9KjlAWfyU0dfyS71pK6V4IgdXLpnLn90yuCTWTrI=;
 b=fJhJoBV3Yx8hMbJLs6GsiOGI7E/YkV6s8nZLNZY5SEMQyYus9I4IQP0Nd4ynix17d5
 U/RtHdge1tGnD5k9c6qXK58eTTFlWGAslqIU+oAPnSxPYPsOy2APQHF7DDkiIHIe3MbX
 D4xuCNFjCCq5BvhBgjmZw+2yx0g+0zcwLAliCuM/ynThtKjyMtjheCWvv413zxtl82nx
 gcMerD9CO4vvcQEiEanbYsExh3OsabVeGKQTemte4ERMUm4VvFJkQ6mXVyVSXVfU75h0
 B1QTECaqaOwxmuWbUBTVMI1woakpuM/gC8X1Vb96+xhQxJqbIBZgh9LpcdvH3wYZewYc
 Fejg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBEUCBzcGVjaWZp
Y2F0aW9uIHVzZXMgdGhlIHRlcm0gImRlZmF1bHQgZnJhbWluZyIgaW5zdGVhZCBvZiAibm9uLQpl
bmhhbmNlZCBmcmFtaW5nIi4KClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jCmluZGV4IDI0MGE5YjY5MjQ0ZC4uNDY4OTI1ZjgwMzI5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jCkBAIC02OTksOCArNjk5LDcgQEAgc3RhdGljIGludCB0Y19nZXRf
ZGlzcGxheV9wcm9wcyhzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJCXRjLT5saW5rLmJhc2UucmV2aXNp
b24gPj4gNCwgdGMtPmxpbmsuYmFzZS5yZXZpc2lvbiAmIDB4MGYsCiAJCSh0Yy0+bGluay5iYXNl
LnJhdGUgPT0gMTYyMDAwKSA/ICIxLjYyR2JwcyIgOiAiMi43R2JwcyIsCiAJCXRjLT5saW5rLmJh
c2UubGFuZXMsCi0JCXRjLT5saW5rLmJhc2UuY2Fwcy5lbmhhbmNlZF9mcmFtaW5nID8gImVuaGFu
Y2VkIiA6Ci0JCQkibm9uLWVuaGFuY2VkIik7CisJCXRjLT5saW5rLmJhc2UuY2Fwcy5lbmhhbmNl
ZF9mcmFtaW5nID8gImVuaGFuY2VkIiA6ICJkZWZhdWx0Iik7CiAJZGV2X2RiZyh0Yy0+ZGV2LCAi
RG93bnNwcmVhZDogJXMsIHNjcmFtYmxlcjogJXNcbiIsCiAJCXRjLT5saW5rLnNwcmVhZCA/ICIw
LjUlIiA6ICIwLjAlIiwKIAkJdGMtPmxpbmsuc2NyYW1ibGVyX2RpcyA/ICJkaXNhYmxlZCIgOiAi
ZW5hYmxlZCIpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
