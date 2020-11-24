Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852582C30EC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB006E578;
	Tue, 24 Nov 2020 19:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04596E52A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l1so23523756wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eR2VWY/uBkZ8OQEHImWEeJT/rcGPCff8wPihf7Jld5M=;
 b=A1J4BPeeNT7yrkRrjaash/ObA12oqLXqva2RiCKNwn8pXH4B82hyrnDC1qOlAUehpo
 AdeJQMEynjujsKrEwnks4sBT37dmB/XAEt+e122O9CLyu93pqUl+AvuCanZAbhKsTBXr
 GudbMVWesoscbiJKMq7jlO/gjtgYXb1D5MaWGt6u0q8TMlv0poGqlRZ9+8wJ01IGRJib
 SiG4ihHTtFziZ72Q9xrA7c7d6XZWZVhthZ5Br7zuNU61Byxk38+icuwZHTLSenPdTwKp
 5GUPemDK4FAEPJMbT2fmdAgMTqijobz7+niz+E3Kcg6QW5AdLpye2o+AbBhjtl1sg+x5
 pl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR2VWY/uBkZ8OQEHImWEeJT/rcGPCff8wPihf7Jld5M=;
 b=C774Qpn+R73igzDILZmRupDPlrp/soQ5UVNNNHf1Ks59sJ0/7rGxzcydVnYUpG8nQm
 wC/bJNs6nix9dZzqgmPrdD9hfBomAIBu4Gl0VnMdo0ty98nGAPaqTvUjQT7kmCzwUIq/
 I4RdZa8UIB/r77c7nQjDJwObr1l5f/TmHToWkhB+CVCnzTAQAkOwkz/+vdg8pmv9G4Ne
 MOThSzXXbtpwOY0Bi/ZMgZzf/ygHWI1sOYyG5RJ8i0r9OsgFD30UuYQGQNh2alJ7ekyi
 U0UPZscWi8P7AVLsE0orHc9L2i0U9gtMEeXKRQmYaERKF3LgZkDodsGgdeUo5q/hOezs
 kw0w==
X-Gm-Message-State: AOAM5316zSZMfC1SiRhFFOzKjtSFuB+aiGoiMC90z6dHUJ/1FoNXVMhG
 89rorelRpNp3kJgaqCsPfsNpiQ==
X-Google-Smtp-Source: ABdhPJxlONImqsImoSyKBlbOvdessgEk2uRK+pugMfFusdmCcYTUJjt30D2TUP0G+2Gd5slDF0M9HQ==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr100154wrn.190.1606247074433; 
 Tue, 24 Nov 2020 11:44:34 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/amd/amdgpu/gfx_v10_0: Make local function
 'gfx_v10_0_rlc_stop()' static
Date: Tue, 24 Nov 2020 19:38:12 +0000
Message-Id: <20201124193824.1118741-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmM6NTAwODo2OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmGdmeF92MTBfMF9ybGNfc3RvcOKAmSBbLVdtaXNzaW5nLXBy
b3RvdHlwZXNdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0Bs
aXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IGQ0NzYwZjRlMjY5YTEuLjllYjg4NmFl
NWEzNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC01MDA1LDcg
KzUwMDUsNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X2NzYihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBnZnhfdjEwXzBfcmxjX3N0b3Aoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCitzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmxjX3N0b3Ao
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJdTMyIHRtcCA9IFJSRUczMl9TT0MxNShH
QywgMCwgbW1STENfQ05UTCk7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
