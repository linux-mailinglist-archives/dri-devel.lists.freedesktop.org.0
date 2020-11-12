Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663572B0D17
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBF76E2D7;
	Thu, 12 Nov 2020 19:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA4B6E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so7191706wrw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1giXMZdt7DXXb4r+KpLOxZ7r3xrDsxCnH5SvILJq7Y=;
 b=ib0DToee6dhVaRCUYKKSQZMNQ/g4EomiT7zCeAwept+8CGssffnj+IMD9+KiqTmiZj
 SGEOXt3jJRypKYdUcKHv/clochvz8K0Thkh9J9nRJEr9WICmtddIe800t7AbEKn+kOFZ
 QOimSE57uPMsVNj95xM3N3msL0+JXs46v/cw3S5mzNx6M3Z5SMFThcN3/SLyEMNkCsoM
 uZZ5zQjvQ6ToX1qDTiXDHZJKKH29DcPFRIA9lWJ6ryGv21IT+mOjGFmoPVNwP6e89fPO
 1yJ9yzLTZKjqtYrAAXAlsWtnYc8H9MMNFADImPh+MXjWW5AY/Mn5BjDUvZvIr3Nutgf+
 Vwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1giXMZdt7DXXb4r+KpLOxZ7r3xrDsxCnH5SvILJq7Y=;
 b=bqn/8xJsw4RRGPvzaZzFbPGgusdUxOIJJ1kEo78p0LR7E2BbMZoFLSdmPfAnfXau0j
 VG5lGov39tVUVFSn1ggtewAc6r9lYI1UUlkurMUAVANe9NCW7/j0+Zq/P5qOWuoFnyZY
 MWuku16rePWU/wugHjsRP4Tjt9haO0XEiQlC/xEQ4f8ymeVC2HNdgBHtFN5suVbaVf/X
 7R9RtV6EoRYx77Aly5RMqewA99z2HhmjNrUi3OpBJtEmAxN+8s5rA6Gu66bBili/2Qmd
 Pvc4wKd0aMYUNuuWZlq93LrroiTTcObESL0ncWZFA9q9BOYsCz99DQ6Fz26v5QTwpVRB
 G9Mw==
X-Gm-Message-State: AOAM533rfHIheflSuoR9i70Z68EiC5XyK3Nysw46XZEy36dxaQP8w0Ah
 4CXaHsvH8JyGmGj72O7RKX33pw==
X-Google-Smtp-Source: ABdhPJzNHArCwbL4pI4uwIksua2841x4CDh9pe2Fw90mcckGWAkWLhZAVXF5LL+GbNyzZfSJFQ7Wfg==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr1119093wrv.266.1605207660599; 
 Thu, 12 Nov 2020 11:01:00 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/30] drm/amd/amdgpu/amdgpu_kms: Fix misnaming of parameter
 'dev'
Date: Thu, 12 Nov 2020 19:00:15 +0000
Message-Id: <20201112190039.2785914-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jOjQ4Nzogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAnZGV2JyBub3QgZGVzY3JpYmVkIGluICdhbWRncHVfaW5mb19p
b2N0bCcKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYzo0ODc6IHdhcm5p
bmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2FkZXYnIGRlc2NyaXB0aW9uIGluICdhbWRn
cHVfaW5mb19pb2N0bCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2tt
cy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCmluZGV4IGNlYzlhYWQ4YmRm
YTkuLjk4NzIxYWU5MzE4NDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21z
LmMKQEAgLTQ3NCw3ICs0NzQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9od19pcF9pbmZvKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LAogLyoqCiAgKiBhbWRncHVfaW5mb19pb2N0bCAtIGFuc3dl
ciBhIGRldmljZSBzcGVjaWZpYyByZXF1ZXN0LgogICoKLSAqIEBhZGV2OiBhbWRncHUgZGV2aWNl
IHBvaW50ZXIKKyAqIEBkZXY6IGRybSBkZXZpY2UgcG9pbnRlcgogICogQGRhdGE6IHJlcXVlc3Qg
b2JqZWN0CiAgKiBAZmlscDogZHJtIGZpbHAKICAqCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
