Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D310FF1E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4736E542;
	Tue,  3 Dec 2019 13:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414496E542
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:48:40 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x185so1891302pfc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EGC/dOGDlJSYQ3xkj7DfBdq9vhE8rvcGutHHf40Jkqk=;
 b=qK+GxnaHJNwSBIYfem6P3euRrzRIE7EqH5QCSn/GGTLRwN9l7pJun33E8UoZEVNniE
 7iqY+nYuQa3Hczq544BX0G4Co1Yx3q21dynKunw7YmK0QhQO7bLSW7mCe86vM8A93gfV
 vbJJqZuW29bH9F+5iYGoRav9ZAtMbyuqmuXRE6nKS/aRJgnlT/joQ0qWQypMuZtAEfq7
 wrnPRE4+EmKnhY83fqOHewix6dCNgpeim9omEbwgF/UsuOa6BHC7rsAX+Qnk3mQI/CcZ
 UiWwaSnYmrAp5IHnXX7CtmDQhu2WWogKoVas7XjPI8rWW+pIqGmXZ9C9D9ob+KPi8WNN
 RN6Q==
X-Gm-Message-State: APjAAAVEuhu148qxrglzWr/QzB5+QwDUCMZ5CP8Y0/w7zaXlhg3vqJXH
 eHD5TGWCGF572qDbC9eEueFcnQ==
X-Google-Smtp-Source: APXvYqwR2WHs/BvcSDVgvw8QRHGGBx7PujazP2vgdr3BhHFqIFkSC6fyLCUzShQFbKUEz7BbybKzqw==
X-Received: by 2002:a62:2686:: with SMTP id m128mr4905220pfm.143.1575380919848; 
 Tue, 03 Dec 2019 05:48:39 -0800 (PST)
Received: from localhost.localdomain ([115.97.190.29])
 by smtp.gmail.com with ESMTPSA id y144sm4397892pfb.188.2019.12.03.05.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:48:39 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v12 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/
 A31 fallback)
Date: Tue,  3 Dec 2019 19:18:11 +0530
Message-Id: <20191203134816.5319-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191203134816.5319-1-jagan@amarulasolutions.com>
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EGC/dOGDlJSYQ3xkj7DfBdq9vhE8rvcGutHHf40Jkqk=;
 b=gO/BVoVsJL4xEzBmaVscN3RJXJZgCV8rufB0cy0WTl2Mw3tqf841WEU8F8OfPl6iXJ
 tcmndNcqLNDxqpIXIWRVf1l9idid8xPBdg1kMTEoPwT2OKa1USdddMWtKRZ/S50TZmvm
 H75IKVE9Ypt9ZeR5PsTS55IlswuTM04Io4fBQ=
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
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1JUEkgRFNJIFBIWSBjb250cm9sbGVyIG9uIEFsbHdpbm5lciBBNjQgaXMgc2ltaWxhcgpv
biB0aGUgb25lIG9uIEEzMS4KCkFkZCBBNjQgY29tcGF0aWJsZSBhbmQgYXBwZW5kIEEzMSBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MTI6Ci0gbm9uZQoKIC4uLi9iaW5k
aW5ncy9waHkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkueWFtbCAgICAgICAgIHwgNiAr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2FsbHdpbm5l
cixzdW42aS1hMzEtbWlwaS1kcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kcGh5LnlhbWwKaW5kZXggZmE0NjY3
MGRlMjk5Li44ODQxOTM4MDUwYjIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkueWFtbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2FsbHdpbm5lcixzdW42aS1hMzEt
bWlwaS1kcGh5LnlhbWwKQEAgLTE1LDcgKzE1LDExIEBAIHByb3BlcnRpZXM6CiAgICAgY29uc3Q6
IDAKIAogICBjb21wYXRpYmxlOgotICAgIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGkt
ZHBoeQorICAgIG9uZU9mOgorICAgICAgLSBjb25zdDogYWxsd2lubmVyLHN1bjZpLWEzMS1taXBp
LWRwaHkKKyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBjb25zdDogYWxsd2lubmVyLHN1bjUw
aS1hNjQtbWlwaS1kcGh5CisgICAgICAgICAgLSBjb25zdDogYWxsd2lubmVyLHN1bjZpLWEzMS1t
aXBpLWRwaHkKIAogICByZWc6CiAgICAgbWF4SXRlbXM6IDEKLS0gCjIuMTguMC4zMjEuZ2ZmYzZm
YTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
