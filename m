Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73784FD798
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967E6E0C9;
	Fri, 15 Nov 2019 08:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1497E6E5D9;
 Thu, 14 Nov 2019 10:23:11 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Nov 2019 15:46:57 +0530
IronPort-SDR: foD5M+vtRxPlfU+/YH0bO4B+mMISka1lGXlS7dInx1WC6+prid2eZha7lKE5upKQSqzpOXRUfV
 ORDiuPj9TJJwXomNQ8EHX08WDGmqNMrbj3f4K3ruhjqTwzUvXGySbH0PDqP+15E7G9H/uhsZG0
 z2kd6gUKKwzNrY77Hz1G2FrPqK9QzpWIiwl1+qXZ5viFlkkUtfTjVfQepUrl5CCvaYCydideTe
 rozsWpSuY7Z+GLyAVu1+XgzQ2xrSl4EE51ljOfIeImub2jNo/ea2LtT+507mtsT+fLFCbMSwFt
 hHYjVHTuEw4r5kUqY30oPIXq
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Nov 2019 15:46:32 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id B690D26FF; Thu, 14 Nov 2019 15:46:31 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] Add suppport for rm69299 Visionox panel driver and add
 DSI config to support DSI version
Date: Thu, 14 Nov 2019 15:46:26 +0530
Message-Id: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudCBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIHJtNjkyOTkgdmlzaW9ub3ggcGFuZWwg
ZHJpdmVyIHVzZWQgaW4gTVNNIHJlZmVyZW5jZSBwbGF0Zm9ybXMgCmFuZCBhbHNvIGFkZHMgRFNJ
IGNvbmZpZyB0aGF0IHN1cHBvcnRzIHRoZSByZXNwZWN0aXZlIERTSSB2ZXJzaW9uLgoKVGhlIHZp
c2lvbm94IHBhbmVsIGRyaXZlciBzdXBwb3J0cyBhIHJlc29sdXRpb24gb2YgMTA4MHgyMjQ4IHdp
dGggNCBsYW5lcyBhbmQgc3VwcG9ydHMgb25seSBzaW5nbGUgRFNJIG1vZGUuCgpDdXJyZW50IHBh
dGNoc2V0IGlzIHRlc3RlZCBvbiBhY3R1YWwgcGFuZWwuCgpIYXJpZ292aW5kYW4gUCAoMik6CiAg
ZHJtL3BhbmVsOiBhZGQgc3VwcG9ydCBmb3Igcm02OTI5OSB2aXNpb25veCBwYW5lbCBkcml2ZXIK
ICBkcm0vbXNtOiBhZGQgRFNJIGNvbmZpZyBjaGFuZ2VzIHRvIHN1cHBvcnQgRFNJIHZlcnNpb24K
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMgICAgICAgICAgICAgIHwgIDIxICsr
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmggICAgICAgICAgICAgIHwgICAxICsK
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDkgKwog
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdmlzaW9ub3gtcm02OTI5OS5jIHwgNDc4ICsrKysr
KysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNTEwIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdmlzaW9ub3gt
cm02OTI5OS5jCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
