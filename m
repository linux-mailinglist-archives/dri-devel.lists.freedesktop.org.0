Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B693C2EF8A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657646E8CF;
	Fri,  8 Jan 2021 20:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEB86E8C7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id v14so8750097wml.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=In1Q+qm5MHof1cMenavqGuBcxDO1piRqNKsllQjE02s=;
 b=F0x9Z4fMGLhfw4n1u93Uhq62eitL0BqRg63/OQZI2nqJtMtnb9XFw10b/oNSbZ/Cc0
 q31JJtFD6ZTSRwnAx4cJeg4an6vd/rYODFPbszdZtF93dGSF1MRSxMcgIEJOX6vMwZX+
 EqyACqU4CLHmNULkAudqGDWMnThQDuoKmVRbS7LWZW+kxv8MP4xtylC6wA+JIKcVlkdy
 7PKpzIU37QV483rrhKqjjM1TFYouFh0iiXuRKQm4l+0NVaAIecM2G1PIps8vSmApgcFQ
 0NeVx4QXyNmRNjJZyPvJjFrytki1lBlcvL3D6nGE1jt8TKEJRI4f6Ab0SIhiTiu8K+gJ
 iwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=In1Q+qm5MHof1cMenavqGuBcxDO1piRqNKsllQjE02s=;
 b=cxF0+HBXSPhMClN1iOzcwmhKLvi973f+rmtSrt2QVqsn+tJ/Ti/FMABqYGQQJrai95
 lZ17mkFVABFyUovL1zDz+79cI0ICLwBqHoOoLResJdrR/p/huUzr012udut8HHaq2Dl2
 3o5CPaNawBVBf/eqIkMMXtq8via/YRxoAZOiNDV+na+ozY9/VMzIeOIxyBGE4ZsD8bPh
 piaW0oUy/k+nxw481E/vBT4oBl2Kvx9CZiVAnmLuk4YrxzbcPL03EiPoKSD+U1yZrVwq
 ftTw6UGmzZmpZEBJ8okgxUkcFiJcgBknc8kWPIdZONHEDdwkFkDZjjnlnN5t1bGv9clE
 ZXbQ==
X-Gm-Message-State: AOAM532sDLYR6/kIWoKHer3SzwkHDuzXcCLtmedeunDt/H1USz6MrfX1
 Bpio3dPPbjOzv6nJm6ZZOoUsmA==
X-Google-Smtp-Source: ABdhPJwFSK+0YlIspGTWyuvGUJ0/L03PXFBojprO/7tBVgl4tWjcjgXy4YV3r9026QikmhFjfkBElg==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr4479570wmj.52.1610136915105;
 Fri, 08 Jan 2021 12:15:15 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/40] drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Fix legacy
 function header formatting
Date: Fri,  8 Jan 2021 20:14:25 +0000
Message-Id: <20210108201457.3078600-9-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5j
OjcyODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaHdtZ3InIG5vdCBk
ZXNjcmliZWQgaW4gJ3ZlZ2ExMl9pbml0X3NtY190YWJsZScKCkNjOiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdy
L3ZlZ2ExMl9od21nci5jIHwgMTEgKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwppbmRleCBkYzIwNmZhODhjNWU1Li5j
MDc1MzAyOWE4ZTJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxh
eS9od21nci92ZWdhMTJfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9od21nci92ZWdhMTJfaHdtZ3IuYwpAQCAtNzE4LDEyICs3MTgsMTEgQEAgc3RhdGljIGlu
dCB2ZWdhMTJfc2F2ZV9kZWZhdWx0X3Bvd2VyX3Byb2ZpbGUoc3RydWN0IHBwX2h3bWdyICpod21n
cikKICNlbmRpZgogCiAvKioKLSogSW5pdGlhbGl6ZXMgdGhlIFNNQyB0YWJsZSBhbmQgdXBsb2Fk
cyBpdAotKgotKiBAcGFyYW0gICAgaHdtZ3IgIHRoZSBhZGRyZXNzIG9mIHRoZSBwb3dlcnBsYXkg
aGFyZHdhcmUgbWFuYWdlci4KLSogQHBhcmFtICAgIHBJbnB1dCAgdGhlIHBvaW50ZXIgdG8gaW5w
dXQgZGF0YSAoUG93ZXJTdGF0ZSkKLSogQHJldHVybiAgIGFsd2F5cyAwCi0qLworICogSW5pdGlh
bGl6ZXMgdGhlIFNNQyB0YWJsZSBhbmQgdXBsb2FkcyBpdAorICoKKyAqIEBod21ncjogIHRoZSBh
ZGRyZXNzIG9mIHRoZSBwb3dlcnBsYXkgaGFyZHdhcmUgbWFuYWdlci4KKyAqIHJldHVybjogIGFs
d2F5cyAwCisgKi8KIHN0YXRpYyBpbnQgdmVnYTEyX2luaXRfc21jX3RhYmxlKHN0cnVjdCBwcF9o
d21nciAqaHdtZ3IpCiB7CiAJaW50IHJlc3VsdDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
