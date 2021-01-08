Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C22EF8B0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEC96E8E1;
	Fri,  8 Jan 2021 20:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327916E8E1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i9so10169355wrc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B0vgdR8naA6iZCQ4IL55g07H1SHyqDXPDametYwo0Pg=;
 b=oLM/pC+rSUDP4ZUfp3a6s6i/HWBsHp9Du8iTI2RGZXxY1NVI07AaFBnwpdJlHwG0ri
 VQWy/Y4lQ4XMyQj7vkEB2ONHZswhsBNlxrWqZDqKyDwMCsD0tvwyuGX5oCvKMYmbJvDb
 K39uYXCmZbZuRkO4RkxnD88hGmVCmzqPdBvnFKoWaghzSw40LfLtM0F52BlernQZy5A7
 0+LUMRcbxP334bSPiCN3m1gjS8U5YoMbdS1BgCd6DO48LnFmd+Q+V4szxYZkFUmqmOix
 BGN6f5dDtv1T46Dye2RikAAdhcILtMNFQNof7yhedF7tFiwrW4S39SWbEhIwsG5JY1Mu
 bfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B0vgdR8naA6iZCQ4IL55g07H1SHyqDXPDametYwo0Pg=;
 b=fvlQ2Vl8ii9W+aS8FNqDtkSANJ4m+BVLUIU8lBIPK+1h4jpbvMfUJ8JiMu0XnlvGV7
 6KC/FQI1R/HGAc2sDkvwQOhWrpnvLUhpjHhZJLZW+aKhNiIzsLLfjlP8mZP4yXpgHgGJ
 9P5X5p+5zA70wewkSgHUNsGNJqdjSI4w9fnbSNMwCtAWyYsgkvDdf+RlHAkXzF/nhtn1
 05ZpCjdCw93+QkF8BdJf02ezGakb9biONIh7CDtp+fqNO9ikBfqXbC45XwHnMb5mcQcE
 AkBhofE3caEGBcDpwaIOBywiocuymxH00b6r47lFlru3UsP0uhP4qG8327cA/tSY/ZUT
 mYow==
X-Gm-Message-State: AOAM530w80myiQF9Q3a+RWxnPXXqk3ZJWZlYtG1GnU4yvOJboIVJFPe/
 MnYLKgi56tLouYoHxfEFXwoZKQ==
X-Google-Smtp-Source: ABdhPJyYiKLdjQp26AmRTUh/MggUIUNkwlTVFGf1EzxWSSuGPgRj9sazR71L7iqaa5Znm27QpNWWow==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr5243954wrw.73.1610136939823; 
 Fri, 08 Jan 2021 12:15:39 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/40] drm/amd/display/dc/dce/dce_stream_encoder: Remove
 unused variable 'regval'
Date: Fri,  8 Jan 2021 20:14:41 +0000
Message-Id: <20210108201457.3078600-25-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Eric Bernstein <eric.bernstein@amd.com>, dri-devel@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVy
LmM6IEluIGZ1bmN0aW9uIOKAmGRjZTExMF91cGRhdGVfZ2VuZXJpY19pbmZvX3BhY2tldOKAmToK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1f
ZW5jb2Rlci5jOjcwOjExOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZWd2YWzigJkgc2V0IGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBH
ZW9yZ2UgU2hlbiA8Z2VvcmdlLnNoZW5AYW1kLmNvbT4KQ2M6IEVyaWMgQmVybnN0ZWluIDxlcmlj
LmJlcm5zdGVpbkBhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYwppbmRleCBhZGE1N2Y3NDVm
ZDc2Li4yNjVlYWVmMzBhNTE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmMKQEAgLTY3LDcgKzY3LDYgQEAgc3Rh
dGljIHZvaWQgZGNlMTEwX3VwZGF0ZV9nZW5lcmljX2luZm9fcGFja2V0KAogCXVpbnQzMl90IHBh
Y2tldF9pbmRleCwKIAljb25zdCBzdHJ1Y3QgZGNfaW5mb19wYWNrZXQgKmluZm9fcGFja2V0KQog
ewotCXVpbnQzMl90IHJlZ3ZhbDsKIAkvKiBUT0RPRlBHQSBGaWd1cmUgb3V0IGEgcHJvcGVyIG51
bWJlciBmb3IgbWF4X3JldHJpZXMgcG9sbGluZyBmb3IgbG9jawogCSAqIHVzZSA1MCBmb3Igbm93
LgogCSAqLwpAQCAtOTksNyArOTgsNyBAQCBzdGF0aWMgdm9pZCBkY2UxMTBfdXBkYXRlX2dlbmVy
aWNfaW5mb19wYWNrZXQoCiAJfQogCS8qIGNob29zZSB3aGljaCBnZW5lcmljIHBhY2tldCB0byB1
c2UgKi8KIAl7Ci0JCXJlZ3ZhbCA9IFJFR19SRUFEKEFGTVRfVkJJX1BBQ0tFVF9DT05UUk9MKTsK
KwkJUkVHX1JFQUQoQUZNVF9WQklfUEFDS0VUX0NPTlRST0wpOwogCQlSRUdfVVBEQVRFKEFGTVRf
VkJJX1BBQ0tFVF9DT05UUk9MLAogCQkJCUFGTVRfR0VORVJJQ19JTkRFWCwgcGFja2V0X2luZGV4
KTsKIAl9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
