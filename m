Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E997124C3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 00:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FDC8925D;
	Thu,  2 May 2019 22:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C038925D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 22:54:24 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id n2so1710673pgg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 15:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2bbAFLYHg7BbnCqa8Z/3P6ZnGKzIwrgxFqmU0u6MtQ=;
 b=D1NX5TmPXtb7qxK3+1Ztynw4+2uJvsuUHMmPNW5HLtbWNpfxZfwh+KWKqechMTAdJh
 preLJ5WLmboeoExgyIszAA8E7PgV75jaJPsi5tXWONJJLVl9VH5nxti0tUPIXwzDqpD8
 cwreSf4ZSn3rtEVABFKBqk8V+iINCBGPFGH4jYdEaK48HhzBqcxtn7vpLmHk22KsAgU3
 M4IYY3S+lRwIf8/w62Jsq2TSHK+qmPSlNuwEGzde8kEVeWS40We82h0oskJNbPMCY+uQ
 VJyKnjHx0de2S6jNGH3WLm61xRV1Es1NLRX2YwpEpUHy8T1v1Q9wf331w6dTxYFg1CJL
 oo3g==
X-Gm-Message-State: APjAAAVyrWd64C0FO5VC2/mGXOV62nwKw/hVqQJn2p+6vtq2r9fRfGoF
 cRylTs90Sh3hD0tnrFEll1CwkA==
X-Google-Smtp-Source: APXvYqwTNwDX8rXg0Agwu8rSnUQ7+u0qFbATbHXFLNSH3EgUqxCM+Vs9APjZJjt0fwjZRPzV6nerSA==
X-Received: by 2002:a65:6688:: with SMTP id b8mr6519822pgw.81.1556837664123;
 Thu, 02 May 2019 15:54:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id v15sm264736pff.105.2019.05.02.15.54.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:54:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/5] dt-bindings: drm/bridge/synopsys: dw-hdmi: Add "unwedge"
 for ddc bus
Date: Thu,  2 May 2019 15:53:32 -0700
Message-Id: <20190502225336.206885-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2bbAFLYHg7BbnCqa8Z/3P6ZnGKzIwrgxFqmU0u6MtQ=;
 b=nvDXTTBkx6gM2GY6hocJXtXsnawL+o/xemGlJje4+eusDN2A0o97J9U5hlrR6RCeYY
 IaJiOv66CzjRFRG/86f/hhXlcSZ+ENN1Ls1spzYSyWL9Pe4VRgvlST5J0rYjN+wmNlBC
 i7F+im4W83ea6FPef3xVPExFEFv7Pdt/bcRcQ=
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mka@chromium.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY2VydGFpbiBzaXR1YXRpb25zIGl0IHdhcyBzZWVuIHRoYXQgd2UgY291bGQgd2VkZ2UgdXAg
dGhlIEREQyBidXMKb24gdGhlIEhETUkgYWRhcHRlciBvbiByazMyODguICBUaGUgb25seSB3YXkg
dG8gdW53ZWRnZSB3YXMgdG8gbXV4IG9uZQpvZiB0aGUgcGlucyBvdmVyIHRvIEdQSU8gb3V0cHV0
LWRyaXZlbi1sb3cgdGVtcG9yYXJpbHkgYW5kIHRoZW4KcXVpY2tseSBtdXggYmFjay4gIEZ1bGwg
ZGV0YWlscyBjYW4gYmUgZm91bmQgaW4gdGhlIHBhdGNoCigiZHJtL2JyaWRnZS9zeW5vcHN5czog
ZHctaGRtaTogQWRkICJ1bndlZGdlIiBmb3IgZGRjIGJ1cyIpLgoKU2luY2UgdW53ZWRnZSByZXF1
aXJlcyByZW11eGluZyB0aGUgcGlucywgd2UgZmlyc3QgbmVlZCB0byBhZGQgdG8gdGhlCmJpbmRp
bmdzIHNvIHRoYXQgd2UgY2FuIHNwZWNpZnkgd2hhdCBzdGF0ZSB0aGUgcGlucyBzaG91bGQgYmUg
aW4gZm9yCnVud2VkZ2luZy4KClNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5k
ZXJzQGNocm9taXVtLm9yZz4KLS0tCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdf
aGRtaS1yb2NrY2hpcC50eHQgICAgICAgICB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50
eHQKaW5kZXggMzkxNDM0MjRhNDc0Li44MzQ2YmFjODFmMWMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2No
aXAudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jv
Y2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0CkBAIC0zOCw2ICszOCwxMyBAQCBPcHRpb25hbCBw
cm9wZXJ0aWVzCiAtIHBoeXM6IGZyb20gZ2VuZXJhbCBQSFkgYmluZGluZzogdGhlIHBoYW5kbGUg
Zm9yIHRoZSBQSFkgZGV2aWNlLgogLSBwaHktbmFtZXM6IFNob3VsZCBiZSAiaGRtaSIgaWYgcGh5
cyByZWZlcmVuY2VzIGFuIGV4dGVybmFsIHBoeS4KIAorT3B0aW9uYWwgcGluY3RybCBlbnRyeToK
Ky0gSWYgeW91IGhhdmUgYm90aCBhICJ1bndlZGdlIiBhbmQgImRlZmF1bHQiIHBpbmN0cmwgZW50
cnksIGR3X2hkbWkKKyAgd2lsbCBzd2l0Y2ggdG8gdGhlIHVud2VkZ2UgcGluY3RybCBzdGF0ZSBm
b3IgMTBtcyBpZiBpdCBldmVyIGdldHMgYW4KKyAgaTJjIHRpbWVvdXQuICBJdCdzIGludGVuZGVk
IHRoYXQgdGhpcyB1bndlZGdlIHBpbmN0cmwgZW50cnkgd2lsbAorICBjYXVzZSB0aGUgU0RBIGxp
bmUgdG8gYmUgZHJpdmVuIGxvdyB0byB3b3JrIGFyb3VuZCBhIGhhcmR3YXJlCisgIGVycmF0YS4K
KwogRXhhbXBsZToKIAogaGRtaTogaGRtaUBmZjk4MDAwMCB7Ci0tIAoyLjIxLjAuMTAyMC5nZjI4
MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
