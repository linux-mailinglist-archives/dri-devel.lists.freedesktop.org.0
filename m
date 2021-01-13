Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AF2F45BB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A38189EAE;
	Wed, 13 Jan 2021 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455C589F0A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:07:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y23so716446wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3c09B7R1bDDRXGkxc3zYuL5FdMguU7F3ASarhgkkjYk=;
 b=Ke29S0ckRABZRt5qaiIctSaJXdhgxyEOAbb+lrGjHH1heF05KLBmidxzRCinjxGbsl
 yn+acgZowbs+SW5i8xy0YiLb6/vzQHz1FI/FFNsPWlSA8mciP787U5U+rWyGhaPAPTE6
 W3Juay2xlCPWy4fQJdzS9QlgYba9pB5pLOJlc8Gc1cCokpty0a4RMuYjbAxzd97hpPbb
 w5UjdWee4uUdmxsy3ICv8xQFCrN9/9mVfpW8pqq38Lp6VYnmvx/eTyL6kdNRPiOad4mO
 NvbBx80+MSILnDc84d7iW0X1Shhj1GDMhSA5R11IISAKv2baeSscTtfgGU+6123gR2OX
 m56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3c09B7R1bDDRXGkxc3zYuL5FdMguU7F3ASarhgkkjYk=;
 b=Tp4+I1UoeQ6DBu/5Y8Pt3HxCUdOnKcEuxMPCJnim7YnxVKvkAt2/V7rZdaSXxtPF/R
 uwaSjOJPAGRwfOsH4FjsQMowInbyrKzVj2mokiMFKJzyQ01tsnZH+2eBq2MkDmZd7xuL
 IDQpuWBfeAC3Vcr+/BtFqjK6OuCy8pc1i+Ns4B1FbtfBXMQDhFvVmf+FJooAWUaZzm1e
 jcjvtF2WQM+yYSOulmQdLF6BnRre8DvxVtCa4dmsL9T+G2ouVGptd7pWZ8f8/uuAcu4G
 FqC6fA4PjtAOtSaq8wsnVlDvoJPueuEi0DEnWl85/yxZUskzFkPhbeFNX1T8UftLHOHH
 rWdw==
X-Gm-Message-State: AOAM531Ul78WPZIfKcLfdOGhUFuoq/QGFvrYJZvFGBkySh5kqOjEuWBQ
 8ancppH9IGf64kopCw3ZKK4e7Q==
X-Google-Smtp-Source: ABdhPJzFZznC3mc+syBSkyi9EiTbDy+X0VVbtJPk+qXMX1WPaf2niMuM9Omp5aPWXqpVk0/5XmSQMA==
X-Received: by 2002:a05:600c:224b:: with SMTP id
 a11mr931054wmm.97.1610525276970; 
 Wed, 13 Jan 2021 00:07:56 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:07:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/30] drm/amd/display/dc/dc_helper: Include our own header,
 containing prototypes
Date: Wed, 13 Jan 2021 08:07:23 +0000
Message-Id: <20210113080752.1003793-2-lee.jones@linaro.org>
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
Cc: Noah Abradjian <noah.abradjian@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY19oZWxwZXIuYzoyOTk6MTA6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZ2VuZXJpY19yZWdfZ2V04oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvZGMvZGNfaGVscGVyLmM6MzA3OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUg
Zm9yIOKAmGdlbmVyaWNfcmVnX2dldDLigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY19oZWxwZXIuYzozMTc6MTA6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZ2VuZXJpY19yZWdfZ2V0M+KAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2RjX2hlbHBlci5jOjMyOToxMDogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBl
IGZvciDigJhnZW5lcmljX3JlZ19nZXQ04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmM6MzQzOjEwOiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGdlbmVyaWNfcmVnX2dldDXigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9kY19oZWxwZXIuYzozNTk6MTA6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYZ2VuZXJpY19yZWdfZ2V0NuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjX2hlbHBlci5jOjM3NzoxMDog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhnZW5lcmljX3JlZ19nZXQ34oCZ
IFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rp
c3BsYXkvZGMvZGNfaGVscGVyLmM6Mzk3OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5
cGUgZm9yIOKAmGdlbmVyaWNfcmVnX2dldDjigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY19oZWxwZXIuYzo1MDM6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhnZW5lcmljX3dyaXRlX2luZGly
ZWN0X3JlZ+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2RjX2hlbHBlci5jOjUxMToxMDogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhnZW5lcmljX3JlYWRfaW5kaXJlY3RfcmVn4oCZIFstV21pc3Np
bmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNfaGVscGVyLmM6NTI5OjEwOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKA
mGdlbmVyaWNfaW5kaXJlY3RfcmVnX2dldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjX2hlbHBlci5jOjU2MDoxMDog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhnZW5lcmljX2luZGlyZWN0X3Jl
Z191cGRhdGVfZXjigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+
CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IE5vYWggQWJyYWRqaWFuIDxub2FoLmFicmFkamlhbkBhbWQuY29tPgpDYzogUm9kcmlnbyBTaXF1
ZWlyYSA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1i
eTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19oZWxwZXIuYwppbmRl
eCA1N2VkYjI1ZmMzODEyLi5hNjEyYmE2ZGMzODk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjX2hlbHBlci5jCkBAIC0zNCw2ICszNCw3IEBACiAKICNpbmNsdWRlICJkYy5o
IgogI2luY2x1ZGUgImRjX2RtdWJfc3J2LmgiCisjaW5jbHVkZSAicmVnX2hlbHBlci5oIgogCiBz
dGF0aWMgaW5saW5lIHZvaWQgc3VibWl0X2RtdWJfcmVhZF9tb2RpZnlfd3JpdGUoCiAJc3RydWN0
IGRjX3JlZ19oZWxwZXJfc3RhdGUgKm9mZmxvYWQsCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
