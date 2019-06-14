Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5114648D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EB889AA7;
	Fri, 14 Jun 2019 16:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856F189AA7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:43:45 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id a186so1790550pfa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlwa0s5nqheQS3zabJv02XXNAZF54w3RCaO1lz7mJ5Q=;
 b=ZBjzmRyKHVbY0FwnuK5sCmSnp4fDlMV5oTdRxR0uDG2Y0fERV0t+3q90Z477tAFuQM
 6/03dGO912Nm3hdmSygQujdLsotjH/XWZcZbnhgASEdw2PfZXx/uKKajQJHpHoABcg4c
 mXcP6PDGyhgGquIlXW97YyvtKLA/eovJAJrRV42W7om6W2P7tPCMKrAXvADY7NXBI1th
 /l9hJjURbrTKYfzNaso5EYdGbqPqZsZcZRLdIwt5I43Eq9mLUfdXnbAOJvI624TtDO7W
 sRhfwVemxsK9YSivMOveTlCgMtRUVMFo0fxUR/wlq9PH0beaZPBWYxlY8/p5pCwJw/Yd
 i43g==
X-Gm-Message-State: APjAAAUIW/UH4RuLqqx13FlX7ZHseVxKFtsNeLv+VsdoBS0/wqNJIZGM
 jYuZKJRDiRt9f2B83heSJfdhHQ==
X-Google-Smtp-Source: APXvYqzxQKiNS3nurPOM/V2GvxzGm9mKdD7TK0cz5nTv+lySbEQRBjB51s0f2UVYbHxtO6KpqnOlHw==
X-Received: by 2002:a17:90a:af8e:: with SMTP id
 w14mr12320434pjq.89.1560530625092; 
 Fri, 14 Jun 2019 09:43:45 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.43.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:43:44 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 1/9] dt-bindings: display: Add TCON LCD compatible for R40
Date: Fri, 14 Jun 2019 22:13:16 +0530
Message-Id: <20190614164324.9427-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlwa0s5nqheQS3zabJv02XXNAZF54w3RCaO1lz7mJ5Q=;
 b=qyDQb+/76FQ6lTl+mdRWZykq7uCJj62GkbjTONISkaUVyPOfFAVxh65BAsgt6CPzut
 9ZhtdcgyXulLsQ1H3JMr+aIhTmdWStjDH33vZohhqIgSFCH9Bmt1KPxsjMRXuFEmqAAd
 VsjLDD8ARz48aonbrS/nKu3429nfJ9hSppYtE=
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

TGlrZSBUQ09OIFRWMCwgVFYxIGFsbHdpbm5lciBSNDAgaGFzIFRDT04gTENEMCwgTENEMSB3aGlj
aAphcmUgbWFuYWdlZCB2aWEgVENPTiBUT1AuCgpBZGQgdGNvbiBsY2QgY29tcGF0aWJsZSBSNDAs
IHRoZSBzYW1lIGNvbXBhdGlibGUgY2FuIGhhbmRsZQpUQ09OIExDRDAsIExDRDEuCgpTaWduZWQt
b2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KQWNrZWQtYnk6
IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0IHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNGktZHJtLnR4dAppbmRleCAzMWFi
NzJjYmEzZDQuLjllOWM3ZjkzNDIwMiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3VueGkvc3VuNGktZHJtLnR4dAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW40aS1kcm0udHh0CkBAIC0x
NjAsNiArMTYwLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKICAgICogYWxsd2lubmVyLHN1bjhp
LWEzMy10Y29uCiAgICAqIGFsbHdpbm5lcixzdW44aS1hODN0LXRjb24tbGNkCiAgICAqIGFsbHdp
bm5lcixzdW44aS1hODN0LXRjb24tdHYKKyAgICogYWxsd2lubmVyLHN1bjhpLXI0MC10Y29uLWxj
ZAogICAgKiBhbGx3aW5uZXIsc3VuOGktcjQwLXRjb24tdHYKICAgICogYWxsd2lubmVyLHN1bjhp
LXYzcy10Y29uCiAgICAqIGFsbHdpbm5lcixzdW45aS1hODAtdGNvbi1sY2QKLS0gCjIuMTguMC4z
MjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
