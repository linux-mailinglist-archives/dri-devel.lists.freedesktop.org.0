Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CE42EF8A3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61436E8BF;
	Fri,  8 Jan 2021 20:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958266E8D2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id e25so9469095wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4SPpSIEaIrZDfJcedbk8KPV+52H3SX44Cb4d3Gm68s=;
 b=k7hMmuN9Mb+20/4OO7wQuc1oKHtEPsh/19e+lUDbPYvmWJu/srmWM995pmehzaT1Nt
 ng+E2Mkj79EDdVAn6pxmRY36XYlU15z00rRXqJsXSGOgkEI2km/GkIE1xJUqPHf2TF2n
 mX90IH/olI2G7GcXXszjf7zSuhid43l7s0KKKFO92GGL4LmtgDn8yS3tn5xNAcqG9BQU
 B08ApRr5fNmTgp8gxDyf3n8qWDXBIp1pmHBUv7s6ICuqnPOSsSxxJb0yGvYmA84qXuGP
 JQuKUN4IrFvyrkCI8n0O90r2WgluMSsVuRVWSyMmle7TrSzhSUdGEhT+URBE3mZyj7r+
 YM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4SPpSIEaIrZDfJcedbk8KPV+52H3SX44Cb4d3Gm68s=;
 b=Xlq/NjSZylDcahm7zWh2aD4HRvp6ag4hiaD3Sqb35K+X11+ZBKFAQkMM1NWhOGHlTc
 J1ULa9XcnO2kufGuPRXNYtAtcUh0Hqu1ki8Y0vJk5y/3daVwDGgNe7X4bIPZjNtdr97Q
 Svkbg05DR9l19pGA3NnhZv1j4+FoT4RjYwIqNEgMzHB1pbHMFCkhWHZFN4GzHZNqS+mW
 weDd3NBxk4jKV8APSN7EikgvX6LLtqoUNSaCFye9FwZO71g34Ah1oBuP7CyP+w6Dfs0U
 kuVQyoI7OSJgxbFbRp49QVJ5aPwDERyOrq/E+wk0GSFsinoyWSAMipDzBiBtPp4k/pmJ
 D2Hg==
X-Gm-Message-State: AOAM531l4mzzUkl2O/3wCbNvTnE2xJD3OPyoUfNw+drh0vLzkbCaGDI9
 9UYfDCQo0LpuRt0jBv1cTVLtCg==
X-Google-Smtp-Source: ABdhPJzV759FP44vxnGcXlBzVi2i/a5jpPiEkWCUxJ6icXlO23FXxSjFXcyMHwGRNCEllrCD5gooQQ==
X-Received: by 2002:a7b:c45a:: with SMTP id l26mr4501753wmi.91.1610136919275; 
 Fri, 08 Jan 2021 12:15:19 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move prototype into
 shared header
Date: Fri,  8 Jan 2021 20:14:28 +0000
Message-Id: <20210108201457.3078600-12-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5j
OjU0NzQ6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh2ZWdhMTBfaHdt
Z3JfaW5pdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9o
d21nci5jICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3
bWdyL3ZlZ2ExMF9od21nci5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9o
d21nci9od21nci5jCmluZGV4IDZhN2RlOGI4OThmYWYuLmYyY2VmMDkzMGFhOTYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwpAQCAtMzMsNiAr
MzMsNyBAQAogI2luY2x1ZGUgInBwc21jLmgiCiAjaW5jbHVkZSAiYW1kX2FjcGkuaCIKICNpbmNs
dWRlICJwcF9wc20uaCIKKyNpbmNsdWRlICJ2ZWdhMTBfaHdtZ3IuaCIKIAogZXh0ZXJuIGNvbnN0
IHN0cnVjdCBwcF9zbXVtZ3JfZnVuYyBjaV9zbXVfZnVuY3M7CiBleHRlcm4gY29uc3Qgc3RydWN0
IHBwX3NtdW1ncl9mdW5jIHNtdThfc211X2Z1bmNzOwpAQCAtNDYsNyArNDcsNiBAQCBleHRlcm4g
Y29uc3Qgc3RydWN0IHBwX3NtdW1ncl9mdW5jIHZlZ2ExMl9zbXVfZnVuY3M7CiBleHRlcm4gY29u
c3Qgc3RydWN0IHBwX3NtdW1ncl9mdW5jIHNtdTEwX3NtdV9mdW5jczsKIGV4dGVybiBjb25zdCBz
dHJ1Y3QgcHBfc211bWdyX2Z1bmMgdmVnYTIwX3NtdV9mdW5jczsKIAotZXh0ZXJuIGludCB2ZWdh
MTBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKIGV4dGVybiBpbnQgc211MTBf
aW5pdF9mdW5jdGlvbl9wb2ludGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKIAogc3RhdGlj
IGludCBwb2xhcmlzX3NldF9hc2ljX3NwZWNpYWxfY2FwcyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3Zl
Z2ExMF9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEwX2h3bWdyLmgKaW5kZXggZjc1MmI0YWQwYzhhZS4uMDdjMDZmOGM5MGIwOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdy
LmgKQEAgLTQ0Miw1ICs0NDIsNiBAQCBpbnQgdmVnYTEwX3VwZGF0ZV91dmRfZHBtKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IsIGJvb2wgYmdhdGUpOwogaW50IHZlZ2ExMF91cGRhdGVfc2FtdV9kcG0o
c3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCBiZ2F0ZSk7CiBpbnQgdmVnYTEwX3VwZGF0ZV9h
Y3BfZHBtKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGJvb2wgYmdhdGUpOwogaW50IHZlZ2ExMF9l
bmFibGVfZGlzYWJsZV92Y2VfZHBtKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGJvb2wgZW5hYmxl
KTsKK2ludCB2ZWdhMTBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKIAogI2Vu
ZGlmIC8qIF9WRUdBMTBfSFdNR1JfSF8gKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
