Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40806115E8C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 21:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3246E22F;
	Sat,  7 Dec 2019 20:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7126E22F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 20:36:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y206so5162309pfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 12:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kMIJY/eOkF08UFC83+z2Yvw2OEsP0PRB4nAXO2fCAU=;
 b=QP4Uf7tg6njwWIAWnmxlsVo9PqT0EGkey/DEpQmrUN110ev6sdAvRhqLD4iFSQ1p+T
 /Z4PcQRbtYbzZtp4FR2ko1BKb2uAJvox/lCJplx4D5cAY0I9XxhrPrU9fozWZ9NOs6fI
 LBOiSXnjQpTTFA7+VPvDOYT7eEETKxQhgYqUWpB71sTyr2eCGoNQtiZjsFSbMe9ZuSsX
 doJfC4sIl6aEGoof5oJQH47+SCZlnTBeyIIOOf+VuVTsqh6W5OLSe+01eDvQ12CwYFeo
 5Vy/mMKnFw1CXTgxd/eo2EO8GAfKlQgy9hdnabBwrDMmtfwL8V0O7inSwg6PXHT//tiv
 E6ww==
X-Gm-Message-State: APjAAAWyxVNTE7vfTRnLBVJ/ufhlK+UxCpfSoW3hK/SPzbaUX+ehCGPy
 Uyf05K5HqxPgFaZVhfdN7+sCGWpM
X-Google-Smtp-Source: APXvYqyHsn0JRBAztc8gkWedID4H+F1dMmOijtBZeWWN976EbUglK6Cd/j6zKuX60a2hGwZ5Nhn3NA==
X-Received: by 2002:a63:d958:: with SMTP id e24mr10614053pgj.31.1575750969811; 
 Sat, 07 Dec 2019 12:36:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d24sm22327447pfq.75.2019.12.07.12.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 12:36:09 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
Subject: [PATCH 0/4] drm+dt: multi panel selection and yoga c630 display
Date: Sat,  7 Dec 2019 12:35:49 -0800
Message-Id: <20191207203553.286017-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kMIJY/eOkF08UFC83+z2Yvw2OEsP0PRB4nAXO2fCAU=;
 b=L1ah2JgjYkVbYTJrHXreZ/M03kKDjwenY8BAjQ9xJEx0gbKashe1+23y3HRp0Xx+WC
 Ou2IQzV+8QXgBlKXvhkEtaCLdSQlIFo+qkXefce0BZdNG5kYKpv3JpAoWpMuy2Lnzwu1
 C5J6apBOhbPYAqsgiW5bhXn3gix9FaHZ83rezWyEV1Za4Jt7ulew6i1DNB5bkjQK02oY
 AzRWp4LLJR/ml+NOxujgBGeSnJuNQbye7c2/YNqS7a8ZU6zfZYHpcI7skbX6dyLODERj
 T4J7zxloGX09YN0DMYOZYbEmtWXI+va/wJdXFZd3GaR71EWPoJJv2wwzxMOu77Q2F70I
 7G8g==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Jeffrey Hugo <jhugo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSXQgaXMgbm90IHVuY29t
bW9uIGZvciBkZXZpY2VzIHRvIHVzZSBvbmUgb2Ygc2V2ZXJhbCBwb3NzaWJsZSBwYW5lbHMuClRo
ZSBMZW5vdm8gWW9nYSBDNjMwIGxhcHRvcCBpcyBvbmUgc3VjaCBkZXZpY2UuICBUaGlzIHBhdGNo
c2V0CmludHJvZHVjZXMgYW4gb3B0aW9uYWwgInBhbmVsLWlkIiBwcm9wZXJ0eSB3aGljaCBjYW4g
YmUgdXNlZCBieSB0aGUKZmlybXdhcmUgdG8gZmluZCB0aGUgY29ycmVjdCBwYW5lbCBub2RlIHRv
IGVuYWJsZS4gIFRoZSBzZWNvbmQgcGF0Y2gKYWRkcyBzdXBwb3J0IGluIGRybS9vZiB0byBhdXRv
bWF0aWNhbGx5IHBpY2sgdGhlIGVuYWJsZWQgZW5kcG9pbnQsIHRvCmF2b2lkIGFkZGluZyB0aGUg
c2FtZSBsb2dpYyBpbiBtdWx0aXBsZSBicmlkZ2VzL2RyaXZlcnMuICBUaGUgbGFzdApwYXRjaCB1
c2VzIHRoaXMgbWVjaGFuaXNtIHRvIGVuYWJsZSBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBZb2dh
IEM2MzAuCgpBbiBleGFtcGxlIHVzYWdlOgoKICBib2VfcGFuZWwgewogICAgICBjb21wYXRpYmxl
ID0gImJvZSxudjEzM2ZobS1uNjEiOwogICAgICBwYW5lbC1pZCA9IDwweGM0PjsKICAgICAgLyog
Zncgd2lsbCBjaGFuZ2Ugc3RhdHVzIHRvICJPayIgaWYgdGhpcyBwYW5lbCBpcyBpbnN0YWxsZWQg
Ki8KICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKCiAgICAgIHBvcnRzIHsKICAgICAgICAgIHBv
cnQgewogICAgICAgICAgICAgIGJvZV9wYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKICAgICAgICAg
ICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZfb3V0X2JvZT47CiAgICAgICAg
ICAgICAgfTsKICAgICAgICAgIH07CiAgICAgIH07CiAgfTsKCiAgaXZvX3BhbmVsIHsKICAgICAg
Y29tcGF0aWJsZSA9ICJpdm8sbTEzM253ZjQtcjAiOwogICAgICBwYW5lbC1pZCA9IDwweGM1PjsK
ICAgICAgLyogZncgd2lsbCBjaGFuZ2Ugc3RhdHVzIHRvICJPayIgaWYgdGhpcyBwYW5lbCBpcyBp
bnN0YWxsZWQgKi8KICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKCiAgICAgIHBvcnRzIHsKICAg
ICAgICAgIHBvcnQgewogICAgICAgICAgICAgIGl2b19wYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsK
ICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZfb3V0X2l2bz47
CiAgICAgICAgICAgICAgfTsKICAgICAgICAgIH07CiAgICAgIH07CiAgfTsKCiAgc242NWRzaTg2
OiBicmlkZ2VAMmMgewogICAgICBjb21wYXRpYmxlID0gInRpLHNuNjVkc2k4NiI7CgogICAgICBw
b3J0cyB7CiAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgICNzaXplLWNl
bGxzID0gPDA+OwoKICAgICAgICAgIHBvcnRAMCB7CiAgICAgICAgICAgICAgcmVnID0gPDA+Owog
ICAgICAgICAgICAgIHNuNjVkc2k4Nl9pbl9hOiBlbmRwb2ludCB7CiAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmZHNpMF9vdXQ+OwogICAgICAgICAgICAgIH07CiAgICAgICAg
ICB9OwoKICAgICAgICAgIHBvcnRAMSB7CiAgICAgICAgICAgICAgcmVnID0gPDE+OwoKICAgICAg
ICAgICAgICBzbjY1ZHNpODZfb3V0X2JvZTogZW5kcG9pbnRAYzQgewogICAgICAgICAgICAgICAg
ICByZW1vdGUtZW5kcG9pbnQgPSA8JmJvZV9wYW5lbF9pbl9lZHA+OwogICAgICAgICAgICAgIH07
CgogICAgICAgICAgICAgIHNuNjVkc2k4Nl9vdXRfaXZvOiBlbmRwb2ludEBjNSB7CiAgICAgICAg
ICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaXZvX3BhbmVsX2luX2VkcD47CiAgICAgICAg
ICAgICAgfTsKICAgICAgICAgIH07CiAgICAgIH07CiAgfTsKClRoaXMgcmVwbGFjZXMgYW4gZWFy
bGllciBwcm9wb3NhbFsxXSB0byB1c2UgY2hvc2VuL3BhbmVsLWlkIHRvIHNlbGVjdCB0aGUKaW5z
dGFsbGVkIHBhbmVsLCBpbiBmYXZvciBvZiBhZGRpbmcgc3VwcG9ydFsyXSB0byBhbiBFRkkgZHJp
dmVyIG1vZHVsZQooRHRiTG9hZGVyLmVmaSkgdG8gZmluZCB0aGUgaW5zdGFsbGVkIHBhbmVsLCBs
b2NhdGUgaXQgaW4gZHRiIHZpYSB0aGUKJ3BhbmVsLWlkJyBwcm9wZXJ0eSwgYW5kIHVwZGF0ZSBp
dCdzIHN0YXR1cyB0byAiT2siLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292
ZXIvMTEwMjQ2MTMvClsyXSBodHRwczovL2dpdGh1Yi5jb20vcm9iY2xhcmsvZWRrMi9jb21taXRz
L2R0YmxvYWRlcgoKSW4gdGhpcyBjYXNlLCBEdGJMb2FkZXIsIHdoaWNoIGlzIHNvbWV3aGF0IGdl
bmVyaWMgKGllLiB0aGlzIG1lY2hhbmlzbQphcHBsaWVzIHRvIGFsbCBzbmFwZHJhZ29uIGJhc2Vk
IGRldmljZXMgd2hpY2ggb3JpZ25hbGx5IHNoaXAgd2l0aAp3aW5kb3dzKSwgZGV0ZXJtaW5lcyB0
aGUgcGFuZWwtaWQgb2YgdGhlIGluc3RhbGxlZCBwYW5lbCBmcm9tIHRoZQpVRUZJRGlzcGxheUlu
Zm8gdmFyaWFibGUuCgpBcyBJIHVuZGVyc3RhbmQsIGEgc2ltaWxhciBzaXR1YXRpb24gZXhpc3Rz
IHdpdGggdGhlIHBpbmU2NCBsYXB0b3BzLiAgQQpzaW1pbGFyIHNjaGVtZSBjb3VsZCBiZSB1c2Vk
IHRvIHN1cHBvcnQgdGhpcywgYnkgbG9hZGluZyB0aGUgcGFuZWwtaWQKZnJvbSBhIHUtYm9vdCB2
YXJpYWJsZS4KCkluIG90aGVyIGNhc2VzIChwaG9uZXMpLCBhIG1vcmUgZGV2aWNlIHNwZWNpZmlj
IHNoaW0gd291bGQgYmUgbmVlZGVkIHRvCmRldGVybWluZSB0aGUgcGFuZWwtaWQgYnkgcmVhZGlu
ZyBzb21lIEdQSU9zLCBvciBzb21lIG90aGVyIG1vcmUgZGV2aWNlLQpzcGVjaWZpYyBtZWNoYW5p
c20uCgpCam9ybiBBbmRlcnNzb24gKDEpOgogIGFybTY0OiBkdHM6IHFjb206IGM2MzA6IEVuYWJs
ZSBkaXNwbGF5CgpSb2IgQ2xhcmsgKDMpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbDog
ZG9jdW1lbnQgcGFuZWwtaWQKICBkcm0vb2Y6IGFkZCBzdXBwb3J0IHRvIGZpbmQgYW55IGVuYWJs
ZWQgZW5kcG9pbnQKICBkcm0vYnJpZGdlOiB0aS1zbjY1ZHNpODY6IGZpbmQgYW55IGVuYWJsZWQg
ZW5kcG9pbnQKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1jb21tb24ueWFtbCAg
fCAgMjYgKysrCiAuLi4vYm9vdC9kdHMvcWNvbS9zZG04NTAtbGVub3ZvLXlvZ2EtYzYzMC5kdHMg
fCAxNjUgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVk
c2k4Ni5jICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICA0MSArKysrLQogNCBmaWxlcyBjaGFuZ2VkLCAyMzIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
