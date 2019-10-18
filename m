Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43947DCE37
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1C96EBAA;
	Fri, 18 Oct 2019 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0989B96
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 12:33:52 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id EDD6461152; Fri, 18 Oct 2019 12:33:51 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6114260A64;
 Fri, 18 Oct 2019 12:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6114260A64
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V8 0/6] backlight: qcom-wled: Support for QCOM wled driver
Date: Fri, 18 Oct 2019 18:03:23 +0530
Message-Id: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571402032;
 bh=3tRVjrnzdm7RkUk3GKY47Ahx002G46T/pICBBH7NvWA=;
 h=From:To:Cc:Subject:Date:From;
 b=bdOtdWTouw5SBPDFtI/v5pMul4N+o5QnDcAifGHh+sKEnhvDOGXcUkmItXbSukTV9
 ZTduSmaHNG19o+DRrwjcXGdydDrkCXCHerh+P/33AeT+deqeT9gmMWPjlQD2p5aYY9
 jA2n+wNgc94rkkK2+8fCYP4kXDQ/0R1xaChDDsoM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571402030;
 bh=3tRVjrnzdm7RkUk3GKY47Ahx002G46T/pICBBH7NvWA=;
 h=From:To:Cc:Subject:Date:From;
 b=aZLlw7UlL4APffRlCQHbZt7Pz9Ox0LA5cc0jOFTDFCoExZsQKnfk3oYrOxhQSTqNZ
 4WKVoclFZE0Jvog5DIr0s6oWvA5/0Ve0ooWplFkcV6ImRnK6duhWvvK8N+JfPG84bW
 xy3sojx7QJaOL0AHSq72XZdtUDkmSqIY16ujIFww=
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
dGNoLzExMzI0NjgvCgpLaXJhbiBHdW5kYSAoNik6CiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6IEFk
ZCBuZXcgcHJvcGVydGllcyBmb3IgUE1JODk5OC4KICBiYWNrbGlnaHQ6IHFjb20td2xlZDogUmVu
YW1lIFBNODk0MSogdG8gV0xFRDMKICBiYWNrbGlnaHQ6IHFjb20td2xlZDogUmVzdHJ1Y3R1cmUg
dGhlIGRyaXZlciBmb3IgV0xFRDMuCiAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6IEFkZCBzdXBwb3J0
IGZvciBXTEVENCBwZXJpcGhlcmFsLgogIGJhY2tsaWdodDogcWNvbS13bGVkOiBhZGQgc3VwcG9y
dCBmb3Igc2hvcnQgY2lyY3VpdCBoYW5kbGluZy4KICBiYWNrbGlnaHQ6IHFjb20td2xlZDogQWRk
IGF1dG8gc3RyaW5nIGRldGVjdGlvbiBsb2dpYwoKIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9xY29tLXdsZWQudHh0ICAgICAgICAgIHwgICA3NCArLQogZHJpdmVycy92aWRlby9iYWNrbGln
aHQvcWNvbS13bGVkLmMgICAgICAgICAgICAgICAgfCAxMjU0ICsrKysrKysrKysrKysrKysrLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDExMjUgaW5zZXJ0aW9ucygrKSwgMjAzIGRlbGV0aW9ucygtKQoK
LS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0
aGUgQ29kZSBBdXJvcmEgRm9ydW0sCiBhIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQ
cm9qZWN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
