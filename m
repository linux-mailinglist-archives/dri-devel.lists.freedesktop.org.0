Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C585CCA52
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 16:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C506E372;
	Sat,  5 Oct 2019 14:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E85A6E375
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 14:19:28 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f21so4519382plj.10
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2019 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j71JSmqo2p/lC+pVotGwXL+zyAoHaLpisutyi3M3xfk=;
 b=rrhl24Te2fO6YUXSK2c5+R2uAnbVpED7cakJhtU40HIjtUZksC3XOt/v3Leeqw9kID
 2qRBwj0kkm+jqced+oei/8Ek2FVnnK2Eml4TfHXa96Qd4k8h9Mi3wtSTmh9WGx14ND1x
 z7t3oVb+vUUnFp79S+hsQfOx0J8m1+YIY3r9RG37SwrMvymMsI6M0Uo47rjZfj7T8PME
 jt2fMoox5gKY/P4vLxwhLkRt038X+weXeofDafvkDvmb3QOU0ojROlBOYxAroEuBqsfG
 t79YF27mDNgZqwJ9ClCEkHmIIBjT017BM/83WtIr7BRkrLnO+xNNc/P/4eDwpM+rM4eO
 tGtg==
X-Gm-Message-State: APjAAAVTNQKf8we5O7CWjeM1Ql0HKMDlWEIQLRcsJ1Q7sGAkrmE820Mn
 3usn+W2sx2sfjA+Axkaxa0IXE6SPXsA=
X-Google-Smtp-Source: APXvYqyUl411uM87vrRwvlJ+wF+fjjwaiPL9XpGjvqCaxZBcb4sTtYi07sCxLpjnKzSjOFwvn84EDg==
X-Received: by 2002:a17:902:b182:: with SMTP id
 s2mr20310966plr.219.1570285168104; 
 Sat, 05 Oct 2019 07:19:28 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id y138sm8977604pfb.174.2019.10.05.07.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 07:19:27 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v10 1/6] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI compatible
Date: Sat,  5 Oct 2019 19:49:08 +0530
Message-Id: <20191005141913.22020-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191005141913.22020-1-jagan@amarulasolutions.com>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j71JSmqo2p/lC+pVotGwXL+zyAoHaLpisutyi3M3xfk=;
 b=c+bNHX150ih1LLE2k5LrQDgeo2hmhkZLqKyEExZX/B9Swz4KTLiOD9Tf1g9nTLGKsa
 YqPTXWFZnLndq79saXmDqpW7gRgHF3ZqVz6kDb/BW0O0RXfwr0kO947ZodH7f5X2p4c5
 fgCyZ0HJsarIkoZGz+CU1cmFxaXs0+2q01eB0=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEz
My4KCkJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdhdGluZyBzbyBp
dCBpcyB2YWxpZAp0byB3aXRoIHNlcGFyYXRlIGNvbXBhdGlibGUgZm9yIEE2NCBvbiB0aGUgc2Ft
ZSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRp
b25zLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIsc3VuNmktYTMxLW1p
cGktZHNpLnlhbWwgICAgICAgIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEz
MS1taXBpLWRzaS55YW1sCmluZGV4IGRhZmMwOTgwYzRmYS4uY2ZjYzg0ZDM4MDg0IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIs
c3VuNmktYTMxLW1pcGktZHNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaS55YW1sCkBAIC0xNSw3
ICsxNSw5IEBAIHByb3BlcnRpZXM6CiAgICIjc2l6ZS1jZWxscyI6IHRydWUKIAogICBjb21wYXRp
YmxlOgotICAgIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHNpCisgICAgZW51bToK
KyAgICAgIC0gY29uc3Q6IGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kKKyAgICAgIC0gY29u
c3Q6IGFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHNpCiAKICAgcmVnOgogICAgIG1heEl0ZW1z
OiAxCi0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
