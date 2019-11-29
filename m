Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E75910DDC2
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 14:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0942F6E139;
	Sat, 30 Nov 2019 13:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074A76E892;
 Fri, 29 Nov 2019 06:56:17 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Nov 2019 12:26:15 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
 by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2019 12:25:53 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 9E3F22346; Fri, 29 Nov 2019 12:25:52 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] Add suppport for rm69299 Visionox panel driver and add
 devicetree bindings for visionox panel.
Date: Fri, 29 Nov 2019 12:25:43 +0530
Message-Id: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 30 Nov 2019 13:23:59 +0000
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
ZHJpdmVyIHVzZWQgaW4gTVNNIHJlZmVyZW5jZSBwbGF0Zm9ybXMuClRoZSB2aXNpb25veCBwYW5l
bCBkcml2ZXIgc3VwcG9ydHMgYSByZXNvbHV0aW9uIG9mIDEwODB4MjI0OCB3aXRoIDQgbGFuZXMg
YW5kIHN1cHBvcnRzIG9ubHkgc2luZ2xlIERTSSBtb2RlLgoKQ3VycmVudCBwYXRjaHNldCBpcyB0
ZXN0ZWQgb24gYWN0dWFsIHBhbmVsLgoKQ2hhbmdlcyBpbiB2MToKCS1hZGQgZGV2aWNldHJlZSBi
aW5kaW5ncyBmb3IgdmlzaW9ub3ggcGFuZWwuCgktU3BsaXQgb3V0IHBhbmVsIGRyaXZlciBwYXRj
aCBmcm9tIGRzaSBjb25maWcgY2hhbmdlcyhSb2IgQ2xhcmspLgogICAgICAgIC1SZW1vdmUgdW5y
ZWxhdGVkIGNvZGUoU3RlcGhlbiBCb3lkKS4KICAgICAgICAtUmVtb3ZlIHN0YXRpYyBhcnJheXMg
dG8gbWFrZSByZWd1bGF0b3Igc2V0dXAKICAgICAgICAgb3BlbiBjb2RlZCBpbiBwcm9iZShTdGVw
aGVuIEJveWQpLgogICAgICAgIC1SZW1vdmUgcHJlLWFzc2lnbmluZyB2YXJpYWJsZXMoU3RlcGhl
biBCb3lkKS4KICAgICAgICAtSW5saW5lIHBhbmVsX2FkZCBmdW5jdGlvbiBpbnRvIHByb2JlKFN0
ZXBoZW4gQm95ZCkuCiAgICAgICAgLVVzZSBtaXBpX2RzaV9kY3Nfd3JpdGUgZGlyZWN0bHkoUm9i
IENsYXJrKS4KCS1SZW1vdmUgcWNvbV9ybTY5Mjk5XzEwODBwX3BhbmVsX21hZ2ljX2NtZHMgYXJy
YXkoUm9iIENsYXJrKS4KCkhhcmlnb3ZpbmRhbiBQICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxh
eTogYWRkIHNjNzE4MCBwYW5lbCB2YXJpYW50CiAgZHJtL3BhbmVsOiBhZGQgc3VwcG9ydCBmb3Ig
cm02OTI5OSB2aXNpb25veCBwYW5lbCBkcml2ZXIKCiAuLi4vYmluZGluZ3MvZGlzcGxheS92aXNp
b25veCxybTY5Mjk5LnR4dCAgICAgICAgICB8ICA2OCArKysrCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtdmlzaW9ub3gtcm02OTI5OS5jICAgICB8IDQxMiArKysrKysrKysrKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDkwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDc1NSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92aXNpb25v
eCxybTY5Mjk5LnR4dAogY3JlYXRlIG1vZGUgMTAwNzU1IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC12aXNpb25veC1ybTY5Mjk5LmMKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
