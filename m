Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1832B1C50
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBFB6E4FE;
	Fri, 13 Nov 2020 13:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BC16E511
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so9948698wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AFNrPQ81hqHHaageZvOMHIm1NdSavC7vYP+Jm2PmTBQ=;
 b=RQ4JxYXE11d9TyWCp2SMLBbDOIjUVovjqhMATP9WC+h2x9s9FvDe9rasQ6PW2pS+CX
 zLsjz9l2Cba9QeatwTFalD928dJP6Kqptw2OGDt9+JbpXHCWZQgfkxrsphmt2oxLRbX8
 Gc4C1tB5v7bFClbC4XagOq7bfZ4JFAXXcZ+mWVEvPoNpb9RJp/asE2wa5QaNl/J2fLjf
 7zCUcMOpcwVkbWLXCviGXnneB5qiP96b3LkmJsFK2KMk+tF/MLBp7LMdRqWoV1oCqpKs
 iZcvU793B2TQQsEww4DI7BRtU2uPq5G6mm9B8nsdJsy1tbB491pGDnUQCxwWVlxzUaYD
 ZHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AFNrPQ81hqHHaageZvOMHIm1NdSavC7vYP+Jm2PmTBQ=;
 b=NM9itUoZJ7KqC7DnopxPoi/Y2Yv/WrpYD8sbLS5Z6xoHn1AeaS/4BNr8uyOYR3aAhu
 yNq75IdDufoANoMylEwL90WU8w71SJoa5gcOgOmKgPHJV6Jinmvb0thoQLCVApQudf6I
 t35ROrabfxR3zk+qWOXIHr7IqjfT63vGDgT/e4wYnR+1XjYkW+USh3lPmC0ALGwLbUHO
 p6ZXMmfqrt41uDSL/EP8vnZZMlDxgVujJoZqP4PbWkLK/meDT//bCuCSPJqxLYQhR8nN
 5AFSm/FfbINVMXrPP70zEGeWT8LvQSs2NwAJ5oCk5gmrGURAk3hKZ0NuI05CAx0Oav8J
 9v2w==
X-Gm-Message-State: AOAM532/mjdjN4cu+LyDZkUkD2gSwr9LuG6rje1kzmX2hIY7kcSeqYuR
 0/Yw4VpjVA9wIhmRMEn9zNxigQ==
X-Google-Smtp-Source: ABdhPJwmo0JOiYrV8oNZNta8viNMWx0NeoRzpJgQvzNkVIsfwOreueO0+qXeFjEfEcn4AjOf2VW3VA==
X-Received: by 2002:adf:df88:: with SMTP id z8mr3609403wrl.113.1605275431632; 
 Fri, 13 Nov 2020 05:50:31 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/amd/amdgpu/gfx_v7_0: Remove unused struct definition
Date: Fri, 13 Nov 2020 13:49:38 +0000
Message-Id: <20201113134938.4004947-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYzo1MjExOjQ1OiB3YXJuaW5nOiDigJhnZnhf
djdfMF9pcF9ibG9ja+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMgfCA5IC0tLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuaCB8IDEgLQogMiBmaWxl
cyBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3
XzAuYwppbmRleCBjYjA3YmMyMWRjYmU1Li4wNGUxZTkyZjVmM2NmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92N18wLmMKQEAgLTUyMDgsMTUgKzUyMDgsNiBAQCBzdGF0aWMgdm9pZCBn
ZnhfdjdfMF9nZXRfY3VfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljdV9pbmZv
LT5sZHNfc2l6ZSA9IDY0OwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9j
a192ZXJzaW9uIGdmeF92N18wX2lwX2Jsb2NrID0KLXsKLQkudHlwZSA9IEFNRF9JUF9CTE9DS19U
WVBFX0dGWCwKLQkubWFqb3IgPSA3LAotCS5taW5vciA9IDAsCi0JLnJldiA9IDAsCi0JLmZ1bmNz
ID0gJmdmeF92N18wX2lwX2Z1bmNzLAotfTsKLQogY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9j
a192ZXJzaW9uIGdmeF92N18xX2lwX2Jsb2NrID0KIHsKIAkudHlwZSA9IEFNRF9JUF9CTE9DS19U
WVBFX0dGWCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18w
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5oCmluZGV4IDZmYjljMTUy
NDY5MWYuLmVlZGNlN2QwMDdmMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92N18wLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAu
aApAQCAtMjQsNyArMjQsNiBAQAogI2lmbmRlZiBfX0dGWF9WN18wX0hfXwogI2RlZmluZSBfX0dG
WF9WN18wX0hfXwogCi1leHRlcm4gY29uc3Qgc3RydWN0IGFtZGdwdV9pcF9ibG9ja192ZXJzaW9u
IGdmeF92N18wX2lwX2Jsb2NrOwogZXh0ZXJuIGNvbnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tf
dmVyc2lvbiBnZnhfdjdfMV9pcF9ibG9jazsKIGV4dGVybiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lw
X2Jsb2NrX3ZlcnNpb24gZ2Z4X3Y3XzJfaXBfYmxvY2s7CiBleHRlcm4gY29uc3Qgc3RydWN0IGFt
ZGdwdV9pcF9ibG9ja192ZXJzaW9uIGdmeF92N18zX2lwX2Jsb2NrOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
