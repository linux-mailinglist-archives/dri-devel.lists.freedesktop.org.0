Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137BB22858
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 20:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C1F891D6;
	Sun, 19 May 2019 18:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EAD891D5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 18:36:49 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id w1so10476138ljw.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 11:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QgdqWs9M0PazZGEqkycLLT4hf/tbz1/vxNSIgUUQMt8=;
 b=eM8DeJ1SlOSaiAmJhm99VHRSUd9FFdcqEaiUlcYAT7yzOTYkLb9IcqA+LGhrqAOpQ/
 tDMzzpkcS5bHMmBlienb96EGHMWI/dcUV6pEu0erDQw/PHcxYT8HzypWaV9vk4gVsZXo
 VV2Q+9QYVb9kjFWYSljt7kqtZPu1LF1urZz1pWoC9AoHCdYxwhLtbL2TdzXrw/g5vEvE
 hTIq4SzSHSy8ZUOGRqqB3ykZPrUdYhmFlHj6zpjrGBnxQHkxw61z6GG8oKjUWyXpSbAn
 hkIdEHzFw/m8ruTzJG5Kwi1sx4S3RuoX4wvr+hCO/d1oKD9afub1io33IoanFQe9OASd
 Fzyw==
X-Gm-Message-State: APjAAAVCSZmagbornrA9KpSLHcvlNmw0B+EV+IYoARtrI5QeXRJvVEhO
 UyXdzIP28mEiKKYeIGjs8nQIRf2XDXs=
X-Google-Smtp-Source: APXvYqycXo7nOzsaLt+YNBivgb1FT0D2mrjP9zcZTxqY0nh/Tqfyw1cwQtrqRcslw7/HIPRXvZiMHQ==
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr5887459ljc.46.1558291007731; 
 Sun, 19 May 2019 11:36:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q65sm2832544lje.42.2019.05.19.11.36.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 11:36:47 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/bridge: drop drmP.h usage
Date: Sun, 19 May 2019 20:36:34 +0200
Message-Id: <20190519183636.19588-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QgdqWs9M0PazZGEqkycLLT4hf/tbz1/vxNSIgUUQMt8=;
 b=gU7bPe1NpSn4ORxax62AytDyzo8g/2BvKhSJf26kN4TX1Lvn7umWszoyxOPLd6g3/R
 Mz9gk+j7QygCdKMix8fo57Yc5E+7JxayFkzJiW6kNKyCqVeAkXkrHLJKtVriCFOOS3Up
 E1TxC54r3Y3eD/kwuqMdVA/wdhUZwSEU3TjvMbgm51/Xz/BD8acld/uB5mlhkGkfvqwr
 ZhkkR2Q9p+k+GbiDkA3K8Zn9C4P07Pgg5Y39ZecdDC2LeeWMZOpUfFa4f70xTm6XJTNN
 +aPTzvbQHOLy8Owval0FP2FVtxRoEih8W9Q1ZzUiywKfnYe96iUvzMX9OcvBDfHVr4px
 DPug==
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gYXZvaWQgdGhhdCBwZW9wbGUgc3RhcnQgdG8gcGljayB1cCBiYWQgaGFiaXRzCmdldCByaWQg
b2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGluIGFsbCBvZiB0aGUgYnJpZGdlLyBjb2RlLgoKQnVp
bGQgdGVzdGVkIHVzaW5nIGFsbG1vZGNvbmZpZy9hbGx5ZXNjb25maWcgd2l0aAphcm0sIHg4Niwg
YWxwaGEgKHRoYXQgaGFzIGEgdGVuZGVuY3kgdG8gYnJlYWspIGFuZCBhIGZldyBtb3JlCgp2MjoK
U29ydCBpbmNsdWRlIGJsb2NrcyBsaWtlIHRoaXM6CiNpbmNsdWRlIDxsaW51eC8qPgoKI2luY2x1
ZGUgPG1lZGlhLyo+CgojaW5jbHVkZSA8ZHJtLyo+CgojaW5jbHVkZSAiZm9vLmgiCgpBbmQgd2l0
aGluIGVhY2ggYmxvY2sgc29ydCBhbHBoYWJldGljYWxseS4KTGF1cmVudCBwb2ludGVkIG91dCB0
aGUgb3JkZXIgb2YgdGhlIGJsb2NrcyB3YXMgbm90IGNvbnNpc3RlbnQuCkFuZCBpdCB3YXMgbm90
IGNvbnNpc3RlbnQgd2hhdCB3YXMgaW4gZWFjaCBibG9jay4KClRoZSByZS1vcmRlcmluZyBjYXVz
ZWQgdGhlIGJ1aWxkIHRvIGZhaWwgZHVlIHRvIGR3X21pcGlfZHNpLmguCkZpeCBzbyB0aGlzIGhl
YWRlciBiZWNvbWVzIHNlbGYtY29udGFpbmVkIHRvIGF2b2lkIHRoaXMuCgpTYW0gUmF2bmJvcmcg
KDIpOgogICAgICBkcm0vYnJpZGdlOiBtYWtlIGR3X21pcGlfZHNpLmggc2VsZi1jb250YWluZWQK
ICAgICAgZHJtL2JyaWRnZTogZHJvcCBkcm1QLmggdXNhZ2UKCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYyAgICAgICB8ICA4ICsrKy0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jICAgICAgICAgIHwgIDggKysrLS0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMgfCAxOCArKysr
KysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgICAgICAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1lbmNvZGVyLmMgICAg
ICAgICAgICAgIHwgMTAgKysrKy0tLS0KIC4uLi9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4
eC1nZS1iODUwdjMtZncuYyAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1w
dG4zNDYwLmMgICAgICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9w
YW5lbC5jICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3BhcmFkZS1wczg2MjIuYyAgICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zaWk5MDJ4LmMgICAgICAgICAgICAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICAgICAgIHwgMjcgKysrKysrKysrKyst
LS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5j
ICAgICAgfCAgOSArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5jICAg
ICAgICAgICAgICAgICAgfCAxNCArKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aGM2M2x2ZDEwMjQuYyAgICAgICAgICAgICAgfCAxMCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90aS1zbjY1ZHNpODYuYyAgICAgICAgICAgICAgfCAxOCArKysrKysrKy0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgICAgICAgICAgICAgICAgIHwgIDQg
KystLQogaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmggICAgICAgICAgICAgICAgICAg
fCAgOCArKysrKysrCiAxNyBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCA2NCBkZWxl
dGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
