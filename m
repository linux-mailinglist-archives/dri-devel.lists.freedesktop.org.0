Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A222DE7B2A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 22:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9ED6EA8F;
	Mon, 28 Oct 2019 21:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06106E4FF;
 Mon, 28 Oct 2019 09:20:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r141so8252712wme.4;
 Mon, 28 Oct 2019 02:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UntOsok0RJA5xyBdV5DE84ry7KtJuNs3rA69E2z2DlM=;
 b=Hwxv0Udd4fLKgiyUQxBPsGFwTcFZsgzEiXppgartiQvYX/LnSG7/1NfbBfp9kNHhOO
 pUFvRE6brlxRtHjt3qmpiypGYC5Z4/ep11uSU3MWb3FKXPu8Dz5GIKntbpAjb3kCWspJ
 B3pf7cm/NXvRnkmLnNx1Jpncb/MIXXwfqOSv29dC4ODOfAfLiRZZqlud87DFEyVexJqn
 LsF7NUkZKfnvksCT2Qu99VR6AT/lRcz4/PQ0d7PMxHWp//mgWVdTS7gpHm/O6+rNcMjZ
 qI5jmqsP3cniavKdt5rsZYLzU92Ib2mCxD9BzvPFxNOwdecwRy5QdPyUd8aXRS/XZ3Xj
 cmUg==
X-Gm-Message-State: APjAAAU9qZho8+zAekfi+kj12v2sMaFs9N+6udRQzgruZ5l5LjG/GI/5
 ECD6cYqn655o3ppmi6OgNV98UuvfmncfpQ==
X-Google-Smtp-Source: APXvYqyJUBnyICbDWxYuvED5P/6503b/z3i6qtHWN/gRRjhaGQcOu9SUYbms5Y7BWsojxsYdr9mnyA==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr15828228wmk.25.1572254415073; 
 Mon, 28 Oct 2019 02:20:15 -0700 (PDT)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id z9sm11427513wrv.1.2019.10.28.02.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 02:20:14 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Outreachy][PATCH 0/2] sparse warning cleanup
Date: Mon, 28 Oct 2019 12:20:03 +0300
Message-Id: <20191028092005.31121-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 21:09:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UntOsok0RJA5xyBdV5DE84ry7KtJuNs3rA69E2z2DlM=;
 b=JP4d5d7Rp2a/4tRoivSLq+T9QpD49Linqp+deoL1VU3fPfpuQx1pkHQc0AfSvCfx4S
 82e22oG+ChZcIaEWz2LAlG7Uv6N5f7OqHWgD8fs5Vi3gEPxj7GQtWAvfBDi0kHC32QWu
 /fyaI9E+kMjFLnw/Pe06IVT5vCAny2fA4QgtTxE0TW8ElrzkyucDbRNs74XJz1+s00My
 qFHluGcSUbJsjB/LxULcAycCqhuSAfpePvB4FQpwDD6QbgPQq7tQ15nlOWqRppw+sdpS
 rotuwM+0dwCWSbLcG2OwUT9Tc5Fc2UEbpWBRuTtCvWsFzWBgwBMmsSgnrcQc7tpmlbmp
 Us3Q==
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
Cc: airlied@linux.ie, outreachy-kernel@googlegroups.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBhZGRyZXNzZXMgdGhlIHNwYXJzZSB3YXJuaW5nIGFib3V0IHRoZQpgYW1k
Z3B1X2V4cF9od19zdXBwb3J0YCB2YXJpYWJsZSBhbmQgY29ycmVjdHMgdGhlIG1pc3BlbGxpbmcg
b2YgdGhlCndvcmQgIl9MRU5USCIuCgpXYW1idWkgS2FydWdhICgyKToKICBkcm0vYW1kOiBkZWNs
YXJlIGFtZGdwdV9leHBfaHdfc3VwcG9ydCBpbiBhbWRncHUuaAogIGRybS9hbWQ6IGNvcnJlY3Qg
Il9MRU5USCIgbWlzcGVsbGluZyBpbiBjb25zdGFudAoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oICAgICAgICB8IDUgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYyB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
