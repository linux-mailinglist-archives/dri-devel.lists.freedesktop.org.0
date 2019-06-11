Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA53C4D7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355CA89159;
	Tue, 11 Jun 2019 07:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812D488E95
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:03:55 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 20so6166593pgr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ep5PT5nJYpz/Bj3Iz+6dAuGsY6URZpg14AnULVjTGA0=;
 b=Noh5qedxtx9BeMGDV2rksMroo5lZE4ANZIIbmamluToiwF4mdqGheLp16TzudBIBsD
 nwOsW/PD8g5cFZVKtDc09oo/9z5nIOoJiWGK9e0yR+vm6W0Y2LYUNa6kY4M/qBbvph4n
 qOdELpwEFgAagBrVeE826582jAA6I9mr9mylAQyv78VYO2Gshn/oIoIs5+13e4IKjMmH
 vvvr+6+k6A58V7aTMvlB4BLe2NclptOM7gJeWSgR0Sdke02/TZ6HbsjaobdJdNOqEooL
 BQp3jca+Ru77Wc5Mb3zRlsWQQIbg0326V58Z4DIaCgmpRJoIeKgDNVq8VjOSEhrmX4hV
 pBKw==
X-Gm-Message-State: APjAAAW1Q2GBRN6dINh5bULO+TivsqI3mp5WveA/qSRZjSWBi04t7Ob5
 BLJwCzTmcpz03FGq4nWeRgg20QN5d5M=
X-Google-Smtp-Source: APXvYqwomU3EkmGbmD6lmNUwogikv7z13A3K3b0++X/UrjCKXAXsfZu9Zj3Dxfvxg4ZWCL337q4OtA==
X-Received: by 2002:a62:e0c2:: with SMTP id d63mr21262331pfm.60.1560225835215; 
 Mon, 10 Jun 2019 21:03:55 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id y133sm13301185pfb.28.2019.06.10.21.03.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 21:03:54 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Panel rotation patches
Date: Mon, 10 Jun 2019 21:03:45 -0700
Message-Id: <20190611040350.90064-1-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 07:21:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ep5PT5nJYpz/Bj3Iz+6dAuGsY6URZpg14AnULVjTGA0=;
 b=BPeWijeb5HdxjyxppQb40ApVn/nxLgHSyp0AL/ASYmRCiKlPLM1ddJO4q+5DVFlKJo
 M/6tW2VGGMmJt5p6uRnJYncIATIm7J5usdTrrpfDSsoiEwZOhO6s75rGbFLm+gF0M/Zu
 OXBZxzrusRa5BRO0jGY04Rtc4em07eeQ66PnQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Derek Basehore <dbasehore@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCnYyIGNoYW5nZXM6CmZpeGVkIGJ1aWxkIGVycm9ycyBpbiBpOTE1CgpEZXJlayBCYXNl
aG9yZSAoNSk6CiAgZHJtL3BhbmVsOiBBZGQgaGVscGVyIGZvciByZWFkaW5nIERUIHJvdGF0aW9u
CiAgZHQtYmluZGluZ3M6IGRpc3BsYXkvcGFuZWw6IEV4cGFuZCByb3RhdGlvbiBkb2N1bWVudGF0
aW9uCiAgZHJtL3BhbmVsOiBBZGQgYXR0YWNoL2RldGFjaCBjYWxsYmFja3MKICBkcm0vY29ubmVj
dG9yOiBTcGxpdCBvdXQgb3JpZW50YXRpb24gcXVpcmsgZGV0ZWN0aW9uCiAgZHJtL210azogYWRk
IHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
cGFuZWwudHh0ICAgICAgICAgIHwgMzIgKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Y29ubmVjdG9yLmMgICAgICAgICAgICAgICB8IDE2ICsrLS0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9wYW5lbC5jICAgICAgICAgICAgICAgICAgIHwgNTUgKysrKysrKysrKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5jICAgICAgICAgICAgICAgIHwgMTMgKysrLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICAgICAgICB8ICA4ICsrKwogaW5j
bHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1
ZGUvZHJtL2RybV9wYW5lbC5oICAgICAgICAgICAgICAgICAgICAgICB8IDExICsrKysKIDcgZmls
ZXMgY2hhbmdlZCwgMTIwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIu
MC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
