Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4FBB5AD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677546E910;
	Mon, 23 Sep 2019 13:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E822E6E910
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:45:15 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b136so33524585iof.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 06:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6KEVbOMgmT7rRfn/GiQXZyuHVfsA7+ZXr3TLsE1ZKxg=;
 b=azv7k8osWfeEiO++AHi9OYNWkIQe94Ocb6rI+YXqMimucRBD1Gc6Sm6PZy09tsGTxq
 +928tIfalQtj4mmBzyKuq8DvQa8hDYfHCxbY6tJQXOarNra4izsavkHB+8U+zk7VhHT3
 /Gb6cdjYe2k7skXYpr8zl1Xj9IcqLM+YbaLKFS71JbsBkZjAls0IJK2a+1JMtsCBIDm7
 lfTHyLAcoCxgFP4IABAuQkeZ4eCCfdeY0lioDnKHsn7qFe8emvJ1EHs6znZ8LwTNre53
 Z+3F1Ik67HyvpAz0VWq44pc/79kVIb7bT5xOOvEoYgLXqC7q3SECIIAYxJDixSEoDbzx
 5ZIA==
X-Gm-Message-State: APjAAAUNunhFO1C/7Xs/S8oOwkUqauw3buM28uym/AYPLBv5ieIguUKP
 FlJdXdYxaIBP67lrCNI6Cr9n2qtgJSM=
X-Google-Smtp-Source: APXvYqyRhc1UYpQc17s5gFWSBKWFMsHMrfOoJgvXh4s0LmVVLySIdfue6aQFT09HebdqP+/6iH4Gzw==
X-Received: by 2002:a6b:e302:: with SMTP id u2mr2267525ioc.135.1569246313939; 
 Mon, 23 Sep 2019 06:45:13 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id x2sm8844474iob.74.2019.09.23.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:45:08 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Mon, 23 Sep 2019 08:44:48 -0500
Message-Id: <20190923134449.22326-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923134449.22326-1-aford173@gmail.com>
References: <20190923134449.22326-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6KEVbOMgmT7rRfn/GiQXZyuHVfsA7+ZXr3TLsE1ZKxg=;
 b=apaI9MYT4uF2EnxCrwNl6kE1+1obRxTSGNBCmUc1fv82RV20hwMgb0DelnRGQBg/0r
 /eUkkz48X0hfIPKZ2N2DmbN5oKZobno+nbjeT4eeskVcepR8ap4NOLPh5/jA0JggX023
 xvJlUduAlc51f9v/RV2Bus8bcJJDY9yzItUSL7KWtJoJ/CObfC3BXBagk07kE4SAp7lX
 oU1df9YcLYKKdlWkMv+q5oms96DMigH/BvWFYs4/vFBV65Fq4vJ42EPFpG6DLEPcXP2L
 pRleMG7p84G+AXDbphrjFJl4MKLA9TSjeWjZu8plF4AKoet8cbrxTyq459qEcWKEXVH4
 FE1g==
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
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZSBXVkdBIHBhbmVsCkxvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KClNpZ25lZC1vZmYtYnk6
IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgotLS0KVjI6ICBVc2UgWUFNTCBpbnN0ZWFk
IG9mIFRYVCBmb3IgYmluZGluZwoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1s
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNzA3ZTJhMTdjOGMyCi0t
LSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbApAQCAtMCwwICsxLDM5IEBACisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgWDExKQorJVlBTUwgMS4yCistLS0KKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9yb25ibyxyYjA3MGQz
MC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCisKK3RpdGxlOiBMb2dpYyBQRCBUeXBlIDI4IDQuMyIgV1FWR0EgVEZUIExDRCBwYW5l
bAorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBsb2dpY3BkLHR5cGUy
OAorCisgIHBvd2VyLXN1cHBseToKKyAgICBkZXNjcmlwdGlvbjogUmVndWxhdG9yIHRvIHByb3Zp
ZGUgdGhlIHN1cHBseSB2b2x0YWdlCisgICAgbWF4SXRlbXM6IDEKKworICBlbmFibGUtZ3Bpb3M6
CisgICAgZGVzY3JpcHRpb246IEdQSU8gcGluIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBwYW5l
bAorICAgIG1heEl0ZW1zOiAxCisKKyAgYmFja2xpZ2h0OgorICAgIGRlc2NyaXB0aW9uOiBCYWNr
bGlnaHQgdXNlZCBieSB0aGUgcGFuZWwKKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZSIKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorCithZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisJbGNkMDogZGlzcGxheSB7CisJ
CWNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiOworCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW81
IDI3IEdQSU9fQUNUSVZFX0hJR0g+OworCQlwb3J0IHsKKwkJCWxjZF9pbjogZW5kcG9pbnQgewor
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47CisJCQl9OworCQl9OworCX07Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
