Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1338E6AE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035E6E8F3;
	Thu, 15 Aug 2019 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AEC6E059
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 06:26:02 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t14so48824700plr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=InbrtY8dAbwb/AvFuK0cFDB3sfg6Iw3ZgPfhmVbir4Y=;
 b=DsKr1y9mqLXAlh5P439vsE3f2OUs2xVAQGMNT0e29QRi1nu4PesFKBRafF83fXsfZv
 quPqX1AJ+8h6oco7EdK8o4JbpynzLmMRKRJUit+WFpDLWCaUIpmCneKioRHX9CoA6pob
 //KKeIyIPATPwHQRWlmTHbYPoFHQarMJW1JyKakwEG9HdALItG3Olq1+A6yMG0DVV0RT
 k58IxcjWiTCMeiwelHFC1toGAZLhH8CFHK+dSoOa17uVLdXu942vTWeI9phD2+iLwTPn
 comI1Un8NZ97OuDiT7yxtqU768+AiKHPJclIPEbZg29sfaZun7op79Yaa4VsZiU7Nu/Y
 xL0Q==
X-Gm-Message-State: APjAAAWYNPAKN1QQVO/4XLT1vaRJhGjEhr4tH+u7KrxQlWZjFdooUVG1
 7wNAJVLFTLJYvKhNnsBbFnM=
X-Google-Smtp-Source: APXvYqz6FjP5yU1Un3HZXDZEwPSzwYT5yGzyK40BuGaSWI8I8Q6l1JtU9sHZBEUfQw6gnswY++9uFg==
X-Received: by 2002:a17:902:74c4:: with SMTP id
 f4mr34807883plt.13.1565677562055; 
 Mon, 12 Aug 2019 23:26:02 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
 by smtp.gmail.com with ESMTPSA id m4sm184279289pff.108.2019.08.12.23.25.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:26:01 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs constant
Date: Tue, 13 Aug 2019 11:55:48 +0530
Message-Id: <20190813062548.24770-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=InbrtY8dAbwb/AvFuK0cFDB3sfg6Iw3ZgPfhmVbir4Y=;
 b=QCtPmNLGRtJWnaKbVF7JxCXVTCbVqEL2Z67r0MjvXyqhZa084nliVV4TiXgRBv8Qm0
 mCinWkSGMfGr08Ae+2cvO3JPZmbgvIIZ4QudKdRd0v1OPFiEHcF/o3dk18cT0moFBCiy
 zFYAKhe1ZybhxWrE7dzNXXbUJlD9sOVPiYfP7qp420T4lqxC9IVwZ06hiW2RJuwl5od7
 nwEl8LeaBSm2q+c5Bsqyh3BpylF7cM3BSvfZYbz2sbOmGTOpLAApIf5a6tYtGMvC10Gx
 dSvPrD/G40nc05wMqtkJ2ok6Of6DY/eoIVhWPnutyyLm6XVfKA7nNL0UYddHzIk/9BEN
 pagQ==
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHN0YXRpYyBzdHJ1Y3R1cmUgdmJveF9mYl9oZWxwZXJfZnVuY3MsIG9mIHR5cGUgZHJtX2Zi
X2hlbHBlcl9mdW5jcywKaXMgdXNlZCBvbmx5IHdoZW4gaXQgaXMgcGFzc2VkIGFzIHRoZSB0aGly
ZCBhcmd1bWVudCB0bwpkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwKCksIHdoaWNoIGRvZXMgbm90
IG1vZGlmeSBpdC4gSGVuY2UgbWFrZSBpdApjb25zdGFudCB0byBwcm90ZWN0IGl0IGZyb20gdW5p
bnRlbmRlZCBtb2RpZmljYXRpb25zLgpJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVv
L3Zib3hfZHJ2LmMKaW5kZXggMDI1MzdhYjljYzA4Li4yYjU3ZWEzMTk1ZjIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewogfTsKIE1PRFVMRV9ERVZJQ0VfVEFC
TEUocGNpLCBwY2lpZGxpc3QpOwogCi1zdGF0aWMgc3RydWN0IGRybV9mYl9oZWxwZXJfZnVuY3Mg
dmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mYl9oZWxw
ZXJfZnVuY3MgdmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7CiAJLmZiX3Byb2JlID0gdmJveGZiX2Ny
ZWF0ZSwKIH07CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
