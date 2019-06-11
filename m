Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068553C08D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6539789157;
	Tue, 11 Jun 2019 00:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA8689137
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 00:23:07 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id p10so40017pgn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ys0DSil+WvCMaDGevz2dSiLwFPZR4jwAs4InRe1vZNA=;
 b=WhpEcq4SXn63q9BjEdCYToYv2ijoI61IkVb5d15+StSyF+qVJJSzJwMDd+7pgoN3UB
 wvfAhRUYlVs7l07Ur33w2pgqfnk7WyFxG12UtxMez+ltJlDw4vZVvoxEXaIwbF9tdQRr
 +GQ6f28w0e1CLP7rlVi5QWNpamfcdsQje5xQTIpfNPU2d8zVC4/Eq/2VEF3mGk8Z67Cc
 xex0CQlODVlN0Cxz/NfG/FZpUM9inF1mB0gUYDrKGRoKthUeMP8idWzTzf8/kQR0y37Q
 DXKH2iI89RiTnDJ5CvGvJDgP+qDXTmIeImnqzeMWMz1x53RhdBfQQeveyzoCsqWdm/1S
 Zrow==
X-Gm-Message-State: APjAAAX/GVcWJitEvXN55ozELwEIO4MWDo3cMacfpfcifjSzSS4cMDw6
 TO9qReBjHlpDnMA2y850ykFVTw==
X-Google-Smtp-Source: APXvYqxAc42hyNbAAjVSUHVWNoM3DB7fjZVsqMVi9qbCUz/7kQyXOOCdI5Fe02ZPTYUapCArvj8xLA==
X-Received: by 2002:a62:7552:: with SMTP id q79mr57521992pfc.71.1560212587343; 
 Mon, 10 Jun 2019 17:23:07 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id t4sm540317pjq.19.2019.06.10.17.23.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 17:23:06 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: display/panel: Expand rotation documentation
Date: Mon, 10 Jun 2019 17:22:53 -0700
Message-Id: <20190611002256.186969-3-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611002256.186969-1-dbasehore@chromium.org>
References: <20190611002256.186969-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ys0DSil+WvCMaDGevz2dSiLwFPZR4jwAs4InRe1vZNA=;
 b=X12Jn3AUd//JNQCTWSBR6eh9r650AWw9Xjg7KpO0V+0SA2HdJEsEae1jQkqDPHyQKe
 F9jkL7x/7/FbANfIR4mwRASAg6AXFvQesI26VoF7tgXODbVqSvH4TDWixSqzy/8t/2Oe
 o6kb4qUN0UwhrIOg/a3lFqtIXvRAqNQYOcNrA=
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
Cc: Derek Basehore <dbasehore@chromium.org>, maxime.ripard@bootlin.com,
 sam@ravnborg.org, intel-gfx@lists.freedesktop.org, airlied@linux.ie,
 thierry.reding@gmail.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
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
