Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CF2DB1C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89BA6E0AA;
	Wed, 29 May 2019 10:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993046E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:56:46 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id g9so1373718pfo.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ckydVo2IPZQfXMKYGz1uqlUzm7n70fMIZ1xjq1PJknE=;
 b=hlYW5o7LPSB2zsJQP3QtTf9LMcxETrummETvZw2dXwEpDPdQn8e5byW1UQiMHK3Yos
 Q13be8JEasL3jGc9EEditPH6amdsEvclzxm30N5ATAZRP7piRmNNw8PaLVd9MbiQlX2C
 rnl5ZhjDYl/BT4AdKKMufl2ikMkWLXx49bbrExoWysLy4j6y6VAD0gnRkx7oegKgry0A
 Md1Ce0cAbj80i5guuT66I4k3r7bFAtjcV8AFhjGyMzvQeZHXuxRdNx/lnp/UKMshEdJ5
 RPNKQmuCGUDsd3CADyEYwiPag+kXba5PwZzZY4IloxkPtDUHo0LdER4qU7YVevLh+EZy
 dEwg==
X-Gm-Message-State: APjAAAXohe6dJUe/HtPVgRmuSuoCcaZwV9Z6LSHKzxMQcrOt7XSQ4Gez
 vPA487COsDMaPIdtOCu2qFcctw==
X-Google-Smtp-Source: APXvYqxAqeyPUCEfsLpzPpNkG6VxtpiEQSBzycYxUZb/YK7f/rdLKTkrj+3tN8YOGJs1FXUIwvLy1A==
X-Received: by 2002:a63:4d56:: with SMTP id
 n22mr110949138pgl.307.1559127406146; 
 Wed, 29 May 2019 03:56:46 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.56.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:56:45 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/9] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
Date: Wed, 29 May 2019 16:26:07 +0530
Message-Id: <20190529105615.14027-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ckydVo2IPZQfXMKYGz1uqlUzm7n70fMIZ1xjq1PJknE=;
 b=V0jQzMibWyqWK10H6MvY76fJcwPWlGrRY8e7Df827n8zYmV9xEN/F62M7y906QKzhy
 xoeISZnEqS7mw55e65yCWO7PijGBgJGHsLydsQoE9PlcgzZ466LkuT5qH+47NCdA5P9Z
 1YRFF+E28l166xBoI+WV7zEvpSlDNH63GJ2Qo=
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

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEz
My4KCkJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdhdGluZyBzbyBp
dCBpcyB2YWxpZAp0byB3aXRoIHNlcGFyYXRlIGNvbXBhdGlibGUgZm9yIEE2NCBvbiB0aGUgc2Ft
ZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRp
b25zLmNvbT4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClRlc3Rl
ZC1ieTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgotLS0KIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0
CmluZGV4IDFjYzQwNjYzYjdhMi4uOTg3NzM5OGJlNjlhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdW54aS9zdW42aS1kc2kudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRz
aS50eHQKQEAgLTEyLDYgKzEyLDcgQEAgVGhlIERTSSBFbmNvZGVyIGdlbmVyYXRlcyB0aGUgRFNJ
IHNpZ25hbCBmcm9tIHRoZSBUQ09OJ3MuCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAtIGNvbXBh
dGlibGU6IHZhbHVlIG11c3QgYmUgb25lIG9mOgogICAgICogYWxsd2lubmVyLHN1bjZpLWEzMS1t
aXBpLWRzaQorICAgICogYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kKICAgLSByZWc6IGJh
c2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiBtZW1vcnktbWFwcGVkIHJlZ2lvbgogICAtIGludGVycnVw
dHM6IGludGVycnVwdCBhc3NvY2lhdGVkIHRvIHRoaXMgSVAKICAgLSBjbG9ja3M6IHBoYW5kbGVz
IHRvIHRoZSBjbG9ja3MgZmVlZGluZyB0aGUgRFNJIGVuY29kZXIKLS0gCjIuMTguMC4zMjEuZ2Zm
YzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
