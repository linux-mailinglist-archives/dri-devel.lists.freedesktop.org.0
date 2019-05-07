Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C20016436
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04836E7C8;
	Tue,  7 May 2019 13:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3366C6E7C8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 13:07:35 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id p6so8281119pgh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 06:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oYIcefqUbtjO6efG05qDKL3HAKUE9dWz26q5t6PWQVk=;
 b=YJ0D8ArvjYjNcMgy3ZWcxZRWSKVGQ9gQW/cJmBOVcSoTAmCsLJqy8apH7WvvEOuvpj
 Ln3gmws4/P+bnAT51NGxPiYe3RsHUycR2MZOQHxUj4P3g1ogSpMEJhFo9N9at3BzyIiS
 qS6XlFbtUKcCpNdT84JItD2DP9v6ad40s55Q0cS1W+YC7GjhBAf77vWDtej0fHk2Ywws
 WuiVCUKoYBUiUBSHKQQM25JvgUgXjTxSnFuwC5vaJDqh7EKhvWQJxXrQXsTy8JSCnNkM
 9hELKRcuP4vWTsoAcjx3kgmtxG5wR9d56NTeVBEpSSJ5lHOhKjY+6y5Q/aAYzhStJpWn
 u/8w==
X-Gm-Message-State: APjAAAU7pvbvbZRBdFBYK18WKexrTpNgOxIJuhTxy4YVkkTRCAM+KIU2
 Pb/rXZQuHkX/L2MkYZnkxYofGQ==
X-Google-Smtp-Source: APXvYqy2CKkQ9wX0prpKV/pt24cFsadXZXvMcaev7EfdOiJeDL66Kfub6iLEmQkBCbHk4BdoBKJpNg==
X-Received: by 2002:a63:fb56:: with SMTP id w22mr38503539pgj.354.1557234454717; 
 Tue, 07 May 2019 06:07:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3682:cdb6:452:ecda:bdfa:452e])
 by smtp.gmail.com with ESMTPSA id w190sm21889823pfb.101.2019.05.07.06.07.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 06:07:33 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/3] drm/panel: simple: Add FriendlyELEC HD702E 800x1280
 LCD panel
Date: Tue,  7 May 2019 18:37:07 +0530
Message-Id: <20190507130708.11255-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190507130708.11255-1-jagan@amarulasolutions.com>
References: <20190507130708.11255-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oYIcefqUbtjO6efG05qDKL3HAKUE9dWz26q5t6PWQVk=;
 b=edyEPa62/tqOK5yYOgIKFbrNm5HJFRdrthDyG8k085PwYA7rMARCaKhtyT0spUv1lZ
 z80r7mktww84mBSrnXqBVlE03aT9WMA4HAZ4mqg/i8fZ1NPa02rZ+dxElXpGI3svX4yK
 Ag+W8uF1vfH5vDlvlyHmywP0gZ4a0qKxq5iBM=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEQ3MDJFIGxjZCBpcyBGcmllbmRseUVMRUMgZGV2ZWxvcGVkIGVEUCBMQ0QgcGFuZWwgd2l0aCA4
MDB4MTI4MApyZXNvbHV0aW9uLiBJdCBoYXMgYnVpbHQgaW4gR29vZGl4LCBHVDkyNzEgY2FwdGl2
ZSB0b3VjaHNjcmVlbgp3aXRoIGJhY2tsaWdodCBhZGp1c3RhYmxlIHZpYSBQV00uCgpBZGQgc3Vw
cG9ydCBmb3IgaXQuCgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNv
bT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjI6Ci0gc2VwYXJhdGUgaXQgZnJvbSBi
aW5kaW5nIHBhdGNoCi0gc29ydCB0aGUgbWF0Y2ggaWQgYW5kIGNvbXBhdGlibGUgCgogZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jCmluZGV4IDllODIxOGY2YTNmMi4uOTMyNzRlMjcwNjYzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0xMTg0LDYgKzExODQsMjkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGZveGxpbmtfZmw1MDB3dnIwMF9hMHQgPSB7CiAJLmJ1
c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAogfTsKIAorc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGZyaWVuZGx5YXJtX2hkNzAyZV9tb2RlID0geworCS5j
bG9jawkJPSA2NzE4NSwKKwkuaGRpc3BsYXkJPSA4MDAsCisJLmhzeW5jX3N0YXJ0CT0gODAwICsg
MjAsCisJLmhzeW5jX2VuZAk9IDgwMCArIDIwICsgMjQsCisJLmh0b3RhbAkJPSA4MDAgKyAyMCAr
IDI0ICsgMjAsCisJLnZkaXNwbGF5CT0gMTI4MCwKKwkudnN5bmNfc3RhcnQJPSAxMjgwICsgNCwK
KwkudnN5bmNfZW5kCT0gMTI4MCArIDQgKyA4LAorCS52dG90YWwJCT0gMTI4MCArIDQgKyA4ICsg
NCwKKwkudnJlZnJlc2gJPSA2MCwKKwkuZmxhZ3MJCT0gRFJNX01PREVfRkxBR19OVlNZTkMgfCBE
Uk1fTU9ERV9GTEFHX05IU1lOQywKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVz
YyBmcmllbmRseWFybV9oZDcwMmUgPSB7CisJLm1vZGVzID0gJmZyaWVuZGx5YXJtX2hkNzAyZV9t
b2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS5zaXplID0geworCQkud2lkdGgJPSA5NCwKKwkJLmhl
aWdodAk9IDE1MSwKKwl9LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlIGdpYW50cGx1c19ncGc0ODI3MzlxczVfbW9kZSA9IHsKIAkuY2xvY2sgPSA5MDAwLAogCS5o
ZGlzcGxheSA9IDQ4MCwKQEAgLTI2MzcsNiArMjY2MCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJs
ZSA9ICJmb3hsaW5rLGZsNTAwd3ZyMDAtYTB0IiwKIAkJLmRhdGEgPSAmZm94bGlua19mbDUwMHd2
cjAwX2EwdCwKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gImZyaWVuZGx5YXJtLGhkNzAyZSIsCisJ
CS5kYXRhID0gJmZyaWVuZGx5YXJtX2hkNzAyZSwKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0gImdp
YW50cGx1cyxncGc0ODI3MzlxczUiLAogCQkuZGF0YSA9ICZnaWFudHBsdXNfZ3BnNDgyNzM5cXM1
Ci0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
