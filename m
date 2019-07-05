Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FE60A7B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6F6E513;
	Fri,  5 Jul 2019 16:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D8C6E514
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:42 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so5404177iog.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoIk+rbFwPJ/lDbdbtoXks82bIuWeLHVYlyQ0/EsZZU=;
 b=SqhtluD3ZNKIUFS9L0yLwRdGtVk+VnIJg2u8oMSR3dpCZcmnP9yaYMQFFgfI461nmx
 u7QkWAkb1IbZP8u2yhIapVPZCWKUHjW6BGBF4C6khPRSpQuzSVQ/LMJwXSO5Gd13A2gZ
 VruvGilydb4pGHhiWGazDhJfZWb9QFBUk9R4OPiVDsOEwenRcNy6huXSbDIBa24tNHEw
 rdxolFKBDs+SSz/QHvHEGVL5xTTTvtpGEkMvnG5FqxOs4lHvhttVUFaP0XV6A24wLRqO
 hsQZ8STJzSHQETvc7FLhQp3nJraxVfChq+Iyb35GMSHV22dNDsQyjbNcTEw1Z9RW5Jkd
 Dm6w==
X-Gm-Message-State: APjAAAWAsAbJx7aNvpTEMAG+isIeNJ5I6p6gbLqB7+DHe6hWgeIFrC+t
 tLhdzIdwS32O0EQbHM04zPA4Gz4=
X-Google-Smtp-Source: APXvYqyUJoGqrhu1jI2/dAFKaqMmF6AV+orNNmKQ/l+hsXENx8O/XWHlmlUk7xd29jsQqHmFggBF+g==
X-Received: by 2002:a5d:9f4a:: with SMTP id u10mr4984238iot.243.1562344961433; 
 Fri, 05 Jul 2019 09:42:41 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:40 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 10/13] dt-bindings: display: Convert innolux,
 ee101ia-01 panel to DT schema
Date: Fri,  5 Jul 2019 10:42:18 -0600
Message-Id: <20190705164221.4462-11-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705164221.4462-1-robh@kernel.org>
References: <20190705164221.4462-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgaW5ub2x1eCxlZTEwMWlhLTAxIExWRFMgcGFuZWwgYmluZGluZyB0byBEVCBz
Y2hlbWEuCgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKUmV2aWV3ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9v
dGxpbi5jb20+CkFja2VkLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9kaXNw
bGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQudHh0ICAgICB8ICA3IC0tLS0tCiAuLi4vZGlz
cGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFkLnlhbWwgICAgfCAzMSArKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvaW5ub2x1eCxlZTEwMWlhLTAxZC50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVl
MTAxaWEtMDFkLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9pbm5vbHV4LGVlMTAxaWEtMDFkLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQu
dHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlNWNhNGNjZDU1ZWQuLjAwMDAwMDAw
MDAwMAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9pbm5vbHV4LGVlMTAxaWEtMDFkLnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDcgKzAsMCBAQAot
SW5ub2x1eCBDb3Jwb3JhdGlvbiAxMC4xIiBFRTEwMUlBLTAxRCBXWEdBICgxMjgweDgwMCkgTFZE
UyBwYW5lbAotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlOiBzaG91bGQgYmUg
Imlubm9sdXgsZWUxMDFpYS0wMWQiCi0KLVRoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGgg
dGhlIGx2ZHMtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVkCi1pbiBwYW5lbC1sdmRz
LnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lubm9sdXgsZWUx
MDFpYS0wMWQueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmE2
OTY4MWU3MjRjYgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lubm9sdXgsZWUxMDFpYS0wMWQueWFtbApAQCAtMCwwICsx
LDMxIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0t
LQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2lubm9s
dXgsZWUxMDFpYS0wMWQueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogSW5ub2x1eCBDb3Jwb3JhdGlvbiAxMC4xIiBF
RTEwMUlBLTAxRCBXWEdBICgxMjgweDgwMCkgTFZEUyBwYW5lbAorCittYWludGFpbmVyczoKKyAg
LSBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAYnEuY29tPgorICAtIFRoaWVycnkgUmVk
aW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IGx2ZHMu
eWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAgIC0g
Y29uc3Q6IGlubm9sdXgsZWUxMDFpYS0wMWQKKyAgICAgIC0ge30gIyBwYW5lbC1sdmRzLCBidXQg
bm90IGxpc3RlZCBoZXJlIHRvIGF2b2lkIGZhbHNlIHNlbGVjdAorCisgIGJhY2tsaWdodDogdHJ1
ZQorICBlbmFibGUtZ3Bpb3M6IHRydWUKKyAgcG93ZXItc3VwcGx5OiB0cnVlCisgIHdpZHRoLW1t
OiB0cnVlCisgIGhlaWdodC1tbTogdHJ1ZQorICBwYW5lbC10aW1pbmc6IHRydWUKKyAgcG9ydDog
dHJ1ZQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKy4uLgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
