Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37EA65272
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D916E13C;
	Thu, 11 Jul 2019 07:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECD96E11E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 17:58:36 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s27so1610216pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 10:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1Yptoe5D085BWh+Bibq1x1Qze0BUntRJjyskqFEUkv4=;
 b=oB2477Wgo18/X/wzZ5rYDg5LymwUP2IjeXFHfqJUuJj+auUobe7RsGggBl3TzTInV/
 gDUk3In86ZgDSkAB3X13AqmiMrGU2nxOpKrRx+Vg3NgIoJ6A1VC/XEm8qfhJWtJSYi5Y
 bWKTVzrxl8Zod6Qk+DMGzq41RYJQ9kYj/Za9Dr9609oHdyZWxEvecJn1oM1zo8Ar1U79
 VrlNwnfCXA8POAdrLeom8tCukkfeRQS5mJLQC+Jw9G4WYM75hp7tOn+JdIfrKZHxxOmk
 I+yaXVQGB8IWFETOa8dxMEsbe03yP68yjH7lImhlFhJ+NoQyDOTErg850t4mPiYF7rhx
 ex1Q==
X-Gm-Message-State: APjAAAUxnAkgX2RcNnElwXNuoFJhbGbBOY7ARMtRjO3oAG0GPrE9BUO5
 pZAjOq0TdcnpFokcQyO20js=
X-Google-Smtp-Source: APXvYqzRIoVFWzhS+1VgbH8QHWcdl6FPoGRrTAD67T9udDa+FcsMUPzpD2OL7tIqAgpvpAzvnDPj7A==
X-Received: by 2002:a17:90b:8e:: with SMTP id
 bb14mr8433814pjb.19.1562781515699; 
 Wed, 10 Jul 2019 10:58:35 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.16.82])
 by smtp.gmail.com with ESMTPSA id a6sm2460536pjs.31.2019.07.10.10.58.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 10 Jul 2019 10:58:34 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: adaplas@gmail.com,
	b.zolnierkie@samsung.com
Subject: [PATCH] video: fbdev: nvidia: Remove extra return
Date: Wed, 10 Jul 2019 23:33:15 +0530
Message-Id: <1562781795-3494-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1Yptoe5D085BWh+Bibq1x1Qze0BUntRJjyskqFEUkv4=;
 b=tTn+t77vdNkoiG8Ypss8Jb1MN9bCLyC0qtR8XfCrzNdJsuOVuvNQ1DdLEOL4u005Ba
 cvHdj6+6PfRyKhHzkljerHrTWMEJfGtZikAG5SfDWxACqVQE8+Y+eXa9vgTs0j1YF6Aq
 /bMlRektpHJiHrSm510ZZ5mlnrI8SHO+tmimjswCuuqgyDF7E7IYHATkGjN8SvLAazha
 QviZGyYzNYCC9M/jzuS2U2gyY7aQqLhwpwNlhWlxSG4yGM+z+3lDk1cl3bVfELADuaPX
 63SX5w2hhXtLZlgH6EYie38nh4MEot/F8DynKZH6pqqn4fSJa3aW4lYui6YIg4Uclt5K
 nrXQ==
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sabyasachi.linux@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWlub3IgY2xlYW51cCB0byByZW1vdmUgZXh0cmEgcmV0dXJuIHN0YXRlbWVudC4KClNpZ25lZC1v
ZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvdmlkZW8vZmJkZXYvbnZpZGlhL252X2JhY2tsaWdodC5jIHwgMiAtLQogMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9udmlk
aWEvbnZfYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9udl9iYWNrbGln
aHQuYwppbmRleCBlNzA1YTc4Li4yY2U1MzUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L252aWRpYS9udl9iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRp
YS9udl9iYWNrbGlnaHQuYwpAQCAtMTIzLDggKzEyMyw2IEBAIHZvaWQgbnZpZGlhX2JsX2luaXQo
c3RydWN0IG52aWRpYV9wYXIgKnBhcikKIAogCXByaW50aygibnZpZGlhOiBCYWNrbGlnaHQgaW5p
dGlhbGl6ZWQgKCVzKVxuIiwgbmFtZSk7CiAKLQlyZXR1cm47Ci0KIGVycm9yOgogCXJldHVybjsK
IH0KLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
