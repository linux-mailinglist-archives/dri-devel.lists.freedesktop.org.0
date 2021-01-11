Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46F2F1EEC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80D789F41;
	Mon, 11 Jan 2021 19:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B44B89F47
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id y187so6814wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8hv513vsZp6qynCGWUcfJy9FTxPQ6BFzk4Chw3OuBy8=;
 b=WAkCuQk0F0cFNo2i2icjnLHXZu6/AtR/W+lQYDsOEbh2dKMoKQrzIMKdNt4VhY3I8Y
 R7e8CPOiIwI1Blfe6yTx5CcZogAjcn0npxVrz1LIUpZVhztWnk09z/9ZGBwCsz2wLe3R
 W0UKrpG+CLWR2APa+jbQiW/J8+CgYCMEbi+B4nr0aJ7sBsBZc/ghuhQi3RzgSO/XbQBm
 8r42F/3sR+27TWQfYPVmX5NQOivmsE//6b5cgPevI7/fG3lWh0kMam3j48SGrDPnahAp
 1zO1Tmsr1I1pCn/MxY0knai5Jtg6Uy0w3RK+BldmZngTlYdEbSPsEEINRZAfe81GyJ9V
 4kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hv513vsZp6qynCGWUcfJy9FTxPQ6BFzk4Chw3OuBy8=;
 b=BGhrLy0l+dO0PjSYXFMPpc4jjNQ8+qQ3naMvX86SOUUAKZJCPdKb5n9GuHmh2HLi0A
 gmUOUyPVpo05Hn8shwHILmlSoI3EVDiZtAzKdN4OB1rHqTGvLCPbJM7J9C3wobhr/Qef
 VrLe/CIrCRRBdhzHLnAl+48tXQlLjSPU6BV7NR1eLO9XB8s5dDaVMnxR2OqThivnSGHC
 bF0bi7SxmYj6qDsOqNxUHaFTVJLFN9w6tLXBu2TdKz2KLwFKhznpoB1hztJidT+yKDNm
 8QAF/qBraFXTSiP0kdFRpKqN2twSWP1Lht7Hrnk5KMumOSB3fhhNPt/4k/BtalHzJWkd
 wUcA==
X-Gm-Message-State: AOAM532rl/HRKsx3XFkZmqcHyn8MOJmah/3KBt/LnirR8hTbITVi1Amd
 2+R3CBXQSXGQsjQzlQ/uAQy3hg==
X-Google-Smtp-Source: ABdhPJzFTT/KFmCGP/Vg84ProquKzYOmuLbrbBbxtcj51mQ9tF0x9wKBH+XCb8kwArWwtqfL05yyyQ==
X-Received: by 2002:a1c:bd87:: with SMTP id n129mr304132wmf.32.1610392806958; 
 Mon, 11 Jan 2021 11:20:06 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/amd/display/dc/calcs/dce_calcs: Demote
 non-conformant kernel-doc function headers
Date: Mon, 11 Jan 2021 19:19:14 +0000
Message-Id: <20210111191926.3688443-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzoyNzUz
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd2Ymlvcycgbm90IGRlc2Ny
aWJlZCBpbiAnaXNfZGlzcGxheV9jb25maWd1cmF0aW9uX3N1cHBvcnRlZCcKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmM6Mjc1Mzogd2Fy
bmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnY2FsY3Nfb3V0cHV0JyBub3QgZGVz
Y3JpYmVkIGluICdpc19kaXNwbGF5X2NvbmZpZ3VyYXRpb25fc3VwcG9ydGVkJwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYzozMDMwOiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjdHgnIG5vdCBkZXNjcmliZWQg
aW4gJ2J3X2NhbGNzJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9j
YWxjcy9kY2VfY2FsY3MuYzozMDMwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdkY2VpcCcgbm90IGRlc2NyaWJlZCBpbiAnYndfY2FsY3MnCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jOjMwMzA6IHdhcm5pbmc6
IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZiaW9zJyBub3QgZGVzY3JpYmVkIGluICdi
d19jYWxjcycKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY2FsY3Mv
ZGNlX2NhbGNzLmM6MzAzMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
cGlwZScgbm90IGRlc2NyaWJlZCBpbiAnYndfY2FsY3MnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jOjMwMzA6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3BpcGVfY291bnQnIG5vdCBkZXNjcmliZWQgaW4gJ2J3
X2NhbGNzJwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jYWxjcy9k
Y2VfY2FsY3MuYzozMDMwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdj
YWxjc19vdXRwdXQnIG5vdCBkZXNjcmliZWQgaW4gJ2J3X2NhbGNzJwoKQ2M6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5j
b20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
Q2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYyB8IDUgKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCmluZGV4IGY2OWMyYjg0ZDQz
MmIuLjk2N2Q2ZDgwYmQzOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jYWxjcy9kY2VfY2FsY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2FsY3MvZGNlX2NhbGNzLmMKQEAgLTI3NDMsNyArMjc0Myw3IEBAIHZvaWQgYndfY2FsY3Nf
aW5pdChzdHJ1Y3QgYndfY2FsY3NfZGNlaXAgKmJ3X2RjZWlwLAogCWtmcmVlKHZiaW9zKTsKIH0K
IAotLyoqCisvKgogICogQ29tcGFyZSBjYWxjdWxhdGVkIChyZXF1aXJlZCkgY2xvY2tzIGFnYWlu
c3QgdGhlIGNsb2NrcyBhdmFpbGFibGUgYXQKICAqIG1heGltdW0gdm9sdGFnZSAobWF4IFBlcmZv
cm1hbmNlIExldmVsKS4KICAqLwpAQCAtMzAxNCwxMyArMzAxNCwxMiBAQCBzdGF0aWMgYm9vbCBh
bGxfZGlzcGxheXNfaW5fc3luYyhjb25zdCBzdHJ1Y3QgcGlwZV9jdHggcGlwZVtdLAogCXJldHVy
biB0cnVlOwogfQogCi0vKioKKy8qCiAgKiBSZXR1cm46CiAgKgl0cnVlIC0JRGlzcGxheShzKSBj
b25maWd1cmF0aW9uIHN1cHBvcnRlZC4KICAqCQlJbiB0aGlzIGNhc2UgJ2NhbGNzX291dHB1dCcg
Y29udGFpbnMgZGF0YSBmb3IgSFcgcHJvZ3JhbW1pbmcKICAqCWZhbHNlIC0gRGlzcGxheShzKSBj
b25maWd1cmF0aW9uIG5vdCBzdXBwb3J0ZWQgKG5vdCBlbm91Z2ggYmFuZHdpZHRoKS4KICAqLwot
CiBib29sIGJ3X2NhbGNzKHN0cnVjdCBkY19jb250ZXh0ICpjdHgsCiAJY29uc3Qgc3RydWN0IGJ3
X2NhbGNzX2RjZWlwICpkY2VpcCwKIAljb25zdCBzdHJ1Y3QgYndfY2FsY3NfdmJpb3MgKnZiaW9z
LAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
