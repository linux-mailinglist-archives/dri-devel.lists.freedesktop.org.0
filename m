Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89881299416
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 18:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178CE6EA50;
	Mon, 26 Oct 2020 17:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8394F6EA4D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 17:41:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w27so14870547ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JVb0PGOkDuUjIOXlma30hmDlvN8E2tggW0h0tg0k578=;
 b=bclFxy5MX/Y441YI5Uc/nISkWA8SfH4RFWTZPL7CuHkzaL62eeeZW7X0jISQKF4WAS
 yG0tWoSVDRLKdUoQqe6+0HfdUYFgdqC1eQ9QNaKGDOMF2s1+LN4JrtBlg7izyM6zPbwL
 5lU785Z54t6rd3qWOFXwlfRqqVYPY3m+hpcsa7FuJWWdNthX/vkEOEyz3Z6vXlV5q4ov
 mfHDPv9Uh+mrGppvUK1k/9EQ1mBAb3LdCic+c3UTsBc6JgMcwgOL0hXyDxNc5FFH117t
 JRrOGtUCGKF4M5Zswx2A3dktOIDKO+P7F8pAAFs3Wv7iEALaomRND/gIM4XM+4Yzo0kE
 BsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JVb0PGOkDuUjIOXlma30hmDlvN8E2tggW0h0tg0k578=;
 b=mrUkM5IhPGo5MU3HzdJ5sXGY1M8zOyDmr5Uoge3rr/j+xDUs2KvagVgONAZRAk6BVi
 /vu6Df1VoPhghx87rwJLInGwFqoat+OncrSxSzNmKBo+q/Jk46oMtsBhYOsWaWNGGdgC
 V0sYy5hweAka/Awrv8g1D+KndNJT0wOxX9k/JUL19aTpFu71OguGya3JerEQ+rdmiRm/
 myNYVPM23Dj55U83ryVT4pikusI31UuvbySNvCvFGEOZgCatszSi9TnroMWV45rODkUv
 XoYTjYFPL/Bh1MMvlAzSy6cYiwXEq+8zi9cpdqLIcjGDglXEnnMYmaHAZgcVj/5shf5H
 EkjA==
X-Gm-Message-State: AOAM532Qn+S/N/ARgp5jEzjnwlpW49nkRsiaTzXGxybAsTf8lT2BEJ3P
 AXiKDUAUpsGpudpjCKoHwS1aNibkD0g=
X-Google-Smtp-Source: ABdhPJx6wbZjixsckCrAOI0S0RTOkOHETsKW2QascEnIN8lV6zGQvrEX2dNhsEFgmzlvu+dxJcM2OQ==
X-Received: by 2002:a17:906:3e17:: with SMTP id
 k23mr17401188eji.414.1603734083954; 
 Mon, 26 Oct 2020 10:41:23 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:203b:21f:8891:7b14])
 by smtp.gmail.com with ESMTPSA id i14sm6227325ejy.110.2020.10.26.10.41.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:41:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/qxl: drop ttm_page_alloc.h include
Date: Mon, 26 Oct 2020 18:41:15 +0100
Message-Id: <20201026174117.2553-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026174117.2553-1-christian.koenig@amd.com>
References: <20201026174117.2553-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCBhcyBmYXIgYXMgSSBjYW4gc2VlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX3R0bS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfdHRtLmMKaW5kZXggZDhlY2ZiOGIzMTkzLi5hODBkNTk2MzQxNDMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX3R0bS5jCkBAIC0zMiw3ICszMiw2IEBACiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fYXBp
Lmg+CiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+CiAjaW5jbHVkZSA8ZHJtL3R0
bS90dG1fbW9kdWxlLmg+Ci0jaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oPgogI2lu
Y2x1ZGUgPGRybS90dG0vdHRtX3BsYWNlbWVudC5oPgogCiAjaW5jbHVkZSAicXhsX2Rydi5oIgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
