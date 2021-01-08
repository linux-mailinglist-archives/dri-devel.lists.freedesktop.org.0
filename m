Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449762EF89F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCAE6E8CA;
	Fri,  8 Jan 2021 20:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CEC6E8CF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id k10so8748814wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ynto/MZpBe5G42s9vReiED0PRGKZttvk/p9R7rGmhMU=;
 b=j5gRi8kb1z9r9v0Wmdcr1/+GgOq0BvFyxJd3BMOSmd4YTFM9odpHw4ntJ7o8srreTK
 S+xjPLLW6HLRvT3SnpwpcsrZ6FjgNgB9VKnHAMH+LkkNEPfWTGHknUnph7WJ+0t402qx
 lZVdInz3sXRPqLHWXmm6oPdMFtEm0C41JiZYtbEdkuSbsa44LvSHR2DR/G5EEKK+Z8nN
 fPmxUsaC/tqeOXjSV9F3HDn81aNwuhIdvjg2dDQM3HQHU+YpmYvr5SbxP0Gjpb5wxsl5
 orEaLRKjsqCfTCOsLh2r/OzNDWUTWM6P63onC+JtQKk2z0ulnnB6/Owyd1hvoNIy6478
 rJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ynto/MZpBe5G42s9vReiED0PRGKZttvk/p9R7rGmhMU=;
 b=QokktH5vRQBMHnytOCwWC0DckYJk3tjoACEQKXN+Se8g389u97Sn2/lKKyq0iHMWhC
 lhD4VewieC4uefwq4WKOrDzUtQE32HoWA0hSAwDxlA/u/ZG32hxw8jgaINDymYXmy0Xp
 pWDP930W/H+Zg/uKD7GthclCzG704A5r+gBYEBaSZFYfhK3fLb3CUg5Qnn9Kyx4Is6JE
 Hbo6f4KKl/bH+IXbRRZLE+xuRpCtzB2vrQcBvxK4vviVv0q+aU43W5XdLoBhf0tE20oa
 YEDBSc1VzIYBdaFaHNGU5aKLriil+x2O/muAoaKSoWgS16ertv/t7oPbjC7u6ddPohwI
 sryQ==
X-Gm-Message-State: AOAM533upYm5zRdsCTi39ZL9pnJfUR9xxNy5EmhUNRz25nSmYnY52jM5
 eMND/16fRG9B2RDAmBzIv2rSLA==
X-Google-Smtp-Source: ABdhPJxAsGGcg5ElEg6lbsPL0Qt2RrOVM2OAs+h+KSs4vC433L+e+4yx8PbxvRflV0mz9r7K5QcWjQ==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr4489592wmr.162.1610136913799; 
 Fri, 08 Jan 2021 12:15:13 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/40] drm/amd/pm/powerplay/hwmgr/ppatomctrl: Fix
 documentation for 'mpll_param'
Date: Fri,  8 Jan 2021 20:14:24 +0000
Message-Id: <20210108201457.3078600-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3BwYXRvbWN0cmwuYzoy
OTA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ21wbGxfcGFyYW0nIG5v
dCBkZXNjcmliZWQgaW4gJ2F0b21jdHJsX2dldF9tZW1vcnlfcGxsX2RpdmlkZXJzX3NpJwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3BwYXRvbWN0cmwu
YzoyOTA6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2RpdmlkZXJzJyBkZXNj
cmlwdGlvbiBpbiAnYXRvbWN0cmxfZ2V0X21lbW9yeV9wbGxfZGl2aWRlcnNfc2knCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5jOjMz
OTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbXBsbF9wYXJhbScgbm90
IGRlc2NyaWJlZCBpbiAnYXRvbWN0cmxfZ2V0X21lbW9yeV9wbGxfZGl2aWRlcnNfdmknCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBhdG9tY3RybC5j
OjMzOTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZGl2aWRlcnMnIGRlc2Ny
aXB0aW9uIGluICdhdG9tY3RybF9nZXRfbWVtb3J5X3BsbF9kaXZpZGVyc192aScKCkNjOiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL3BwYXRvbWN0cmwuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9od21nci9wcGF0b21jdHJsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci9wcGF0b21jdHJsLmMKaW5kZXggODNhNjUwNGUwOTNjYi4uYjEw
MzhkMzBjOGRjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkv
aHdtZ3IvcHBhdG9tY3RybC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5
L2h3bWdyL3BwYXRvbWN0cmwuYwpAQCAtMjc5LDcgKzI3OSw3IEBAIHN0YXRpYyBjb25zdCBBVE9N
X1ZPTFRBR0VfT0JKRUNUX1YzICphdG9tY3RybF9sb29rdXBfdm9sdGFnZV90eXBlX3YzKAogICoK
ICAqIEBod21ncjogICAgICAgICAgIGlucHV0IHBhcmFtZXRlcjogcG9pbnRlciB0byBId01ncgog
ICogQGNsb2NrX3ZhbHVlOiAgICAgaW5wdXQgcGFyYW1ldGVyOiBtZW1vcnkgY2xvY2sKLSAqIEBk
aXZpZGVyczogICAgICAgIG91dHB1dCBwYXJhbWV0ZXI6IG1lbW9yeSBQTEwgZGl2aWRlcnMKKyAq
IEBtcGxsX3BhcmFtOiAgICAgIG91dHB1dCBwYXJhbWV0ZXI6IG1lbW9yeSBjbG9jayBwYXJhbWV0
ZXJzCiAgKiBAc3Ryb2JlX21vZGU6ICAgICBpbnB1dCBwYXJhbWV0ZXI6IDEgZm9yIHN0cm9iZSBt
b2RlLCAgMCBmb3IgcGVyZm9ybWFuY2UgbW9kZQogICovCiBpbnQgYXRvbWN0cmxfZ2V0X21lbW9y
eV9wbGxfZGl2aWRlcnNfc2koCkBAIC0zMzIsNyArMzMyLDcgQEAgaW50IGF0b21jdHJsX2dldF9t
ZW1vcnlfcGxsX2RpdmlkZXJzX3NpKAogICoKICAqIEBod21ncjogICAgICAgICAgICAgICAgIGlu
cHV0IHBhcmFtZXRlcjogcG9pbnRlciB0byBId01ncgogICogQGNsb2NrX3ZhbHVlOiAgICAgICAg
ICAgaW5wdXQgcGFyYW1ldGVyOiBtZW1vcnkgY2xvY2sKLSAqIEBkaXZpZGVyczogICAgICAgICAg
ICAgIG91dHB1dCBwYXJhbWV0ZXI6IG1lbW9yeSBQTEwgZGl2aWRlcnMKKyAqIEBtcGxsX3BhcmFt
OiAgICAgICAgICAgIG91dHB1dCBwYXJhbWV0ZXI6IG1lbW9yeSBjbG9jayBwYXJhbWV0ZXJzCiAg
Ki8KIGludCBhdG9tY3RybF9nZXRfbWVtb3J5X3BsbF9kaXZpZGVyc192aShzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyLAogCQl1aW50MzJfdCBjbG9ja192YWx1ZSwgcHBfYXRvbWN0cmxfbWVtb3J5X2Ns
b2NrX3BhcmFtICptcGxsX3BhcmFtKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
