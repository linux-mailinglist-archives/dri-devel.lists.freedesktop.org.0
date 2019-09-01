Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02651A490E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 14:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365E18987C;
	Sun,  1 Sep 2019 12:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43188987C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 12:06:24 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id u72so1650573pgb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2019 05:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nB/K4fFCOmhRTBELx0mrWczJtN91X4L47iUtpc1Dn5U=;
 b=ZYLj9Y16pIE4moY7cS0chc8pj5GkS225cq6SRf3bjjMgBksSWR1zNWOqZCVc1Cd+3G
 s4kf80WZFqLnGeGbsf1BRsLocyEXKZ8tFE6H0EunPgBk4jWMJkYWwDneVXM/WvIQiXlC
 /EpBc2TFhSqMJ982xR5K1XGwnYkgIjsHhu+VW/N3CraE/hB/oGcU196FqEWQYpAvwaKI
 N0go0mu0hMEVd9VeV7g6i7E0jqBwuPcBeap1m2GQsWyidRcDkfHsONMH/p+6/2iOAkR5
 blekrhRhb1naWPPVNFsFl1xTStAzpKH3shT9s3ATtB/GCyWmyBnAWcFpFcWzdmFSOfVR
 +aHg==
X-Gm-Message-State: APjAAAXdsl+pXiSowUfbs0k5EJygQiLc0KfecDfVRcnej0kmfWlKqS9V
 7WcU59X4mxbpckpTLOLWoanZlG4HbRQ=
X-Google-Smtp-Source: APXvYqySHThX8Km3wN6rbbaMlbzLhS/eo0kCnWMSQXxIyvf7bgSza0WqR/n8eynbCVmfIoGxyDr0Nw==
X-Received: by 2002:a62:7d0d:: with SMTP id y13mr27898710pfc.150.1567339584021; 
 Sun, 01 Sep 2019 05:06:24 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id m4sm11273538pgs.71.2019.09.01.05.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 05:06:23 -0700 (PDT)
From: Inki Dae <daeinki@gmail.com>
To: airlied@linux.ie
Subject: [GIT PULL] exynos-drm-next
Date: Sun,  1 Sep 2019 21:06:19 +0900
Message-Id: <20190901120619.3992-1-daeinki@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nB/K4fFCOmhRTBELx0mrWczJtN91X4L47iUtpc1Dn5U=;
 b=ZQ/uvY81mcA/CqiG7bgF3OOfTCLK0bVAlFEMHNrBoUUjO8aIwroAQ5ehw14o2lRqeK
 XqA9ZMYmVShfB3QHrNJO4jeq6N+H3Cv7ZQRSS4IlG4mnzX1KPtckhrRk/v/R17aJTJcV
 JOC17U645BQY9fiZCOp+gcIPGXWsM+1oYvB4rtIltktOkqVWzyUDWmcLAp1/2oEb0/BR
 hp8uFpxlT2J8a4kMLwSiLyI5z2SPXqwXRkKSPuJL+H38hGNqRMqNad9s5JOdbtXoZtFh
 P+cqkg4Y22x8t2Sui/NpO0KkiSfBEj1KiDlWL9vKPIoOHcyR9ULjaupq4nAtU/3Rvqhe
 5+8g==
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCiAgIEp1c3Qgb25lIHBhdGNoIHdoaWNoIGRyb3BzIHRoZSB1c2Ugb2YgZHJtUC5o
IGhlYWRlciBmaWxlLgoKICAgUGxlYXNlIGtpbmRseSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBh
bnkgcHJvYmxlbS4KClRoYW5rcywKSU5raSBEYWUKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgNTc4ZDIzNDJlYzcwMmU1ZmI4YTc3OTgzZmFiYjM3NTRhZTNlOTY2MDoKCiAgTWVy
Z2UgdGFnICdkcm0tbmV4dC01LjQtMjAxOS0wOC0yMycgb2YgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNr
dG9wLm9yZy9+YWdkNWYvbGludXggaW50byBkcm0tbmV4dCAoMjAxOS0wOC0yNyAxNzoyMjoxNSAr
MTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGFlaW5raS9kcm0tZXh5bm9z
IHRhZ3MvZXh5bm9zLWRybS1uZXh0LWZvci12NS40Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gMjI2MDI0YjE2Njg1NTIyZWY4YTk3ZDg4MWNmZmI5MDUwMGVmMTkwMzoKCiAgZHJtL2V4
eW5vczogZHJvcCB1c2Ugb2YgZHJtUC5oICgyMDE5LTA5LTAxIDIwOjU1OjEyICswOTAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQotIEpVc3Qgb25lIGNsZWFudXAgd2hpY2ggZHJvcHMgdGhlIHVzZSBvZiBkcm1QLmggaGVh
ZGVyIGZpbGUuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClNhbSBSYXZuYm9yZyAoMSk6CiAgICAgIGRybS9leHlub3M6IGRy
b3AgdXNlIG9mIGRybVAuaAoKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYu
YyAgICAgfCA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmlt
Yy5jICAgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jICAg
ICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9pcHAuYyAgICAgfCA1
ICsrKystCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1faXBwLmggICAgIHwgMiAt
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3JvdGF0b3IuYyB8IDIgKysKIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYyAgfCAxICsKIDcgZmlsZXMg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
