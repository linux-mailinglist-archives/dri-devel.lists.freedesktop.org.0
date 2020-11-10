Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E32ADF6E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580B689C07;
	Tue, 10 Nov 2020 19:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B7789BFC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so4300478wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sNPdGWABv4jG6EjCUZH3w6oQTK+ox++FdPmHOUbRD6w=;
 b=fASKJQ1F2LCs/AXSrcItfdLVqsf0CAL2+ISvgcB4CsEelSk6mnK06tXoPNySTK7MHU
 1TEc5IRZOgZd6Q+mBlBBeCLeVUEo7SuJqHyCRR9YXaMmYcLXdhPNTgxIFrRW+Mh/TBVy
 2R0rZoZXmlUx7+E+do7U1FoKSGq6OyO/n8XM74q9QAJN8kiU3gqLtgxe7Twd8VZ0ZQr6
 BzEzhavEf5cCFsfsimr552j4Kqo7jIJ3YNsiNF2ht4DN0WNJJ+eSrIcXid5p/sbfUHdb
 MVorhUAzWurm5GkOqUYzYaThJsDwVkA5gWpGY6HJZZItFJohZ6GAEU17mxG6lF2296+z
 FhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNPdGWABv4jG6EjCUZH3w6oQTK+ox++FdPmHOUbRD6w=;
 b=SwOaV7m3dQfoPwyQQ8vud90xe4k2mIqOT2XyWPnUPIuKySBRDTcnp16+hPkkvIsJWW
 QcHUwAjGSxI4itJvuiPBDhgzDKJE1OAX7ty50Quz+h3qSeXEFCj06IBW5lgqisrppTHj
 EvFVXXIXMKODLGOukQGpAQn7910ulYfsQ6XzRIRBF2IbBO7C42hOnneANtDdtMK9vT12
 xYcNlz6YmAED+OtMj2Ke3g3sbeRDyC9u59eZPPhnNFG0LL3JliHfS9Fyfnk5se+II+vF
 JRCi0Mdm5R8Dbcmc4x2tZUckV+e5+kq7cZPsJi5IYZunNnC7/gBdCUuw5HTLfNM0sv9G
 JqCg==
X-Gm-Message-State: AOAM532+L8XGkuy7ihAdgg8cGqpdKpAiD90+dWOYEfDTr0kCdv1Tjkmp
 vAZFkpNrVACGQ2BMOViOOxGaRw==
X-Google-Smtp-Source: ABdhPJwbSyUwCQvxoTz0sM425fPOU7xGkt033a2qrUmzUxTVV2GqCTMp1AIaiNCG/Jfa0ilVVhAaOA==
X-Received: by 2002:a1c:b041:: with SMTP id z62mr713702wme.183.1605036695387; 
 Tue, 10 Nov 2020 11:31:35 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/30] drm/radeon/cik_sdma: Demote vague attempt at kernel-doc
Date: Tue, 10 Nov 2020 19:30:57 +0000
Message-Id: <20201110193112.988999-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jOjk0OTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlciAncmluZycgbm90IGRlc2NyaWJlZCBpbiAnY2lrX2RtYV92bV9mbHVzaCcK
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYzo5NDk6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ3ZtX2lkJyBub3QgZGVzY3JpYmVkIGluICdjaWtfZG1hX3Zt
X2ZsdXNoJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jOjk0OTogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncGRfYWRkcicgbm90IGRlc2NyaWJlZCBpbiAn
Y2lrX2RtYV92bV9mbHVzaCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+
CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npa19zZG1hLmMgfCA0
ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npa19zZG1hLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2Npa19zZG1hLmMKaW5kZXggNjg0MDNlNzc3NTZkMy4uM2M3MDllYmU4ZDFh
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYwpAQCAtOTM2LDExICs5MzYsOSBAQCB2b2lk
IGNpa19zZG1hX3ZtX3BhZF9pYihzdHJ1Y3QgcmFkZW9uX2liICppYikKIAkJaWItPnB0cltpYi0+
bGVuZ3RoX2R3KytdID0gU0RNQV9QQUNLRVQoU0RNQV9PUENPREVfTk9QLCAwLCAwKTsKIH0KIAot
LyoqCisvKgogICogY2lrX2RtYV92bV9mbHVzaCAtIGNpayB2bSBmbHVzaCB1c2luZyBzRE1BCiAg
KgotICogQHJkZXY6IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgotICoKICAqIFVwZGF0ZSB0aGUgcGFn
ZSB0YWJsZSBiYXNlIGFuZCBmbHVzaCB0aGUgVk0gVExCCiAgKiB1c2luZyBzRE1BIChDSUspLgog
ICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
