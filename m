Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA22B4DC6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C36D6EA09;
	Mon, 16 Nov 2020 17:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE69D6EA01
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so19704384wrx.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbt6Bt9xb+nEOL+sC88FIyMMDCRwxeU6Sb1wX9bISpg=;
 b=jjlCCiNIxsXpA+Jb25gKyWLrqTzlSWECuVTeXlKwqjUFgAiMxr2Kg1XsOu2FBDybwM
 wlRkZCxOJb/RWj0i6Uh14Z8mZESJ4jsc5a5m97NFCFK10sB7oe7LWCpmkBLNACoAEDGT
 XsH/kfY8Xy6dWH0+U1ERkrX4+wT77JWiLWRTDYONESCjRkl7SpP+eTUmq5S69un0s8x8
 tZlttEn9Mofc1vKl82qQa3htdJRCyrK6jakgRDCgIgeVn8u/bxzK6iGrPvoyWYFXKCOY
 U/LNolmUxpjXqFf14X66y15Q1pU0Ul51bCFk/mWMfRsyW4W+haj5BpTbHXJOfr3btsFP
 p8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbt6Bt9xb+nEOL+sC88FIyMMDCRwxeU6Sb1wX9bISpg=;
 b=pze/6pnAG6pop5kxwc9vfN6Iau1eZ2DuqRWMgHNeKyU1viJewnap7AQNfWpM3/aDaN
 /0u5s/64B88/RRzJ+qLlzUYNLMHj7Au+4eSeLvu54UoX8L8f63HA/O6qbEFz1SOBKB4z
 xHz6HCvXMJwVdvtxq/6AZC5lDGyyxQEMIaZwqwusGnt1A5lWnMzl5iW+cFZi7pGh+2q3
 jHs5sKzAuuPjg4Rg8wl0CEdccuVrjrpIa+NnI60kswgNFZ/ahEE5DMiiKoKTOC73EmVj
 kPmV6+gql6N2chJuZrdUbZ641ilNzSosb5cCzZpsZVVTmx9efQ0lHaPmD91j1gxE3U1B
 QO6g==
X-Gm-Message-State: AOAM531HeiFQmOqP+tK0nLYB7SeRT6SxQz8UhASHPlfgSZ1C1zKtVMnm
 Z2KjcjFwH/mROPdRW1yi671NhQ==
X-Google-Smtp-Source: ABdhPJxixVTfoinJ+pbMo9gBUuK0pz4maqlEmMuGBMn7mSWL5CMNmdd/xIpmu0aAD8lk+4XYjkVVsw==
X-Received: by 2002:adf:8521:: with SMTP id 30mr20985238wrh.265.1605548518655; 
 Mon, 16 Nov 2020 09:41:58 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/42] drm/selftests/test-drm_mm: Mark 'hole_end' as
 always_unused
Date: Mon, 16 Nov 2020 17:40:57 +0000
Message-Id: <20201116174112.1833368-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIG1hY3JvIGRybV9tbV9mb3JfZWFjaF9ob2xlKCkgJ2hvbGVfZW5kJyBpcyBwcm92aWRl
ZCBhcyBhCmNvbnRhaW5lciBmb3IgJ2hvbGVfc3RhcnQgKyBwb3MtPmhvbGVfc2l6ZScsIGJ1dCBp
cyBub3QgdXRpbGlzZWQgaW4KdGhpcyB1c2UtY2FzZS4gIFdlIGNhbm5vdCBzaW1wbHkgZGVsZXRl
IHRoZSB2YXJpYWJsZSwgc28gaGVyZSB3ZSB0ZWxsCnRoZSBjb21waWxlciB0aGF0IHdlJ3JlIGlu
dGVudGlvbmFsbHkgZGlzY2FyZGluZyB0aGUgcmVhZCB2YWx1ZS4KCkZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fbW0uYzogSW4gZnVuY3Rpb24g4oCYYXNzZXJ0X25vX2hvbGVz4oCZOgogZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jOjU3OjE4OiB3YXJuaW5nOiB2YXJp
YWJsZSDigJhob2xlX2VuZOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpDYzogTmlybW95IERhcyA8bmlybW95LmFpZW1kQGdtYWlsLmNvbT4K
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX21tLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3Qt
ZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKaW5kZXgg
OTVlMjEyYTlhNzRkMi4uYjc2OGI1M2M0YWVlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
dGVzdC1kcm1fbW0uYwpAQCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgaW50IGlndF9zYW5pdHljaGVj
ayh2b2lkICppZ25vcmVkKQogc3RhdGljIGJvb2wgYXNzZXJ0X25vX2hvbGVzKGNvbnN0IHN0cnVj
dCBkcm1fbW0gKm1tKQogewogCXN0cnVjdCBkcm1fbW1fbm9kZSAqaG9sZTsKLQl1NjQgaG9sZV9z
dGFydCwgaG9sZV9lbmQ7CisJdTY0IGhvbGVfc3RhcnQsIF9fYWx3YXlzX3VudXNlZCBob2xlX2Vu
ZDsKIAl1bnNpZ25lZCBsb25nIGNvdW50OwogCiAJY291bnQgPSAwOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
