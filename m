Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB7B2B4D2C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034789F3B;
	Mon, 16 Nov 2020 17:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DF66E042
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:17 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w24so36754wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZGU4hgv9ySSnT3lm5gi+Q8yFIEoSUWPQdVLIUJTRR4=;
 b=vjRgiF3sSV4IhUHRkfrW6zpxaiOTAP5+ndmpMJ5njzwICymUi4FgUOeakjFqSbhu4P
 Ux+bCPQFOWiIKcYf5U+jGLeG+dNLaoDVDRnxbur3utiqelyXUWvmqV5okLCcKN+XHXGK
 3PTAT4CET3cVGb445Pcpfunq48d+MHHvGL8PFGirnEA9uULw5eR0b38qaAFibnFf2Kg8
 Vv06ZwvmKCQdSstEOvE6BbwJlK4BDuM8nEZo67fVcHjSfstZ/2DVeffUp/aDK3dofOkn
 3AsUz+crAA5fDsvaAni98zlrqW8tFV4fJAe46+wuXXTDPWp3Dt6Dr0c1P+61dZyZYABK
 cSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZGU4hgv9ySSnT3lm5gi+Q8yFIEoSUWPQdVLIUJTRR4=;
 b=fpHNdvq7J7yFO5JW+bGRyXr8NgUnO2uDXICGP3pTBqa8bZ3zUqRQuv8qqwpKOMYM3c
 DhNN08UIq5HxwKswwDNd+TcMGR6apRhPh8LlTtzWcSK0UtPvBWD9Q7yTckLgN63DY3Kz
 GkythNzTHrdMRkLwmJdhulQqvGMMLjliIsyTBpd1XsUDdpWdCDvk67A6agUUgWiB59wy
 i7/JWU2TpbYB1NJyP/TQPZMRzZ2jLvECatfhRhxsGAstm0Gj/aRyOXF161kLRqjaYXNU
 Y9n5H1DZVY/dHLrmjJnQ24xIGEJBtj1p1shmkNJUy/AYaDNqXy/17RTgM2k20h1f+2Mp
 KfmA==
X-Gm-Message-State: AOAM532CmGkvwHrRe5q12kIxVbd+wQSRYdrUZBn8UGcyXZPUQWWabq6V
 Y8/Z5oPve17p0zSEj3WKwOgoQg==
X-Google-Smtp-Source: ABdhPJxbzdfNIyAFT2LF3a9ZdTCAEIeELmy4y2jPN9Zvr+QlzxMIe75PBAOzGqb0m2oCDoDMXOde/Q==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr23442wmi.42.1605548235694;
 Mon, 16 Nov 2020 09:37:15 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/43] drm/radeon/radeon_irq_kms: Demote non-conformant
 kernel-doc fix another
Date: Mon, 16 Nov 2020 17:36:25 +0000
Message-Id: <20201116173700.1830487-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpcnEnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9kcml2ZXJf
aXJxX2hhbmRsZXJfa21zJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5j
OjU2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdhcmcnIG5vdCBkZXNj
cmliZWQgaW4gJ3JhZGVvbl9kcml2ZXJfaXJxX2hhbmRsZXJfa21zJwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25faXJxX2ttcy5jOjU3MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnbicgbm90IGRlc2NyaWJlZCBpbiAncmFkZW9uX2lycV9rbXNfc2V0X2lycV9u
X2VuYWJsZWQnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pcnFfa21zLmM6NTcxOiB3
YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdudW0nIGRlc2NyaXB0aW9uIGluICdy
YWRlb25faXJxX2ttc19zZXRfaXJxX25fZW5hYmxlZCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25faXJxX2ttcy5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9pcnFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9p
cnFfa21zLmMKaW5kZXggYjg2YmM4OGFkNDMwOC4uYTI0MmI2MDUzZDQ3ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYwpAQCAtNDMsMTEgKzQzLDkgQEAKIAogI2RlZmlu
ZSBSQURFT05fV0FJVF9JRExFX1RJTUVPVVQgMjAwCiAKLS8qKgorLyoKICAqIHJhZGVvbl9kcml2
ZXJfaXJxX2hhbmRsZXJfa21zIC0gaXJxIGhhbmRsZXIgZm9yIEtNUwogICoKLSAqIEBpbnQgaXJx
LCB2b2lkICphcmc6IGFyZ3MKLSAqCiAgKiBUaGlzIGlzIHRoZSBpcnEgaGFuZGxlciBmb3IgdGhl
IHJhZGVvbiBLTVMgZHJpdmVyIChhbGwgYXNpY3MpLgogICogcmFkZW9uX2lycV9wcm9jZXNzIGlz
IGEgbWFjcm8gdGhhdCBwb2ludHMgdG8gdGhlIHBlci1hc2ljCiAgKiBpcnEgaGFuZGxlciBjYWxs
YmFjay4KQEAgLTU0OSwxNCArNTQ3LDE0IEBAIHZvaWQgcmFkZW9uX2lycV9rbXNfZGlzYWJsZV9o
cGQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHVuc2lnbmVkIGhwZF9tYXNrKQogfQogCiAv
KioKLSAqIHJhZGVvbl9pcnFfa21zX3VwZGF0ZV9pbnRfbiAtIGhlbHBlciBmb3IgdXBkYXRpbmcg
aW50ZXJydXB0IGVuYWJsZSByZWdpc3RlcnMKKyAqIHJhZGVvbl9pcnFfa21zX3NldF9pcnFfbl9l
bmFibGVkIC0gaGVscGVyIGZvciB1cGRhdGluZyBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVycwog
ICoKICAqIEByZGV2OiByYWRlb24gZGV2aWNlIHBvaW50ZXIKICAqIEByZWc6IHRoZSByZWdpc3Rl
ciB0byB3cml0ZSB0byBlbmFibGUvZGlzYWJsZSBpbnRlcnJ1cHRzCiAgKiBAbWFzazogdGhlIG1h
c2sgdGhhdCBlbmFibGVzIHRoZSBpbnRlcnJ1cHRzCiAgKiBAZW5hYmxlOiB3aGV0aGVyIHRvIGVu
YWJsZSBvciBkaXNhYmxlIHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIKICAqIEBuYW1lOiB0aGUgbmFt
ZSBvZiB0aGUgaW50ZXJydXB0IHJlZ2lzdGVyIHRvIHByaW50IHRvIHRoZSBrZXJuZWwgbG9nCi0g
KiBAbnVtOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIgdG8gcHJpbnQgdG8g
dGhlIGtlcm5lbCBsb2cKKyAqIEBuOiB0aGUgbnVtYmVyIG9mIHRoZSBpbnRlcnJ1cHQgcmVnaXN0
ZXIgdG8gcHJpbnQgdG8gdGhlIGtlcm5lbCBsb2cKICAqCiAgKiBIZWxwZXIgZm9yIHVwZGF0aW5n
IHRoZSBlbmFibGUgc3RhdGUgb2YgaW50ZXJydXB0IHJlZ2lzdGVycy4gQ2hlY2tzIHdoZXRoZXIK
ICAqIG9yIG5vdCB0aGUgaW50ZXJydXB0IG1hdGNoZXMgdGhlIGVuYWJsZSBzdGF0ZSB3ZSB3YW50
LiBJZiBpdCBkb2Vzbid0LCB0aGVuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
