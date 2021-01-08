Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF392EF8A8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE186E8D5;
	Fri,  8 Jan 2021 20:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77C06E8D3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id a6so8731690wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mGH9J7vG9w88diVL7S4q4GpxhT0ewyJTldBss+diQXU=;
 b=PoNsSs56+BhMbOp3HWwYXgMD2QalVIqugoJIccivvlUXtTK6KydRosDvXV2ZMuK/j6
 V6deq3qJNwDrJvTtxb7rjmxTFTbONrxIeNL/zfclyDWG6Fn3P7ALgSPgu3EF4Cs7h1gO
 QZxb/a0xh4i64xWfdI1wyCJhnaWHq7gvEWk5XBusIVSbcBRJeaVcaKPSyAjQcin6JAsX
 e3aD9yBqliYSPffaP0lhXjbatKqzhsO3cZn/JuwGPbJUBYgkcGg9pspsR7XYLAjAezOQ
 trOtfe1OF81CcTOBCg2m0rxWecucTjnZDHJ1PtOw0qT/qF9F4x0mLHsKgtc6B4gxw12G
 HsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mGH9J7vG9w88diVL7S4q4GpxhT0ewyJTldBss+diQXU=;
 b=RLfvDYBZ8ejm0u7yykKr81xrn7CeLlAIWiOvz3MTSuhAkcgSq4Z1NJLnO/8rcuElUA
 1cVYE6T57VrR8gKlbxVB8lan4V6mBmPtbQ2GsE3nFV4KcSzjKQ9cRG7N6JcqphpE4jef
 kY+X7bBFKFpS5KXGxPm7FdTpNBL1RwgPiq3mUruTx+Fl4CacBIdxK58y8XYbONiHZYXA
 UMHOmcAt4sqXEIog4frBTjapKn31U+oPUer1CkP5E6BJYUkuDZk8SENDkDtnf+a1mYeQ
 z4BHMd5vUEdg7z+HyxK62YyZ3x99um0Zrkr3yWnjyIgTU7KGgy0MNFUa9RIHVVn3whV7
 Z/Lg==
X-Gm-Message-State: AOAM5333EDc3itz/fvAqTMc7I5H3oi2+oErCiDeQaqlD6rvegaLvh0Ni
 vI7OnyPEgTM4LfLkM/WvO9B33g==
X-Google-Smtp-Source: ABdhPJwK8AFiXaFBtq8APb9s+USZEr9/YOKlixvoWl/dOKnQX99kel0RW2cLzwRidX++r0XSx7n0KA==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr4586785wmd.159.1610136926583; 
 Fri, 08 Jan 2021 12:15:26 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/40] drm/amd/display/dc/bios/command_table_helper: Fix
 kernel-doc formatting
Date: Fri,  8 Jan 2021 20:14:32 +0000
Message-Id: <20210108201457.3078600-16-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVs
cGVyLmM6MTMxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd0JyBub3Qg
ZGVzY3JpYmVkIGluICdkYWxfY21kX3RhYmxlX2hlbHBlcl90cmFuc21pdHRlcl9icF90b19hdG9t
JwoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IE1hdXJvIFJvc3NpIDxpc3Nvci5vcnVhbUBnbWFpbC5jb20+
CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIC4uLi9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXIuYyAgICB8
IDIwICsrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlci5jCmluZGV4IDQ4YjRlZjAzZmM4Zjgu
LjViNzcyNTFlMDU5MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZV9oZWxwZXIuYwpAQCAtMTE0LDE4ICsxMTQsMTQg
QEAgYm9vbCBkYWxfY21kX3RhYmxlX2hlbHBlcl9jb250cm9sbGVyX2lkX3RvX2F0b20oCiB9CiAK
IC8qKgotKiB0cmFuc2xhdGVfdHJhbnNtaXR0ZXJfYnBfdG9fYXRvbQotKgotKiBAYnJpZWYKLSog
IFRyYW5zbGF0ZSB0aGUgVHJhbnNtaXR0ZXIgdG8gdGhlIGNvcnJlc3BvbmRpbmcgQVRPTSBCSU9T
IHZhbHVlCi0qCi0qIEBwYXJhbQotKiAgIGlucHV0IHRyYW5zbWl0dGVyCi0qICAgb3V0cHV0IGRp
Z2l0YWxUcmFuc21pdHRlcgotKiAgICAvLyA9MDA6IERpZ2l0YWwgVHJhbnNtaXR0ZXIxICggVU5J
UEhZIGxpbmtBQiApCi0qICAgIC8vID0wMTogRGlnaXRhbCBUcmFuc21pdHRlcjIgKCBVTklQSFkg
bGlua0NEICkKLSogICAgLy8gPTAyOiBEaWdpdGFsIFRyYW5zbWl0dGVyMyAoIFVOSVBIWSBsaW5r
RUYgKQotKi8KKyAqIHRyYW5zbGF0ZV90cmFuc21pdHRlcl9icF90b19hdG9tIC0gVHJhbnNsYXRl
IHRoZSBUcmFuc21pdHRlciB0byB0aGUKKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29ycmVzcG9uZGluZyBBVE9NIEJJT1MgdmFsdWUKKyAqIEB0OiB0cmFuc21pdHRlcgor
ICogcmV0dXJuczogb3V0cHV0IGRpZ2l0YWxUcmFuc21pdHRlcgorICogICAgLy8gPTAwOiBEaWdp
dGFsIFRyYW5zbWl0dGVyMSAoIFVOSVBIWSBsaW5rQUIgKQorICogICAgLy8gPTAxOiBEaWdpdGFs
IFRyYW5zbWl0dGVyMiAoIFVOSVBIWSBsaW5rQ0QgKQorICogICAgLy8gPTAyOiBEaWdpdGFsIFRy
YW5zbWl0dGVyMyAoIFVOSVBIWSBsaW5rRUYgKQorICovCiB1aW50OF90IGRhbF9jbWRfdGFibGVf
aGVscGVyX3RyYW5zbWl0dGVyX2JwX3RvX2F0b20oCiAJZW51bSB0cmFuc21pdHRlciB0KQogewot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
