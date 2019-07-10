Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39A642BB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA4089C33;
	Wed, 10 Jul 2019 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C9889951
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 02:17:04 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id cl9so362632plb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 19:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QL/iKcky+DBal5hSRMsXARSXXCVch6Zl/oKMaiM15pA=;
 b=ZR0ZQyNInFZYlJa8D14UzklPXB8fQ19AcRlGbzPDjza4xWUhLqJ28YrGhg1LBy0lXB
 HBFr8En739fVG/H4h2nK/87htNs0rqYYurpFKB602Br0mL5ZhAqW0jfVZIb8+gFTX9ir
 3jnltyDsuJuqrIkZ3didTRrFK8L3tC9IU/DeMpQ4x/cbd/e+HPqAbyONGoHx6OADlAZr
 Uz/omYp2RbVRXIiY/KTvZjyCkTX4iiJogILs8ypftuTYWTN2nxT14yWjUZ3CMula9dQZ
 +zATX4PgMmV7rhiJd3EQNL5mJtDkBgsVyhvAIE4o4H1hx8qvd0Rl3kt9dPxxox0pe+vS
 VCpw==
X-Gm-Message-State: APjAAAViTh2MT4ZcwGWD27XLPpldi5FHXLmxj5E1+n79MaKWhha3Sbq4
 DMXIJoHTKqbUO0I+SYWBNwfnUA==
X-Google-Smtp-Source: APXvYqyEKIBQy601LP2m94TC+l7EN0vjJQm/b7SyERDtRnwMRSIGypY9ZrywmAynnQCFbswC7bKmrw==
X-Received: by 2002:a17:902:788f:: with SMTP id
 q15mr36510488pll.236.1562725023757; 
 Tue, 09 Jul 2019 19:17:03 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id f17sm326296pgv.16.2019.07.09.19.17.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 19:17:03 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] Panel rotation patches
Date: Tue,  9 Jul 2019 19:16:55 -0700
Message-Id: <20190710021659.177950-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QL/iKcky+DBal5hSRMsXARSXXCVch6Zl/oKMaiM15pA=;
 b=LQXF4iztDK4WfGH3yFPHfMFpFoxRGzJ5SJsuvt8PUYKH5sMMGeff6st/EcfYxwcIzc
 GxhzEvZK940b7dcqpFHyB4koUyH87iv3Ful02WPZLOgp+RbNy5HxSi0QtGxb1TioliFj
 to6SHdkOhkaignW44UcMR8L2Lb/KPwHiPg1zI=
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
c2VudC4KCnY3IGNoYW5nZXM6Ci1mb3Jnb3QgdG8gYWRkIHN0YXRpYyBpbmxpbmUKCnY2IGNoYW5n
ZXM6Ci1hZGRlZCBlbnVtIGRlY2xhcmF0aW9uIHRvIGRybV9wYW5lbC5oIGhlYWRlcgoKdjUgY2hh
bmdlczoKLXJlYmFzZWQKCnY0IGNoYW5nZXM6Ci1maXhlZCBzb21lIGNoYW5nZXMgbWFkZSB0byB0
aGUgaTkxNSBkcml2ZXIKLWNsYXJpZmllZCBjb21tZW50cyBvbiBvZiBvcmllbnRhdGlvbiBoZWxw
ZXIKCnYzIGNoYW5nZXM6Ci1jaGFuZ2VkIGZyb20gYXR0YWNoL2RldGFjaCBjYWxsYmFja3MgdG8g
ZGlyZWN0bHkgc2V0dGluZyBmaXhlZCBwYW5lbAogdmFsdWVzIGluIGRybV9wYW5lbF9hdHRhY2gK
LXJlbW92ZWQgdXBkYXRlIHRvIERvY3VtZW50YXRpb24KLWFkZGVkIHNlcGFyYXRlIGZ1bmN0aW9u
IGZvciBxdWlya2VkIHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5IGluaXQKCnYyIGNoYW5nZXM6
CmZpeGVkIGJ1aWxkIGVycm9ycyBpbiBpOTE1CgpEZXJlayBCYXNlaG9yZSAoNCk6CiAgZHJtL3Bh
bmVsOiBBZGQgaGVscGVyIGZvciByZWFkaW5nIERUIHJvdGF0aW9uCiAgZHJtL3BhbmVsOiBzZXQg
ZGlzcGxheSBpbmZvIGluIHBhbmVsIGF0dGFjaAogIGRybS9jb25uZWN0b3I6IFNwbGl0IG91dCBv
cmllbnRhdGlvbiBxdWlyayBkZXRlY3Rpb24KICBkcm0vbXRrOiBhZGQgcGFuZWwgb3JpZW50YXRp
b24gcHJvcGVydHkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgIHwgNDUgKysr
KysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jICAgICAgICB8IDcw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZHAuYyAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS92bHZfZHNpLmMgICAgIHwg
IDUgKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgIDggKysrKwogaW5j
bHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICB8ICAyICsKIGluY2x1ZGUvZHJtL2RybV9w
YW5lbC5oICAgICAgICAgICAgfCAyMSArKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgMTM4IGlu
c2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUt
Z29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
