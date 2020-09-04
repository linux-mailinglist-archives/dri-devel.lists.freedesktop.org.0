Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8525DF8C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E136EC81;
	Fri,  4 Sep 2020 16:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084206EC81
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:15:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k15so7266321wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VW8/Gqfl2ygRzhelgm8VgMzXeTrqKEKDiPdSn34tSCE=;
 b=MLOUcWu0MPsrbS2FTQkXUWJ2ueuR/hWyD6JTigcMy8+S7yczFEVDN4sVtXn4Fsmwl5
 QvAIme6XsbyHzM7wfGCpy8xb27TH3PuyZiXVw2Hv6xxjufFaygz433/G1YOUO6xU6pN3
 cUGLJ0Qtyrn2A+li6Z6jyDTLgTEofO5402uUDxU9Pyo3MmAFCWkXhCXbYLOtq+bwbuM6
 7xwxi2TEpadbbP8rn4jr2k+OxTaaKXrf/hO12yEu1rS2eSv7IgymLVUyJgc9/UbuN6ug
 dHNCCfBH168X3KEKAl9zmTol76MXCB3AGAeH41yqsUYnR/cdx6WpEOewjEX7BPm5JJf8
 +WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VW8/Gqfl2ygRzhelgm8VgMzXeTrqKEKDiPdSn34tSCE=;
 b=gO4nHjhp+LJQbBmYi72tpLjLuLhUS7psCh8m1RGBNZL027tAnJVGBwaF6X/emuOMCw
 VyZ8R7GgVifyVrvAzn+xJoWO5W5/A3IgbG3+mgHqGPoBFdNlaB7PjszzkRB1d/yA2t5g
 uGOMdSjRDLtm/1GFZHI5ErQgGppz+9wgWX0pvErzN/WXkmgGKnWgcf7KSaqKLUFBdFEQ
 vaDhZ4gTZz2DoYygQbXE7kdsxN4YkwjePhAJ7LW6qYOzUqT06iNUmzRRsWNXEW40zDlo
 UVEvVcBjHmfWhaj4Bi5froCijqAvNOgxQOwnZoK2YhV8ygJZ2rDhEaAndzkg08KNA6wL
 FR+g==
X-Gm-Message-State: AOAM530XgHCq0tqaAIxRkH9RbL6L74A/KMXyH13bcSGsy9stITy/o5rA
 IJS1mmKudda3pNx3/k/VhOyT1g==
X-Google-Smtp-Source: ABdhPJzBStwPYgSPHPXMrwc0ijPLvHWYZmHpf/4cpLNfKiWOt8MMJHmIYPnwpmV6MkYuzVeqkYlQFw==
X-Received: by 2002:adf:fc43:: with SMTP id e3mr8030854wrs.28.1599236111470;
 Fri, 04 Sep 2020 09:15:11 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d18sm12238160wrm.10.2020.09.04.09.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:15:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH 0/2] drm: panel: add support for TDO tl070wsh30 panel
Date: Fri,  4 Sep 2020 18:15:02 +0200
Message-Id: <20200904161504.23915-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHN1cHBvcnQgYmluZGluZ3MgYW5kIHN1cHBvcnQgZm9yIHRoZSBURE8gVEwwNzBX
U0gzMCBURlQtTENEIHBhbmVsCm1vZHVsZSBzaGlwcGVkIHdpdGggdGhlIEFtbG9naWMgUzQwMCBE
ZXZlbG9wbWVudCBLaXQuClRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlvbiBhbmQg
dXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KSXQgcHJvdmlkZXMgYSBNSVBJIERTSSBpbnRlcmZh
Y2UgdG8gdGhlIGhvc3QsIGEgYnVpbHQtaW4gTEVEIGJhY2tsaWdodAphbmQgdG91Y2ggY29udHJv
bGxlci4KCk5laWwgQXJtc3Ryb25nICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6
IGFkZCBURE8gdGwwNzB3c2gzMCBEU0kgcGFuZWwgYmluZGluZ3MKICBkcm06IHBhbmVsOiBhZGQg
VERPIHRsMDcwd3NoMzAgcGFuZWwgZHJpdmVyCgogLi4uL2Rpc3BsYXkvcGFuZWwvdGRvLHRsMDcw
d3NoMzAueWFtbCAgICAgICAgIHwgIDU4ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29u
ZmlnICAgICAgICAgICAgICAgICB8ICAxMSArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvTWFrZWZp
bGUgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRk
by10bDA3MHdzaDMwLmMgIHwgMjYzICsrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2Vk
LCAzMzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Rkbyx0bDA3MHdzaDMwLnlhbWwKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdGRvLXRsMDcwd3NoMzAu
YwoKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
