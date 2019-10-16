Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4DDCE1B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208C6EB8D;
	Fri, 18 Oct 2019 18:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C1B6E91D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:14:05 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 6B9CB60716; Wed, 16 Oct 2019 10:14:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kgunda@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C8A78601D4;
 Wed, 16 Oct 2019 10:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8A78601D4
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V7 0/6] backlight: qcom-wled: Support for QCOM wled driver
Date: Wed, 16 Oct 2019 15:43:40 +0530
Message-Id: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571220845;
 bh=XJgNG9009diU9oqaJQDCi/V2yYlvtSwWohQ7wEW/wos=;
 h=From:To:Cc:Subject:Date:From;
 b=HYbTuT6/0+LaYGv704o1rsL1nKJPYQETS5poTVDj7m1DAbQuz1ASZTIZiqd/mZj3J
 Ad4Wa2kCyj6MIN11gX+xBR6TsS3+qaehiWcuICCdqGBlVaY74GNtI1aB1YFgjXQg1p
 Fgrl0wGDqXS49rbWwgCoqNto4a8psbry40kDNjV0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571220844;
 bh=XJgNG9009diU9oqaJQDCi/V2yYlvtSwWohQ7wEW/wos=;
 h=From:To:Cc:Subject:Date:From;
 b=fo4cTaF8PfH7j5yLfcxSIWTUyg2oE2u+B1JOfkDObzK6U46gmeohl+J5Fd80hF+uq
 b8+jXQEQ/VY0EQ6FaIHAMbKeYafLAsd3D1Ja0GPP73CN3lHhJClSs5p+SkqRcStm9o
 H6m8774NPSEyYIhxNicvHj/fcaAtvapcEmbOqvKU=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=kgunda@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgcmVuYW1lcyB0aGUgcG04OTQxLXdsZWQuYyBkcml2ZXIgdG8gcWNv
bS13bGVkLmMgdG8gYWRkCnRoZSBzdXBwb3J0IGZvciBtdWx0aXBsZSBQTUlDcyBzdXBwb3J0ZWQg
YnkgcXVhbGNvbW0uIFRoaXMgcGF0Y2ggc2VyaWVzCnN1cHBvcnRzIGJvdGggUE04OTQxIGFuZCBQ
TUk4OTk4IFdMRUQuIFRoZSBQTUk4OTk4IFdMRUQgaGFzIHRoZSBzdXBwb3J0CnRvIGhhbmRsZSB0
aGUgT1ZQIChvdmVyIHZvbHRhZ2UgcHJvdGVjdGlvbikgYW5kIHRoZSBTQyAoc2hvcnQgY2lyY3Vp
dApwcm90ZWN0aW9uKQppbnRlcnJ1cHRzLiBJdCBhbHNvIGhhcyB0aGUgYXV0byBzdHJpbmcgZGV0
ZWN0aW9uIGFsZ29yaXRobSBzdXBwb3J0IHRvCmNvbmZpZ3VyZSB0aGUgcmlnaHQgc3RyaW5ncyBp
ZiB0aGUgdXNlciBzcGVjaWZpZWQgc3RyaW5nIGNvbmZpZ3VyYXRpb24KaXMgaW4tY29ycmVjdC4g
VGhlc2UgdGhyZWUgZmVhdHVyZXMgYXJlIGFkZGVkIGluIHRoaXMgc2VyaWVzIGZvciBQTUk4OTk4
LgoKY2hhbmdlcyBmcm9tIHYxOgogICAtIEZpeGVkIHRoZSBjb21taXQgbWVzc2FnZSBmb3IKICAg
LSBiYWNrbGlnaHQ6IHFjb20td2xlZDogUmVuYW1lIHBtODk0MS13bGVkLmMgdG8gcWNvbS13bGVk
LmMKCkNoYW5nZXMgZnJvbSB2MjoKICAgLSBGaXhlZCBiam9ybiBhbmQgb3RoZXIgcmV2aWV3ZXIn
cyBjb21tZW50cwogICAtIFNlcGVyYXRlZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MKICAgLSBT
cGxpdHRlZCBvdXQgdGhlIFdMRUQ0IGNoYW5nZXMgaW4gc2VwZXJhdGUgcGF0Y2gKICAgLSBNZXJn
ZWQgT1ZQIGFuZCBhdXRvIHN0cmluZyBkZXRlY3Rpb24gcGF0Y2gKCkNoYW5nZXMgZnJvbSB2MzoK
ICAtIEFkZGVkIFJldmlld2VkLWJ5L0Fja2VkLWJ5IHRhZ3MKICAtIEZpeGVkIGNvbW1lbnRzIGZy
b20gQmpvcm4vVmlub2QvUm9iCiAgLSBTcGxpdHRpbmcgdGhlICJiYWNrbGlnaHQ6IHFjb20td2xl
ZDogQWRkIHN1cHBvcnQgZm9yIFdMRUQ0IHBlcmlwaGVyYWwiIHBhdGNoCiAgICB0byBzZXBlcmF0
ZSB0aGUgV0xFRDMgc3BlY2lmaWMgcmVzdHJ1Y3R1cmUuCgpDaGFuZ2VzIGZyb20gdjQ6CiAgLSBB
ZGRlZCByZXZpZXdlZC1ieS9BY2tlZC1ieSB0YWdzCiAgLSBGaXhlZCBjb21tZW50cyBmcm9tIEJq
b3JuL0RhbmllbC9QYXZlbAoKQ2hhbmdlcyBmcm9tIHY1OgogIC0gRml4ZWQgY29tbWVudHMgZnJv
bSBCam9ybi9QYXZlbAoKQ2hhbmdlcyBmcm9tIHY1L3Y2OgogIC0gRml4ZWQgY29tbWVudHMgZnJv
bSBCam9ybi9QYXZlbCBvbiBWNSBzZXJpZXMsIHdoaWNoIHdlcmUgbWlzc2VkIGluIFY2IHNlcmll
cwogIC0gUGF0Y2ggMSBhbmQgMiwgbWVudGlvbmVkIGJlbG93LCBmcm9tIFY2IHNlcmllcyBhcmUg
cGlja2VkIGJ5IFBhdmVsIEluIG5leHQuCiAgICBIZW5jZSwgZHJvcHBlZCB0aGVtIGluIHRoaXMg
c2VyaWVzLgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzExMzI0
NjcvCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTEzMjQ2OC8K
CktpcmFuIEd1bmRhICg2KToKICBiYWNrbGlnaHQ6IHFjb20td2xlZDogQWRkIG5ldyBwcm9wZXJ0
aWVzIGZvciBQTUk4OTk4CiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6IFJlbmFtZSBQTTg5NDEqIHRv
IFdMRUQzLgogIGJhY2tsaWdodDogcWNvbS13bGVkOiBSZXN0cnVjdHVyZSB0aGUgZHJpdmVyIGZv
ciBXTEVEMwogIGJhY2tsaWdodDogcWNvbS13bGVkOiBBZGQgc3VwcG9ydCBmb3IgV0xFRDQgcGVy
aXBoZXJhbC4KICBiYWNrbGlnaHQ6IHFjb20td2xlZDogYWRkIHN1cHBvcnQgZm9yIHNob3J0IGNp
cmN1aXQgaGFuZGxpbmcuCiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6IEFkZCBhdXRvIHN0cmluZyBk
ZXRlY3Rpb24gbG9naWMKCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcWNvbS13bGVkLnR4
dCAgICAgICAgICB8ICAgNzQgKy0KIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5j
ICAgICAgICAgICAgICAgIHwgMTI1NiArKysrKysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAxMTI2IGluc2VydGlvbnMoKyksIDIwNCBkZWxldGlvbnMoLSkKCi0tIApUaGUgUXVhbGNv
bW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3Jh
IEZvcnVtLAogYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
