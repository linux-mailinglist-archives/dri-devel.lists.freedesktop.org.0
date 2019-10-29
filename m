Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C577E8657
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 12:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3FE6E218;
	Tue, 29 Oct 2019 11:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F26B6E218
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 11:10:11 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id x5so1939475wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 04:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yXYGEaODJbeKbSOHFM3xoxL2a4me4Eamz1v3QkQLIQ=;
 b=ZFbamBy7MqAwKdVNhUZlj94ZpHAdvEsjlwdTPIGUPL3AtvLpZxNoTxfLtrQHIhjScE
 tH2Ejkqr8nOc3MlwAOcu3rMIB+IUAhlPChc+6XRql/kufuQonNfN5V1jvmYKyuMBdHqk
 Lc5xKqULCh6FjQIduI8dsNBurfdBs2fXv7WMsrfKWnICcMQU5Fb5mXhDtbMU4D3wztGc
 NwcHs9CSi647/4MBTvFMtqExOb09QypkqvIMlYQyb8rK/fvAFunhVTLCXYCH9e1y2DF7
 M0O/nkMN5eJygaRWjYxzyujlq/4Swr5oKGzE2MVhlXj9vVdYWiSXR9mWpUwyiU6pFCnm
 0vcA==
X-Gm-Message-State: APjAAAU0l0+iPfAJ1Kv/gjuLy1E9Yju2zI08praG5vo/B9EBHbG0aaRQ
 xEp7oRVkHhYSEJaZHeSIMqmGHH6s
X-Google-Smtp-Source: APXvYqyOS42+L0bMNQAQXlvHEbJYli0U3ewrtUqvJU1G+Lm/1dpj10dPtk1LwZyuToGK2UJ3jzQrjg==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr3438089wmi.17.1572347409466; 
 Tue, 29 Oct 2019 04:10:09 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 65sm25826288wrs.9.2019.10.29.04.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 04:10:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp: Increase link status size
Date: Tue, 29 Oct 2019 12:10:06 +0100
Message-Id: <20191029111006.358963-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yXYGEaODJbeKbSOHFM3xoxL2a4me4Eamz1v3QkQLIQ=;
 b=l8d+fwoQFguerlEV+yKzgT/bIXWLDrwaXrAFgRdpaGhT3AhxxeKmKV+MuavwSro1Oq
 mUOZINsxvUmVTI1gG9TjcXyYshwmcwhXde6VjriX8KVfxOiV6UIJkXexIq3hIPtkKMgJ
 8CMOtnX9DbqGL6oCjFkTjxlirm7uu8B21mE/YAeYA4Nm51fF3sKqaiRDxMZow11MvZaz
 V5gL2DgMujoJomfkIH96W8S8J13Fsrm+t14q6ZlaG8K+12Ogy2vgHJfuX15guZRQ5Gri
 6d6O6TxpuxASl5pqN13D4ib5JVyi4UDxa05C4qNBhyBQSrGpXAC6mMM1kPGeYAZvLMzQ
 gYlA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: coverity-bot <keescook+coverity-bot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBjdXJyZW50IGxp
bmsgc3RhdHVzIGNvbnRhaW5zIGJ5dGVzIDB4MjAyIHRocm91Z2ggMHgyMDcsIGJ1dCB3ZSBhbHNv
CndhbnQgdG8gbWFrZSBzdXJlIHRvIGluY2x1ZGUgdGhlIERQX0FESlVTVF9SRVFVRVNUX1BPU1Rf
Q1VSU09SMiAoMHgyMGMpCnNvIHRoYXQgdGhlIHBvc3QtY3Vyc29yIGFkanVzdG1lbnQgY2FuIGJl
IHF1ZXJpZWQgZHVyaW5nIGxpbmsgdHJhaW5pbmcuCgpSZXBvcnRlZC1ieTogY292ZXJpdHktYm90
IDxrZWVzY29vaytjb3Zlcml0eS1ib3RAY2hyb21pdW0ub3JnPgpBZGRyZXNzZXMtQ292ZXJpdHkt
SUQ6IDE0ODczNjYgKCJNZW1vcnkgLSBjb3JydXB0aW9ucyIpCkZpeGVzOiA3OTQ2NWUwZmZlYjkg
KCJkcm0vZHA6IEFkZCBoZWxwZXIgdG8gZ2V0IHBvc3QtY3Vyc29yIGFkanVzdG1lbnRzIikKU2ln
bmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCkkgdmFn
dWVseSByZWNhbGwgb25jZSBjYXJyeWluZyBhIHBhdGNoIHRvIGRvIHRoaXMsIGJ1dCBJIGNhbid0
IGZpbmQgYW55CnRyYWNlIG9mIGl0LgoKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaAppbmRleCA1MWVjYjUxMTJlZjguLjk1ODFkZWM5MDBiYSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aApAQCAtMTEyMSw3ICsxMTIxLDcgQEAKICNkZWZpbmUgRFBfTVNUX1BIWVNJQ0FMX1BPUlRfMCAw
CiAjZGVmaW5lIERQX01TVF9MT0dJQ0FMX1BPUlRfMCA4CiAKLSNkZWZpbmUgRFBfTElOS19TVEFU
VVNfU0laRQkgICA2CisjZGVmaW5lIERQX0xJTktfU1RBVFVTX1NJWkUJICAgMTEKIGJvb2wgZHJt
X2RwX2NoYW5uZWxfZXFfb2soY29uc3QgdTggbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0la
RV0sCiAJCQkgIGludCBsYW5lX2NvdW50KTsKIGJvb2wgZHJtX2RwX2Nsb2NrX3JlY292ZXJ5X29r
KGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
