Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E4D1F0F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 05:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31676EA7D;
	Thu, 10 Oct 2019 03:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF976EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 03:44:59 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i32so2741932pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 20:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=550gxSeJhzNkTjxw5FC1sTsyheSIffBNoMopfL6z+Dk=;
 b=iTtJ/iMe5VMo73rSO1Pwi2DVnc0tObQjJ5Xz5Q9Uga2v1YFu//E+TQ6Gnzhs4kXpfI
 fiz+CrOqw9rfbpp6mKXOn7OcrJSAfatqbTKlN4j4batlgODM4FVcHuX6R68+vKaoccfi
 gl2TUqrXxTLegzDFhzT6f15FweJnnMNiBCQ0YrVgJ5e/kIAyxmIOLOcnxYW5SADE5ake
 +a4YZyzN81FnQElK+YgZOVZv3plf0GasCHEFiNo1WmM+wfPgxK2EuaZcjzDYr8jlZv6C
 0xyv0YT4LVFzcnPeHu9TgVmYesO9aYXaBVtU2Gasn8n2aC8Km9fPwq4yCH9PwF9FbLP0
 ooqg==
X-Gm-Message-State: APjAAAXnQu5OXKo0kAsRSYOoIo0E44VNUS9rO7XsbefXyR0siL6ojKCC
 6PPwCppoNNW3H5DfuDTCZf4=
X-Google-Smtp-Source: APXvYqyhwc9uPwrA9hTdDDMnfRt6Xj0TDI+CGUJ3ZOFD4r3TR+s2KL0z8X0HW/f8P7FsK5lk0ktDXQ==
X-Received: by 2002:a62:38d5:: with SMTP id f204mr7933796pfa.100.1570679098883; 
 Wed, 09 Oct 2019 20:44:58 -0700 (PDT)
Received: from localhost.localdomain ([103.29.142.67])
 by smtp.gmail.com with ESMTPSA id z13sm4552188pfq.121.2019.10.09.20.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 20:44:58 -0700 (PDT)
From: Nickey Yang <nickey.yang@rock-chips.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Subject: [PATCH 0/1] drm/rockchip: vop: add the definition of dclk_pol
Date: Thu, 10 Oct 2019 11:44:51 +0800
Message-Id: <20191010034452.20260-1-nickey.yang@rock-chips.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck5pY2tleSBZYW5nICgxKToKICBkcm0vcm9ja2NoaXA6IHZvcDogYWRkIHRoZSBkZWZpbml0aW9u
IG9mIGRjbGtfcG9sCgogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
YyB8IDEyICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Au
aCB8ICA4ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMg
fCA0NSArKysrKysrKysrKysrKy0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKSwgMjIgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
