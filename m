Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C11A82CB5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CBF6E2FF;
	Tue,  6 Aug 2019 07:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996338955D;
 Mon,  5 Aug 2019 17:21:46 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so36670911pla.7;
 Mon, 05 Aug 2019 10:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=0FCyF18aUxWJ9+t/F+A4A3WWkl75FHwlH6+LVDGD7ag=;
 b=qDQGMkVhTJjsOYpp+fCJDdKsF7rlnw8Hked4d+P0vN9UwyOglr4YSZO2pbBWYKKODm
 BjDdbRpp0XIvdajswPc52wD+0ihelYacIY4aWRnQVfWZASDB1HeKZPgo1Zu2BnpGunYw
 /IRpAM8WYH+eEjY5GIXgdKdrkyybFAajS87x/Cta3MtfRi01pNUFN7bYN8wyLK/ct/KY
 2EGRL+jN9qVTGiXByMQs2Nc56uy8J433n58e7xNyX+EaHaY1xbROgKJ0+fj5IuEWUT7E
 GhgYJwcf9i3iUj8PU5HKsiposakF3hXIZThXU+U8gyxXLjrFPeNPFb1MtUrDggexhUtW
 xnlA==
X-Gm-Message-State: APjAAAXXbe4QqXVZORBiJRnVNuzMJZfXWcPVoPD9aaCjP7rVYEAWkx+N
 Jnpn3QXeCDqEw6JPwCp+Krg=
X-Google-Smtp-Source: APXvYqwIV0N1dyFjX7btKHmWvmn/Ut5d5y1exafohtGaYFcDrT2pwhL9Hwn9FlvYtNxUNgd7qo9Ozg==
X-Received: by 2002:a17:902:b28b:: with SMTP id
 u11mr138820204plr.11.1565025706185; 
 Mon, 05 Aug 2019 10:21:46 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id a1sm51451703pgh.61.2019.08.05.10.21.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 10:21:44 -0700 (PDT)
Date: Mon, 5 Aug 2019 22:51:38 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: amd: powerplay: Remove logically dead code
Message-ID: <20190805172138.GA4534@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=0FCyF18aUxWJ9+t/F+A4A3WWkl75FHwlH6+LVDGD7ag=;
 b=ABgb8foKstHmdhUxms2DovOOlq0l6QUHJViGEydEwgLscdMO/d4R5xr24wgG/b9Njb
 xcKnwHC2tWjjn2mJyhoWkeOHQ3ODIWTHIyEDBM4eB00Pv+pliKAu7ayOLNZwIC+Gs4EX
 MjlZplzIDkpfxHvd9xRqJNj/UdO0FSfBx2aAdloj0JJNctBGZS1i/x0Vt7VRK2Ir8Mxa
 5myOML+3JiGBgtsmTTY70Q+/lnpKX0AXLikbOrV5WXB7z16A/o/vWOGkVcS9AAkVxqDy
 8eAof8yxGaWtroJLaC/BDtTLRLdGYSsLunmoJl3+j09won7gc8CIyIVC9fphSkNdgGtP
 yc5g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVzdWx0IG9mIHBvaW50ZXIgYWlydGhtZW50aWMgaXMgbmV2ZXIgbnVsbAoKZml4IGNvdmVyaXR5
IGRlZmVjdDoxNDUxODc2CgpTaWduZWQtb2ZmLWJ5OiBIYXJpcHJhc2FkIEtlbGFtIDxoYXJpcHJh
c2FkLmtlbGFtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjExXzAuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKaW5kZXggZWU3MzljMC4uYTNhY2Q3
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKQEAgLTczNiw4
ICs3MzYsNiBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF93cml0ZV93YXRlcm1hcmtzX3RhYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211KQogCXN0cnVjdCBzbXVfdGFibGUgKnRhYmxlID0gTlVMTDsK
IAogCXRhYmxlID0gJnNtdV90YWJsZS0+dGFibGVzW1NNVV9UQUJMRV9XQVRFUk1BUktTXTsKLQlp
ZiAoIXRhYmxlKQotCQlyZXR1cm4gLUVJTlZBTDsKIAogCWlmICghdGFibGUtPmNwdV9hZGRyKQog
CQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
