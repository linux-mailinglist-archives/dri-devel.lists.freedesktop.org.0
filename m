Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65FF38547
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4FA89A35;
	Fri,  7 Jun 2019 07:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B10896EC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:47:13 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v18so1368794ljh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 02:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/U6XWsLOhFjdMqLKkh6fLtzFOqDQWJVhwH8yel62eg=;
 b=s2pkVA+Kaeer4j+MqNgt2bi1lw0v51ENGYo6BTeXruF+3c7hDm1UpMxh+rnNz4AQBo
 HKIEj6yqMvyyPxWrrqhkcPPDPCvwwKtblua1PoXy2K6wFr4tS9yg39cNzxcIPOZDeoFP
 lcr/FW2FtE3uyMpF38xS1hLyw970EDcGa6p82+yphkYC/ChR/ANzRJC6sFhP8mq8NIkS
 8SdPk5ECCie8b3EQ5sgR0WVUzRVKFxoSggmvD0ltw1DX4qEq8UrksGOoEOWUyA7g5olV
 5pbBjnzvEe+5MyAo4VbrpfqB3rwTLtbqnpf0S5w+AorEotP9k77BAjtk+fyHPgzYvR8q
 TRhA==
X-Gm-Message-State: APjAAAVlO/xLaXeyNTrZfQr1W3txRtnZswvyBUMYCo8JtIjJGidkD++p
 +VumqUPyPKGqgltyDVGraD11Zg==
X-Google-Smtp-Source: APXvYqy7mb00k+UK6LOG7DoqGlifcZ13JvJ32QMCTaESKr1UJUujm2V1imjgYwk0EZVnqo92sOxRgA==
X-Received: by 2002:a2e:2b11:: with SMTP id q17mr24274621lje.23.1559814431865; 
 Thu, 06 Jun 2019 02:47:11 -0700 (PDT)
Received: from localhost (c-1c3670d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.54.28])
 by smtp.gmail.com with ESMTPSA id q2sm217457lfj.25.2019.06.06.02.47.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 02:47:11 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 davem@davemloft.net
Subject: [PATCH 1/8] drivers: net: dsa: realtek: fix warning same module names
Date: Thu,  6 Jun 2019 11:47:07 +0200
Message-Id: <20190606094707.23664-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/U6XWsLOhFjdMqLKkh6fLtzFOqDQWJVhwH8yel62eg=;
 b=DPqi9DXwR+/hq7+Y9ZtMxZT2lLXGKzxdH/38Gu1SLXrFX1a+ucNrqvP8hDzJ33uHfp
 pHEwDO0hH6zLdP51PIE7a9x0i3YEr55tq9dzzKM2sf7emuDCE24z6TmisXtKu4JZYCfT
 I5+Ywy17dLMfSskwg73uua2d5seIGWnJH4ccXJGPEm56bi+clkBBXjvOTAbhkMQl7xUu
 REhmNfRmiR3yPcEvujzxpqbYiiNCMdqFFPlGaOIrpBDxtQDH8j1BgnS/FfuowKEobouO
 ZtKE/RsncvrSsnltdI/Y98+ttSi+9orKWxSDoJjdFl077xhmlcWcq4CB/fwN06jV3ZJQ
 pFbg==
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
Cc: marex@denx.de, linux-fbdev@vger.kernel.org,
 Anders Roxell <anders.roxell@linaro.org>, b.zolnierkie@samsung.com,
 airlied@linux.ie, lee.jones@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, mchehab@kernel.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyB3aXRoIENPTkZJR19ORVRfRFNBX1JFQUxURUtfU01JIGFuZCBDT05GSUdf
UkVBTFRFS19QSFkKZW5hYmxlZCBhcyBsb2FkYWJsZSBtb2R1bGVzLCB3ZSBzZWUgdGhlIGZvbGxv
d2luZyB3YXJuaW5nOgoKd2FybmluZzogc2FtZSBtb2R1bGUgbmFtZXMgZm91bmQ6CiAgZHJpdmVy
cy9uZXQvcGh5L3JlYWx0ZWsua28KICBkcml2ZXJzL25ldC9kc2EvcmVhbHRlay5rbwoKUmV3b3Jr
IHNvIHRoZSBuYW1lcyBtYXRjaGVzIHRoZSBjb25maWcgZnJhZ21lbnQuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9u
ZXQvZHNhL01ha2VmaWxlIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9NYWtlZmlsZSBi
L2RyaXZlcnMvbmV0L2RzYS9NYWtlZmlsZQppbmRleCBmZWZiNmFhYTgyYmEuLmRiZTgzNTJjZjhh
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZHNhL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvbmV0
L2RzYS9NYWtlZmlsZQpAQCAtOSw4ICs5LDggQEAgb2JqLSQoQ09ORklHX05FVF9EU0FfTEFOVElR
X0dTV0lQKSArPSBsYW50aXFfZ3N3aXAubwogb2JqLSQoQ09ORklHX05FVF9EU0FfTVQ3NTMwKQkr
PSBtdDc1MzAubwogb2JqLSQoQ09ORklHX05FVF9EU0FfTVY4OEU2MDYwKSArPSBtdjg4ZTYwNjAu
bwogb2JqLSQoQ09ORklHX05FVF9EU0FfUUNBOEspCSs9IHFjYThrLm8KLW9iai0kKENPTkZJR19O
RVRfRFNBX1JFQUxURUtfU01JKSArPSByZWFsdGVrLm8KLXJlYWx0ZWstb2JqcwkJCTo9IHJlYWx0
ZWstc21pLm8gcnRsODM2Ni5vIHJ0bDgzNjZyYi5vCitvYmotJChDT05GSUdfTkVUX0RTQV9SRUFM
VEVLX1NNSSkgKz0gZHNhLXJlYWx0ZWstc21pLm8KK2RzYS1yZWFsdGVrLXNtaS1vYmpzCQkJOj0g
cmVhbHRlay1zbWkubyBydGw4MzY2Lm8gcnRsODM2NnJiLm8KIG9iai0kKENPTkZJR19ORVRfRFNB
X1NNU0NfTEFOOTMwMykgKz0gbGFuOTMwMy1jb3JlLm8KIG9iai0kKENPTkZJR19ORVRfRFNBX1NN
U0NfTEFOOTMwM19JMkMpICs9IGxhbjkzMDNfaTJjLm8KIG9iai0kKENPTkZJR19ORVRfRFNBX1NN
U0NfTEFOOTMwM19NRElPKSArPSBsYW45MzAzX21kaW8ubwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
