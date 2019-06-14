Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31857464A2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC4189B27;
	Fri, 14 Jun 2019 16:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D3789B03
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:43:59 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f97so1249084plb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMcHhUCCSqrQ8w5r0SBOHVWgQpyokTTOxyC10sE/a4o=;
 b=Lknfilev3tiL6Yr2vv/s4GLKxHBFkVL5ySASc8aMIAed7i7s6PWzPEaQtujWH0mbPo
 TwVHGAHBUaEOvfdSVUlW0zYzpgKLOuWGEYP3xhO5GaRXKFU12OLRjiI9IBExt3y2SSbi
 YPYe6PjXmWYD+suBhe5TNe75B6ySnuYCAgkYzUFwG7gM5vRVk7hazpHkZUB+MYCoSEbg
 9C/OmaflEmEIiZWscYTmc2XwLdyQ/vjpWeiXnLp6TX+TCnbZlD0xXT+vOq+z5IpA7bnB
 uyZrgnU9C4c0abyqXWiOZCZ88O4HdwQsSAwMigdc0bH14ujbjodmMjvQBLUtvROiAmKM
 xOzA==
X-Gm-Message-State: APjAAAX64i2lxNRfK27ErGioq32y2v2KTdoujXP7Z9WhqSBs4elCezRw
 s0RX2mVNxbAh/+i0f1MZs2qwMw==
X-Google-Smtp-Source: APXvYqyFy8nCAnBwgIJRSJDDpBab+N09/m7BqSCnT6KVMvRVAN91roqAIbiRAuIW+l+mzB70c4EWpQ==
X-Received: by 2002:a17:902:fa2:: with SMTP id
 31mr70064172plz.38.1560530637426; 
 Fri, 14 Jun 2019 09:43:57 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.43.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:43:57 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 4/9] drm/sun4i: tcon_top: Use clock name index macros
Date: Fri, 14 Jun 2019 22:13:19 +0530
Message-Id: <20190614164324.9427-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMcHhUCCSqrQ8w5r0SBOHVWgQpyokTTOxyC10sE/a4o=;
 b=J8Xp1Wt+5I1Gk1+MvTX47WWZdXOHu/eA8HUtP8XrZIbLeH3QH5ChGzKZ/+Lk0j7X+F
 V8guvVzYksa4ijBm/m24OaE53k64yUpEFhyMxUSWfN/OX9yhzdD/HrIUIkdztBzUyZor
 tVj5UEVaiSYmpYHiQulYUu+OfiruHFD1rF2Lg=
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
Cc: linux-sunxi@googlegroups.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VENPTiBUT1AgbXV4IGJsb2NrcyBpbiBSNDAgYXJlIHJlZ2lzdGVyaW5nIGNsb2NrIHVzaW5nCnRj
b24gdG9wIGNsb2NrIGluZGV4IG51bWJlcnMuCgpSaWdodCBub3cgdGhlIGNvZGUgaXMgdXNpbmcs
IHJlYWwgbnVtYmVycyBzdGFydCB3aXRoIDAsIGJ1dAp3ZSBoYXZlIHByb3BlciBtYWNyb3MgdGhh
dCBkZWZpbmVkIHRoZXNlIG5hbWUgaW5kZXggbnVtYmVycy4KClVzZSB0aGUgZXhpc3RpbmcgbWFj
cm9zLCBpbnN0ZWFkIG9mIHJlYWwgbnVtYmVycyBmb3IgbW9yZQpjb2RlIHJlYWRhYmlsaXR5LgoK
U2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3Rjb25fdG9wLmMgfCA5ICsrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5jCmluZGV4IDMyNjdkMGY5YjliMi4uNDY1ZTliMGNk
ZmVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwpAQCAtMTk0LDE5ICsx
OTQsMjIgQEAgc3RhdGljIGludCBzdW44aV90Y29uX3RvcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWNsa19kYXRhLT5od3NbQ0xLX1RDT05fVE9QX1RW
MF0gPQogCQlzdW44aV90Y29uX3RvcF9yZWdpc3Rlcl9nYXRlKGRldiwgInRjb24tdHYwIiwgcmVn
cywKIAkJCQkJICAgICAmdGNvbl90b3AtPnJlZ19sb2NrLAotCQkJCQkgICAgIFRDT05fVE9QX1RD
T05fVFYwX0dBVEUsIDApOworCQkJCQkgICAgIFRDT05fVE9QX1RDT05fVFYwX0dBVEUsCisJCQkJ
CSAgICAgQ0xLX1RDT05fVE9QX1RWMCk7CiAKIAlpZiAocXVpcmtzLT5oYXNfdGNvbl90djEpCiAJ
CWNsa19kYXRhLT5od3NbQ0xLX1RDT05fVE9QX1RWMV0gPQogCQkJc3VuOGlfdGNvbl90b3BfcmVn
aXN0ZXJfZ2F0ZShkZXYsICJ0Y29uLXR2MSIsIHJlZ3MsCiAJCQkJCQkgICAgICZ0Y29uX3RvcC0+
cmVnX2xvY2ssCi0JCQkJCQkgICAgIFRDT05fVE9QX1RDT05fVFYxX0dBVEUsIDEpOworCQkJCQkJ
ICAgICBUQ09OX1RPUF9UQ09OX1RWMV9HQVRFLAorCQkJCQkJICAgICBDTEtfVENPTl9UT1BfVFYx
KTsKIAogCWlmIChxdWlya3MtPmhhc19kc2kpCiAJCWNsa19kYXRhLT5od3NbQ0xLX1RDT05fVE9Q
X0RTSV0gPQogCQkJc3VuOGlfdGNvbl90b3BfcmVnaXN0ZXJfZ2F0ZShkZXYsICJkc2kiLCByZWdz
LAogCQkJCQkJICAgICAmdGNvbl90b3AtPnJlZ19sb2NrLAotCQkJCQkJICAgICBUQ09OX1RPUF9U
Q09OX0RTSV9HQVRFLCAyKTsKKwkJCQkJCSAgICAgVENPTl9UT1BfVENPTl9EU0lfR0FURSwKKwkJ
CQkJCSAgICAgQ0xLX1RDT05fVE9QX0RTSSk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgQ0xLX05VTTsg
aSsrKQogCQlpZiAoSVNfRVJSKGNsa19kYXRhLT5od3NbaV0pKSB7Ci0tIAoyLjE4LjAuMzIxLmdm
ZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
