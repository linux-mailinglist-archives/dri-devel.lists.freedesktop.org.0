Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD931EB0B4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 14:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0B66EC32;
	Thu, 31 Oct 2019 13:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398C46EE1A;
 Thu, 31 Oct 2019 10:44:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v9so5673327wrq.5;
 Thu, 31 Oct 2019 03:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kyw+VrjIluOVETkrbPtQFePhVuk9mRrThavtM8H778=;
 b=PFWbcYrKsPzUj1CVeZvZD3nJQMmPQ7w6VD0WCFm6VXROsACr0MOLWebyj5ZCDL2H8l
 NWIWd9uPaq1XPqueSW9dVI3uvgt4BzqNgoBpUmfE45pjZGSo7c56xzUt19RNTDJ++vzE
 8akKQeyJkqOMiFGNOHf6I4tRAnoAUenYiQOGfYR0lYuO5JW6My6A1HAUMJPwlXhVo1zg
 jKuJR3DCh72js0ZMJuWh8PFGL4nvkAq6P9cFz4EEy7dHIxAWiM7/5+Y6gNs3nCdEOHGo
 VikMg5dvYWL8mJdjeKqzWUnfs+zeK5EnTvnTbjjxDpev/ih3jTdNrdAw7IsAXaCyRD6d
 i11g==
X-Gm-Message-State: APjAAAUuU/J2aECMOjrAJuvSQWzvPBdek+6EgHEcBax76cnoLDI/yVtE
 +CVRgHPmMIHNSQ055Osa6ug=
X-Google-Smtp-Source: APXvYqxbYaS5sRyVAhsl7geY/EZw3oqStF/nVVJakRko/T4e9ztkZGbbDjq1w9/MAC6c8i/F1CydPg==
X-Received: by 2002:adf:e903:: with SMTP id f3mr5124031wrm.121.1572518648641; 
 Thu, 31 Oct 2019 03:44:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Oct 2019 03:44:08 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/7] DRM/MSM: Add support for MSM8956 and Adreno 510
Date: Thu, 31 Oct 2019 11:43:55 +0100
Message-Id: <20191031104402.31813-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Oct 2019 13:00:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7kyw+VrjIluOVETkrbPtQFePhVuk9mRrThavtM8H778=;
 b=c33HVydS3Hcq55X2NoEsiAtLP/MX+UF9BMh+RN46W8VCD73GzwJEklwd6CDGUxrIjc
 YKsT15/KIF/1LDiLLgRcrqKgErJuSazEGl01kWFM2/EdwFACjZU+sz5kOksindeSueFZ
 mjwdJDWG2hY8CTaNln7BWrSIUJcfQf0S27YXCQ91wm61etFdOqga6BILwv62K44rTBlE
 TciH1M6gtC/NndMakkNr9uOH702/LDxCjmAVFc8LAikwz2S9MmOPL33pP0oJnus2pqmj
 kYhoZ+JqmujN2YpktmS8xVI9pX2fGFW1TG5s2dUkFtWtPveGVlph/uYlMrsAaXV1LY1V
 RDfA==
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, marijns95@gmail.com,
 jonathan@marek.ca, airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, tglx@linutronix.de, kholk11@gmail.com, sean@poorly.run,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGtob2xrMTFAZ21haWwuY29tPgoKVGhp
cyBwYXRjaCBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBNU004OTU2Lzc2IGFuZCBpdHMgQWRy
ZW5vIDUxMApHUFUgb24gdGhlIGN1cnJlbnQgRFJNIGRyaXZlci4KClRoZSBwZXJzb25hbCBhaW0g
aXMgdG8gdXBzdHJlYW0gTVNNODk1NiBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKVGhpcyBjb2RlIGhh
cyBiZWVuIHRlc3RlZCBvbiB0d28gU29ueSBwaG9uZXMgZmVhdHVyaW5nIHRoZSBRdWFsY29tbQpN
U004OTU2IFNvQy4KCkNoYW5nZXMgaW4gdjI6Ci0gTURQNTogRG9jdW1lbnRlZCB0YnUgYW5kIHRi
dV9ydCBjbG9ja3MgKEplZmZyZXkpCi0gQWRyZW5vNTEwOgogIC0gTG93ZXIgY2FzZSBoZXggd2hl
cmUgcmVxdWlyZWQgKEpvcmRhbikKICAtIERpcmVjdCByZWdpc3RlciB3cml0ZXMgKEpvcmRhbikK
ICAtIFVzZWQgZ3B1X3JtdygpIHdoZXJlIHJlcXVpcmVkIChKb3JkYW4pCiAgLSBObyBtZW50aW9u
aW5nIG9mIHVuc3VwcG9ydGVkIEE1eHggKEpvcmRhbikKICAtIFpBUCBmaXJtd2FyZSBleGNsdXNp
b25zIG5vdCBwZXItbW9kZWwgKFJvYikKCkNoYW5nZXMgaW4gdjM6Ci0gUmViYXNlZCBvbnRvIGxp
bnV4LW5leHQgMjAxOTEwMTUKLSBSZW5hbWVkIE1TTTh4NTYgcmVmZXJlbmNlcyB0byBNU004eDc2
ICh0aGUgcmVhc29uIGlzIHRoYXQgSSBhbQogIHVzaW5nIHRoZSA4OTc2Lzh4NzYgbmFtZSBmb3Ig
YWxsIHRoZSBvdGhlciBkcml2ZXJzLiBBbHNvLCB0aGUKICA4OTc2IGFuZCA4OTU2IGNoaXBzIGFy
ZSBlcXVhbCBhbmQgdGhlIG9ubHkgY2hhbmdpbmcgcGFydCBpcwogIHRoZSBDUFUgYmlnIGNvcmVz
IGNvdW50KQotIFNwbGl0dGVkIGR0LWJpbmRpbmdzIG1vZGlmaWNhdGlvbnMgYXMgcGVyIHJlcXVl
c3QgKFNlYW4pCgpDaGFuZ2VzIGluIHY0OgotIEZpeGVkIGlvX3N0YXJ0IGZvciB0aGUgc2Vjb25k
YXJ5IGRzaSBwaHkgb24gZmFtaWx5LWIKCkFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vICg3KToK
ICBkcm0vbXNtL21kcDU6IEFkZCBvcHRpb25hbCBUQlUgYW5kIFRCVV9SVCBjbG9ja3MKICBkdC1i
aW5kaW5nczogbXNtL21kcDU6IERvY3VtZW50IG9wdGlvbmFsIFRCVSBhbmQgVEJVX1JUIGNsb2Nr
cwogIGRybS9tc20vbWRwNTogQWRkIGNvbmZpZ3VyYXRpb24gZm9yIG1zbTh4NzYKICBkcm0vbXNt
L2RzaTogQWRkIGNvbmZpZ3VyYXRpb24gZm9yIDI4bm0gUExMIG9uIGZhbWlseSBCCiAgZHQtYmlu
ZGluZ3M6IG1zbS9kc2k6IEFkZCAyOG5tIFBMTCBmb3IgZmFtaWx5IEIgY29tcGF0aWJsZQogIGRy
bS9tc20vZHNpOiBBZGQgY29uZmlndXJhdGlvbiBmb3IgOHg3NgogIGRybS9tc20vYWRyZW5vOiBB
ZGQgc3VwcG9ydCBmb3IgQWRyZW5vIDUxMCBHUFUKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9kc2kudHh0ICAgfCAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9tZHA1LnR4dCAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4
X2dwdS5jICAgICAgICAgfCA3MyArKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTV4eF9wb3dlci5jICAgICAgIHwgIDcgKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2FkcmVub19kZXZpY2UuYyAgICB8IDE1ICsrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYWRyZW5vX2dwdS5oICAgICAgIHwgIDUgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21k
cDUvbWRwNV9jZmcuYyAgICAgIHwgOTggKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyAgICAgIHwgMTAgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmggICAgICB8ICAyICsKIGRyaXZlcnMvZ3B1L2RybS9t
c20vZHNpL2RzaV9jZmcuYyAgICAgICAgICAgICB8IDIyICsrKysrCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfY2ZnLmggICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9waHkvZHNpX3BoeS5jICAgICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rz
aS9waHkvZHNpX3BoeS5oICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9w
aHkvZHNpX3BoeV8yOG5tLmMgICAgfCAxOCArKysrCiAxNCBmaWxlcyBjaGFuZ2VkLCAyNDMgaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
