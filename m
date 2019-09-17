Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C3B529D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 18:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B136ECF9;
	Tue, 17 Sep 2019 16:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5C6ECF9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 16:12:35 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id a1so8961678ioc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DnOWZfH0hOJW+dI1w1NtgRKHb/FFjMuNFZYKGDHEM+E=;
 b=or23G4vnnmPKqkaL7M8bBqZ7CLwJCHkw+0niSAp0fzykf/syhInWxD1HnOqtmjLeE0
 kyzUDZcvh0YNWtkcHo0E/UeJQ+qBAU6bTEVBGwY9ju1yBSdV3Y0OiGc2NpLMfOc6kjFe
 MRqri9nW9JaTc3cENOFdLUPyvV2xBmDuNv5mgXAsMSyv9jdxehrnMGx1mdBqzrf03vhR
 9kKGL7szG3bBffA8FH3S3Gt/Dnb3Gos2msR36MVnqjH9rid4N/C34i5UAevzZW0AITrl
 AdqK+OLTvOji7+9kcoCegDDZ374N2rSYQwWf7/HjeiyBeiS4RDsfu7TJn+qsPABgyFz2
 Cumw==
X-Gm-Message-State: APjAAAUAHnQOILdBGnQBvn/OA0xaeAv2AskrI7otsPCxCvei0w55iFjM
 xLsMp3kACRy4yDenEmJOeDWqaOyYIGD/ww==
X-Google-Smtp-Source: APXvYqxKwe5NGUh8qHgGmEb1qYzQYcMoUgcdSrs/VA407oH7iuMzBffD3hKkrywOQuGjJWnPF7yIyg==
X-Received: by 2002:a5d:8f02:: with SMTP id f2mr220335iof.272.1568736754145;
 Tue, 17 Sep 2019 09:12:34 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id p25sm2090487ioo.35.2019.09.17.09.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 09:12:29 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Tue, 17 Sep 2019 11:12:12 -0500
Message-Id: <20190917161214.2913-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917161214.2913-1-aford173@gmail.com>
References: <20190917161214.2913-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DnOWZfH0hOJW+dI1w1NtgRKHb/FFjMuNFZYKGDHEM+E=;
 b=DdhP0J19s0F897KOlRUOyWuJ79Fe27lc+QeqrI5mKAKZWfIyaqt58mnKR0aFCiDJBA
 kU4QtLqfUglUq6yoPa3ZqZfVDCfw63tvQ8h9KZ6goqBY1SyKCSMX0HBdvGb8CofEfTsQ
 PScUllzeXrIBnDfOIMegWYmcvwWLMhHe9kDuq7HnxzkkFvDMS1tAUQMC3YgCwt9KGn6v
 13shSdNd7LOwBozcd0IfIkAa4+kskIJ0W2tNIOYBjGNTUI51IVqcSP3TP6HjJm2Qcowd
 FqC31PZZ0N1X8IPzaPAAR0P9aVDGW17N9A/VN6r0yiYC4icFKI9SY2tU73AsdRwdiUNx
 DGmg==
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
IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPgoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQs
dHlwZTI4LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjgyOWZj
NTIxMGUwNgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4LnR4dApAQCAtMCwwICsxLDI2IEBACitM
b2dpYyBQRCBUeXBlIDI4IDQuMyIgV1FWR0EgVEZUIExDRCBwYW5lbAorCitUaGlzIGJpbmRpbmcg
aXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3Bl
Y2lmaWVkCitpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgorCitSZXF1aXJl
ZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgImxvZ2ljcGQsdHlwZTI4Igor
CitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBwb3dlci1zdXBwbHk6IHJlZ3VsYXRvciB0byBwcm92
aWRlIHRoZSBzdXBwbHkgdm9sdGFnZQorLSBlbmFibGUtZ3Bpb3M6IEdQSU8gcGluIHRvIGVuYWJs
ZSBvciBkaXNhYmxlIHRoZSBwYW5lbAorLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2ts
aWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCisKK09wdGlvbmFsIG5vZGVzOgorLSBW
aWRlbyBwb3J0IGZvciBSR0IgaW5wdXQuCisKK0V4YW1wbGU6CisJbGNkMDogZGlzcGxheSB7CisJ
CWNvbXBhdGlibGUgPSAibG9naWNwZCx0eXBlMjgiOworCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW81
IDI3IEdQSU9fQUNUSVZFX0hJR0g+OworCQlwb3J0IHsKKwkJCWxjZF9pbjogZW5kcG9pbnQgewor
CQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291dD47CisJCQl9OworCQl9OworCX07Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
