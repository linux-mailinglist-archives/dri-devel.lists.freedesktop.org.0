Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4F464A8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BA589B48;
	Fri, 14 Jun 2019 16:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2C89B11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:44:06 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s27so1872671pgl.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rjQuB296hfp4qUoq+6jTshGIZnt17kv/able4oYgNY=;
 b=BfhLTpT//PXzXR6k8ce8fCF27TeeCI9PK0Zvia3ODsDxxteb/f4htwxE1LApucnyCQ
 SdXKzwn4b3l80gMUD4O/cJbsRrZ6h6wZFb/UHdNjjuVXQ6pBGeuYxh+xWmxAKsYEghrd
 Fdzu8vWLwYrWNu0ExGoaZDEi1AbfBlmXR1BjTXVi/m54crXR76flbybTSW2LaJTg7irq
 DC1zhFEBY2vHUfTU/ADb890ntE1pQekELU9kFNhEcNk0cYQ4t92I8YlOWz/HdXLJrthy
 lKkeFoeGJ7XJ9/jaibZanIstupgECWNF848DraE3O25k5Ms90I0QrdoF7ah5Euv90UAK
 TIuA==
X-Gm-Message-State: APjAAAUlXEr3XkPAuc3mGZcYxxnTGd4pKCnwSOvZGPcs1GmR8E42Zl3q
 xAlN14cckFHb21ORnoK2r2EAVw==
X-Google-Smtp-Source: APXvYqxP0WmrTVw50rx/FytEhR6NAKnXMvz/RCUMoTAx8wmz1g6jzNa4s+rIzY3i9D8U4EzfOzGmgg==
X-Received: by 2002:a17:90a:b00b:: with SMTP id
 x11mr12178417pjq.120.1560530645251; 
 Fri, 14 Jun 2019 09:44:05 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.44.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:44:04 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 6/9] dt-bindings: sun6i-dsi: Add R40 MIPI-DSI compatible
 (w/ A64 fallback)
Date: Fri, 14 Jun 2019 22:13:21 +0530
Message-Id: <20190614164324.9427-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rjQuB296hfp4qUoq+6jTshGIZnt17kv/able4oYgNY=;
 b=jcBZ6YMltICKDAXDCZu7yT0KHax9GStXh55CAzwxRtyM1XcvrLR4OeHIh+melge7j8
 8KlHTIWZZj09dAZONDclCazGOwpGX2wsWeiBI2/Z76lDWhXgfMlFtFx+bCcmcR6e1w2a
 il57TilFvp/301Ukd0ea7ssDIf2cdSg9z35GI=
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

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIFI0MCBpcyBzaW1pbGFyIG9uCnRo
ZSBvbmUgb24gQTY0IGxpa2UgZG9lc24ndCBhc3NvY2lhdGUgYW55IERTSV9TQ0xLIGdhdGluZy4K
ClNvLCBhZGQgUjQwIGNvbXBhdGlibGUgYW5kIGFwcGVuZCBBNjQgY29tcGF0aWJsZSBhcyBmYWxs
YmFjay4KClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhp
L3N1bjZpLWRzaS50eHQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhp
L3N1bjZpLWRzaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9zdW54aS9zdW42aS1kc2kudHh0CmluZGV4IGQwY2U1MWZlYTEwMy4uNDM4ZjFmOTk5YWViIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54
aS9zdW42aS1kc2kudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQKQEAgLTEzLDYgKzEzLDcgQEAgUmVxdWlyZWQgcHJv
cGVydGllczoKICAgLSBjb21wYXRpYmxlOiB2YWx1ZSBtdXN0IGJlIG9uZSBvZjoKICAgICAqIGFs
bHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kKICAgICAqIGFsbHdpbm5lcixzdW41MGktYTY0LW1p
cGktZHNpCisgICAgKiBhbGx3aW5uZXIsc3VuOGktcjQwLW1pcGktZHNpLCBhbGx3aW5uZXIsc3Vu
NTBpLWE2NC1taXBpLWRzaQogICAtIHJlZzogYmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIG1lbW9y
eS1tYXBwZWQgcmVnaW9uCiAgIC0gaW50ZXJydXB0czogaW50ZXJydXB0IGFzc29jaWF0ZWQgdG8g
dGhpcyBJUAogICAtIGNsb2NrczogcGhhbmRsZXMgdG8gdGhlIGNsb2NrcyBmZWVkaW5nIHRoZSBE
U0kgZW5jb2RlcgotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
