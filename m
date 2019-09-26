Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB43C002B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87CB6EE88;
	Fri, 27 Sep 2019 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEFF6ECFF;
 Thu, 26 Sep 2019 10:53:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m18so2088450wmc.1;
 Thu, 26 Sep 2019 03:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=edVq6toJYtTG1F9wGfOEc0Dk1VMZscjnLagdzkANlQ4=;
 b=OmpVnhuQplLY8Ps+FwnKSuJg80IkB+Lu0Ux41bocNBozXIhFQbmJzh0Z/dkbvE/SEW
 H3VGdnmvb/hTnbOfZAHoloaLVkDVvK99mpzQ+BRvNTWItRfxADo4ETSuBGxOeTaWxf2W
 h97V0FHcVqwOpUEoMOygv6yDOfPFj82ry47hOWDU8IWsjxYUDZhU4Wtw4RjYa6U2bPcy
 cVDzjdTBP4M0jDVJSetzE6RyQf8rhJbfXaIZ8AyjgcHLUyVAIUp5jS8W6O3wslAzc8Wm
 RRX+4bMWcQQuZ4wmuYi4z1kE1sxGR9Pek0dsJbgxdt8WpmYIHYt7tChTBrTJ/6CQNy5n
 K1pQ==
X-Gm-Message-State: APjAAAWWs1NooZsCI+6wjw0aPPwRZsDSE3ELJoyxoKWvAYRuQy1BH3Ji
 3yOryKAYLwhbHyWOyGM6MbM=
X-Google-Smtp-Source: APXvYqyUXjsRAd5bewdDGkceJIo2vtV19a4VCmE8yGuxHY0WGu2WNg/FtXqclOKryn8aOmIqfO48Ww==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr2382966wmy.118.1569495200278; 
 Thu, 26 Sep 2019 03:53:20 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
 by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 03:53:19 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] DRM/MSM: Add support for MSM8956 and Adreno 510
Date: Thu, 26 Sep 2019 12:52:51 +0200
Message-Id: <20190926105256.61412-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=edVq6toJYtTG1F9wGfOEc0Dk1VMZscjnLagdzkANlQ4=;
 b=PIu6pqs6DvVRWOC7lo0X0ctSHAZ30u/lCM4IA4tEeiLfx6xBsO7ZyZjDEYuzb1tsrO
 arkdPbRVfrBozBRs2QGpPLvxgHYUR1CegZeE2fqc2I5a1kZbNQy92VurQGKbS2GmlwGt
 /ixqttbBlYEb++l+mWbMeCa7JJCGKqW9R6CzSRjKrr1bRj4Syn5SPb8f7dra2FWkOl/f
 ci6HBoJ9NG8u5xq7hh+KNFty5x/TZ+V9H3+zHBCTma1KO5JYj73ukl5Y/L343zL1+uWo
 e5iBSxP7jKD/ugK3V/gYB0VtASWSU7pMBOLDdj7YHq6UqyC+Xc8ER/9rTA+78o+YDrz/
 DX/w==
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
b25zIG5vdCBwZXItbW9kZWwgKFJvYikKCkFuZ2VsbyBHLiBEZWwgUmVnbm8gKDUpOgogIGRybS9t
c20vbWRwNTogQWRkIG9wdGlvbmFsIFRCVSBhbmQgVEJVX1JUIGNsb2NrcwogIGRybS9tc20vbWRw
NTogQWRkIGNvbmZpZ3VyYXRpb24gZm9yIG1zbTh4NTYKICBkcm0vbXNtL2RzaTogQWRkIGNvbmZp
Z3VyYXRpb24gZm9yIDI4bm0gUExMIG9uIGZhbWlseSBCCiAgZHJtL21zbS9kc2k6IEFkZCBjb25m
aWd1cmF0aW9uIGZvciA4eDU2CiAgZHJtL21zbS9hZHJlbm86IEFkZCBzdXBwb3J0IGZvciBBZHJl
bm8gNTEwIEdQVQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2RzaS50eHQg
ICB8ICAxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL21kcDUudHh0ICB8
ICAyICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgICAgICAgICB8IDcz
ICsrKysrKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3Bvd2VyLmMg
ICAgICAgfCAgNyArKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2RldmljZS5j
ICAgIHwgMTUgKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmggICAg
ICAgfCAgNSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NmZy5jICAgICAg
fCA5OSArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X2ttcy5jICAgICAgfCAxMCArKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuaCAgICAgIHwgIDIgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jICAg
ICAgICAgICAgIHwgMjIgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuaCAg
ICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMg
ICAgICAgICB8ICAyICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmggICAg
ICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzI4bm0uYyAg
ICB8IDE4ICsrKysKIDE0IGZpbGVzIGNoYW5nZWQsIDI0NCBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
