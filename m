Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F052B951D8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0486E497;
	Mon, 19 Aug 2019 23:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167026E497
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:48:48 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d3so1743700plr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0FuLv5Zr+cxHC18qV9Ymv7B49a2IFYwtbEueh1KcEvM=;
 b=ZbsyI5FxH0DNww1LcgDZ45J2ajR5ZAiS91wxQys4jA4avWbGjQ6U+Z6czhRAoVVOJb
 DRxZcOt1szAKwuFqqlo9Rj3qfNzGpxq3/QS5a4+5dxQ8Acti6Awpt6PiPM1ZXblNnCc8
 4RTYknqYhmOzt13BwBIFohqLxoMMUZtqJS9u/uHXvNoW+znDVDCdPNLnKMOksVOp4/CY
 aWk4wpv23Zd3QpsMvlAfce03pzJTs4rJ5sbZG3q3SY+dNYowznHeEsxzvJwDwJEQC2E8
 zZm+Xn+Wb+5qqoVjc1A6yrVO1/iGrptbb3iYBGK+6uXkgVk32u4ZmIjtVLLYAoSAKWF5
 m30w==
X-Gm-Message-State: APjAAAV0HqW9AuzY2Sv3X8x/A8yauJ/JGWnCa1cku6j4wNhyOg1PeD81
 HRdltV7AlW1PIu4wpGG2HsqAhQ==
X-Google-Smtp-Source: APXvYqwS90/sOsmy9exLtni67ANg3PZmELosaPRMBAbUykexQdBfrAbKQp74SAYJ2MucrBWI+jCC/Q==
X-Received: by 2002:a17:902:e30b:: with SMTP id
 cg11mr25695004plb.335.1566258527616; 
 Mon, 19 Aug 2019 16:48:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 185sm18769681pfa.170.2019.08.19.16.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:48:46 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: gpu: mali-utgard: add hisilicon,
 hi6220-mali compatible
Date: Mon, 19 Aug 2019 23:48:38 +0000
Message-Id: <20190819234840.37786-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819234840.37786-1-john.stultz@linaro.org>
References: <20190819234840.37786-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0FuLv5Zr+cxHC18qV9Ymv7B49a2IFYwtbEueh1KcEvM=;
 b=deXVNLoyRrdJV5151g0Pj2weOCcEQHbEb21VCS8oSn05nF5EWXO9webwpbjy4Ut3Zb
 3LSfDRu3+aJpOCzDEYIVK/trRJQl9rWYVgr0C/70/2k5lL9thzLvbgE1/YlLFwfUC9PC
 AqobLGMOtXBzxKYNOADY2/q7xlXvU9X8WF8Qz38M1Kcr7CUYCQhz/rrLZpUAiCw3ZDf7
 Z/kgAzyvZ7IF1DyrR1/RsoVJfai1gZ61jtd0thGL3aQfQqPoAIGFiH/u+bbc5jurbxDt
 JJqD4iWqPTL/Od+crWcr/D4G55rsMq/iBL64vZpIVxsIVSuexFhkgweWd6XQ+bASDQUP
 x7nQ==
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgoKVGhlIEhpc2ls
aWNvbiBoaTYyMjAgdXNlcyBhIE1hbGktNDUwTVA0IHdpdGggNCBQUHMsIHNvIGFkZAphIGNvbXBh
dGlibGUgZm9yIGl0LgoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+CkNjOiBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPgpDYzogUGhp
bGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBHcmlm
ZmluIDxwZXRlci5ncmlmZmluQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6
IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJkLnR4dCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQKaW5kZXggYjM1MmE2ODUxYTA2Li5i
YTg5NWVmZTMwMzkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncHUvYXJtLG1hbGktdXRnYXJkLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQKQEAgLTI0LDYgKzI0LDcgQEAgUmVxdWly
ZWQgcHJvcGVydGllczoKICAgICAgICsgcm9ja2NoaXAscmszMjI4LW1hbGkKICAgICAgICsgcm9j
a2NoaXAscmszMzI4LW1hbGkKICAgICAgICsgc3Rlcmljc3NvbixkYjg1MDAtbWFsaQorICAgICAg
KyBoaXNpbGljb24saGk2MjIwLW1hbGkKIAogICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNz
IGFuZCBsZW5ndGggb2YgdGhlIEdQVSByZWdpc3RlcnMKIApAQCAtOTgsNiArOTksMTAgQEAgdG8g
c3BlY2lmeSBvbmUgbW9yZSB2ZW5kb3Itc3BlY2lmaWMgY29tcGF0aWJsZSwgYW1vbmc6CiAgICAg
ICAqIGludGVycnVwdC1uYW1lcyBhbmQgaW50ZXJydXB0czoKICAgICAgICAgKyBjb21iaW5lZDog
Y29tYmluZWQgaW50ZXJydXB0IG9mIGFsbCBvZiB0aGUgYWJvdmUgbGluZXMKIAorICAtIGhpc2ls
aWNvbixoaTYyMjAtbWFsaQorICAgIFJlcXVpcmVkIHByb3BlcnRpZXM6CisgICAgICAqIHJlc2V0
czogcGhhbmRsZXMgdG8gdGhlIHJlc2V0IGxpbmVzIGZvciB0aGUgR1BVCisKIEV4YW1wbGU6CiAK
IG1hbGk6IGdwdUAxYzQwMDAwIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
