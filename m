Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F620DE0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 19:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64C189700;
	Thu, 16 May 2019 17:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490AD89700
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 17:25:17 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z16so1877409pgv.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ousylPICmwH1og6gjNylTr7gaxUc1ig3ZdhjNRxPghU=;
 b=LdWW6avySeoMnxQcXTs7YXgzxzVQsNOMF5JgJNMcFnSRZ3Cb1T7fM8po1A+Go+YXp2
 dOyts2cH+tVyeQgjX6IB6ou1jIV/RRCfGcqYkgLfGP8Obfzsj6hWwka4cA7KVylnTjKh
 a1b/woz2rv92z6DVJrLM1lb2UyLXAdN4cR4ZJ9r352ZlYEnQmQ38IREKS0oVuaKrEr07
 W7C/y5SdjscdZTLGsg/QVr8JY+WAQ1U73NUeVPFq3tVQBZW054dmGedjHKg/kPtPFuOi
 GJeraq0OP0UVct9dPh0FbTKyMCqxoEsUiliITAoihRjI2jI/60LhzFv3EgcqSyrkeTNf
 BnzQ==
X-Gm-Message-State: APjAAAXLeHsUScN6Zx0GmxaZo89RWvnAf8OSDkQ2yaD0bvD1y4LFJh7j
 PJQTgZsnsYCb6JPc/fM2W0KCtg==
X-Google-Smtp-Source: APXvYqyRLtHHdZ/6gBoDhAq+Ft8DnEuAOLEu1Tag/6FSXqdLHOz2xTh+/UUVMzZ7Jib/lJnPD2TaUw==
X-Received: by 2002:a62:570a:: with SMTP id l10mr54993359pfb.151.1558027516911; 
 Thu, 16 May 2019 10:25:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id f29sm17110563pfq.11.2019.05.16.10.25.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 10:25:16 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/3] ARM: dts: rockchip: Add #cooling-cells entry for
 rk3288 GPU
Date: Thu, 16 May 2019 10:25:09 -0700
Message-Id: <20190516172510.181473-2-mka@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190516172510.181473-1-mka@chromium.org>
References: <20190516172510.181473-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ousylPICmwH1og6gjNylTr7gaxUc1ig3ZdhjNRxPghU=;
 b=dgGSuA8VDPXv7Fj5Q5+ofTuWInUTRLCEGimaJ/XwDGZgH8iS5qpn3DIYuedOUERjIX
 TgF/rxteIL7Z4FgxhseTSJdM60kvzN7B9+j7MOUShrmdYPyIeiqsNXzbHYJYAtdG1MRf
 sXk2aqJnxCwgTHfdsfrBaJ3wtHTlqnbyhdVh4=
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1hbGkgR1BVIG9mIHRoZSByazMyODggY2FuIGJlIHVzZWQgYXMgY29vbGluZyBkZXZpY2Us
IGFkZAphICNjb29saW5nLWNlbGxzIGVudHJ5IGZvciBpdC4KClNpZ25lZC1vZmYtYnk6IE1hdHRo
aWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBhZGRlZCBE
b3VnJ3MgJ1Jldmlld2VkLWJ5JyB0YWcKLS0tCiBhcmNoL2FybS9ib290L2R0cy9yazMyODguZHRz
aSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRz
aQppbmRleCBhMDI0ZDFlN2U3NGMuLjE0ZDk2MDlmMGIxNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvcmszMjg4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kK
QEAgLTEyNzMsNiArMTI3Myw3IEBACiAJCWludGVycnVwdC1uYW1lcyA9ICJqb2IiLCAibW11Iiwg
ImdwdSI7CiAJCWNsb2NrcyA9IDwmY3J1IEFDTEtfR1BVPjsKIAkJb3BlcmF0aW5nLXBvaW50cy12
MiA9IDwmZ3B1X29wcF90YWJsZT47CisJCSNjb29saW5nLWNlbGxzID0gPDI+OyAvKiBtaW4gZm9s
bG93ZWQgYnkgbWF4ICovCiAJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2VyIFJLMzI4OF9QRF9HUFU+
OwogCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCX07Ci0tIAoyLjIxLjAuMTAyMC5nZjI4MjBjZjAx
YS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
