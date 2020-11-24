Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEE2C30E0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E527B6E558;
	Tue, 24 Nov 2020 19:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18216E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a186so87834wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjbxtDMJ2mzJHY8erVLf4gsozStccXbO1UKtGEg99mY=;
 b=Ag7rhcl7/rvzeLuAHjQfgJaFLQTfabEOu2bp+usdtMNvawzlH0cWoeYgVAdlXm/biq
 ZuPZfgyx6m2NUQSEkBnlnJJgAXw7ZL9Gedeo4VS1wjsX5Hosf48qqXr8+c//c3dxeNRX
 v+AvpZmgpG4hKWD+bq6vwgrjIVLgu5N+EzNskBVkez4sbFuZu9H6EpivWUedWLSDWYK1
 mbF9KJ4sS+HvbukWNxWHNN25abdGc9B/vDEwX6zmmqtUntUPPJsgbCRMT85DKyPHbldD
 tc7RQJb0a8JDuMWutpdlsBpUPy5fyXLlIYLwhfDXXgG8vvGVl0QJ1NaL/tEHLpXs9bhj
 gX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjbxtDMJ2mzJHY8erVLf4gsozStccXbO1UKtGEg99mY=;
 b=hhi8+xf8jPcKA23DCGEezBHDsKLd1d1HWgEFCLZBQ80XX0N8diZiNA/7ZanP6jY3r0
 TRXuoiZfy+fqIspMeQWKaBWqquhLG+ibJWUwdIDAsc4OVMkd0QChED19psVTzHnMHEK2
 4daPR4ozhWbbwhZ9n7cj0hH/Ezdw/dVGaDLC7Dlummp1cDJdlQ9agJuvFPyoI9COtWOw
 qHfpmWDktv1HEeTXOXcJNgGhhGuj9ZgpWWVyp11kE6d+DtUmQbOYR1Yu1Rys4D72stk+
 KkQqdKLzfSyrOWnd7QLfoTw8+W+yyOrX4DV9rztLyNKT9qqnR+Pdp6a9fbMSyzshR8di
 H8HQ==
X-Gm-Message-State: AOAM530i1LkWRDWXlOH78tALtgMgPjR5T1o+6rLFNqf33irH25KJVrKV
 2GTkKtrHAKa3nuHWR3Jd7bAUjw==
X-Google-Smtp-Source: ABdhPJzUd+8fjzWTFYwiB6AmT0yaY7XFSUxHnPxdi5IjlskHBIh47RAs2kkFJmMSWrxtNAGoDb0o6Q==
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr188239wmd.182.1606247045448; 
 Tue, 24 Nov 2020 11:44:05 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/40] drm/amd/amdgpu/tonga_ih: Provide some missing
 descriptions for 'ih' and 'entry'
Date: Tue, 24 Nov 2020 19:37:49 +0000
Message-Id: <20201124193824.1118741-6-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvdG9uZ2FfaWguYzoxOTM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICd0b25nYV9paF9nZXRfd3B0
cicKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3RvbmdhX2loLmM6MjI1OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAndG9uZ2Ff
aWhfZGVjb2RlX2l2JwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdG9uZ2FfaWguYzoyMjU6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2VudHJ5JyBub3QgZGVzY3Jp
YmVkIGluICd0b25nYV9paF9kZWNvZGVfaXYnCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS90
b25nYV9paC5jOjI1NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgn
IG5vdCBkZXNjcmliZWQgaW4gJ3RvbmdhX2loX3NldF9ycHRyJwoKQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS90b25nYV9paC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdG9uZ2Ff
aWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3RvbmdhX2loLmMKaW5kZXggZTQwMTQw
YmY2Njk5Yy4uY2UzMzE5OTkzYjRiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdG9uZ2FfaWguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS90b25nYV9p
aC5jCkBAIC0xODEsNiArMTgxLDcgQEAgc3RhdGljIHZvaWQgdG9uZ2FfaWhfaXJxX2Rpc2FibGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAgKiB0b25nYV9paF9nZXRfd3B0ciAtIGdldCB0
aGUgSUggcmluZyBidWZmZXIgd3B0cgogICoKICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50
ZXIKKyAqIEBpaDogSUggcmluZyBidWZmZXIgdG8gZmV0Y2ggd3B0cgogICoKICAqIEdldCB0aGUg
SUggcmluZyBidWZmZXIgd3B0ciBmcm9tIGVpdGhlciB0aGUgcmVnaXN0ZXIKICAqIG9yIHRoZSB3
cml0ZWJhY2sgbWVtb3J5IGJ1ZmZlciAoVkkpLiAgQWxzbyBjaGVjayBmb3IKQEAgLTIxNSw2ICsy
MTYsOCBAQCBzdGF0aWMgdTMyIHRvbmdhX2loX2dldF93cHRyKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAogICogdG9uZ2FfaWhfZGVjb2RlX2l2IC0gZGVjb2RlIGFuIGludGVycnVwdCB2ZWN0
b3IKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKiBAaWg6IElIIHJpbmcg
YnVmZmVyIHRvIGRlY29kZQorICogQGVudHJ5OiBJViBlbnRyeSB0byBwbGFjZSBkZWNvZGVkIGlu
Zm9ybWF0aW9uIGludG8KICAqCiAgKiBEZWNvZGVzIHRoZSBpbnRlcnJ1cHQgdmVjdG9yIGF0IHRo
ZSBjdXJyZW50IHJwdHIKICAqIHBvc2l0aW9uIGFuZCBhbHNvIGFkdmFuY2UgdGhlIHBvc2l0aW9u
LgpAQCAtMjQ3LDYgKzI1MCw3IEBAIHN0YXRpYyB2b2lkIHRvbmdhX2loX2RlY29kZV9pdihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIHRvbmdhX2loX3NldF9ycHRyIC0gc2V0IHRoZSBJ
SCByaW5nIGJ1ZmZlciBycHRyCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgor
ICogQGloOiBJSCByaW5nIGJ1ZmZlciB0byBzZXQgcnB0cgogICoKICAqIFNldCB0aGUgSUggcmlu
ZyBidWZmZXIgcnB0ci4KICAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
