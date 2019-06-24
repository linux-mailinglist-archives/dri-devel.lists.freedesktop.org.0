Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263251D91
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B3989E06;
	Mon, 24 Jun 2019 21:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52D389DCF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:58:53 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s7so373499iob.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEFj1m00BQHw9ShNEs9XZxRgQ7JCz9e7ngBon7KyAz4=;
 b=s+FTVt2/LP1j85IGHBd5cLl2O7wLcBYsVcA35zTsqPeP9O7UaMQ+mFSzgOOfCVxu3o
 fkwnjGvC7FLlKByGHfIUZwlB5iTLAj9yvVihaCdzG2yXf4zcDWusOeHnW1WaC1sTTVgP
 LKhs0PlHg50dPWOdoM1KZWo0Kghr1ILk+Z3el7nT0HCir6NHk/gajmNpfyb3V9U+eypS
 Ik/8Tv9kL13c6XXBA1A2mCKHqqDaDetEEV+6FUxbTbq9tIseHIRdbmuaUReuQjE05sYU
 kM+HcPbW5GPfEpzs1eDUpbY0IedGeqfevWUzJV8WEORLuc2TpneeW8Qovnu6m/Gkksz2
 dt3A==
X-Gm-Message-State: APjAAAVPBM8TQhE9J25W/AbHjLN8IeWEoUQ3yljlpIuB2oM6lj3knFrF
 YhjenWIUTOX64B1ULS8TmwgXAQ0=
X-Google-Smtp-Source: APXvYqw/FHO+gVZRrGcciOK3h3Kb/yWTmo0PoEZ7PQLBbItysz7a1oMFgC77m1j4HXKE5Et7o3a8FQ==
X-Received: by 2002:a5d:8759:: with SMTP id k25mr17594429iol.307.1561413532967; 
 Mon, 24 Jun 2019 14:58:52 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.58.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:58:52 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 01/15] dt-bindings: display: rockchip-lvds: Remove panel
 references
Date: Mon, 24 Jun 2019 15:56:35 -0600
Message-Id: <20190624215649.8939-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
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
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsIGJpbmRpbmdzIGFyZSBvdXRzaWRlIHRoZSBzY29wZSBvZiB0aGUgUm9ja2NoaXAg
TFZEUyBpbnRlcmZhY2UKYmluZGluZy4gVGhlIHJlZmVyZW5jZXMgYXJlIGFib3V0IHRvIGNoYW5n
ZSB0b28sIHNvIHJhdGhlciB0aGFuIHVwZGF0ZQp0aGVtIGp1c3QgZHJvcCB0aGUgc2VjdGlvbiBv
biB0aGUgcGFuZWwgYmluZGluZ3MuCgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNv
bT4KQ2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcm9ja2NoaXAvcm9ja2NoaXAtbHZkcy50eHQgICAgICAgfCAxMSAtLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLWx2ZHMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvcm9j
a2NoaXAtbHZkcy50eHQKaW5kZXggZGE2OTM5ZWZkYjQzLi43ODQ5ZmYwMzkyMjkgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3Jv
Y2tjaGlwLWx2ZHMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLWx2ZHMudHh0CkBAIC0zMiwxNyArMzIsNiBAQCBUaGVp
ciBjb25uZWN0aW9ucyBhcmUgbW9kZWxlZCB1c2luZyB0aGUgT0YgZ3JhcGggYmluZGluZ3Mgc3Bl
Y2lmaWVkIGluCiAtIHZpZGVvIHBvcnQgMCBmb3IgdGhlIFZPUCBpbnB1dCwgdGhlIHJlbW90ZSBl
bmRwb2ludCBtYXliZSB2b3BiIG9yIHZvcGwKIC0gdmlkZW8gcG9ydCAxIGZvciBlaXRoZXIgYSBw
YW5lbCBvciBzdWJzZXF1ZW50IGVuY29kZXIKIAotdGhlIGx2ZHMgcGFuZWwgZGVzY3JpYmVkIGJ5
Ci0JRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2ltcGxl
LXBhbmVsLnR4dAotCi1QYW5lbCByZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBwb3J0cyBmb3IgcmVt
b3RlIExWRFMgb3V0cHV0Ci0KLVBhbmVsIG9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIGRhdGEtbWFw
cGluZzogc2hvdWxkIGJlICJ2ZXNhLTI0IiwiamVpZGEtMjQiIG9yICJqZWlkYS0xOCIuCi1UaGlz
IGRlc2NyaWJlcyBkZWNyaWJlZCBieToKLQlEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dAotCiBFeGFtcGxlOgogCiBsdmRzX3BhbmVs
OiBsdmRzLXBhbmVsIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
