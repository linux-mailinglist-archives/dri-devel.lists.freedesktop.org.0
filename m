Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7576642CE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E9689C9C;
	Wed, 10 Jul 2019 07:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B498B8994A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 22:58:45 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z75so191500pgz.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 15:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfBNRjMW96lNOTO1+wc8G+mqG3/RxD26VY8ohNb7l7s=;
 b=fZTs0rnQG/NTTPR1FVTTYPal1Xb19dDdSUVHgny1aj5mve7M2nOEmuJAJIKh41ziyE
 1lwVjP/qatVTmdzztrrB6L4PUikc/0n3aEwpjCK0uDemSv0Ey+nb4IPGl23ukWQgbvf5
 pPBE7C25haDd55qFcqvCVNRnVWRK3l919figIkawobAo8UymAshkt8K6VQsOmIWQnyUo
 zP/olsqbGsoCr5FCXOAh/TF8C6sOK8BBoEdUDANC4fJvyVOek1sy0VsDB5yIeP/vObc+
 KGW/f1Ug6SsLqlMsZgIDrSZUlKqUsdD/Q7Hoag6vvFSLlxT3ekOy92srr0+SuiwOEP2S
 +Vlw==
X-Gm-Message-State: APjAAAViB9q0NFNdTfoobQ057yAi+UrEnY66y7Cac4JJpHB2A101qgs8
 9WjFbuq/Rwk+5ullp/VjURo7kg==
X-Google-Smtp-Source: APXvYqzHCjdRgs8T2Gzw/2FP8RssoOjRLpdQrKxiGCNwSt8p03lTof0IAKIZqNN5ejjfFbu9SwHkpQ==
X-Received: by 2002:a17:90a:20c6:: with SMTP id
 f64mr2812506pjg.57.1562713125358; 
 Tue, 09 Jul 2019 15:58:45 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id 201sm152939pfz.24.2019.07.09.15.58.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 15:58:44 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] Panel rotation patches
Date: Tue,  9 Jul 2019 15:58:36 -0700
Message-Id: <20190709225840.144038-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfBNRjMW96lNOTO1+wc8G+mqG3/RxD26VY8ohNb7l7s=;
 b=g+2aDXwaj0DzsFicoZrXvoungL+MWOPC0VtEH2gPXuj8zlNnwwgyIhkxF0bkqpoWcm
 8TboO6bKfQEBXG8g8wp2IMRGW/TvAviOydq287DyBpvxHMXEz6+WOc0/hqAIcJYCcTju
 BoRstaqm8JPuzjtT4y8KqxFrOGp53xRR93cJ8=
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCnY2IGNoYW5nZXM6Ci1hZGRlZCBlbnVtIGRlY2xhcmF0aW9uIHRvIGRybV9wYW5lbC5o
IGhlYWRlcgoKdjUgY2hhbmdlczoKLXJlYmFzZWQKCnY0IGNoYW5nZXM6Ci1maXhlZCBzb21lIGNo
YW5nZXMgbWFkZSB0byB0aGUgaTkxNSBkcml2ZXIKLWNsYXJpZmllZCBjb21tZW50cyBvbiBvZiBv
cmllbnRhdGlvbiBoZWxwZXIKCnYzIGNoYW5nZXM6Ci1jaGFuZ2VkIGZyb20gYXR0YWNoL2RldGFj
aCBjYWxsYmFja3MgdG8gZGlyZWN0bHkgc2V0dGluZyBmaXhlZCBwYW5lbAogdmFsdWVzIGluIGRy
bV9wYW5lbF9hdHRhY2gKLXJlbW92ZWQgdXBkYXRlIHRvIERvY3VtZW50YXRpb24KLWFkZGVkIHNl
cGFyYXRlIGZ1bmN0aW9uIGZvciBxdWlya2VkIHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5IGlu
aXQKCnYyIGNoYW5nZXM6CmZpeGVkIGJ1aWxkIGVycm9ycyBpbiBpOTE1CgpEZXJlayBCYXNlaG9y
ZSAoNCk6CiAgZHJtL3BhbmVsOiBBZGQgaGVscGVyIGZvciByZWFkaW5nIERUIHJvdGF0aW9uCiAg
ZHJtL3BhbmVsOiBzZXQgZGlzcGxheSBpbmZvIGluIHBhbmVsIGF0dGFjaAogIGRybS9jb25uZWN0
b3I6IFNwbGl0IG91dCBvcmllbnRhdGlvbiBxdWlyayBkZXRlY3Rpb24KICBkcm0vbXRrOiBhZGQg
cGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jICAgIHwgNDUgKysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5l
bC5jICAgICAgICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZHAuYyAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS92
bHZfZHNpLmMgICAgIHwgIDUgKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
IHwgIDggKysrKwogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICB8ICAyICsKIGlu
Y2x1ZGUvZHJtL2RybV9wYW5lbC5oICAgICAgICAgICAgfCAyMSArKysrKysrKysKIDcgZmlsZXMg
Y2hhbmdlZCwgMTM4IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC40
MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
