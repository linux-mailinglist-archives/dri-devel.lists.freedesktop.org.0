Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA60113740
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 22:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE2B6E94E;
	Wed,  4 Dec 2019 21:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B866E94E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 21:51:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so1444195wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 13:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DineaCUxtXZyF5eVfdeaHcVkj+3QG5rCu+T6TpNdzNc=;
 b=sBskHsVyNU6mCuLWdDUBqRGh2kSuvTNolhc6fvQ+eEe2F28p1Y71Oc4a1k/bSEJel7
 WCT3aEUONKIKAxuccVfofwebmQF7SliEAwBnRlD/8cn2bPFsu1B/HoQIWwAmzggWGNr0
 dO8z33GODyy5OwJzCbw04lc28wiuE8b3T8BUnu47bMK1dI8+XyLSVIIo51smwf/ajfxY
 STbIwv+ATRlh/arhEDGVaHLUxfW8Abz1e+3xsDpFkMwWi6vW2qowVnQKsT7Q7utu3gWP
 RKKXJzfOPZb7pUFE/AGTVjOLhKsesbvtzO8cWkC3j+HPzGGUtm7VBE5CEk10/vXNUXMO
 VTHQ==
X-Gm-Message-State: APjAAAVjXJphNXT0rX3SqbQzQXN8jX/Z2hUlLHcKJ54kZl4yjv7gjNJB
 o3BlRZmba8//HvUrsx2eIY4Xk+b+CH4=
X-Google-Smtp-Source: APXvYqyveN/NM/BqCSvK0XZhdEBxg9tIPSZ8AR1TcT/KyNPk7ZmH1z0FdS7gJAgyQXflfUm0wgxS1A==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr1816299wmi.0.1575496271035;
 Wed, 04 Dec 2019 13:51:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id q6sm10409464wrx.72.2019.12.04.13.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 13:51:10 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
Date: Wed,  4 Dec 2019 22:51:05 +0100
Message-Id: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DineaCUxtXZyF5eVfdeaHcVkj+3QG5rCu+T6TpNdzNc=;
 b=E/Dc2fcBEXg9O7rrLFl+CUNHdg6nwQObKTEeRjxJi0gerdcWN17OB1Ea/dURi+sIk8
 cmVlL3k2XKlvc+zkDeFbX1RK2rL500+re+kpty16NiyRNlWneVCjOVkguelrsDMleGQj
 EmkRXniI8+E4N6dlRuEeklPKwPuyRkHSlio40=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSd2ZSBzcGVudCBhIGJpdCB0b28gbXVjaCB0aW1lIHJldmlld2luZyBhbGwga2luZHMgb2YgdXNl
cnMgYWxsIG92ZXIKdGhlIGtlcm5lbCBmb3IgdGhpcyBidWZmZXIgc2hhcmluZyBpbmZyYXN0cnVj
dHVyZS4gQW5kIHNvbWUgb2YgaXQgaXMKYXQgbGVhc3QgcXVlc3Rpb25hYmxlLgoKTWFrZSBzdXJl
IHdlIGF0IGxlYXN0IHNlZSB3aGVuIHRoaXMgc3R1ZmYgZmxpZXMgYnkuCgpBY2tlZC1ieTogRGF2
ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0Br
ZXJuZWwub3JnPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwotLS0KIE1B
SU5UQUlORVJTIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDM3NWRiZWE4YmM4OC4uYzFlM2Rh
MmMxOTQ3IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNDk0
MSw2ICs0OTQxLDcgQEAgRjoJaW5jbHVkZS9saW51eC9kbWEtYnVmKgogRjoJaW5jbHVkZS9saW51
eC9yZXNlcnZhdGlvbi5oCiBGOglpbmNsdWRlL2xpbnV4LypmZW5jZS5oCiBGOglEb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvZG1hLWJ1Zi5yc3QKK0s6CWRtYV8oYnVmfGZlbmNlfHJlc3YpCiBUOgln
aXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCiAKIERNQSBHRU5F
UklDIE9GRkxPQUQgRU5HSU5FIFNVQlNZU1RFTQotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
