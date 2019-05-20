Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBC22FBB
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187498930E;
	Mon, 20 May 2019 09:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4536C8930B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:07:40 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id a3so6498554pgb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v9fCm6pJfwNnZtBLiOWDCiXX9M7MmpxMOv/deygL7hU=;
 b=PiGaA3ScM7ELxe2NqtBR2kxwb+Z2bW9A1NclUIJcNR9s+aD4Q2EzgH9fdTZSBcgnrr
 Dr29lapnCau2KYlsmra7x/c1oXWgQHkL+hpu18fA+38Pj8FGyYGJ+YMLipAUOfkMZm9o
 I6hJCqMSlWA2uAplzP9Wdc7KwCNAb6B0C9EOR0ok/L8k+6fN7dSbOXwisNol5y/1ctj3
 0DMyXusMZsB3t56bjP2cONNuItZMoZxK2WujsFAo/D941SYNnpq3vybZa13QA4IM9Bt4
 0kRRRCB4VULAHNzEDIcb0hJzbjnHXt2mQWZpdVkxXyeFqq/LJrNocOtUe3FpsSEuAyGW
 aUBQ==
X-Gm-Message-State: APjAAAUF+CTtlF6r7X8HgVOT+EGcCsD9AimT7gy/dCt4KeAv0zHLAtoQ
 oKKhi1GBA9wYBIQqI1R2e4f44g==
X-Google-Smtp-Source: APXvYqySfQ3A6Yya3mnBJTmrp77lvlN5ou8ZoeGALRWlDGRY8S5yM7HkEEgoTE9x3zLO+IG5XbCEIA==
X-Received: by 2002:a63:ee0b:: with SMTP id e11mr21644801pgi.453.1558343259840; 
 Mon, 20 May 2019 02:07:39 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.07.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:07:39 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v10 05/11] drm/sun4i: tcon: Export get tcon0 routine
Date: Mon, 20 May 2019 14:33:12 +0530
Message-Id: <20190520090318.27570-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190520090318.27570-1-jagan@amarulasolutions.com>
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v9fCm6pJfwNnZtBLiOWDCiXX9M7MmpxMOv/deygL7hU=;
 b=DZf0IHTg+6ePioO6PbxXMr3b0sxOtlWkuB0Rp/4yTi2ZN5gA6vpKqzCt+E79/4xyLz
 sTb8V2qQqNyxh1FgxVCOw5Ro+uDhlkiDCr+Teqvov0ZjXg4xmEQAe9q73sschfeV2/7b
 1umWfMmqWgnFDP9XQOT2EyjzH1L1l22e8ByC4=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZXRpbWVzIHRjb24gYXR0cmlidXRlcyBsaWtlIHRjb24gZGl2aWRlciwgY2xvY2sgcmF0ZSBl
dGMgYXJlIG5lZWRlZAppbiBpbnRlcmZhY2UgZHJpdmVycyBsaWtlIERTSS4gU28gZm9yIHN1Y2gg
Y2FzZXMgaW50ZXJmYWNlIGRyaXZlciBtdXN0CnByb2JlIHRoZSByZXNwZWN0aXZlIHRjb24gYW5k
IGdldCB0aGUgYXR0cmlidXRlcy4KClNpbmNlIHRjb24wIHByb2JlIGlzIGFscmVhZHkgYXZhaWxh
YmxlLCB2aWEgc3VuNGlfZ2V0X3Rjb24wIGZ1bmN0aW9uLApleHBvcnQgdGhlIHNhbWUgaW5zdGVh
ZCBvZiBwcm9iaW5nIHRjb24gZXhwbGljaXRseS4KClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kg
PGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpUZXN0ZWQtYnk6IE1lcmxpam4gV2FqZXIgPG1l
cmxpam5Ad2l6enVwLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5j
IHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmggfCAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMKaW5kZXggOGY5MzEyMWZlYWQ0Li45ZTlkMDhlZTgzODcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwpAQCAtMjIxLDcgKzIyMSw3IEBAIEVYUE9SVF9TWU1CT0wo
c3VuNGlfdGNvbl9lbmFibGVfdmJsYW5rKTsKICAqIGFyZSBsb2NhdGVkIGluIFRDT04wLiBUaGlz
IGhlbHBlciByZXR1cm5zIGEgcG9pbnRlciB0byBUQ09OMCdzCiAgKiBzdW40aV90Y29uIHN0cnVj
dHVyZSwgb3IgTlVMTCBpZiBub3QgZm91bmQuCiAgKi8KLXN0YXRpYyBzdHJ1Y3Qgc3VuNGlfdGNv
biAqc3VuNGlfZ2V0X3Rjb24wKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCitzdHJ1Y3Qgc3VuNGlf
dGNvbiAqc3VuNGlfZ2V0X3Rjb24wKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiB7CiAJc3RydWN0
IHN1bjRpX2RydiAqZHJ2ID0gZHJtLT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3Qgc3VuNGlfdGNvbiAq
dGNvbjsKQEAgLTIzNSw2ICsyMzUsNyBAQCBzdGF0aWMgc3RydWN0IHN1bjRpX3Rjb24gKnN1bjRp
X2dldF90Y29uMChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogCiAJcmV0dXJuIE5VTEw7CiB9CitF
WFBPUlRfU1lNQk9MKHN1bjRpX2dldF90Y29uMCk7CiAKIHN0YXRpYyB2b2lkIHN1bjRpX3Rjb25f
c2V0X211eChzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwgaW50IGNoYW5uZWwsCiAJCQkgICAgICAg
Y29uc3Qgc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90
Y29uLmgKaW5kZXggODRjZmIxOTUyZmY3Li44OGU5NzFkNWY5MzcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX3Rjb24uaApAQCAtMjcyLDYgKzI3Miw3IEBAIHN0cnVjdCBzdW40aV90Y29uIHsKIHN0
cnVjdCBkcm1fYnJpZGdlICpzdW40aV90Y29uX2ZpbmRfYnJpZGdlKHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZSk7CiBzdHJ1Y3QgZHJtX3BhbmVsICpzdW40aV90Y29uX2ZpbmRfcGFuZWwoc3RydWN0
IGRldmljZV9ub2RlICpub2RlKTsKIAorc3RydWN0IHN1bjRpX3Rjb24gKnN1bjRpX2dldF90Y29u
MChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKTsKIHZvaWQgc3VuNGlfdGNvbl9lbmFibGVfdmJsYW5r
KHN0cnVjdCBzdW40aV90Y29uICp0Y29uLCBib29sIGVuYWJsZSk7CiB2b2lkIHN1bjRpX3Rjb25f
bW9kZV9zZXQoc3RydWN0IHN1bjRpX3Rjb24gKnRjb24sCiAJCQkgY29uc3Qgc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
