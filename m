Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B972C5611
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601546E963;
	Thu, 26 Nov 2020 13:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAEF6E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p19so3692162wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHPe3Mn8cbArsPPQt69rySCnIbjXwyEYsPDbwO3FTTg=;
 b=ZrrrsDoz87EZgy+M2aL51jy5fVNnRT9Ooj/mOazxarq50HhmO8uE9haPCFapX0NTg9
 x6bITVxxMy2ceyMIwwlvVmfWhLohKVIHaifZYvD564ABfgOPiHpkcZAbNCqT3gCiBxRH
 imzJ74y7rbX2hhwcFh9PdH9ckSdhgs9smHWe8Tx/tFs4BfKX7eww65fmFdde3p7JFBTQ
 ry69c8PoPC0zzTqFcvuG7NWha5f4adD59UdUYcyH7Yn6EZ8wG8/T5Smq0V+PfDRSZvlZ
 Z2SczZBNrlqd51wVoJ/qGri9TQGx9wCE+/ihHS3qMxVbsFChNME1JW6ADJCox2oValvD
 4kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHPe3Mn8cbArsPPQt69rySCnIbjXwyEYsPDbwO3FTTg=;
 b=uE+pd0BmC5M2AIFQ/ul+naQ8hym0IvQMYltzCt2fdxP5krO2oruM1fPKRbN5cWwGkf
 HRKuE6dn9OPjmvbeIEl1/5dRNccm80mZcc0ns5FUIgE1sjZMfP9DHc9xiwQ5Do47WAgi
 QMrqFrC+CIh+46OwHlBKtKBDi/xbgM7m4OwrGInxv/v6dujTpKxo1UXKD79Nxks6NISC
 yQYXDHDd0VJ5f4IjPCzKyce5a4sdte8/RQS/fgxvrQ+85AoVKREAA50Cuy6bk+PHn+6P
 A8T5Sf9dCidRzACssOHz5R4ISeroQcciHFZgRhiOzpdp83yXeCgPbpQ1cwqI3q5/eSe7
 pK5A==
X-Gm-Message-State: AOAM53158SKF9eoWGOH2PAYeiwJBbU3w9HOhQmHtkn+Z29Z7GdOOGyl7
 yBPvshVUEa2Xcb/VfFwrw2H5DQ==
X-Google-Smtp-Source: ABdhPJxByRK1Q8cdllulc14iL3DZ69ssy3TPiMpLDs4KGV5DAkCdW1u+aGwsGVDu2jftEfHpDkPoDA==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr3512224wmc.130.1606398176747; 
 Thu, 26 Nov 2020 05:42:56 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/40] drm/amd/pm/powerplay/hwmgr/hardwaremanager: Remove
 unused 'phm_set_*()' functions
Date: Thu, 26 Nov 2020 13:42:08 +0000
Message-Id: <20201126134240.3214176-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdl
ci5jOjUxODo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBobV9zZXRf
bWluX2RlZXBfc2xlZXBfZGNlZmNsa+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5hZ2Vy
LmM6NTI4OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcGhtX3NldF9o
YXJkX21pbl9kY2VmY2xrX2J5X2ZyZXHigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdl
ci5jOjUzODo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHBobV9zZXRf
aGFyZF9taW5fZmNsa19ieV9mcmVx4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIC4uLi9hbWQvcG0vcG93ZXJwbGF5L2h3bWdy
L2hhcmR3YXJlbWFuYWdlci5jICB8IDMxIC0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3Bvd2VycGxheS9od21nci9oYXJkd2FyZW1hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jCmluZGV4IDFmOWI5ZmFjZGYxZjQu
LjQ1ZGRlM2U3NGI1NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
cG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jCkBAIC01MTQsMzQgKzUxNCwzIEBAIGlu
dCBwaG1fc2V0X2FjdGl2ZV9kaXNwbGF5X2NvdW50KHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIHVp
bnQzMl90IGNvdW50KQogCiAJcmV0dXJuIGh3bWdyLT5od21ncl9mdW5jLT5zZXRfYWN0aXZlX2Rp
c3BsYXlfY291bnQoaHdtZ3IsIGNvdW50KTsKIH0KLQotaW50IHBobV9zZXRfbWluX2RlZXBfc2xl
ZXBfZGNlZmNsayhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCB1aW50MzJfdCBjbG9jaykKLXsKLQlQ
SE1fRlVOQ19DSEVDSyhod21ncik7Ci0KLQlpZiAoIWh3bWdyLT5od21ncl9mdW5jLT5zZXRfbWlu
X2RlZXBfc2xlZXBfZGNlZmNsaykKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KLQlyZXR1cm4gaHdtZ3It
Pmh3bWdyX2Z1bmMtPnNldF9taW5fZGVlcF9zbGVlcF9kY2VmY2xrKGh3bWdyLCBjbG9jayk7Ci19
Ci0KLWludCBwaG1fc2V0X2hhcmRfbWluX2RjZWZjbGtfYnlfZnJlcShzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyLCB1aW50MzJfdCBjbG9jaykKLXsKLQlQSE1fRlVOQ19DSEVDSyhod21ncik7Ci0KLQlp
ZiAoIWh3bWdyLT5od21ncl9mdW5jLT5zZXRfaGFyZF9taW5fZGNlZmNsa19ieV9mcmVxKQotCQly
ZXR1cm4gLUVJTlZBTDsKLQotCXJldHVybiBod21nci0+aHdtZ3JfZnVuYy0+c2V0X2hhcmRfbWlu
X2RjZWZjbGtfYnlfZnJlcShod21nciwgY2xvY2spOwotfQotCi1pbnQgcGhtX3NldF9oYXJkX21p
bl9mY2xrX2J5X2ZyZXEoc3RydWN0IHBwX2h3bWdyICpod21nciwgdWludDMyX3QgY2xvY2spCi17
Ci0JUEhNX0ZVTkNfQ0hFQ0soaHdtZ3IpOwotCi0JaWYgKCFod21nci0+aHdtZ3JfZnVuYy0+c2V0
X2hhcmRfbWluX2ZjbGtfYnlfZnJlcSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KLQlyZXR1cm4gaHdt
Z3ItPmh3bWdyX2Z1bmMtPnNldF9oYXJkX21pbl9mY2xrX2J5X2ZyZXEoaHdtZ3IsIGNsb2NrKTsK
LX0KLQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
