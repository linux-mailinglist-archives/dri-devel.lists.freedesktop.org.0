Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6E5DE77
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322E26E0DC;
	Wed,  3 Jul 2019 07:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491C26E0A0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 23:43:03 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so215419pff.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 16:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BbKEAFwQNgdJMuzfiYPMlyXAsoNdsnEp4Uok88ypekU=;
 b=ULEWSAE7qK7v3AHlbB5MxkMiLgo7b0JoZrUW4KRbv9yCrdJHdgewVcz2k2vvNi2DAi
 bzIoJGmrv4YgcF/4HJqIGqH2TlcTa0ZMTcpi6IgJzyBTG1vq8XlzfadzN3EJBjcqag9h
 cAKB01tvWz0xANY61bwr8yW2p2Qm39+b4kcXC9NA95IG1f0dUA5ojJyuk/Hgi6Opc9QD
 jEUKeOs+vTXGYB7lffEIqKEBUPye/N+uFfVOMw8WivNAhlceoPIJiyMv++kIdFLqqH8V
 AdMt5k3KZwqzGI4y9bshDzGE6rAsWtguiV+g9BrP9dCtzOZDyrFZ6xI4/FBAnWF/sXrg
 J7wQ==
X-Gm-Message-State: APjAAAXsJVcBYCKWmKFNtokecNTozsrCwke/rAOzq0OnBq0aPxewI5hP
 t2Vo0aDdrDBExZ6wO5RBNlUDnQ==
X-Google-Smtp-Source: APXvYqzlQqAaaA9TlBYcDIIcItk2Sbug9JeUuEIc7DDU9bCUWN1kFgrxSAljeRrXbuNEk+5pPKxVXA==
X-Received: by 2002:a17:90a:32c7:: with SMTP id
 l65mr8573547pjb.1.1562110982720; 
 Tue, 02 Jul 2019 16:43:02 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id c26sm167611pfr.172.2019.07.02.16.43.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 16:43:01 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Panel rotation patches
Date: Tue,  2 Jul 2019 16:42:54 -0700
Message-Id: <20190702234258.136349-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BbKEAFwQNgdJMuzfiYPMlyXAsoNdsnEp4Uok88ypekU=;
 b=dzRWt1d0cH9OT8aIY2cfNcZP1PY8roOuwd7uTGeLkG0cZl8zRBQFiUDispqLSA/UuQ
 7qtogcL/XgZ4GiHoPPdi2jdl9O8tG/VgyjT9Dvw6mhdOaxNhTFFazxDQ55AxHlhv/wMv
 Zs28goiGB3utYWKBKTNH2WzG18bLyrlTHqcBQ=
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
c2VudC4KCnY0IGNoYW5nZXM6Ci1maXhlZCBzb21lIGNoYW5nZXMgbWFkZSB0byB0aGUgaTkxNSBk
cml2ZXIKLWNsYXJpZmllZCBjb21tZW50cyBvbiBvZiBvcmllbnRhdGlvbiBoZWxwZXIKCnYzIGNo
YW5nZXM6Ci1jaGFuZ2VkIGZyb20gYXR0YWNoL2RldGFjaCBjYWxsYmFja3MgdG8gZGlyZWN0bHkg
c2V0dGluZyBmaXhlZCBwYW5lbAogdmFsdWVzIGluIGRybV9wYW5lbF9hdHRhY2gKLXJlbW92ZWQg
dXBkYXRlIHRvIERvY3VtZW50YXRpb24KLWFkZGVkIHNlcGFyYXRlIGZ1bmN0aW9uIGZvciBxdWly
a2VkIHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5IGluaXQKCnYyIGNoYW5nZXM6CmZpeGVkIGJ1
aWxkIGVycm9ycyBpbiBpOTE1CgpEZXJlayBCYXNlaG9yZSAoNCk6CiAgZHJtL3BhbmVsOiBBZGQg
aGVscGVyIGZvciByZWFkaW5nIERUIHJvdGF0aW9uCiAgZHJtL3BhbmVsOiBzZXQgZGlzcGxheSBp
bmZvIGluIHBhbmVsIGF0dGFjaAogIGRybS9jb25uZWN0b3I6IFNwbGl0IG91dCBvcmllbnRhdGlv
biBxdWlyayBkZXRlY3Rpb24KICBkcm0vbXRrOiBhZGQgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVy
dHkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgIHwgNDUgKysrKysrKysrKysr
KystLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jICAgICAgICB8IDcwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHAuYyAg
ICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS92bHZfZHNpLmMgICAgIHwgIDUgKy0tCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgIDggKysrKwogaW5jbHVkZS9kcm0v
ZHJtX2Nvbm5lY3Rvci5oICAgICAgICB8ICAyICsKIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oICAg
ICAgICAgICAgfCAyMSArKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlvbnMo
KyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
