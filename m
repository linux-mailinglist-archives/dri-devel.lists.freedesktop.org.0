Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2C82C30FA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B896E5B9;
	Tue, 24 Nov 2020 19:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180A16E529
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so5250088wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GsDkEPnukv2Vdk6eKkCyxgdzq1nylzzKySTODP9qfuE=;
 b=BAzGYM8m8GiMon4ZVqoLqEtdGvasSHBbWulfMGj2/kmgVvLHY2Rhl2KZKgRIERzWE1
 BdXkFVPeLYvZIifdk7PlzvY5sIWsjqU3Lm5Dt70+S0azALV57w7AEZP9vK/R9OQ2Av+0
 6Z3mXbbY2COkJyj1Ps15qLjrSbwM+mX0ffmHMS6/TP4dztACdQQ6w9Vf3HY2UTkokz8E
 +3xH5bu9VkDBLkv3j5W+t0GnC1F+Hb6aYldFKAIklSW/ThL9zmDhagmo5sme/1HEG5km
 E7hqzRbM+uqPILwHWsmZokfHxkKygB+MxUNebCXFX6V9q3d7vFdPNppSGnG+UPjZSwDh
 Hsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GsDkEPnukv2Vdk6eKkCyxgdzq1nylzzKySTODP9qfuE=;
 b=XfKL7eefVhAv3jv0yCmNRgaUchiDcIrsBRfDXzMOFeH8vNst7Y3OqYJtFqSTuaqkdC
 MusI9Vzh7g1iXPi9ZOrVpvA1sQlOXxdO+JrW1wbdDxZQ1jRIQJABpRoQxmY63zOBAXKl
 3yWCZWARPnXekdMzjIsq0mSL17q6ZttvvgyOsCSKOvcAcGRG8CraW/IEyD5BQEjWoTwp
 fJgmIS49xQamjntEMQankqFQrda98VXma08ZmV4YGahENVaca2wJ8NYorZ6HpYikwonm
 JL4eua+2MwizEJNmN0yvp8Z2P0aD0QTDJjEA1A6kYs4NAWuPUAONEPaz4TdHhvdKpAwg
 1TDw==
X-Gm-Message-State: AOAM531xCMPX1A+f/knr0kfsYQNwTZ6xAdbAHA7yuKyJQmR1trFpBsw5
 efeLchVtPustbJHtEa6wvnLzvA==
X-Google-Smtp-Source: ABdhPJz4IuEFWuDWKGOSXiMZv/BwXoAcxqMZeznOdIOMoH7V7z/8W5uykNyAXKnvZNXwFGbkJ9TW4Q==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr127799wrn.56.1606247082781;
 Tue, 24 Nov 2020 11:44:42 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/40] drm/amd/pm/swsmu/smu11/vangogh_ppt: Make local function
 'vangogh_set_default_dpm_tables()' static
Date: Tue, 24 Nov 2020 19:38:19 +0000
Message-Id: <20201124193824.1118741-36-lee.jones@linaro.org>
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzogQXQg
dG9wIGxldmVsOgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEv
dmFuZ29naF9wcHQuYzo3NjQ6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDi
gJh2YW5nb2doX3NldF9kZWZhdWx0X2RwbV90YWJsZXPigJkgWy1XbWlzc2luZy1wcm90b3R5cGVz
XQogNzY0IHwgaW50IHZhbmdvZ2hfc2V0X2RlZmF1bHRfZHBtX3RhYmxlcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSkKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBYaWFvamlhbiBE
dSA8WGlhb2ppYW4uRHVAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9z
d3NtdS9zbXUxMS92YW5nb2doX3BwdC5jIHwgOSArKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jCmluZGV4IDlhMmY3MmYyMWVkODYuLjA1YzMy
YmUzYTc0OTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEv
dmFuZ29naF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3Zh
bmdvZ2hfcHB0LmMKQEAgLTQwMCwxNiArNDAwLDEzIEBAIHN0YXRpYyBpbnQgdmFuZ29naF9nZXRf
Y3VycmVudF9hY3Rpdml0eV9wZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCQkg
ICAgICAgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCiAJCQkJCSAgICAgICB1aW50MzJfdCAq
dmFsdWUpCiB7Ci0JaW50IHJldCA9IDA7Ci0KIAlpZiAoIXZhbHVlKQogCQlyZXR1cm4gLUVJTlZB
TDsKIAogCXN3aXRjaCAoc2Vuc29yKSB7CiAJY2FzZSBBTURHUFVfUFBfU0VOU09SX0dQVV9MT0FE
OgotCQlyZXQgPSB2YW5nb2doX2dldF9zbXVfbWV0cmljc19kYXRhKHNtdSwKLQkJCQkJCSAgTUVU
UklDU19BVkVSQUdFX0dGWEFDVElWSVRZLAotCQkJCQkJICB2YWx1ZSk7CisJCXZhbmdvZ2hfZ2V0
X3NtdV9tZXRyaWNzX2RhdGEoc211LCBNRVRSSUNTX0FWRVJBR0VfR0ZYQUNUSVZJVFksCisJCQkJ
CSAgICAgdmFsdWUpOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlkZXZfZXJyKHNtdS0+YWRldi0+
ZGV2LCAiSW52YWxpZCBzZW5zb3IgZm9yIHJldHJpZXZpbmcgY2xvY2sgYWN0aXZpdHlcbiIpOwpA
QCAtNzYxLDcgKzc1OCw3IEBAIHN0YXRpYyBpbnQgdmFuZ29naF9vZF9lZGl0X2RwbV90YWJsZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBQUF9PRF9EUE1fVEFCCiAJcmV0dXJuIHJldDsK
IH0KIAotaW50IHZhbmdvZ2hfc2V0X2RlZmF1bHRfZHBtX3RhYmxlcyhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSkKK3N0YXRpYyBpbnQgdmFuZ29naF9zZXRfZGVmYXVsdF9kcG1fdGFibGVzKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KQogewogCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqc211X3Rh
YmxlID0gJnNtdS0+c211X3RhYmxlOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
