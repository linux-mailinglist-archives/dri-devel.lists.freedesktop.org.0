Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BEE38B7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BC86E505;
	Thu, 24 Oct 2019 16:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE76E4D4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n15so16072634wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NT91ixyOydK7qB96GIPJOfEspuJPPBJ5IFvHC12wAR8=;
 b=kTA6tlOTcIP8zsj+2xSt1mkXBcxo8LMHuZ7IeI/6DrMVR9XbFXRNksZlfn1dVnXqW7
 YOPkwoRAuaQ+XkqMJK4KHZWpu6t3sTdv+tv0kxmDLSy2iuh+BeQsLZhgd3+T5ezGT5pF
 kHpw+eMW+iU3ut5PFwUvwl2P7wqqDQydY4a/xOYfwO658r0El3COYJ7PCy/pFRA4NwY+
 eMkjWz0pvK+ehqtupIO3dOb+zsFIJ8VTttt3mJA6joBvaHY4dvINbFWEUeNZEkWCcvHS
 N0q9C5tgghwlyKqfxSV9ZC7vvJ/D/kK+NPN+G6K8e1lJqWTcss6MKskFcGfA5fkhDzbJ
 TyJw==
X-Gm-Message-State: APjAAAUMgRWx05riSM7a1h8YOSTPn7mzES5XCGtkTCyFT61Lx/1Bsx5f
 nvfsXEY2TfdXqw9YIgbAT5k=
X-Google-Smtp-Source: APXvYqxXZcg2upg7fjAz2/y500pwHBj5qwugs8fAt0m2iRpSER2xWrE2PrSTsevL9U61oGwvwU3V0Q==
X-Received: by 2002:a05:6000:11c4:: with SMTP id
 i4mr4638067wrx.277.1571935586785; 
 Thu, 24 Oct 2019 09:46:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id g5sm3596115wmg.12.2019.10.24.09.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 22/32] drm/tegra: sor: Remove tegra186-sor1 support
Date: Thu, 24 Oct 2019 18:45:24 +0200
Message-Id: <20191024164534.132764-23-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NT91ixyOydK7qB96GIPJOfEspuJPPBJ5IFvHC12wAR8=;
 b=i5ZvW56P9o2vrG223SkKlNPdXMG9zWHHbDYW525HN4gnSUp0eii74knnQ2y/Pm+vGT
 4Le1b81W8dEXQl4E8+TYHNX6b+/jQJcc6EQso72skJUHSTd8s4e2mR5ioivA38VVN0nQ
 WStZKlHF3emj0pIvcqcdlGUA+et2LkbMzZYH2oI191s1rVrapoAc42nApWQ7CeJrQb7K
 ZxRewovB7f6BzxsRViin2EGNObaxcucUfjbaMeOmOBHuFThI3efhWDBA+s/v/n6Nb/XX
 09J8+/lorpSSgqVjboGTqb08EIAUxw98mjBTZB52b4GywsFSJ/9A4MSndZi6MYvclr0L
 K8Ng==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkl0IHR1cm5zIG91dCB0
aGF0IFNPUjEgaXMganVzdCBhbm90aGVyIGluc3RhbmNlIG9mIHRoZSBzYW1lIGJsb2NrIGFzIHRo
ZQpTT1IwLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGRpc3Rpbmd1aXNoIHRoZW0uCgpTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYyB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9z
b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCA5Y2YwMDhkN2M2N2IuLjRl
NDY1MjRmMjJlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMzY4MCwyMyArMzY4MCw2IEBAIHN0YXRp
YyBjb25zdCB1OCB0ZWdyYTE4Nl9zb3JfcHJlX2VtcGhhc2lzWzRdWzRdWzRdID0gewogfTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCB0ZWdyYV9zb3Jfc29jIHRlZ3JhMTg2X3NvciA9IHsKLQkuc3Vw
cG9ydHNfZWRwID0gZmFsc2UsCi0JLnN1cHBvcnRzX2x2ZHMgPSBmYWxzZSwKLQkuc3VwcG9ydHNf
aGRtaSA9IGZhbHNlLAotCS5zdXBwb3J0c19kcCA9IHRydWUsCi0KLQkucmVncyA9ICZ0ZWdyYTE4
Nl9zb3JfcmVncywKLQkuaGFzX252ZGlzcGxheSA9IHRydWUsCi0KLQkueGJhcl9jZmcgPSB0ZWdy
YTEyNF9zb3JfeGJhcl9jZmcsCi0JLmxhbmVfbWFwID0gdGVncmExMjRfc29yX2xhbmVfbWFwLAot
CS52b2x0YWdlX3N3aW5nID0gdGVncmExODZfc29yX3ZvbHRhZ2Vfc3dpbmcsCi0JLnByZV9lbXBo
YXNpcyA9IHRlZ3JhMTg2X3Nvcl9wcmVfZW1waGFzaXMsCi0JLnBvc3RfY3Vyc29yID0gdGVncmEx
MjRfc29yX3Bvc3RfY3Vyc29yLAotCS50eF9wdSA9IHRlZ3JhMTI0X3Nvcl90eF9wdSwKLX07Ci0K
LXN0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfc29yX3NvYyB0ZWdyYTE4Nl9zb3IxID0gewogCS5z
dXBwb3J0c19lZHAgPSBmYWxzZSwKIAkuc3VwcG9ydHNfbHZkcyA9IGZhbHNlLAogCS5zdXBwb3J0
c19oZG1pID0gdHJ1ZSwKQEAgLTM3NDcsNyArMzczMCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
dGVncmFfc29yX3NvYyB0ZWdyYTE5NF9zb3IgPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIHRlZ3JhX3Nvcl9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAibnZp
ZGlhLHRlZ3JhMTk0LXNvciIsIC5kYXRhID0gJnRlZ3JhMTk0X3NvciB9LAotCXsgLmNvbXBhdGli
bGUgPSAibnZpZGlhLHRlZ3JhMTg2LXNvcjEiLCAuZGF0YSA9ICZ0ZWdyYTE4Nl9zb3IxIH0sCiAJ
eyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExODYtc29yIiwgLmRhdGEgPSAmdGVncmExODZf
c29yIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmEyMTAtc29yMSIsIC5kYXRhID0g
JnRlZ3JhMjEwX3NvcjEgfSwKIAl7IC5jb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTIxMC1zb3Ii
LCAuZGF0YSA9ICZ0ZWdyYTIxMF9zb3IgfSwKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
