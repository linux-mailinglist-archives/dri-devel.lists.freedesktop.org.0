Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14967E52AA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE166EB1E;
	Fri, 25 Oct 2019 17:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682B46EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:56:55 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c3so1639861plo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLu60EjnRBnW4wz32/fkJTOsgD5cNWvT5qBN+RYNBTg=;
 b=Pw0YxE3f/pKsMAhQwM2NNdl7ZASDvKvWZjfhso5fEajXC2IawML3Ff5x5hWryCJ6Fe
 umlwX5/lRYyb/jPdkSRzP8Zu8sQZRInwhPR653xrYUvxVIdFc/HEhxvekxpEF+JKy7Xp
 XvsuctjpUe1Ybdcddu/5BpnhN+9ADo0hw3cp973O9/9oFSsJ2vv4NeEH2BeqoxwXT5Ey
 M8vQwPG50caigW4dwFXZxmJ9fhrXoK+mLWevbOiPZgyK7UmftoPkO4rI+YnShTkt5J88
 VIX48tcz/ov/OcLtRksx5blrC+h65hFzmergewMqwLzuto1T9mDPkFUqjUM0IpsghaLZ
 jM0A==
X-Gm-Message-State: APjAAAXIEmiyK2bbKMpXlwr+oA1o0wxTyiy0m2/SNaUdtmLJVA2gIs1I
 AtZuokbk/xVWttyszrLe4kPHtw==
X-Google-Smtp-Source: APXvYqwG2PcwNymr0aLBWSu0Ew+FNG8Zo1et6ICQyCp5D/JHBAhCy2QuD7wY9vd+w8cmoYVE4JztoA==
X-Received: by 2002:a17:902:304:: with SMTP id 4mr5342476pld.106.1572026214910; 
 Fri, 25 Oct 2019 10:56:54 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:56:54 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v11 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/
 A31 fallback)
Date: Fri, 25 Oct 2019 23:26:20 +0530
Message-Id: <20191025175625.8011-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLu60EjnRBnW4wz32/fkJTOsgD5cNWvT5qBN+RYNBTg=;
 b=nzR3p0+HUwjXCJKFafzIo/pTdfwQapiV5SDEz31AqhqaOqpWV+6AfLRqzgUNU2dQll
 GQOezQcsxvulPc8HLtausz/BgBiI92Lo/kgjsrUkgENWm4yzLSud7S0aX+UPD7aWADn8
 3z8WU/qkfRHqIk4IhK1d19jwGUosVM0Ma0W8w=
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
