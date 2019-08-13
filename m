Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207A8BA4D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE926E134;
	Tue, 13 Aug 2019 13:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAF96E134
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:33:20 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99E4F327;
 Tue, 13 Aug 2019 15:33:18 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/9] dt-bindings: Add vendor prefix for LG Display
Date: Tue, 13 Aug 2019 16:33:03 +0300
Message-Id: <20190813133311.26441-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813133311.26441-1-laurent.pinchart@ideasonboard.com>
References: <20190813133311.26441-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565703198;
 bh=iVfLiV6yoOzv1vahCYN8FY6MXQxQF7KJYrc08EJWFzw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qzKdHar7XfSf9RfYlPMrzEcQihy77Yth0DEAniv9CueRv6YokhCsn2VnX8Z/V3K0o
 V/RAagqvK1WTd97mmSRs3Gkuq/WTX+Im+t2depcOuo353LRO0fRvtiX+Ac5p8IEn1A
 3Mop+wnoawEWA3vn/PvgfgT9GsqJkNpGEFUJXwqc=
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TEcgRGlzcGxheSBpcyBhbiBMQ0QgZGlzcGxheSBtYW51ZmFjdHVyZXIuIE9yaWdpbmFsbHkgZm9y
bWVkIGFzIGEgam9pbnQKdmVudHVyZSBieSBMRyBFbGVjdHJvbmljcyBhbmQgUGhpbGlwcyBFbGVj
dHJvbmljcywgaXQgd2FzIGZvcm1lcmx5IGtub3duCmFzIExHLlBoaWxpcHMgTENELCBoZW5jZSB0
aGUgRFQgdmVuZG9yIHByZWZpeCBsZ3BoaWxpcHMgKHdoaWNoIGlzCmFscmVhZHkgaW4gYWN0aXZl
IHVzZSBpbiB0aGUga2VybmVsKS4KCk1vcmUgaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlIGF0Cmh0
dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0xHX0Rpc3BsYXkuCgpTaWduZWQtb2ZmLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggNjk5MmJiYmJmZmFiLi41
ZWZkZGJmZjI0MzAgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKQEAgLTUxMSw2ICs1MTEsOCBAQCBwYXR0ZXJuUHJv
cGVydGllczoKICAgICBkZXNjcmlwdGlvbjogTGVub3ZvIEdyb3VwIEx0ZC4KICAgIl5sZywuKiI6
CiAgICAgZGVzY3JpcHRpb246IExHIENvcnBvcmF0aW9uCisgICJebGdwaGlsaXBzLC4qIjoKKyAg
ICBkZXNjcmlwdGlvbjogTEcgRGlzcGxheQogICAiXmxpYnJldGVjaCwuKiI6CiAgICAgZGVzY3Jp
cHRpb246IFNoZW56aGVuIExpYnJlIFRlY2hub2xvZ3kgQ28uLCBMdGQKICAgIl5saWNoZWVwaSwu
KiI6Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
