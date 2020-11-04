Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4392A6E02
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 20:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22556E3EF;
	Wed,  4 Nov 2020 19:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D01C6E3EF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 19:36:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e2so3441727wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJlyn82FOfM7EXjR0q74MRu42lgfKXYpFARoLgEcKcw=;
 b=CDTWv8+b7Pc7euhcDEsYBH2s0hgrrGZ9dFeeb26B0gMt0vQRbHOkNYq12S81R2kSIb
 BkAZElbMwbidJp0VR2ZQrpMuxtaij6l4SS3iiFsKW8QQicUO0kgIo+9bHizDrHJSN/7i
 8aOmvSrphp4pnAsk4raJf8eABmQqhcqbtF86lo5/LYL3HQ5u/y5vVtfwc19HNURBk39W
 TmrGK+eFMC0IBsAxiOCp5WoexunKFDgC+MdbkeMV3/YLnbC7GDLyFT1NlqdhgeAJKI2T
 ZxTy7SwCJ2VQzBXSlfn77lrnQBilU8LpnRRDY2CaseHey2g0t+xd3ZnRCPrqr5TSTd3/
 jHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJlyn82FOfM7EXjR0q74MRu42lgfKXYpFARoLgEcKcw=;
 b=G5fhKkKNg2KD6WtKNdcudIuSFO+ibUYhxoV+g3IGErU6KCWQJKQCkva874DcAvp+J5
 59+yl02KGCrDihQWNreFf0VtW4dz0g8BvhJGoAXdwPU9xzAlF/pYirkyXjTzQ37tanXZ
 lF4ZLjAXHZ2YudauKqi/D44SK0SvMVqhexV0EEBGuxODlkrKEwjvao4pPY2IDmuRVwBY
 dWgTIYyhoOVfUG0xzLJRU8PL9+Y+AbBgz2cFEpqRKhGey6WAmrdHnzKlsq8dJ/jyzgOW
 U82QxeTueZE5yi6dl/hof7UVntDuh09YQyyrwsZOQLgcF5HOBoFULCM5lHR3Rq+cfgic
 nUBg==
X-Gm-Message-State: AOAM533CkZLIeEM9UqlXEA9IKJnzhb+RkuEJn0e39E2TGWWKsUmCmcyL
 kkiEIRdRCkbpftWVyNfz0492OQ==
X-Google-Smtp-Source: ABdhPJwCKoSo/a5+S17lYgSHyM7aF0XsUIOUlkwoI96HWyiOrIZnl0nWmrJK04DiKb1xktIaygjjXQ==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr5105765wmf.96.1604518603201; 
 Wed, 04 Nov 2020 11:36:43 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:36:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/36] tty: serial: serial-tegra: Provide some missing struct
 member descriptions
Date: Wed,  4 Nov 2020 19:35:43 +0000
Message-Id: <20201104193549.4026187-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
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
Cc: linux-serial@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy90dHkvc2VyaWFsL3NlcmlhbC10ZWdyYS5jOjk0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICdmaWZvX21vZGVfZW5hYmxlX3N0YXR1cycgbm90IGRlc2NyaWJlZCBpbiAn
dGVncmFfdWFydF9jaGlwX2RhdGEnCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsLXRlZ3JhLmM6
OTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3VhcnRfbWF4X3BvcnQn
IG5vdCBkZXNjcmliZWQgaW4gJ3RlZ3JhX3VhcnRfY2hpcF9kYXRhJwogZHJpdmVycy90dHkvc2Vy
aWFsL3NlcmlhbC10ZWdyYS5jOjk0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdtYXhfZG1hX2J1cnN0X2J5dGVzJyBub3QgZGVzY3JpYmVkIGluICd0ZWdyYV91YXJ0X2No
aXBfZGF0YScKIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWwtdGVncmEuYzo5NDogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZXJyb3JfdG9sZXJhbmNlX2xvd19yYW5nZScg
bm90IGRlc2NyaWJlZCBpbiAndGVncmFfdWFydF9jaGlwX2RhdGEnCiBkcml2ZXJzL3R0eS9zZXJp
YWwvc2VyaWFsLXRlZ3JhLmM6OTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1i
ZXIgJ2Vycm9yX3RvbGVyYW5jZV9oaWdoX3JhbmdlJyBub3QgZGVzY3JpYmVkIGluICd0ZWdyYV91
YXJ0X2NoaXBfZGF0YScKCkNjOiBMYXhtYW4gRGV3YW5nYW4gPGxkZXdhbmdhbkBudmlkaWEuY29t
PgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6
IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJuZWwub3JnPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRo
aWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52
aWRpYS5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzog
U3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogbGludXgtc2VyaWFsQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxp
bmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWwtdGVncmEu
YyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsLXRlZ3JhLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
c2VyaWFsLXRlZ3JhLmMKaW5kZXggYzM2M2VlMDQ3MGY0NS4uYmJhZTA3MmExMjVkYiAxMDA2NDQK
LS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbC10ZWdyYS5jCisrKyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC9zZXJpYWwtdGVncmEuYwpAQCAtODEsNiArODEsMTEgQEAKICAqIEBhbGxvd190eGZp
Zm9fcmVzZXRfZmlmb19tb2RlOiBhbGxvd190eCBmaWZvIHJlc2V0IHdpdGggZmlmbyBtb2RlIG9y
IG5vdC4KICAqCQkJVGVncmEzMCBkb2VzIG5vdCBhbGxvdyB0aGlzLgogICogQHN1cHBvcnRfY2xr
X3NyY19kaXY6IENsb2NrIHNvdXJjZSBzdXBwb3J0IHRoZSBjbG9jayBkaXZpZGVyLgorICogQGZp
Zm9fbW9kZV9lbmFibGVfc3RhdHVzOiBJcyBGSUZPIG1vZGUgZW5hYmxlZD8KKyAqIEB1YXJ0X21h
eF9wb3J0OiBNYXhpbXVtIG51bWJlciBvZiBVQVJUIHBvcnRzCisgKiBAbWF4X2RtYV9idXJzdF9i
eXRlczogTWF4aW11bSBzaXplIG9mIERNQSBidXJzdHMKKyAqIEBlcnJvcl90b2xlcmFuY2VfbG93
X3JhbmdlOiBMb3dlc3QgbnVtYmVyIGluIHRoZSBlcnJvciB0b2xlcmFuY2UgcmFuZ2UKKyAqIEBl
cnJvcl90b2xlcmFuY2VfaGlnaF9yYW5nZTogSGlnaGVzdCBudW1iZXIgaW4gdGhlIGVycm9yIHRv
bGVyYW5jZSByYW5nZQogICovCiBzdHJ1Y3QgdGVncmFfdWFydF9jaGlwX2RhdGEgewogCWJvb2wJ
dHhfZmlmb19mdWxsX3N0YXR1czsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
