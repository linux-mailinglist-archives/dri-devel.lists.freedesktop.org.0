Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 778FB61B04
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DCD89A56;
	Mon,  8 Jul 2019 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B435E6E2E1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:56:59 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m30so4551904pff.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aJ9A33XeWtxV0qN7kevtyk3VxBBowXnZfu+VcAnor48=;
 b=gragD3C9hX3IE4uVBb8dVtYrjknkxXo6mvDPJZV4bVckoDC5dpSIfhgt/rN9TSAS+j
 bcWRFGFquvrryzjS+NTVKtwa5mm+8vMy0aIq+2f+5LkEIfsJn4hcEEnMV6TGBUwj0SgP
 WtGvvpYLaLD1rvJO93nKD0cEEAFY9ojlMd9W1rwDQHBHRIJUvWGSSLj3cGHYjUPqazwV
 XhTXkEPvw1oZYnKfa0oH4fiMn1tI8Nqfcuu+a9ukJImaJdzjmaJHh2wL7/3eSTR/fjr/
 NlUz7eL0ZfQjzB4ROInfaS9e7dkaWYUB+hTScCElKK9WipSoVEO3fenJ4YKBy5xUA0cQ
 NMjg==
X-Gm-Message-State: APjAAAU0Ehj96jih14/IZdKUIgyLOOI+eTDLKm8y7QEsEHXtdVc5A2nA
 6Tv+AR/Kh5mq6DCH9e5MiU4=
X-Google-Smtp-Source: APXvYqzLkG4W3qE9HCpmT4BW/IS4oA24stCeA7+cpzx8H5U5MOt5gzOL5CxjX+fL+kFC2K4XhRjd4w==
X-Received: by 2002:a63:1f47:: with SMTP id q7mr6615825pgm.264.1562345819395; 
 Fri, 05 Jul 2019 09:56:59 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id e26sm9285734pfn.94.2019.07.05.09.56.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 09:56:58 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date: Fri,  5 Jul 2019 09:56:55 -0700
Message-Id: <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aJ9A33XeWtxV0qN7kevtyk3VxBBowXnZfu+VcAnor48=;
 b=tz8DX/jKoInhtLlLZaBLfxK3HCjQCvrIbHkC4j+EqgsDTfRoUcyvqIxLOOH3r0KvzH
 NoAMntP26vyOTlx5Q63WRr3rgXn7UX/fHGGuyjAnjpNl7zSOdOxkTijfhawjIl1OV03V
 roC8k3Ptfl7gPSWwO0tb+pWguCp7M95yIZ6eL+pE8t2/eKZN7tCA0RmY8P00SAhMiZ6B
 GK/AtvtJLyXJHe4OIx2cBYmKrWhvjTp53Zk/Qz1gWoeguE2NhnWRCaN0Gh00pjvmnj0Q
 T2B5NxnjCIPvY/q/0gagoimqpsrvadlA9HuAyrrYtoX6c6uInqBHZIy3T+Yu3CDMtRzm
 hOmA==
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
Cc: devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNoYXJwIExELUQ1MTE2WjAxQiBpcyBhIDEyLjMiIGVEUCBwYW5lbCB3aXRoIGEgMTkyMFgx
MjgwIHJlc29sdXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9zaGFycCxsZC1kNTExNnowMWIu
dHh0ICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAxYi50eHQKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zaGFycCxs
ZC1kNTExNnowMWIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvc2hhcnAsbGQtZDUxMTZ6MDFiLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLjM5MzhjMjg0N2ZlNQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAx
Yi50eHQKQEAgLTAsMCArMSwyNyBAQAorU2hhcnAgTEQtRDUxMTZaMDFCIDEyLjMiIFdVWEdBKyBl
RFAgcGFuZWwKKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJl
ICJzaGFycCxsZC1kNTExNnowMWIiCistIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIHRvIHByb3Zp
ZGUgdGhlIFZDQyBzdXBwbHkgdm9sdGFnZSAoMy4zIHZvbHRzKQorCitUaGlzIGJpbmRpbmcgaXMg
Y29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZy4KKworVGhlIGRldmljZSBu
b2RlIGNhbiBjb250YWluIG9uZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGlsZAorJ2Vu
ZHBvaW50JyBub2RlLCBhY2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQgaW4gWzFdLiBU
aGlzCitub2RlIHNob3VsZCBkZXNjcmliZSBwYW5lbCdzIHZpZGVvIGJ1cy4KKworWzFdOiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQK
KworRXhhbXBsZToKKworCXBhbmVsOiBwYW5lbCB7CisJCWNvbXBhdGlibGUgPSAic2hhcnAsbGQt
ZDUxMTZ6MDFiIjsKKwkJcG93ZXItc3VwcGx5ID0gPCZ2bGNkXzN2Mz47CisJCW5vLWhwZAorCisJ
CXBvcnQgeworCQkJcGFuZWxfZXA6IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmJyaWRnZV9vdXRfZXA+OworCQkJfTsKKwkJfTsKKwl9OwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
