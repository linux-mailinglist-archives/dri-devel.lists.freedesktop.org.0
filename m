Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854DCCA53
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 16:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6D6E375;
	Sat,  5 Oct 2019 14:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C631D6E375
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 14:19:32 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w8so4532313plq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2019 07:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLu60EjnRBnW4wz32/fkJTOsgD5cNWvT5qBN+RYNBTg=;
 b=TjUYOqwH5qNV1bMmyWV8m29ScTUSjg8adjoPprByfGDaRdyKCwJet85VIQK6v5vMs7
 bCK9l6OHcDXDDDnT/gZqCXWzW+KNI+OEBKERdwIefDFclv5Eq8UOzhXiGZRaqC4fkjqF
 sBCpnBx6HEQ/8jp3XI9DDF0WMQkjyIK/5x/mSGGBKrJ+LtjYPPwp69elPEYQxtiQZY/2
 L/SLz1vdWQsPTUnclRmcdsN2HoxTF5fE6bMJzYm5Xl9c/nnUyXp8KwIxhVIeG+bV7xOD
 iEF1/c0Z0o/5qEqCjk4YzRBJwIMuN44+vUKeIBtHCdOsk/9CeHxDSg2mCxAwmAIL7jfp
 RD2w==
X-Gm-Message-State: APjAAAXyaUgaW2+ppJ7uwU/y7xXcuoRWfsP0oXNIuT71lSP4Z5sSVfIq
 OYTouGZB/wOy45fGn/vWBHRUeQ==
X-Google-Smtp-Source: APXvYqzyfbYoP0nigJLm601pen/N5iojsrxWH3PJfSr9afbuIRmYCd4P+TgvvrASJEz29Up2FoLOMw==
X-Received: by 2002:a17:902:9a41:: with SMTP id
 x1mr14550279plv.269.1570285172204; 
 Sat, 05 Oct 2019 07:19:32 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id y138sm8977604pfb.174.2019.10.05.07.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 07:19:31 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v10 2/6] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/
 A31 fallback)
Date: Sat,  5 Oct 2019 19:49:09 +0530
Message-Id: <20191005141913.22020-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191005141913.22020-1-jagan@amarulasolutions.com>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLu60EjnRBnW4wz32/fkJTOsgD5cNWvT5qBN+RYNBTg=;
 b=pqNAHW+FwCPLtmMCrEkOjKWwvUGOVLbSDKFc786vnhYyrwlP6swsENzUfsK51+kxu6
 cA0MvHQrlrJpu2rAbw5We0cRNiGT6OWwq+E4UdP0X+x8tJ33JVZQj3upf7PeS8f9W/2t
 FPdU2xvzZ/L6YVpMLVCBITsyrAOB7exwrsfv4=
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

VGhlIE1JUEkgRFNJIFBIWSBjb250cm9sbGVyIG9uIEFsbHdpbm5lciBBNjQgaXMgc2ltaWxhcgpv
biB0aGUgb25lIG9uIEEzMS4KCkFkZCBBNjQgY29tcGF0aWJsZSBhbmQgYXBwZW5kIEEzMSBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL3BoeS9hbGx3aW5uZXIsc3VuNmkt
YTMxLW1pcGktZHBoeS55YW1sICAgICAgICAgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvYWxsd2lubmVyLHN1bjZp
LWEzMS1taXBpLWRwaHkueWFtbAppbmRleCBmYTQ2NjcwZGUyOTkuLjg4NDE5MzgwNTBiMiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9hbGx3aW5uZXIs
c3VuNmktYTMxLW1pcGktZHBoeS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waHkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHkueWFtbApAQCAtMTUsNyAr
MTUsMTEgQEAgcHJvcGVydGllczoKICAgICBjb25zdDogMAogCiAgIGNvbXBhdGlibGU6Ci0gICAg
Y29uc3Q6IGFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kcGh5CisgICAgb25lT2Y6CisgICAgICAt
IGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeQorICAgICAgLSBpdGVtczoKKyAg
ICAgICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNTBpLWE2NC1taXBpLWRwaHkKKyAgICAgICAg
ICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeQogCiAgIHJlZzoKICAgICBt
YXhJdGVtczogMQotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
