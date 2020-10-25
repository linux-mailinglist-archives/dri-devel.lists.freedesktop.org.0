Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE5298252
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8786E9D2;
	Sun, 25 Oct 2020 15:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEF56E9CE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:13 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id l16so6877493eds.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JVb0PGOkDuUjIOXlma30hmDlvN8E2tggW0h0tg0k578=;
 b=SBDd4GwKlXv7AoaWyLOvnR+lPlCeGm2hHmTVEPhfjRL4QeF5xr3v12Diqp11J7CUXC
 /T7H5blOjhrPIJunYw8eCXQjKCA1adhuml9rEylfhKphOxzO9kg5IpVQqOJcJoUQDFtG
 a4LGz2cRhja+xtCLbWZxgX2D40dA8TzngxKbULhygfTSzEnviWjUwRTh750Ig+Iw/CWT
 J8wGWbhBI8czyvXa+pVcCQ2P4dFFGdDbr5kZ49Sdk3B/6cWNJTdIqMNyv7tZWUqCZlaY
 Jk0CLHae5egrrupRjEq7AdUYcGWhOIvpU5InWWxM2xU323yXY8/Wyv8n2QIbgmdvmIzx
 oQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JVb0PGOkDuUjIOXlma30hmDlvN8E2tggW0h0tg0k578=;
 b=GaqSw+Nxf/NHum4bBFGoBS60RAklz3Kk9OVWoHaDT0892WeEVDYv10hpFuEi+/alyx
 GNnQtPgqL4dJJRMZ23nGeFMSg7X0ZwAjDz0UozPsTE84ecJAeNdQbv7ic+7EJm3P/rAV
 1WV6VrgHpSsrIxrvZcVzS7eKw6UWb6LSV2BB4YSOaUR+G5vaelK/6+pRvRTVeTuIDUwF
 y+NaETMGiNtcBv93tEE/mCAVUtq/MCWbML2jA2NCjQKESae4xVD5FgTjErOP5o6ot0Jc
 2A4BnzBRZ0kQfX/O2O7AQP1kDltjIDNnuBKyYUm1tdZgW+m2972XjGIYfusD9I10av6x
 SNGQ==
X-Gm-Message-State: AOAM531mimWVpyNQSp8LUBnqDrM0fbl6Ug7F3/Ec7PtqMKE3UnFZXfv8
 mbORJ85IbBVrjTPwWs6WPkTznH4shyk=
X-Google-Smtp-Source: ABdhPJzrxE0Pumek80L960s6q3i75rVHy95CGjTzGocesMUN+wDjhtUAlTE5tOCipyM63wNEyzJ2mw==
X-Received: by 2002:a05:6402:142c:: with SMTP id
 c12mr12344610edx.41.1603640472516; 
 Sun, 25 Oct 2020 08:41:12 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] drm/qxl: drop ttm_page_alloc.h include
Date: Sun, 25 Oct 2020 16:40:58 +0100
Message-Id: <20201025154100.16400-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201025154100.16400-1-christian.koenig@amd.com>
References: <20201025154100.16400-1-christian.koenig@amd.com>
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
Cc: Ray.Huang@amd.com
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
