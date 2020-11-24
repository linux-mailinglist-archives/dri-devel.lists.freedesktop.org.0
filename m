Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0292D2C30E4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B526E56A;
	Tue, 24 Nov 2020 19:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9976E544
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so80863wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tr6g3sY0MoTTAswpPOODkkh+Vew/Ispj+AKTskHKpgk=;
 b=qiXoIqvCMOLUq4U1R3LxpHUjrA2UfLXQwtIgcDg/bve9rBIcBU6zvTPTLWB8mU41mJ
 yNesZnheuX8iEimQVaX1MYgbUJuApVl8SKZDd94qb8h193gkXpIH4PHoCquNcUd2KUaZ
 qzyEWjwYNhlCEelu6/qgYmDAobsZCOXW7W/HY6wDZFUzMWzzUnDs9v7Fmcbjb1xzc27f
 9ZWepClRYIMa51Ty4Y/zahsIuPV7OHEC8Xz6kwomcfX7mNkdRZ/C8vy+FvdBYVNk4Pvv
 oqekY5Z5AMTu68tqKvBMEgM8QLEU/5s/+28bdXHPb3z0kOt3tUzcm+Xx/kktIquRTN1G
 +Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tr6g3sY0MoTTAswpPOODkkh+Vew/Ispj+AKTskHKpgk=;
 b=VZPOH9u6KWdem9/e4ZTGr4naX9uxxDQyVXg20f1DUrA0t/nTaW8XsCUIvbg/DSJNlV
 GUPVH7AAlJV6RnFeNAqJHm6LsINkJQB5kWo5f0Ovdl4VWWrfnIw2Wf6JkH1OzzUqUS6a
 t9zFImyVUdDQJVq2Fupp2uu6B/Bq9xPFOmNk64uGKzT3Ctm8KgLJwH6vupwHQx2SmT8Q
 obOYf8bgBo9YUs5ijVNZeoItMrFc7pfXNeMUP2qaSFKLuKGkaQkkIrU3s4g+TLt30/US
 EU1NYDXQV5K7xlkx1qaMIQH7Uc/L09TT3FC3CCmN1vCY7Qvo/QGn1amgS5UC5F724xro
 2pUA==
X-Gm-Message-State: AOAM530jVJqnxEbc55lG/Ogc1o0buQSC31qlgCjscC3A+yI72XVDn4pE
 Td3dw744vHk6rcOACRFyx9RzXw==
X-Google-Smtp-Source: ABdhPJwuxJm/b/b0AS806h+qGtDQjuuTjAOa1Z/OoKhj44vaUS2oJoYRXaRfeQaotdc6Y/JsjXoHRA==
X-Received: by 2002:a05:600c:414b:: with SMTP id
 h11mr61966wmm.89.1606247046524; 
 Tue, 24 Nov 2020 11:44:06 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/40] drm/amd/amdgpu/cz_ih: Add missing function param
 descriptions for 'ih' and 'entry'
Date: Tue, 24 Nov 2020 19:37:50 +0000
Message-Id: <20201124193824.1118741-7-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvY3pfaWguYzoxOTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICdjel9paF9nZXRfd3B0cicKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2N6X2loLmM6MjIzOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnY3pfaWhfZGVjb2RlX2l2
JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY3pfaWguYzoyMjM6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2VudHJ5JyBub3QgZGVzY3JpYmVkIGluICdjel9paF9k
ZWNvZGVfaXYnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jel9paC5jOjI1Mzogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNjcmliZWQgaW4gJ2N6
X2loX3NldF9ycHRyJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jel9paC5jIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY3pfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2N6X2loLmMKaW5kZXggMWRjYTBjYWJjMzI2YS4uZGEzN2Y4YTkwMGFmYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY3pfaWguYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9jel9paC5jCkBAIC0xNzksNiArMTc5LDcgQEAgc3RhdGljIHZvaWQgY3pf
aWhfaXJxX2Rpc2FibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiBjel9paF9nZXRf
d3B0ciAtIGdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0cgogICoKICAqIEBhZGV2OiBhbWRncHVf
ZGV2aWNlIHBvaW50ZXIKKyAqIEBpaDogSUggcmluZyBidWZmZXIgdG8gZmV0Y2ggd3B0cgogICoK
ICAqIEdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0ciBmcm9tIGVpdGhlciB0aGUgcmVnaXN0ZXIK
ICAqIG9yIHRoZSB3cml0ZWJhY2sgbWVtb3J5IGJ1ZmZlciAoVkkpLiAgQWxzbyBjaGVjayBmb3IK
QEAgLTIxMyw2ICsyMTQsOCBAQCBzdGF0aWMgdTMyIGN6X2loX2dldF93cHRyKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAogICogY3pfaWhfZGVjb2RlX2l2IC0gZGVjb2RlIGFuIGludGVycnVw
dCB2ZWN0b3IKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAaWg6IElI
IHJpbmcgYnVmZmVyIHRvIGRlY29kZQorICogQGVudHJ5OiBJViBlbnRyeSB0byBwbGFjZSBkZWNv
ZGVkIGluZm9ybWF0aW9uIGludG8KICAqCiAgKiBEZWNvZGVzIHRoZSBpbnRlcnJ1cHQgdmVjdG9y
IGF0IHRoZSBjdXJyZW50IHJwdHIKICAqIHBvc2l0aW9uIGFuZCBhbHNvIGFkdmFuY2UgdGhlIHBv
c2l0aW9uLgpAQCAtMjQ1LDYgKzI0OCw3IEBAIHN0YXRpYyB2b2lkIGN6X2loX2RlY29kZV9pdihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIGN6X2loX3NldF9ycHRyIC0gc2V0IHRoZSBJ
SCByaW5nIGJ1ZmZlciBycHRyCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgor
ICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBzZXQgcnB0cgogICoKICAqIFNldCB0aGUgSUggcmlu
ZyBidWZmZXIgcnB0ci4KICAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
