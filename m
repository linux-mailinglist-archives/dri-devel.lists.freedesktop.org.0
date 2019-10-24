Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52808E387F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839E86E48C;
	Thu, 24 Oct 2019 16:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00856E48C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w18so26321381wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjKIZ1LpAPZhzjpwp4Zv4ngCHh1CxDu19C7DzIcBPMA=;
 b=ciAwNVLmzSQhzCrgIGuCDQWnmno90WZS0NqGqo6Tl7HtZv3npmUC07un1zMoXO2sxm
 irNcoloH3FYEY7mAa+3aivQy01ibtylVqeVBAp3J5qBngkhlYn/lcay8iZeQNTfGayd8
 sMOFQuAfg35x0dyCsSoeoKsY+mQoVSKtnfn6Vp9C3TEByDbi1ha/1oop9+YokdEtY/zx
 V103Na6wq+Jsgld1eb2BnYS7S1Sn9mxP42K1rOU2G55QROmWgjimEggli/SREj63BsfS
 nTqj2xp9phbFG7EoekAale84A9h8+ra3mWRgZNU0exPKdBFNB3B2EgUsOCBSwVLFTq4Z
 G4bg==
X-Gm-Message-State: APjAAAU/lbE+GRSssJ4ez/eeeKTDtIgKbv6Nd/Xf4bkDY7pWT8RGTLDW
 1o7wGRCBue2hZjmSCNnS8hE=
X-Google-Smtp-Source: APXvYqx2lKg7yQQ0+7HxydYUvSHqeZdiRIUrqKTaixBZM5T+2vGOpUYTbVp29/lEzWdkEVQdp0wB+g==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4415473wrv.99.1571935537359;
 Thu, 24 Oct 2019 09:45:37 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id t13sm31799765wra.70.2019.10.24.09.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 00/32] drm/tegra: Add DisplayPort support
Date: Thu, 24 Oct 2019 18:45:02 +0200
Message-Id: <20191024164534.132764-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjKIZ1LpAPZhzjpwp4Zv4ngCHh1CxDu19C7DzIcBPMA=;
 b=KsxOAaCRv6vJxegiNqJlu9sEi7yYxJIPYT32Fxc6lLJwF2Wt26IlSethlX8TNOuPCX
 L9o2Z1jeyido8RZVPwUXYs13sznHAC9WopHp+ROoeW+ieTl0DXcaYRuSpY7Xowdb2Hqv
 tpuNpkud/JDuSEPaEzqAu3hiisXU13z/Kc3+sxNN1wMdmL1Ygi/lgXNdDfnteZH3ePas
 8bO3Ih29DYnSjaiumqJJNDkPqR1VBhm8yQkpcJA4H+ez9BT90i8Oy0TWmO+knG5z96H1
 b2svCLxy01CkoCkRz4BnDxmmJRvxLrZqVvtgYJitDR7FjSD/oLKjdAOIZG//Gk6GVX8u
 DL6w==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgc2V0IG9mIHBh
dGNoZXMgYnVpbGQgb24gdG9wIG9mIHRoZSBleGlzdGluZyBlRFAgc3VwcG9ydCB0aGF0IGV4aXN0
cwpmb3IgVGVncmExMjQgYW5kIGV4dGVuZHMgaXQgd2l0aCBmdWxsIERQIHN1cHBvcnQgb24gVGVn
cmEyMTAsIFRlZ3JhMTg2CmFuZCBUZWdyYTE5NC4gQWZ0ZXIgdGhlIHNlcmllcywgdGhlIGVEUCBj
b2RlIGlzIHVuaWZpZWQgd2l0aCB0aGUgRFAgY29kZQphbmQgb25seSBwYXJhbWV0ZXJpemVkIHdo
ZXJlIG5lY2Vzc2FyeS4KClRoaWVycnkKClRoaWVycnkgUmVkaW5nICgzMik6CiAgZHJtL3RlZ3Jh
OiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZm9yIHN0cnVjdCBkcm1fZHBfbGluawogIGRybS90ZWdy
YTogZHA6IEFkZCBkcm1fZHBfbGlua19yZXNldCgpIGltcGxlbWVudGF0aW9uCiAgZHJtL3RlZ3Jh
OiBkcDogVHJhY2sgbGluayBjYXBhYmlsaXRpZXMgYWxvbmdzaWRlIHNldHRpbmdzCiAgZHJtL3Rl
Z3JhOiBkcDogVHVybiBsaW5rIGNhcGFiaWxpdGllcyBpbnRvIGJvb2xlYW5zCiAgZHJtL3RlZ3Jh
OiBkcDogUHJvYmUgbGluayB1c2luZyBleGlzdGluZyBwYXJzaW5nIGhlbHBlcnMKICBkcm0vdGVn
cmE6IGRwOiBSZWFkIGZhc3QgdHJhaW5pbmcgY2FwYWJpbGl0eSBmcm9tIGxpbmsKICBkcm0vdGVn
cmE6IGRwOiBSZWFkIFRQUzMgY2FwYWJpbGl0eSBmcm9tIHNpbmsKICBkcm0vdGVncmE6IGRwOiBS
ZWFkIGNoYW5uZWwgY29kaW5nIGNhcGFiaWxpdHkgZnJvbSBzaW5rCiAgZHJtL3RlZ3JhOiBkcDog
UmVhZCBhbHRlcm5hdGUgc2NyYW1ibGVyIHJlc2V0IGNhcGFiaWxpdHkgZnJvbSBzaW5rCiAgZHJt
L3RlZ3JhOiBkcDogUmVhZCBlRFAgdmVyc2lvbiBmcm9tIERQQ0QKICBkcm0vdGVncmE6IGRwOiBS
ZWFkIEFVWCByZWFkIGludGVydmFsIGZyb20gRFBDRAogIGRybS90ZWdyYTogZHA6IFNldCBjaGFu
bmVsIGNvZGluZyBvbiBsaW5rIGNvbmZpZ3VyYXRpb24KICBkcm0vdGVncmE6IGRwOiBFbmFibGUg
YWx0ZXJuYXRlIHNjcmFtYmxlciByZXNldCB3aGVuIHN1cHBvcnRlZAogIGRybS90ZWdyYTogZHA6
IEFkZCBkcm1fZHBfbGlua19jaG9vc2UoKSBoZWxwZXIKICBkcm0vdGVncmE6IGRwOiBBZGQgc3Vw
cG9ydCBmb3IgZURQIGxpbmsgcmF0ZXMKICBkcm0vdGVncmE6IGRwOiBBZGQgRGlzcGxheVBvcnQg
bGluayB0cmFpbmluZyBoZWxwZXIKICBkcm0vdGVncmE6IHNvcjogVXNlIERQIGxpbmsgdHJhaW5p
bmcgaGVscGVycwogIGRybS90ZWdyYTogc29yOiBIb29rIHVwIEkyQy1vdmVyLUFVWCB0byBvdXRw
dXQKICBkcm0vdGVncmE6IHNvcjogU3RhYmlsaXplIGVEUAogIGRybS90ZWdyYTogc29yOiBGaWx0
ZXIgZURQIHJhdGVzCiAgZHJtL3RlZ3JhOiBzb3I6IEFkZCBEaXNwbGF5UG9ydCBzdXBwb3J0CiAg
ZHJtL3RlZ3JhOiBzb3I6IFJlbW92ZSB0ZWdyYTE4Ni1zb3IxIHN1cHBvcnQKICBkcm0vdGVncmE6
IHNvcjogVXNlIGNvcnJlY3QgU09SIGluZGV4IG9uIFRlZ3JhMjEwCiAgZHJtL3RlZ3JhOiBzb3I6
IEltcGxlbWVudCBwYWQgY2xvY2sgZm9yIGFsbCBTT1IgaW5zdGFuY2VzCiAgZHJtL3RlZ3JhOiBz
b3I6IERlZHVwbGljYXRlIGNvbm5lY3RvciB0eXBlIGRldGVjdGlvbiBjb2RlCiAgZHJtL3RlZ3Jh
OiBzb3I6IFN1cHBvcnQgRGlzcGxheVBvcnQgb24gVGVncmExOTQKICBkcm0vdGVncmE6IHNvcjog
VW5pZnkgY2xvY2sgc2V0dXAgZm9yIGVEUCwgSERNSSBhbmQgRFAKICBkcm0vdGVncmE6IHNvcjog
VXNlIGNvcnJlY3QgSS9PIHBhZCBmb3IgRFAKICBkcm0vdGVncmE6IHNvcjogVW5pZnkgZURQIGFu
ZCBEUCBzdXBwb3J0CiAgZHJtL3RlZ3JhOiBzb3I6IEF2b2lkIHRpbWVvdXRzIG9uIHVucGx1ZyBl
dmVudHMKICBkcm0vdGVncmE6IHNvcjogRXh0cmFjdCBjb21tb24gYXVkaW8gZW5hYmxpbmcgY29k
ZQogIGRybS90ZWdyYTogc29yOiBJbnRyb2R1Y2UgYXVkaW8gZW5hYmxlL2Rpc2FibGUgY2FsbGJh
Y2tzCgogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMgICAgfCAgNzY1ICsrKysrKysrKy0KIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oICAgIHwgIDE1NyArLQogZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RwYXV4LmMgfCAgIDY5IC0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgIHwgICAg
NSAtCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgICB8IDI1NzEgKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmggICB8ICAgIDMg
KwogNiBmaWxlcyBjaGFuZ2VkLCAyMzk1IGluc2VydGlvbnMoKyksIDExNzUgZGVsZXRpb25zKC0p
CgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
