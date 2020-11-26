Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5552C5600
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7B6E950;
	Thu, 26 Nov 2020 13:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A186E950
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:42:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 1so2455285wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YuzX4IvswDkJ8SA2+BkBhvbot5/c2/3wXnFFxZJ8VHQ=;
 b=sRGeaUQGfXY/xtrrAXDFNvJrX3YKVvXloSsB437HHje8kVce4ACPjCwY2I+mqD4Ntn
 R36M0zwVsj+jWH9K0pApQNqSDZXF9SNbtgkJiBPwo3+1Dp3oZew2onO4cF/ygdNH90i8
 vLGPicCNcRFzYM5NkLCrj9rNXGTUnwxHYq+xeG56NMLOUvGZOgFBKSOL9m3DDDgQPQ3L
 zYo+cQnG6BEMvVyiquM9HL9I+WDDvXSJka74EwuqIxRA862k9s377J9nWHyMRAS2Zr+a
 cwVBb8x9aH+3e1v5ss4W8ZsDENgF0tKInWFDh3TT08apWnP+5+hfO3XmYMY/gaefgXdB
 NWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YuzX4IvswDkJ8SA2+BkBhvbot5/c2/3wXnFFxZJ8VHQ=;
 b=Yq9d0zYTlpQiHMluG3vKozo8oUl93jFtXVRDeBSK+3ooGj6CiEHPmJic+2BxokuBXv
 87fofDNmkxPBSjGcGqHKp0SCyyYiZmQwBPpcQV2+MxAOliT0/V6ADCM1nR7ayH4Euz72
 JZPEB+r9uLpjM0qjxghJq7HnBxsNXlg6aggOIQlTRWoIgfMlx5mBUx3zRguwcavpqGVS
 6rkYmLSPgMBCD5u3mwDG/EKFSYNbqDFXfyPCq4pdLXsDrpE6M+BfTczgW2kNhv6k9knY
 DfHdPtLu+LFdcrgbC4WgY2B21Ud2RVrroTLo69tripeGSc+bpChlCk959i80nOfHZS0z
 yJhg==
X-Gm-Message-State: AOAM530tOJVxsc5bC66/9sRG7hmjVL9nmoJJwTsPkFH8onoJUkZPVwcc
 vmNVmWOyOkduAfxwJhSngTjkng==
X-Google-Smtp-Source: ABdhPJxj15M1SEPtHn27yhWOhuSIur/4laupvsT3VboOtcpMEaD4/YV5Sx+xX9ZrHTm5GaKL0vlzZg==
X-Received: by 2002:a1c:2284:: with SMTP id i126mr3459973wmi.43.1606398165341; 
 Thu, 26 Nov 2020 05:42:45 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/40] drm/amd/pm/powerplay/smumgr/tonga_smumgr: Remove set
 but unused variable 'res'
Date: Thu, 26 Nov 2020 13:42:01 +0000
Message-Id: <20201126134240.3214176-2-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci90b25nYV9zbXVtZ3Iu
YzogSW4gZnVuY3Rpb24g4oCYdG9uZ2FfdGhlcm1hbF9zZXR1cF9mYW5fdGFibGXigJk6CiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9wb3dlcnBsYXkvc211bWdyL3RvbmdhX3NtdW1n
ci5jOjI0Njk6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVz4oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1k
LmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9zbXVtZ3IvdG9uZ2Ff
c211bWdyLmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9zbXVtZ3IvdG9uZ2Ffc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9zbXVtZ3IvdG9uZ2Ffc211bWdyLmMKaW5kZXggNGJmYWRiNDk1MjFiYy4uYzI4ZjNlMTI5
OTcwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdy
L3RvbmdhX3NtdW1nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3Nt
dW1nci90b25nYV9zbXVtZ3IuYwpAQCAtMjQ2Niw3ICsyNDY2LDYgQEAgc3RhdGljIGludCB0b25n
YV90aGVybWFsX3NldHVwX2Zhbl90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCXVpbnQz
Ml90IHRfZGlmZjEsIHRfZGlmZjIsIHB3bV9kaWZmMSwgcHdtX2RpZmYyOwogCXVpbnQxNl90IGZk
b19taW4sIHNsb3BlMSwgc2xvcGUyOwogCXVpbnQzMl90IHJlZmVyZW5jZV9jbG9jazsKLQlpbnQg
cmVzOwogCXVpbnQ2NF90IHRtcDY0OwogCiAJaWYgKCFwaG1fY2FwX2VuYWJsZWQoaHdtZ3ItPnBs
YXRmb3JtX2Rlc2NyaXB0b3IucGxhdGZvcm1DYXBzLApAQCAtMjUzOSwxMSArMjUzOCw5IEBAIHN0
YXRpYyBpbnQgdG9uZ2FfdGhlcm1hbF9zZXR1cF9mYW5fdGFibGUoc3RydWN0IHBwX2h3bWdyICpo
d21ncikKIAogCWZhbl90YWJsZS5GYW5Db250cm9sX0dMX0ZsYWcgPSAxOwogCi0JcmVzID0gc211
N19jb3B5X2J5dGVzX3RvX3NtYyhod21nciwKLQkJCQkJc211X2RhdGEtPnNtdTdfZGF0YS5mYW5f
dGFibGVfc3RhcnQsCi0JCQkJCSh1aW50OF90ICopJmZhbl90YWJsZSwKLQkJCQkJKHVpbnQzMl90
KXNpemVvZihmYW5fdGFibGUpLAotCQkJCQlTTUNfUkFNX0VORCk7CisJc211N19jb3B5X2J5dGVz
X3RvX3NtYyhod21nciwgc211X2RhdGEtPnNtdTdfZGF0YS5mYW5fdGFibGVfc3RhcnQsCisJCQkg
ICAgICAgKHVpbnQ4X3QgKikmZmFuX3RhYmxlLAorCQkJICAgICAgICh1aW50MzJfdClzaXplb2Yo
ZmFuX3RhYmxlKSwgU01DX1JBTV9FTkQpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
