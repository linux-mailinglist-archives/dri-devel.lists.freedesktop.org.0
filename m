Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F152DB33
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8C06E2B8;
	Wed, 29 May 2019 10:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5F86E2B8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:57:18 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a5so896142pls.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6DwmkLGpJZpkcPw0XMVVDkf1y0K009QPRSW8hUfXBRY=;
 b=LswpKVUSE12cIy3FODNYISdgGuz92FfBSja4cOAFoxdAurdL+OM1aRoyMtdB3sUSdG
 OsuTbI0NU/Au6+ulkr22keBe0L8BbjZgs24iNYEMVooH3Up97JGsUjDxnoWWzVh5FD+O
 i7MylTRmAj18Mzxj6IKd5l/oDoiv5bJ/mk6e3puKgzfSNaQNoGOFb43ogb9xgLmIZ8XM
 l5Idbbs7knzjAQinIlvccYLxSp5xiSAhnoBNgwyOmhNgusTZRihg9DLvADuw2O+FGV/3
 bioTc0LkMX/uZLi4+cM3ii/coXnVq5aXgR9jMNWBUtNjm91dz2Zlo2W3jV3DAaQGR1Gu
 2K1Q==
X-Gm-Message-State: APjAAAXuiqlSUctNIHvCuQ9jgLHRmfpjRPB0GGoIHbDXyGZOJJakqCBn
 0jVPVULXzjnAwTpT2lmwBYfITA==
X-Google-Smtp-Source: APXvYqwygLxq0inFrDqP1GBEA4oJIXO+O1N08+R0LPi1oqe2Amq7V89w6a/dgny0hRfvq1CVA26PnA==
X-Received: by 2002:a17:902:20eb:: with SMTP id
 v40mr15879742plg.239.1559127437024; 
 Wed, 29 May 2019 03:57:17 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.57.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:57:16 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [DO NOT MERGE] [PATCH v9 8/9] arm64: dts: allwinner: a64-pine64-lts:
 Enable Feiyang FY07024DI26A30-D DSI panel
Date: Wed, 29 May 2019 16:26:14 +0530
Message-Id: <20190529105615.14027-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6DwmkLGpJZpkcPw0XMVVDkf1y0K009QPRSW8hUfXBRY=;
 b=VFu9w0hD1Ourpd8eMMh8PYNciyswgOS1KtrgHUdk0KAmbBdup7r3OzJtKsKMtdN0BH
 5AS3DuAId2PTW+ttuh2IAHVuA7mZ2XxF6MgB1mm9oABWptM+8bobX3Dwxul01VlpKDoS
 gSnWhBuTO1Skk4JqIA12yvsaam3Xpv9pnZMN0=
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmVpeWFuZyBGWTA3MDI0REkyNkEzMC1EIE1JUElfRFNJIHBhbmVsIGlzIGRlc2lnZWQgdG8gYXR0
YWNoIHdpdGgKRFNJIGNvbm5lY3RvciBvbiBwaW5lNjQgYm9hcmRzLCBlbmFibGUgdGhlIHNhbWUg
Zm9yIHBpbmU2NCBMVFMuCgpEU0kgcGFuZWwgY29ubmVjdGVkIHZpYSBib2FyZCBEU0kgcG9ydCB3
aXRoLAotIERMRE8xIGFzIFZDQy1EU0kgc3VwcGx5Ci0gREMxU1cgYXMgQVZERCBzdXBwbHkKLSBE
TERPMiBhcyBEVkREIHN1cHBseQotIFBEMjQgZ3BpbyBmb3IgcmVzZXQgcGluCi0gUEgxMCBncGlv
IGZvciBiYWNrbGlnaHQgZW5hYmxlIHBpbgoKVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJs
aWpuQHdpenp1cC5vcmc+ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgotLS0KIC4uLi9hbGx3aW5uZXIvc3VuNTBpLWE2NC1zb3BpbmUtYmFzZWJv
YXJkLmR0cyB8IDMxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWE2NC1zb3BpbmUtYmFzZWJvYXJkLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lu
bmVyL3N1bjUwaS1hNjQtc29waW5lLWJhc2Vib2FyZC5kdHMKaW5kZXggZTZmYjk2ODNmMjEzLi41
MWIwY2Y3MWMzZDQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1
bjUwaS1hNjQtc29waW5lLWJhc2Vib2FyZC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWE2NC1zb3BpbmUtYmFzZWJvYXJkLmR0cwpAQCAtNDYsNiArNDYsNyBA
QAogL2R0cy12MS87CiAKICNpbmNsdWRlICJzdW41MGktYTY0LXNvcGluZS5kdHNpIgorI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3B3bS9wd20uaD4KIAogLyB7CiAJbW9kZWwgPSAiU29QaW5lIHdpdGgg
YmFzZWJvYXJkIjsKQEAgLTYxLDYgKzYyLDE0IEBACiAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6
MTE1MjAwbjgiOwogCX07CiAKKwliYWNrbGlnaHQ6IGJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUg
PSAicHdtLWJhY2tsaWdodCI7CisJCXB3bXMgPSA8JnJfcHdtIDAgNTAwMDAgUFdNX1BPTEFSSVRZ
X0lOVkVSVEVEPjsKKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MSAyIDQgOCAxNiAzMiA2NCAxMjgg
MjU1PjsKKwkJZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDg+OworCQllbmFibGUtZ3Bpb3Mg
PSA8JnBpbyA3IDEwIEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBMQ0QtQkwtRU46IFBIMTAgKi8KKwl9
OworCiAJaGRtaS1jb25uZWN0b3IgewogCQljb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsK
IAkJdHlwZSA9ICJhIjsKQEAgLTEwNCw2ICsxMTMsMjQgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9
OwogCismZHBoeSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmRzaSB7CisJdmNjLWRzaS1z
dXBwbHkgPSA8JnJlZ19kbGRvMT47CQkvKiBWQ0MtRFNJICovCisJc3RhdHVzID0gIm9rYXkiOwor
CisJcGFuZWxAMCB7CisJCWNvbXBhdGlibGUgPSAiZmVpeWFuZyxmeTA3MDI0ZGkyNmEzMGQiOwor
CQlyZWcgPSA8MD47CisJCWF2ZGQtc3VwcGx5ID0gPCZyZWdfZGMxc3c+OwkvKiBWQ0MtTENEICov
CisJCWR2ZGQtc3VwcGx5ID0gPCZyZWdfZGxkbzI+OwkvKiBWQ0MtTUlQSSAqLworCQlyZXNldC1n
cGlvcyA9IDwmcGlvIDMgMjQgR1BJT19BQ1RJVkVfSElHSD47IC8qIExDRC1SU1Q6IFBEMjQgKi8K
KwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCX07Cit9OworCiAmZWhjaTAgewogCXN0YXR1
cyA9ICJva2F5IjsKIH07CkBAIC0xODQsNiArMjExLDEwIEBACiAJdmNjLWhkbWktc3VwcGx5ID0g
PCZyZWdfZGxkbzE+OwogfTsKIAorJnJfcHdtIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAm
c291bmQgewogCXNpbXBsZS1hdWRpby1jYXJkLGF1eC1kZXZzID0gPCZjb2RlY19hbmFsb2c+Owog
CXNpbXBsZS1hdWRpby1jYXJkLHdpZGdldHMgPSAiTWljcm9waG9uZSIsICJNaWNyb3Bob25lIEph
Y2siLAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
