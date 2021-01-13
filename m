Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322F2F45CC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C5B6E02A;
	Wed, 13 Jan 2021 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA006E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id c124so682044wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YtdAaEqJ+OgUUPAXBPbeBnhYUUGO94r1mRrUVzyKNqw=;
 b=J4u9O4QqJw9NZ0jVvvAMdTcHDKR5DdnXk3Ob0X7W0XjXytVoKhQFQmf5V177HDeaw6
 DqwzEq0kkEhGD+eaLkMORoIjCqrj+FznQMQ1+ocLIg7w8IIdKP+L2AgJH7jnt2HMLAEY
 AfvdBRThpE1B+QBu7eOFPYevp1TjEjyey0WgZD3O7XSAOZzsXHK+oJNH4GcVoa7ujph3
 vET4kj0k272eJplJyWKqGojwAmFg/YuM4prRhb7l2cKjj8dDHFw6wqM/okNdk2Ftv/FL
 WePS7sAZPVPTArf/yf2wYdKCqzTeB+MyjCuzBqmZnZBDbQ3QMr5vJrvDieTyNRVTXn2d
 RQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YtdAaEqJ+OgUUPAXBPbeBnhYUUGO94r1mRrUVzyKNqw=;
 b=YQnrWfeyK4awjdwku5JNRnGRJHnpYmQlZulQ6onounwHzi556xwcJ3JbJuUlVWI8En
 TUz4ZDn8H8MejSviBk9/w8O+Hj/81z0DvjTbutGih71kK4b/WvlrfHgf7asedFun1lNM
 1vlEUQCMjSxt8FOiSCQHHJ0LHfudk+95N/sbYgw1JiBBB6GVRXTxFxKroZgSzvNwcAof
 TjnA8v4EKhZhhFn7oDxR7HIW05bRRp30ZpMDp2MdRFIscr0Mf6OfuF8xJTsTq1GVTBOW
 9pcEZbcqA7JNR87KyA1LY4M1aT1NB1DTA/H7voEONwzTNf/MrENj3VMHfPvkbhCRtmsV
 KHwg==
X-Gm-Message-State: AOAM531B9uN1ltnRX7GIZu/yFpj9ITiZb/jLRGQN4wacQVwjJpW8o8R9
 YootJ/RC6FaUPVboOT9Gkwd+Ww==
X-Google-Smtp-Source: ABdhPJwCvYxaM2sHo0QhAxW+Mm5PK5lmxhLKKwKNhoXwmQg+a/L2rTXiNEg6zDYQlv3SjpfxITC8jQ==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr935004wmi.55.1610525294937; 
 Wed, 13 Jan 2021 00:08:14 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/30] drm/amd/display/dc/dce80/dce80_resource: Include our
 own header containing prototypes
Date: Wed, 13 Jan 2021 08:07:37 +0000
Message-Id: <20210113080752.1003793-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5j
OjExMjY6MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlODBfY3Jl
YXRlX3Jlc291cmNlX3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jOjEzMjU6
MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlODFfY3JlYXRlX3Jl
c291cmNlX3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jOjE1MjA6MjM6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlODNfY3JlYXRlX3Jlc291cmNl
X3Bvb2zigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEFudGhv
bnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2U4MC9kY2U4MF9yZXNvdXJjZS5jCmluZGV4IGZlNWQ3MTYwODQzNjMuLjcyNWQ5MmU0
MGNkMzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4MC9k
Y2U4MF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U4
MC9kY2U4MF9yZXNvdXJjZS5jCkBAIC02MCw2ICs2MCw4IEBACiAjaW5jbHVkZSAiZGNlL2RjZV9p
MmMuaCIKIC8qIFRPRE8gcmVtb3ZlIHRoaXMgaW5jbHVkZSAqLwogCisjaW5jbHVkZSAiZGNlODBf
cmVzb3VyY2UuaCIKKwogI2lmbmRlZiBtbU1DX0hVQl9SRFJFUV9ETUlGX0xJTUlUCiAjaW5jbHVk
ZSAiZ21jL2dtY183XzFfZC5oIgogI2luY2x1ZGUgImdtYy9nbWNfN18xX3NoX21hc2suaCIKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
