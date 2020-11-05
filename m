Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75422A816B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ACF6ED8D;
	Thu,  5 Nov 2020 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAA36ED90
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p19so1283141wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PcLLONpboZvUTN2aQG6zfp2ux20ADiydIBkQhnQ1U2o=;
 b=TPoS4HuPdYH3c9MkIFPPhTWS3RWJ96JxCEE54GBANaYyXJMNJ57387nPrvwHRDaSNm
 nHeUY9/F6E6+1ajLkqOBdOwSz5wlN0DSW7bnb1kM0wXtle/sPy0+QyzhHL2HmYDskP0v
 5a4eQrJJ0W/tyvnCITfTXUTSFkYNhAXh+AqVcy9u1VbHeLO0Fq9Bzo0EvGqSkLe1zH+B
 Hsy14wy/MXLN+cEeGwCc0fsMQzhwOZlaUnyojp+zFzAx1gfvzRv+/sU1YkCrjUbRFHGj
 nqjP0GLiBveDIZrB3bqZAv6TFLiFeKVtaym1w8d+0ijahi4yfUnW+DsvZlU60sUcORea
 pq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcLLONpboZvUTN2aQG6zfp2ux20ADiydIBkQhnQ1U2o=;
 b=RSaSsrKMIhMvcNywbP/ebhI0P2GUIaG5drYFZcd/xif6U6rgpOP8e9Vn83If3RxQS3
 xdaManTIiyneRJS0WmUMQe6PzrpjXI7ETrVY64J3E993PKbNNTlFLZHA6FcqxFz+FjfG
 iFIPF7wzI/CPmCV7vGW+U3oi82OAxasVcfdR/fmigeFveAA5m5YhFNe1fK3Hn9irTRoU
 PuqIQxpBR4JChsxzVxIzZhiUVqE700b9Ah0Mcb1p4JpFY6PMxJ6ir85XCS1EcixbXYZD
 BUyDs/9LJ7FRr7B0dUjFtiZsSEBviJ/gmmWq2UZKEbdmncNd+MWAyUN6GOukhI7lh1i5
 WBDA==
X-Gm-Message-State: AOAM53063x8E+hlGbg4a27R1sP8hkX391S8oNQuS4pN8fOBoOyRH7yJI
 kytuI6cQYfC1o01GCJT7YxjQ1w==
X-Google-Smtp-Source: ABdhPJx1nScLQJ8+/5pp9aKW+CIR313HsjM2GzYFhafeQ2i1VZRBFeJhdHevY5Gcwa6RoHinYaOFfg==
X-Received: by 2002:a1c:a7ce:: with SMTP id q197mr3190860wme.138.1604587938324; 
 Thu, 05 Nov 2020 06:52:18 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/19] gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as
 __always_unused
Date: Thu,  5 Nov 2020 14:45:01 +0000
Message-Id: <20201105144517.1826692-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIG1hY3JvIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRlKCkgJ2NydGNfc3RhdGUn
IGlzIHByb3ZpZGVkCmFzIGEgY29udGFpbmVyIGZvciBzdGF0ZS0+Y3J0Y3NbaV0ubmV3X3N0YXRl
LCBidXQgaXMgbm90IHV0aWxpc2VkIGluCnRoaXMgdXNlLWNhc2UuICBXZSBjYW5ub3Qgc2ltcGx5
IGRlbGV0ZSB0aGUgdmFyaWFibGUsIHNvIGhlcmUgd2UgdGVsbAp0aGUgY29tcGlsZXIgdGhhdCB3
ZSdyZSBpbnRlbnRpb25hbGx5IGRpc2NhcmRpbmcgdGhlIHJlYWQgdmFsdWUuCgpGaXhlcyB0aGUg
Zm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBkcml2ZXJzL2dwdS9kcm0v
aW14L2lwdXYzLXBsYW5lLmM6IEluIGZ1bmN0aW9uIOKAmGlwdV9wbGFuZXNfYXNzaWduX3ByZeKA
mToKIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYzo3NDY6NDI6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmGNydGNfc3RhdGXigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgpDYzogU2Fz
Y2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpDYzogUGVuZ3V0cm9uaXggS2VybmVs
IFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4KQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5l
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaW14L2lwdXYzLXBsYW5lLmMKaW5kZXggOGE0MjM1ZDlkOWYxZS4uYWNjMGEzY2U0
OTkyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1wbGFuZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtcGxhbmUuYwpAQCAtNzQzLDcgKzc0Myw3IEBAIGJv
b2wgaXB1X3BsYW5lX2F0b21pY191cGRhdGVfcGVuZGluZyhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSkKIGludCBpcHVfcGxhbmVzX2Fzc2lnbl9wcmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJ
CSAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewotCXN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqb2xkX2NydGNfc3RhdGUsICpjcnRjX3N0YXRlOworCXN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqb2xkX2NydGNfc3RhdGUsIF9fYWx3YXlzX3VudXNlZCAqY3J0Y19zdGF0ZTsKIAlzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKIAlzdHJ1Y3QgaXB1X3BsYW5lX3N0YXRlICpp
cHVfc3RhdGU7CiAJc3RydWN0IGlwdV9wbGFuZSAqaXB1X3BsYW5lOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
