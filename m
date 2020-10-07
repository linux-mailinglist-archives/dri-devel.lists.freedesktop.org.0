Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421A285B4E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 10:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833656E239;
	Wed,  7 Oct 2020 08:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4916E239
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 08:52:25 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id lw21so1819982ejb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ii7Y4MhBkcTKFTLelmlNQMSIYcZNj/mhChG8Txf/MHQ=;
 b=f3JDiknvQt6+dvMjUox8BnHe44QbJF5fe4BlZ6Yf+esY9JB9nvx38ENw1hUcOIZS9F
 BMiFALFWy8cKujBqHDSJXI6Dx0sMp32Je5f3RdHPJ1i5EIx1OycgjGMCoCYcKLjI8ORJ
 yYoeW4+MUMq2kvspWXp2uBWz6fao2LMupDIZ/cIl0LrEcYRtbbF0MyaFs5ep+DNiKySL
 Kta0pR6AemWZoXqwAEHEkxR37mP2ubqeG73SUjtiOjf4y/GTE1hgAA/mOzjfYZ4FtNZO
 bwbmPKeqQkRlTO2BVhx5XbcXRL0D/2dQDN9qembKVsPuA/vSoSP60NmuIO56SDllL0DU
 uZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ii7Y4MhBkcTKFTLelmlNQMSIYcZNj/mhChG8Txf/MHQ=;
 b=GQ+RfdQVk+t1PCwnK9j6M+9Dbw3IXOG723f9fc2sECSZ+jiMDpiEAK042vnOls4hU9
 6/GlFtg39ROV3g6Y5F7Mv3nBB8f7onM83Qiae1r2aXRur7eBf5j0ODGMysIYMRAf5Ub0
 6xR8S2VcBWpcZ0dDNjVWPC1FR3qXJsx3dCHZzTWbqli2nvIxI3ZGoIXeWS2VkJSzpPnR
 zuelDJCfhietbAFGQYU+qZOhWHLFwDrbSx0I10WZTh/uraLTgihW1LhiL4pwWxk3HzaH
 xfh5SmjEX2vkBbrmGpw7Vqc5xnheKxqyv18ytJSEZgGusIhV1SdKPv9ZT0ZU05du2vkY
 GPWQ==
X-Gm-Message-State: AOAM530WRlijaOs76czbQd49bgHNMbtbwlQL1tCOZvlSibjHH3CNZ8Dt
 UnsGjprkMWWROYsDB/s/k6mqMWyqkhw=
X-Google-Smtp-Source: ABdhPJz/WC62jVeeerO+Df8/8H6iRlzDSlUpNpFT6fKqmIBkJ96qt4d+TmuofyEC8IUyX7gAMFCI2w==
X-Received: by 2002:a17:906:f90a:: with SMTP id
 lc10mr2352774ejb.272.1602060744351; 
 Wed, 07 Oct 2020 01:52:24 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:66f6:da2c:40a:1c42])
 by smtp.gmail.com with ESMTPSA id s7sm966635edu.71.2020.10.07.01.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 01:52:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, ray.huang@amd.com,
 michael.j.ruhl@intel.com
Subject: [PATCH] drm/ttm: remove ttm_bo_unmap_virtual_locked declaration
Date: Wed,  7 Oct 2020 10:52:22 +0200
Message-Id: <20201007085222.16586-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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

VGhhdCB3YXMgbWlzc2VkIGR1cmluZyB0aGUgY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBpbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oIHwgOSAtLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9p
bmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCmluZGV4IDk4OTdhMTZjMGE5ZC4uYjU4ZGVk
Y2U3MDc5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCisrKyBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKQEAgLTQ0OSwxNSArNDQ5LDYgQEAgaW50
IHR0bV9ib19kZXZpY2VfaW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKICAqLwogdm9p
ZCB0dG1fYm9fdW5tYXBfdmlydHVhbChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKTsKIAot
LyoqCi0gKiB0dG1fYm9fdW5tYXBfdmlydHVhbAotICoKLSAqIEBibzogdGVhciBkb3duIHRoZSB2
aXJ0dWFsIG1hcHBpbmdzIGZvciB0aGlzIEJPCi0gKgotICogVGhlIGNhbGxlciBtdXN0IHRha2Ug
dHRtX21lbV9pb19sb2NrIGJlZm9yZSBjYWxsaW5nIHRoaXMgZnVuY3Rpb24uCi0gKi8KLXZvaWQg
dHRtX2JvX3VubWFwX3ZpcnR1YWxfbG9ja2VkKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8p
OwotCiAvKioKICAqIHR0bV9ib19yZXNlcnZlOgogICoKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
