Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD72965A
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FCF6E0C0;
	Fri, 24 May 2019 10:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747C06E0C0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:52:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d126so2920894pfd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qNTSCPsOEC2W2+GNT7l2VKFB0+zY6ZYUs+njP7ZZryY=;
 b=Qcs57+WVUs7mp+k57+CJVel/msSV1O9BIzngmo72JY+CCvxwdpiJSeOQzA999mjBMK
 I7ZnuGqWEgvt6G80SKA/PrJ4VRsKcFQVEPx6/SlsdFl4ihhVtlbHWDcuYVysUtVeFqpT
 8e/y9ognxwE7RjuYU/9zzeyhPxrSFKLhLnF3YxNv9EB7vNZ8kMmW6nSHho6hy7GDF/TV
 qVNwSy9lEeyDaVAhawKPF7s63huhicDemiJuiUEBFfKKVQtMdqas1OJA7sq8cwVJRo05
 Ks0gPFaWZPbvc+6DTmBLcvUc0olgdtvGoWdXKnEdbj/78M2iprJAz+pGIA4ZGmW0wQ8R
 hqgg==
X-Gm-Message-State: APjAAAUJJO8fKt/g3ob+SvJrU/wo6CYyiqtbSnXRBwW3GoU+mjIp5T9A
 7Qh8qlYGDtLcLDmNMW6VOEOUdw==
X-Google-Smtp-Source: APXvYqwKcohDIPUT5/aEC255pUPB2TXqU3TOva/kNXfG24c8fTCD7t9u2h8RQ7FYuSxfiGAGamTVqQ==
X-Received: by 2002:a62:5653:: with SMTP id
 k80mr110389226pfb.144.1558694623629; 
 Fri, 24 May 2019 03:43:43 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.60])
 by smtp.gmail.com with ESMTPSA id h11sm2303416pfn.170.2019.05.24.03.43.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 03:43:43 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 4/6] dt-bindings: display: bridge: Add ICN6211 MIPI-DSI to
 RGB converter bridge
Date: Fri, 24 May 2019 16:13:15 +0530
Message-Id: <20190524104317.20287-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190524104317.20287-1-jagan@amarulasolutions.com>
References: <20190524104317.20287-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qNTSCPsOEC2W2+GNT7l2VKFB0+zY6ZYUs+njP7ZZryY=;
 b=MMbn8v2Zd2qsn/V/zb6Mt7MtfVlWEps+yV995UvWXL1qqyAQ3BZmYedcZmufHrmzso
 pmn/HjUvKsI28wdzVni96j2suAg2VF2NOyBYHDWkoag8/K6d/bRvl3k9S3+JbubG81qG
 C/PJWR2X8Czf3xVJnt9ALXMpfquiiK0chagBE=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SUNONjIxMSBpcyBNSVBJLURTSS9SR0IgY29udmVydGVyIGJyaWRnZSBmcm9tIGNoaXBvbmUuCkl0
IGhhcyBhIGZsZXhpYmxlIGNvbmZpZ3VyYXRpb24gb2YgTUlQSSBEU0kgc2lnbmFsIGlucHV0CmFu
ZCBwcm9kdWNlIFJHQjU2NSwgUkdCNjY2LCBSR0I4ODggb3V0cHV0IGZvcm1hdC4KCkFkZCBkdC1i
aW5naW5ncyBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4KLS0tCiAuLi4vZGlzcGxheS9icmlkZ2UvY2hpcG9uZSxpY242MjExLnR4
dCAgICAgICAgfCA3OCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNzggaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jaGlwb25lLGljbjYyMTEudHh0CgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NoaXBvbmUs
aWNuNjIxMS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvY2hpcG9uZSxpY242MjExLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjUzYTk4NDhlZjhiNgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jaGlwb25lLGljbjYyMTEudHh0CkBA
IC0wLDAgKzEsNzggQEAKK0NoaXBvbmUgSUNONjIxMSBNSVBJLURTSSB0byBSR0IgQ29udmVydGVy
IEJyaWRnZQorCitJQ042MjExIGlzIE1JUEktRFNJL1JHQiBjb252ZXJ0ZXIgYnJpZGdlIGZyb20g
Y2hpcG9uZS4KK0l0IGhhcyBhIGZsZXhpYmxlIGNvbmZpZ3VyYXRpb24gb2YgTUlQSSBEU0kgc2ln
bmFsIGlucHV0CithbmQgcHJvZHVjZSBSR0I1NjUsIFJHQjY2NiwgUkdCODg4IG91dHB1dCBmb3Jt
YXQuCisKK1JlcXVpcmVkIHByb3BlcnRpZXMgZm9yIFJHQjoKKy0gY29tcGF0aWJsZTogbXVzdCBi
ZSAiY2hpcG9uZSxpY242MjExIgorLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVyIG9m
IGEgRFNJIHBlcmlwaGVyYWwKKy0gcmVzZXQtZ3Bpb3M6IGEgR1BJTyBwaGFuZGxlIGZvciB0aGUg
cmVzZXQgcGluCisKK1RoZSBkZXZpY2Ugbm9kZSBjYW4gY29udGFpbiBmb2xsb3dpbmcgJ3BvcnQn
IGNoaWxkIG5vZGVzLAorYWNjb3JkaW5nIHRvIHRoZSBPRiBncmFwaCBiaW5kaW5ncyBkZWZpbmVk
IGluIFsxXToKKyAgMDogRFNJIElucHV0LCBub3QgcmVxdWlyZWQsIGlmIHRoZSBicmlkZ2UgaXMg
RFNJIGNvbnRyb2xsZWQKKyAgMTogUkdCIE91dHB1dCwgbWFuZGF0b3J5CisKK1sxXTogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0CisK
K0V4YW1wbGU6CisKKwlwYW5lbCB7CisJCWNvbXBhdGlibGUgPSAiYmFuYW5hcGksczA3MHd2MjAt
Y3QxNiIsICJzaW1wbGUtcGFuZWwiOworCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyAxIDcgR1BJT19B
Q1RJVkVfSElHSD47IC8qIExDRC1QV1ItRU46IFBCNyAqLworCQliYWNrbGlnaHQgPSA8JmJhY2ts
aWdodD47CisKKwkJcG9ydCB7CisJCQlwYW5lbF9vdXRfYnJpZGdlOiBlbmRwb2ludCB7CisJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZicmlkZ2Vfb3V0X3BhbmVsPjsKKwkJCX07CisJCX07CisJfTsK
KworJmRzaSB7CisJdmNjLWRzaS1zdXBwbHkgPSA8JnJlZ19kY2RjMT47CQkvKiBWQ0MtRFNJICov
CisJc3RhdHVzID0gIm9rYXkiOworCisJcG9ydHMgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
KwkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJZHNpX291dDogcG9ydEAwIHsKKwkJCXJlZyA9IDww
PjsKKworCQkJZHNpX291dF9icmlkZ2U6IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQg
PSA8JmJyaWRnZV9vdXRfZHNpPjsKKwkJCX07CisJCX07CisJfTsKKworCWJyaWRnZUAwIHsKKwkJ
Y29tcGF0aWJsZSA9ICJjaGlwb25lLGljbjYyMTEiOworCQlyZWcgPSA8MD47CisJCXJlc2V0LWdw
aW9zID0gPCZyX3BpbyAwIDUgR1BJT19BQ1RJVkVfSElHSD47IC8qIExDRC1SU1Q6IFBMNSAqLwor
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJcG9ydHMg
eworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJ
YnJpZGdlX2luOiBwb3J0QDAgeworCQkJCXJlZyA9IDwwPjsKKworCQkJCWJyaWRnZV9vdXRfZHNp
OiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291dF9icmlkZ2U+Owor
CQkJCX07CisJCQl9OworCisJCQlicmlkZ2Vfb3V0OiBwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsK
KworCQkJCWJyaWRnZV9vdXRfcGFuZWw6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50
ID0gPCZwYW5lbF9vdXRfYnJpZGdlPjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OworfTsKLS0g
CjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
