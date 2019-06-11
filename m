Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19543C097
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99A989174;
	Tue, 11 Jun 2019 00:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E702689132
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 00:23:02 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id a3so5895201pgb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ys/QIuTzESKgIhK+4lqN2GBOgNe/RQ4XjHnrFVNq/bg=;
 b=GB1kbzop1bOG+SYAWI8z4TEbwYilJZEMslK9iMy+ZaNnnrZN4diq1pX2cgcS5GhDKI
 0uZWgfbtKbg+PCO1TGv69VGsvGEMWqdV6JaoebS97/SBoOoKCTFU7+Bdqgb3Vu8PTHxn
 2Py5vsRYDiscHuJ0vnDFVUOgwGWZHGoxE53m6BWfXeeGvcK26H9IHKrnRHQd/YysLMdT
 9txojLigpMGCF+Y+sHgfteDxfCgNbPZDcZOF2UZvvwi7/UTFSktM/OX+/wCkfBQaCsUO
 M1HigCzdhnaVhfmIfmGfRl4Gj8CXYA3TpNnpUTuzUwi16z2KOibhow7qqMpcCRB4nO0R
 noBA==
X-Gm-Message-State: APjAAAXGxENk0a89r2terxI97gdZOOz2TWx3C8i6bkAIrmCXlxallkug
 W7tauu75osJ5T+spCddqtwJQ3Q==
X-Google-Smtp-Source: APXvYqyFDNopqPX7XaEAu7EG9CwttGgKSVT073ogwDm3kj5G1I2Zurlp7yaWcrSslQANYBeJiel1uQ==
X-Received: by 2002:a17:90a:25c8:: with SMTP id
 k66mr2852849pje.129.1560212582590; 
 Mon, 10 Jun 2019 17:23:02 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id t4sm540317pjq.19.2019.06.10.17.23.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 17:23:01 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Panel rotation patches
Date: Mon, 10 Jun 2019 17:22:51 -0700
Message-Id: <20190611002256.186969-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ys/QIuTzESKgIhK+4lqN2GBOgNe/RQ4XjHnrFVNq/bg=;
 b=f5ipcdNBMgeYN6xIkspolGbToPlj9rnUy85L/384p3yAVGYdbKT3rIYX2R9DTVe5DZ
 BYJNhX2Lc4MpUKIIZ8Uvygx+l7dI/iqp1tjbx6cPL9JzfUDgJZKWqECoYuYfsfw24UwA
 BoOUkWOPjP/ynt3LEWf2YKuM3gT243RbvpPTQ=
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
Cc: Derek Basehore <dbasehore@chromium.org>, maxime.ripard@bootlin.com,
 sam@ravnborg.org, intel-gfx@lists.freedesktop.org, airlied@linux.ie,
 thierry.reding@gmail.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCkRlcmVrIEJhc2Vob3JlICg1KToKICBkcm0vcGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJl
YWRpbmcgRFQgcm90YXRpb24KICBkdC1iaW5kaW5nczogZGlzcGxheS9wYW5lbDogRXhwYW5kIHJv
dGF0aW9uIGRvY3VtZW50YXRpb24KICBkcm0vcGFuZWw6IEFkZCBhdHRhY2gvZGV0YWNoIGNhbGxi
YWNrcwogIGRybS9jb25uZWN0b3I6IFNwbGl0IG91dCBvcmllbnRhdGlvbiBxdWlyayBkZXRlY3Rp
b24KICBkcm0vbXRrOiBhZGQgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkKCiAuLi4vYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQgICAgICAgICAgfCAzMiArKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgICAgICAgIHwgMTYgKystLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgICAgICAgICAgICAgICAgICAgfCA1NSArKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS92bHZfZHNpLmMgICAgICAgICAgICAg
ICAgfCAxMyArKystLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgICAg
ICAgIHwgIDggKysrCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggICAgICAgICAgICAgICAgICAgICAg
IHwgMTEgKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pCgotLSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
