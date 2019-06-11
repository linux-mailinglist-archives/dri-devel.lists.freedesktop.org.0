Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0483C4D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D620F89149;
	Tue, 11 Jun 2019 07:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D03890F7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:03:58 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m30so6017548pff.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ys0DSil+WvCMaDGevz2dSiLwFPZR4jwAs4InRe1vZNA=;
 b=YP2vaGSUkxQwPLRzDalQCXa/QudiPSOG0wgm6N7d6UoHWCMIFMjbxNAqIpdn4CcAPD
 kdgWIKGc1bLq4Ngt5BdCfl5o6ezNsDKoh+oC2hjNy8b0iKImZMT4blW1PHEYx7UvSodi
 FgNkG83a/dRqO1vZPokojz9HHT6CLaHpzhFLeAW/iX9xZyz150aThXRw5SEENebNr+dH
 8U+ZvwOKYSc2bdymfB8RZwWfAqskorXWA0L+OnrNqG3IbNapaKktWJMVBZHBiwA3coUr
 8t8W8udQi9K3sKsO8Af64BvUuR8X3uVt00lBXWfnSmpHMBPl++Jn7+XCXVXSSDDep5/N
 KEXQ==
X-Gm-Message-State: APjAAAVrgpadjbcInMgYwBVvYKG8NCakX6U2ZVMSbqRMVSc7xeJ5/zf7
 AbhRUpswJDCTgP67C0be6knaiw==
X-Google-Smtp-Source: APXvYqztkWgDwmpShVmNY3JX/yoLvhlQG+pv1dg44RWOiGpLZ5kd7o3wLJ474CqYq7S74tPbVuKsCw==
X-Received: by 2002:aa7:825a:: with SMTP id e26mr79303252pfn.255.1560225837698; 
 Mon, 10 Jun 2019 21:03:57 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id y133sm13301185pfb.28.2019.06.10.21.03.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 21:03:57 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: display/panel: Expand rotation documentation
Date: Mon, 10 Jun 2019 21:03:47 -0700
Message-Id: <20190611040350.90064-3-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611040350.90064-1-dbasehore@chromium.org>
References: <20190611040350.90064-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 07:21:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ys0DSil+WvCMaDGevz2dSiLwFPZR4jwAs4InRe1vZNA=;
 b=NpIiYZAZ293e5siqen5Oz27pVJuQEiqx/skxzzgF9MmBRxj1DCy5igwLq3xQY5fLt4
 6ijSQMHl5nqD2CEkVoKO7bNwFt2FMABbPicsIoQ+6XGy1CrK43ONHRMIiygoP/GBi1Tx
 mpT3cNIEtjV+ei2btpQJ+tOS5TF+m8OjwvjZ4=
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
 Derek Basehore <dbasehore@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRvIHRoZSByb3RhdGlvbiBkb2N1bWVudGF0aW9uIHRvIGV4cGxhaW4gaG93IGRy
aXZlcnMgc2hvdWxkCnVzZSB0aGUgcHJvcGVydHkgYW5kIGdpdmVzIGFuIGV4YW1wbGUgb2YgdGhl
IHByb3BlcnR5IGluIGEgZGV2aWNldHJlZQpub2RlLgoKU2lnbmVkLW9mZi1ieTogRGVyZWsgQmFz
ZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcGFuZWwudHh0ICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQKaW5kZXggZTJlNjg2
Nzg1MmI4Li5mMzVkNjJkOTMzZmMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQKQEAgLTIsMyArMiwzNSBA
QCBDb21tb24gZGlzcGxheSBwcm9wZXJ0aWVzCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAK
IC0gcm90YXRpb246CURpc3BsYXkgcm90YXRpb24gaW4gZGVncmVlcyBjb3VudGVyIGNsb2Nrd2lz
ZSAoMCw5MCwxODAsMjcwKQorCitQcm9wZXJ0eSByZWFkIGZyb20gdGhlIGRldmljZSB0cmVlIHVz
aW5nIG9mIG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24KKworVGhlIHBhbmVsIGRyaXZlciBt
YXkgYXBwbHkgdGhlIHJvdGF0aW9uIGF0IHRoZSBUQ09OIGxldmVsLCB3aGljaCB3aWxsCittYWtl
IHRoZSBwYW5lbCBsb29rIGxpa2UgaXQgaXNuJ3Qgcm90YXRlZCB0byB0aGUga2VybmVsIGFuZCBh
bnkgb3RoZXIKK3NvZnR3YXJlLgorCitJZiBub3QsIGEgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVy
dHkgc2hvdWxkIGJlIGFkZGVkIHRocm91Z2ggdGhlIFNvQwordmVuZG9yIERSTSBjb2RlIHVzaW5n
IHRoZSBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxfb3JpZW50YXRpb25fcHJvcGVydHkKK2Z1bmN0
aW9uLgorCitFeGFtcGxlOgorCXBhbmVsOiBwYW5lbEAwIHsKKwkJY29tcGF0aWJsZSA9ICJib2Us
aGltYXg4Mjc5ZDhwIjsKKwkJcmVnID0gPDA+OworCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSAw
PjsKKwkJcHAzMy1ncGlvcyA9IDwmcGlvIDM1IDA+OworCQlwcDE4LWdwaW9zID0gPCZwaW8gMzYg
MD47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzdGF0ZV8zMzAwbXYiLCAic3RhdGVf
MTgwMG12IjsKKwkJcGluY3RybC0wID0gPCZwYW5lbF9waW5zX2RlZmF1bHQ+OworCQlwaW5jdHJs
LTEgPSA8JnBhbmVsX3BpbnNfMzMwMG12PjsKKwkJcGluY3RybC0yID0gPCZwYW5lbF9waW5zXzE4
MDBtdj47CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+OworCQlyb3RhdGlvbiA9IDwx
ODA+OworCQlzdGF0dXMgPSAib2theSI7CisKKwkJcG9ydCB7CisJCQlwYW5lbF9pbjogZW5kcG9p
bnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291dD47CisJCQl9OworCQl9OworCX07
Ci0tIAoyLjIyLjAucmMyLjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
