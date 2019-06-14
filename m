Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FAA4648F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17A989AC9;
	Fri, 14 Jun 2019 16:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871C789AC9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:43:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 20so1862963pgr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEKdnhKR+/dWWRVZjYYO+x5HGCPCoPobrZ4wln/DJzY=;
 b=q+XRz3QmJCdyjZgiAx4p/Fu/y3fjoz4tnByX9UNn2g2R/wcBJXlenWwFxHu44fwlrU
 EZaX2z29cEnwjRFgJv00BMx+rT6es1qwTsN7o4ngAcUIWjaeSQSIaQMd54arI45DrlFR
 LqsWs/LtUQLX3WarPxZ4M4DptUcLDPzH4B5AX6KdnrcdhM2YTArdKr/cJZMXN4zHKUfH
 g2/pNcajZGbrlOE88NYuypU2G9/Z97F5VuK8ezueD6IZGaDfaUXtMOx9RAaJqs9jc8oM
 F1mjqEHWozYEO2+rwKdexnxC6m4woLPk9fUHV+RdR/MyaO4OTIjxUw1BpJGNrf8G6CM6
 +RkQ==
X-Gm-Message-State: APjAAAW6uz6aRPx1Fw7AYgU0MWIh3uFceG64yKIzEhsDOX2Jxx0Xq1LB
 7jiXiFZcOXu7HGrMjTbJMxbh5Q==
X-Google-Smtp-Source: APXvYqxVZ/VBMdd1plRYRlRdBu2PAEOFwSdXMjHmnSt33jJGhQ4n+lhUW7eRWumCYAU2L0kC+eo4hA==
X-Received: by 2002:a63:6881:: with SMTP id
 d123mr11058424pgc.201.1560530628964; 
 Fri, 14 Jun 2019 09:43:48 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.43.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:43:48 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 2/9] drm/sun4i: tcon: Add TCON LCD support for R40
Date: Fri, 14 Jun 2019 22:13:17 +0530
Message-Id: <20190614164324.9427-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEKdnhKR+/dWWRVZjYYO+x5HGCPCoPobrZ4wln/DJzY=;
 b=pt+MCQrYrr1z9usf53hpmCyEdhtX35GU4v450sx+7ngZfUg9lOUJdWuFI9JOxl8RTp
 CHUPQOKAzK2NXpws6xY7rj+PcC18JYJtjwgryLTh5NTOOLOBJcHS6zygGc3tgYy1fJyE
 efXaUwOts0I1GtXTgS8qdMApryCG8QaDzqmMc=
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

VENPTiBMQ0QwLCBMQ0QxIGluIGFsbHdpbm5lciBSNDAsIGFyZSB1c2VkIGZvciBtYW5hZ2luZwpM
Q0QgaW50ZXJmYWNlcyBsaWtlIFJHQiwgTFZEUyBhbmQgRFNJLgoKTGlrZSBUQ09OIFRWMCwgVFYx
IHRoZXNlIExDRDAsIExDRDEgYXJlIGFsc28gbWFuYWdlZCB2aWEKdGNvbiB0b3AuCgpBZGQgc3Vw
cG9ydCBmb3IgaXQsIGluIHRjb24gZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjRpX3Rjb24uYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRleCA5ZTlkMDhlZTgzODcuLjk4Mzg5MTMz
MDVhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBAIC0xNDcxLDYgKzE0NzEsMTMg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40aV90Y29uX3F1aXJrcyBzdW44aV9hODN0X3R2X3F1
aXJrcyA9IHsKIAkuaGFzX2NoYW5uZWxfMQkJPSB0cnVlLAogfTsKIAorc3RhdGljIGNvbnN0IHN0
cnVjdCBzdW40aV90Y29uX3F1aXJrcyBzdW44aV9yNDBfbGNkX3F1aXJrcyA9IHsKKwkuc3VwcG9y
dHNfbHZkcwkJPSB0cnVlLAorCS5oYXNfY2hhbm5lbF8wCQk9IHRydWUsCisJLyogVE9ETyBOZWVk
IHRvIHN1cHBvcnQgVENPTiBvdXRwdXQgbXV4aW5nIHZpYSBHUElPIHBpbnMgKi8KKwkuc2V0X211
eAkJPSBzdW44aV9yNDBfdGNvbl90dl9zZXRfbXV4LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBzdW40aV90Y29uX3F1aXJrcyBzdW44aV9yNDBfdHZfcXVpcmtzID0gewogCS5oYXNfY2hhbm5l
bF8xCQk9IHRydWUsCiAJLnNldF9tdXgJCT0gc3VuOGlfcjQwX3Rjb25fdHZfc2V0X211eCwKQEAg
LTE1MDEsNiArMTUwOCw3IEBAIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3VuNGlfdGNvbl9v
Zl90YWJsZVtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWEzMy10Y29u
IiwgLmRhdGEgPSAmc3VuOGlfYTMzX3F1aXJrcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjhpLWE4M3QtdGNvbi1sY2QiLCAuZGF0YSA9ICZzdW44aV9hODN0X2xjZF9xdWlya3Mg
fSwKIAl7IC5jb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1hODN0LXRjb24tdHYiLCAuZGF0
YSA9ICZzdW44aV9hODN0X3R2X3F1aXJrcyB9LAorCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVy
LHN1bjhpLXI0MC10Y29uLWxjZCIsIC5kYXRhID0gJnN1bjhpX3I0MF9sY2RfcXVpcmtzIH0sCiAJ
eyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktcjQwLXRjb24tdHYiLCAuZGF0YSA9ICZz
dW44aV9yNDBfdHZfcXVpcmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGkt
djNzLXRjb24iLCAuZGF0YSA9ICZzdW44aV92M3NfcXVpcmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9
ICJhbGx3aW5uZXIsc3VuOWktYTgwLXRjb24tbGNkIiwgLmRhdGEgPSAmc3VuOWlfYTgwX3Rjb25f
bGNkX3F1aXJrcyB9LAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
