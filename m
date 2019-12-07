Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A64115E8D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 21:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A726E231;
	Sat,  7 Dec 2019 20:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CA96E231
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 20:36:12 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ca19so4170894pjb.8
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 12:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z3/AYVovlJiJ1Alu6bE6pYRPal+N6Ynq1x5wnV6ZnAY=;
 b=LjT9yEaVlPP71AE+pR7jVg668jYJsVGmjDeMxJfRh3kbTiThSykGj3Qf3A4H3JxDkD
 lU+Zr/0XvfRYeh0ueneIAZuU65uZiPC5Q4N2IEcKgfnyjQf12piqEHhuLbjz3Rkawb57
 H+MV9S8xHJ+1MJoYNg14C3GPoJ7CnWkUX++Nwny888XWB9rNGZZ9K6W37ATrijtOFgun
 LTZZ5zggHMIBV2k9ltWy6uaFZwKvz+NegYSd8afawyBiXUgOOvFbtpLtgvepbDsTtng6
 IQpZQnoNjPyMm75GEU16bPhHqEFjVciYTTZo2cYC8hiiRB+ZQfPd2rdpKeZPTgoQdTIv
 RbVw==
X-Gm-Message-State: APjAAAVvTjdsG63O2ywnVzSux7GGOnU8OIquaDE7hQCkMKOY9/o8G0+Y
 kdJYZ0h3nladyvEprXOImLZgKEvx
X-Google-Smtp-Source: APXvYqy0w+EuWHFKr8S5+G6Ihehi1cLJ75cYyMki2L3dxv/6qi53ML5wX8lcDeRM081R2NGlCpOONA==
X-Received: by 2002:a17:90a:fb87:: with SMTP id
 cp7mr23509768pjb.56.1575750972199; 
 Sat, 07 Dec 2019 12:36:12 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l1sm1884223pgs.47.2019.12.07.12.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 12:36:11 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 aarch64-laptops@lists.linaro.org
Subject: [PATCH 1/4] dt-bindings: display: panel: document panel-id
Date: Sat,  7 Dec 2019 12:35:50 -0800
Message-Id: <20191207203553.286017-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z3/AYVovlJiJ1Alu6bE6pYRPal+N6Ynq1x5wnV6ZnAY=;
 b=AI3kKMlUpDOEK8jI30xnwDi6FbaN9R3AEX+zDWP825P8L4WIE6lqRibsGBNH990x6S
 2W1aLv0wOqFpSB31f8F7l1zxV56Did5ya2GMvZJ/7kw5cHAiEfhR2Tp53PQ3sBAT6oDh
 JqVOaJt1II8tJNn5yAwswhTIVOU091UFAbTFFtsaWx9yef9ywpJEWEh8wHlNvkGl5Dz6
 AyO6kHoUAsNIa12cbiDJO2VwLMlvuw05GwqlR+nBzBPNHq75Pfni4Kia7/5Ei0HVRpRP
 xZ2t/i0AwZn6D+xVSpxrbG6oah5ngpYwQTzPZiNkuXxk2AlDapRg4dVo5mUFeoHH5c8p
 FtEA==
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRm9yIGRldmljZXMgdGhh
dCBoYXZlIG9uZSBvZiBzZXZlcmFsIHBvc3NpYmxlIHBhbmVscyBpbnN0YWxsZWQsIHRoZQpwYW5l
bC1pZCBwcm9wZXJ0eSBnaXZlcyBmaXJtd2FyZSBhIGdlbmVyaWMgd2F5IHRvIGxvY2F0ZSBhbmQg
ZW5hYmxlIHRoZQpwYW5lbCBub2RlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGluc3RhbGxlZCBwYW5l
bC4gIEV4YW1wbGUgb2YgaG93IHRvIHVzZQp0aGlzIHByb3BlcnR5OgoKICAgIGl2b19wYW5lbCB7
CiAgICAgICAgY29tcGF0aWJsZSA9ICJpdm8sbTEzM253ZjQtcjAiOwogICAgICAgIHBhbmVsLWlk
ID0gPDB4YzU+OwogICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7CgogICAgICAgIHBvcnRzIHsK
ICAgICAgICAgICAgcG9ydCB7CiAgICAgICAgICAgICAgICBpdm9fcGFuZWxfaW5fZWRwOiBlbmRw
b2ludCB7CiAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzbjY1ZHNpODZf
b3V0X2l2bz47CiAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICB9OwogICAgICAgIH07CiAg
ICB9OwoKICAgIGJvZV9wYW5lbCB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJib2UsbnYxMzNmaG0t
bjYxIjsKICAgICAgICBwYW5lbC1pZCA9IDwweGM0PjsKICAgICAgICBzdGF0dXMgPSAiZGlzYWJs
ZWQiOwoKICAgICAgICBwb3J0cyB7CiAgICAgICAgICAgIHBvcnQgewogICAgICAgICAgICAgICAg
Ym9lX3BhbmVsX2luX2VkcDogZW5kcG9pbnQgewogICAgICAgICAgICAgICAgICAgIHJlbW90ZS1l
bmRwb2ludCA9IDwmc242NWRzaTg2X291dF9ib2U+OwogICAgICAgICAgICAgICAgfTsKICAgICAg
ICAgICAgfTsKICAgICAgICB9OwogICAgfTsKCiAgICBzbjY1ZHNpODY6IGJyaWRnZUAyYyB7CiAg
ICAgICAgY29tcGF0aWJsZSA9ICJ0aSxzbjY1ZHNpODYiOwoKICAgICAgICBwb3J0cyB7CiAgICAg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OwogICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsKCiAgICAgICAgICAgIHBvcnRAMCB7CiAgICAgICAgICAgICAgICByZWcgPSA8MD47CiAgICAg
ICAgICAgICAgICBzbjY1ZHNpODZfaW5fYTogZW5kcG9pbnQgewogICAgICAgICAgICAgICAgICAg
IHJlbW90ZS1lbmRwb2ludCA9IDwmZHNpMF9vdXQ+OwogICAgICAgICAgICAgICAgfTsKICAgICAg
ICAgICAgfTsKCiAgICAgICAgICAgIHBvcnRAMSB7CiAgICAgICAgICAgICAgICByZWcgPSA8MT47
CgogICAgICAgICAgICAgICAgc242NWRzaTg2X291dF9ib2U6IGVuZHBvaW50QGM0IHsKICAgICAg
ICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmJvZV9wYW5lbF9pbl9lZHA+OwogICAg
ICAgICAgICAgICAgfTsKCiAgICAgICAgICAgICAgICBzbjY1ZHNpODZfb3V0X2l2bzogZW5kcG9p
bnRAYzUgewogICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaXZvX3BhbmVs
X2luX2VkcD47CiAgICAgICAgICAgICAgICB9OwogICAgICAgICAgICB9OwogICAgICAgIH07CiAg
ICB9OwoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgot
LS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNvbW1vbi55YW1sICB8IDI2ICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
cGFuZWwtY29tbW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9wYW5lbC1jb21tb24ueWFtbAppbmRleCBlZjhkOGNkZmNlZGUuLjYxMTMzMTli
OTFkZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtY29tbW9uLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtY29tbW9uLnlhbWwKQEAgLTc1LDYgKzc1LDMy
IEBAIHByb3BlcnRpZXM6CiAgICAgICBpbiB0aGUgZGV2aWNlIGdyYXBoIGJpbmRpbmdzIGRlZmlu
ZWQgaW4KICAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQu
CiAKKyAgcGFuZWwtaWQ6CisgICAgZGVzY3JpcHRpb246CisgICAgICBUbyBzdXBwb3J0IHRoZSBj
YXNlIHdoZXJlIG9uZSBvZiBzZXZlcmFsIGRpZmZlcmVudCBwYW5lbHMgY2FuIGJlIGluc3RhbGxl
ZAorICAgICAgb24gYSBkZXZpY2UsIHRoZSBwYW5lbC1pZCBwcm9wZXJ0eSBjYW4gYmUgdXNlZCBi
eSB0aGUgZmlybXdhcmUgdG8gaWRlbnRpZnkKKyAgICAgIHdoaWNoIHBhbmVsIHNob3VsZCBoYXZl
IGl0J3Mgc3RhdHVzIGNoYW5nZWQgdG8gIm9rIi4gIFRoaXMgcHJvcGVydHkgaXMgbm90CisgICAg
ICB1c2VkIGJ5IHRoZSBITE9TIGl0c2VsZi4KKworICAgICAgRm9yIGEgZGV2aWNlIHdpdGggbXVs
dGlwbGUgcG90ZW50aWFsIHBhbmVscywgYSBub2RlIGZvciBlYWNoIHBvdGVudGlhbAorICAgICAg
c2hvdWxkIGJlIGRlZmluZWQgd2l0aCBzdGF0dXMgPSAiZGlzYWJsZWQiLCBhbmQgYW4gYXBwcm9w
cmlhdGUgcGFuZWwtaWQKKyAgICAgIHByb3BlcnR5LiAgVGhlIHZpZGVvIGRhdGEgcHJvZHVjZXIg
c2hvdWxkIGJlIHNldHVwIHdpdGggZW5kcG9pbnRzIGdvaW5nIHRvCisgICAgICBlYWNoIHBvc3Np
YmxlIHBhbmVsLiAgVGhlIGZpcm13YXJlIHdpbGwgZmluZCB0aGUgZHQgbm9kZSB3aXRoIGEgcGFu
ZWwtaWQKKyAgICAgIG1hdGNoaW5nIHRoZSBhY3R1YWwgcGFuZWwgaW5zdGFsbGVkLCBhbmQgY2hh
bmdlIGl0J3Mgc3RhdHVzIHRvICJvayIuCisKKyAgICAgIFRoZSBleGFjdCBtZXRob2QgdGhlIGZp
cm13YXJlIHVzZXMgdG8gZGV0ZXJtaW5lIHRoZSBwYW5lbC1pZCBvZiB0aGUgaW5zdGFsbGVkCisg
ICAgICBwYW5lbCBpcyBvdXRzaWRlIHRoZSBzY29wZSBvZiB0aGlzIGJpbmRpbmcsIGJ1dCBhIGZl
dyBleGFtcGxlcyBhcmUKKworICAgICAgMSkgdS1ib290IG1vZHVsZSByZWFkaW5nIGEgdmFsdWUg
ZnJvbSBhIHUtYm9vdCBlbnYgdmFyCisgICAgICAyKSBFRkkgZHJpdmVyIG1vZHVsZSByZWFkaW5n
IGEgdmFsdWUgZnJvbSBhbiBFRkkgdmFyaWFibGUKKyAgICAgIDMpIGRldmljZSBzcGVjaWZpYyBm
aXJtd2FyZSByZWFkaW5nIHNvbWUgZGV2aWNlIHNwZWNpZmljIEdQSU9zIG9yCisgICAgICAgICBl
LWZ1c2UKKworICAgICAgVGhlIHBhbmVsLWlkIHZhbHVlcyBhcmUgYW4gb3BhcXVlIGludGVnZXIu
ICBUaGV5IGNhbiBiZSBzcGFyc2UuICBUaGUgb25seQorICAgICAgaW1wb3J0YW50IHRoaW5nIGlz
IHRoYXQgZWFjaCBwb3NzaWJsZSBwYW5lbCBpbiB0aGUgc3lzdGVtIGhhcyBhIHVuaXF1ZQorICAg
ICAgcGFuZWwtaWQsIGFuZCB0aGF0IHRoZSB2YWx1ZXMgY29uZmlndXJlZCBpbiB0aGUgZGV2aWNl
J3MgRFRCIG1hdGNoIHRoZQorICAgICAgdmFsdWVzIHRoYXQgdGhlIGZpcm13YXJlIGlzIGxvb2tp
bmcgZm9yLgorCiAgIGRkYy1pMmMtYnVzOgogICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3BoYW5kbGUKICAgICBkZXNjcmlwdGlvbjoKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
