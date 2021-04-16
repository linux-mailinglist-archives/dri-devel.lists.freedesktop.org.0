Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6F362273
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB31B6EBB5;
	Fri, 16 Apr 2021 14:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75896EBAA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:33 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g5so35778128ejx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EV1/WI0XFtiI+21vP83s/uEYxGv7mm0ay0nKpA5C64=;
 b=rAeQAepkPGd8RRBrjx7A0S/HNVWkMJN3LZ/HO3Uq44xiLqTZo99xBiIHSI8h8smrSk
 D3mN1W8ok0u9i/hZqpr9qPfK+TWzr+JKdNXL11/7hckcjzWm2CD0pF2PkHCIuMuVwHZl
 ry3u1F55TjgPmXuMC9/hAuIhzbRcI8iIBBP8OXP2o69Jd8OLahC9JXoKetjacP4mVMz1
 qKKosfQYMv2DmgONKYJuqQcIyQbG8jg5gsLFkyG6nF9W68YlSe1cSyyZKQBYGf/ecePU
 RO/CIZBwdMAwcBcO1pvVKhUKVHGHAwO4ilcjB0Cz56Sp2Plru6Xux8BWWlwHvlI/y3/s
 WuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1EV1/WI0XFtiI+21vP83s/uEYxGv7mm0ay0nKpA5C64=;
 b=klzBPzXYQJm5aSxWCbRSRzgx6bdXhiR5XiWGr/JLGMOkWIVrtHs2VfB1lJF2bNtl/W
 7PnRmxXc4AvmQwpIbr2S0nd4uZbIQQ1KuGQnFcPTtA+SAKd7V5ms9gV1RA4seck7nmkd
 7ijNLOP+JeYPyQgEf/x3nc64PkXiICqjAqNhDf3BpcF3hV54lYiFnG2zd96/EXXIJX+s
 iekCI/ROvf4n6no+geJHzEOeArysA1eRtA3Wjvj7mZJtG+on/ooCCtASm2nE6p8XIgrt
 sLHyohxxluq6gPs0owm/N1o1dW+HUhsSfJkSFZ36EmJhiouQlTpMw4bEfo+5E+NQr/LZ
 W8Vg==
X-Gm-Message-State: AOAM531hlC5sjK4evcVXdBXUuej2nVWcVzcp+qQ6M7lew8Ynd0djp4z/
 e1rpt/7VSAwXcwEp8I3N8GHCnQ==
X-Google-Smtp-Source: ABdhPJwB92Bysnaf6kcMoQ5pu+E9BrfDp1ehXDbDO0zVh0cfFbH0Cvf/Q1ZdxIV9Fo1L3lY/2BG9bg==
X-Received: by 2002:a17:906:704a:: with SMTP id
 r10mr8736436ejj.312.1618583852460; 
 Fri, 16 Apr 2021 07:37:32 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:31 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/40] drm/nouveau/dispnv50/disp: Remove unused variable 'ret'
Date: Fri, 16 Apr 2021 15:36:47 +0100
Message-Id: <20210416143725.2769053-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjEzODE6Njogd2FybmluZzogdmFyaWFi
bGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzICstLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCAxYzljMGNkZjg1ZGJjLi40ODAxYWFmZDk1
NTJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0xNDEwLDEw
ICsxNDEwLDkgQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKIHsK
IAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJhc2Uu
YmFzZS5kZXYpOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0OwogCiAJ
TlZfQVRPTUlDKGRybSwgIiVzOiBtc3RtIHByZXBhcmVcbiIsIG1zdG0tPm91dHAtPmJhc2UuYmFz
ZS5uYW1lKTsKLQlyZXQgPSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJm1zdG0tPm1ncik7
CisJZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOwogCiAJZHJtX2Zvcl9l
YWNoX2VuY29kZXIoZW5jb2RlciwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewogCQlpZiAo
ZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKLS0gCjIu
MjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
