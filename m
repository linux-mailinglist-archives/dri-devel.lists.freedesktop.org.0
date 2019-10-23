Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6CE13CB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2526E9BA;
	Wed, 23 Oct 2019 08:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7E16E96B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 07:07:27 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 96EE860A1B; Wed, 23 Oct 2019 07:07:27 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 042D460271;
 Wed, 23 Oct 2019 07:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 042D460271
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V9 0/6] backlight: qcom-wled: Support for QCOM wled driver
Date: Wed, 23 Oct 2019 12:36:57 +0530
Message-Id: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571814447;
 bh=RsVQJG+BbPE2D4TxTttitoOCBgg8yT6xV6o3eaZ5zec=;
 h=From:To:Cc:Subject:Date:From;
 b=JhUGHzWXleowBbsDyarOPEj7Zk6htV7vgJL1gefsAPZZuoTU94Br3bGXVutmtKFXM
 OtyQ9cMZsu/ucB+2A/VVUQThqYlBTGCaRjuP27UY6FKLbtLpoH9fUJll4qjuHq3saY
 glDqzJ1ZDoUb4zlxhXDBMqYyQKqQg+uu1+qafEEY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571814446;
 bh=RsVQJG+BbPE2D4TxTttitoOCBgg8yT6xV6o3eaZ5zec=;
 h=From:To:Cc:Subject:Date:From;
 b=AX/XvyaQ4sCeQb3tCmLBAYYXljanSHma00n7UqzT/Uhi2dsFWXIyv5HpAdq2bflnH
 tCUhMqIoQPZYP4aEQY7eKXdK4vVokhWJ7vqdJzFtylX1V4xviYt+6OEXYb+rEH2y0Q
 wKUqwzcyjgCx1Sd7+NDxyvee5/w2W3HEOmIJjQTk=
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
CkNoYW5nZXMgZnJvbSB2NzoKICAtIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIERhbmllbCBUaG9t
cHNvbi9MZWUgSm9uZXMKICAtIFBhdGNoIDEgYW5kIDIsIG1lbnRpb25lZCBiZWxvdywgZnJvbSBW
NiBzZXJpZXMgYXJlIHBpY2tlZCBieSBQYXZlbCBJbiBuZXh0LgogICAgSGVuY2UsIGRyb3BwZWQg
dGhlbSBpbiB0aGlzIHNlcmllcy4KICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29y
ay9wYXRjaC8xMTMyNDY3LwogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3Bh
dGNoLzExMzI0NjgvCgpDaGFuZ2VzIGZyb20gdjg6CiAtIEFkZHJlc3NlZCBhIGNvbW1lbnQgZnJv
bSBEYW5pZWwgVGhvbXBzb24gb24gcGF0Y2ggNgogLSBBZGRlZCBSZXZpZXdlZC1ieSB0YWcgb2Yg
RGFuaWVsIFRob21wc29uIG9uIHBhdGNoIDQKIC0gUGF0Y2ggMSBhbmQgMiwgbWVudGlvbmVkIGJl
bG93LCBmcm9tIFY2IHNlcmllcyBhcmUgcGlja2VkIGJ5IFBhdmVsIEluIG5leHQuCiAgICBIZW5j
ZSwgZHJvcHBlZCB0aGVtIGluIHRoaXMgc2VyaWVzLgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3BhdGNoLzExMzI0NjcvCiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9w
YXRjaHdvcmsvcGF0Y2gvMTEzMjQ2OC8KCktpcmFuIEd1bmRhICg2KToKICBiYWNrbGlnaHQ6IHFj
b20td2xlZDogQWRkIG5ldyBwcm9wZXJ0aWVzIGZvciBQTUk4OTk4LgogIGJhY2tsaWdodDogcWNv
bS13bGVkOiBSZW5hbWUgUE04OTQxKiB0byBXTEVEMwogIGJhY2tsaWdodDogcWNvbS13bGVkOiBS
ZXN0cnVjdHVyZSB0aGUgZHJpdmVyIGZvciBXTEVEMy4KICBiYWNrbGlnaHQ6IHFjb20td2xlZDog
QWRkIHN1cHBvcnQgZm9yIFdMRUQ0IHBlcmlwaGVyYWwuCiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6
IGFkZCBzdXBwb3J0IGZvciBzaG9ydCBjaXJjdWl0IGhhbmRsaW5nLgogIGJhY2tsaWdodDogcWNv
bS13bGVkOiBBZGQgYXV0byBzdHJpbmcgZGV0ZWN0aW9uIGxvZ2ljCgogLi4uL2JpbmRpbmdzL2xl
ZHMvYmFja2xpZ2h0L3Fjb20td2xlZC50eHQgICAgICAgICAgfCAgIDc0ICstCiBkcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYyAgICAgICAgICAgICAgICB8IDEyNTYgKysrKysrKysr
KysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEyNyBpbnNlcnRpb25zKCspLCAyMDMgZGVs
ZXRpb25zKC0pCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEg
bWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKIGEgTGludXggRm91bmRhdGlvbiBDb2xs
YWJvcmF0aXZlIFByb2plY3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
