Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69751EDF76
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 10:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC29899B3;
	Thu,  4 Jun 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855796E2F9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:12:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j198so6255884wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tFPcYYVPEczCJNqu565ZZzRL31Ro7iqoJLud+V9/W6s=;
 b=MV7FJtoEKLyy0r+Z0KoFPEtyhRXEwQ/IbBpYLu8LO9Uc78Ax/2RYA4vzBMjtiJcK6p
 AdKwrHzr6dzh+N3ms51V1I6le1IjLWDF+LcV9lCl9LStGwUptD8GwQ/Htx2fZJN8DVly
 sAfPeJLEgUIdNH8S/XB9b4lCyMgUL5KbMtjSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tFPcYYVPEczCJNqu565ZZzRL31Ro7iqoJLud+V9/W6s=;
 b=WbcrPYFwegmfp9X28G/CUjaLTY+c13kSETwkaZc2eYS3Ff7QSQ3Iwg5qdEtPzJdE5o
 sGvX2GUA5lWmWVU/FlSuDIiQ98mZVY+25Oowx1l8CiYBGVvLR+qRywZKmv9fGhEHnCIo
 BAYfSPQXjnNaV7eMYs1+G4BfEC3s7HegI7imFzd3NyOWFYlF+Q7tdBbvlnlGbMr1LC5/
 Md+CXo1hRAnA9+W+KcwpATU2Eokp6mIwwQRztj7GjI6fhi3wk6jylKXMF/uLsc95zgTl
 1juzEUvTqDWGCKr15bJik0v8986Bq6U4NspVOjVIxNXpkKOvygSvlr72vz0wHQwBtyOx
 mdBA==
X-Gm-Message-State: AOAM530Lmc0uygma+28B2ZcME8BjKOE39qD+8kj8rAb4dGE0F9yR22bL
 crJiSqv8VLv6XfQucHjqAhCE4SZAf6I=
X-Google-Smtp-Source: ABdhPJwyTSsHObvqYxt5vjWFqYKxgNRr/Tg50mOhhgXdXRLp1pp0LpRagZgRAkv0R2QBG8+IZNWOoQ==
X-Received: by 2002:a7b:c18a:: with SMTP id y10mr3020133wmi.73.1591258374887; 
 Thu, 04 Jun 2020 01:12:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 01:12:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/18] drm/i915: Annotate dma_fence_work
Date: Thu,  4 Jun 2020 10:12:24 +0200
Message-Id: <20200604081224.863494-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aTkxNSBkb2VzIHRvbnMgb2YgYWxsb2NhdGlvbnMgZnJvbSB0aGlzIHdvcmtlciwgd2hpY2ggbG9j
a2RlcCBjYXRjaGVzLgoKQWxzbyBnZW5lcmljIGluZnJhc3RydWN0dXJlIGxpa2UgdGhpcyB3aXRo
IGJpZyBwb3RlbnRpYWwgZm9yIGhvdwpkbWFfZmVuY2Ugb3Igb3RoZXIgY3Jvc3MgZHJpdmVyIGNv
bnRyYWN0cyB3b3JrLCByZWFsbHkgc2hvdWxkIGJlCnJldmlld2VkIG9uIGRyaS1kZXZlbC4gSW1w
bGVtZW50aW5nIGN1c3RvbSB3aGVlbHMgZm9yIGV2ZXJ5dGhpbmcKd2l0aGluIHRoZSBkcml2ZXIg
aXMgYSBjbGFzc2ljIGNhc2Ugb2YgInBsYXRmb3JtIHByb2JsZW0iIFsxXS4gV2hpY2ggaW4KdXBz
dHJlYW0gd2UgcmVhbGx5IHNob3VsZG4ndCBoYXZlLgoKU2luY2UgdGhlcmUncyBubyBxdWljayB3
YXkgdG8gc29sdmUgdGhlc2Ugc3BsYXRzIChkbWFfZmVuY2Vfd29yayBpcwp1c2VkIGEgYnVuY2gg
aW4gYmFzaWMgYnVmZmVyIG1hbmFnZW1lbnQgYW5kIGNvbW1hbmQgc3VibWlzc2lvbikgbGlrZQpm
b3IgYW1kZ3B1LCBJJ20gZ2l2aW5nIHVwIGF0IHRoaXMgcG9pbnQgaGVyZS4gQW5ub3RhdGluZyBp
OTE1CnNjaGVkdWxlciBhbmQgZ3B1IHJlc2V0IGNvdWxkIHdvdWxkIGJlIGludGVyZXN0aW5nLCBi
dXQgc2luY2UgbG9ja2RlcAppcyBvbmUtc2hvdCB3ZSBjYW4ndCBzZWUgd2hhdCBzdXJwcmlzZXMg
d291bGQgbHVyayB0aGVyZS4KCjE6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy80NDM1MzEvCkNj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfc3dfZmVuY2Vfd29yay5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2ZlbmNlX3dvcmsu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc3dfZmVuY2Vfd29yay5jCmluZGV4IGEzYTgx
YmI4ZjJjMy4uNWI3NGFjYWRhZWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3N3X2ZlbmNlX3dvcmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2Zl
bmNlX3dvcmsuYwpAQCAtMTcsMTIgKzE3LDE1IEBAIHN0YXRpYyB2b2lkIGZlbmNlX3dvcmsoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewogCXN0cnVjdCBkbWFfZmVuY2Vfd29yayAqZiA9IGNv
bnRhaW5lcl9vZih3b3JrLCB0eXBlb2YoKmYpLCB3b3JrKTsKIAlpbnQgZXJyOworCWJvb2wgZmVu
Y2VfY29va2llOwogCisJZmVuY2VfY29va2llID0gZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmco
KTsKIAllcnIgPSBmLT5vcHMtPndvcmsoZik7CiAJaWYgKGVycikKIAkJZG1hX2ZlbmNlX3NldF9l
cnJvcigmZi0+ZG1hLCBlcnIpOwogCiAJZmVuY2VfY29tcGxldGUoZik7CisJZG1hX2ZlbmNlX2Vu
ZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CiAJZG1hX2ZlbmNlX3B1dCgmZi0+ZG1hKTsKIH0K
IAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
