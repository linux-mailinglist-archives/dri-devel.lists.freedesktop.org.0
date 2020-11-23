Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277A2C0D8E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B626889EFF;
	Mon, 23 Nov 2020 14:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C9289EFF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:34:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p8so18819656wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzQ+MW1sRozBpQLbt6oHDRl3TR3+0qJeZOJ2PqKNVPw=;
 b=ebqRsCRRJtSqC0s8ZL2x/5Y5ZYIzJbs6cCAuKXzUsIQQ0yhEmJAMtzifwtORq7Bh52
 vFrpZXjEbkT6cESUTBbw2j+xoobJBL7lS1on/hkz0JxU8wK1PxEtM7dazwFXPlXY4Pwz
 rW0m4PXhi2ZXqijZ0tCzI8ZGmiuM7sCMUzKVOwj3eeejmNwHP/8ASIg5m2TZt9I9OYSL
 okHUwxQczORqPLyDiEHRFg9muHtwPFIzgRyL/H2NB9AP2t1ovyDkpIu/kMIUHRfs48Vs
 UJ+7qOMSaGx7kNeHqtnc3+Auz7R/8YxLiiYK7jb3e1zuv6plSnLjulgb5Yl5VjfWQmO8
 QQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzQ+MW1sRozBpQLbt6oHDRl3TR3+0qJeZOJ2PqKNVPw=;
 b=kxkbbfYo28EPKEy7v6oWj7VbmLUfzpNuHyKkS4VF1Ac0w/xgI8zaLQ0mmIY+wMKK90
 fF/oQGXzI8CN9V9nTUpPVideBuNZcmZMfPORmarj+4ocXptg/IxEVX4OmQHO2ruUxe8e
 l4vmFjyhs1/v+nfK1woy+T8bmXg6tYstz1EGOQGV83nXNt94LAKE7qCu858NmcO3E9OH
 y5XoxLn65EyBPyS1kvsi3C2Tz6xd1FnBxlXhaq4khuHeKCECkGE8pxwJlEpp8BpG7PUu
 CHwudP3pyd215ngMQVx+N5so+ocrU3rgqVFVoUOkqBre5UQKxE3KwW+aIGt6hzYOMRR4
 /xWw==
X-Gm-Message-State: AOAM532JI8Z4UXxpxVvLJv8qreKbeIyneycFiUiXZRT02Jg/dT8QXviP
 dXj3hQaQrNXROoacdTKNVVEn/lnyR9Dk9kRi
X-Google-Smtp-Source: ABdhPJwehKyk0RMzN+JwyVjbkvxBf9siWp85cfodX5MrKLYB3qY3Up0iA83EJiLEjiVbMg4MOy6T9A==
X-Received: by 2002:adf:c147:: with SMTP id w7mr33954942wre.60.1606142047701; 
 Mon, 23 Nov 2020 06:34:07 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id h2sm18126723wme.45.2020.11.23.06.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:34:07 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sam@ravnborg.org
Subject: [PATCH 1/2] dt-bindings: panel-simple-dsi: add Khadas TS050 panel
 bindings
Date: Mon, 23 Nov 2020 15:33:53 +0100
Message-Id: <20201123143354.295844-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123143354.295844-1-narmstrong@baylibre.com>
References: <20201123143354.295844-1-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGQgdGhlIGJpbmRpbmdzIGZvciB0aGUgS2hhZGFzIFRTMDUwIDEwODB4MTkyMCA1IiBM
Q0QgRFNJIHBhbmVsIGRlc2lnbmVkIHRvIHdvcmsKd2l0aCB0aGUgS2hhZGFzIEVkZ2UtViwgQ2Fw
dGFpbiwgVklNMyBhbmQgVklNM0wgU2luZ2xlIEJvYXJkIENvbXB1dGVycy4KClNpZ25lZC1vZmYt
Ynk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KLS0tCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2kueWFtbCAgICAg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxl
LWRzaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCmluZGV4IDcyZTRiNmQ0ZDVlMS4uZmJkNzE2NjkyNDhm
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCkBAIC0zNSw2ICsz
NSw4IEBAIHByb3BlcnRpZXM6CiAgICAgICAtIGJvZSx0djA4MHd1bS1ubDAKICAgICAgICAgIyBJ
bm5vbHV4IFAwNzlaQ0EgNy44NSIgNzY4eDEwMjQgVEZUIExDRCBwYW5lbAogICAgICAgLSBpbm5v
bHV4LHAwNzl6Y2EKKyAgICAgICAgIyBLaGFkYXMgVFMwNTAgNSIgMTA4MHgxOTIwIExDRCBwYW5l
bAorICAgICAgLSBraGFkYXMsdHMwNTAKICAgICAgICAgIyBLaW5nZGlzcGxheSBLRDA5N0QwNCA5
LjciIDE1MzZ4MjA0OCBURlQgTENEIHBhbmVsCiAgICAgICAtIGtpbmdkaXNwbGF5LGtkMDk3ZDA0
CiAgICAgICAgICMgTEcgQUNYNDY3QUtNLTcgNC45NSIgMTA4MMOXMTkyMCBMQ0QgUGFuZWwKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
