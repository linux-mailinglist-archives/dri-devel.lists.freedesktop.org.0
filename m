Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD1D8D6C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD46E921;
	Wed, 16 Oct 2019 10:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3793A6E904
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:55:01 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 241DD240003;
 Wed, 16 Oct 2019 08:54:56 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v6 2/8] dt-bindings: display, renesas,
 du: Document cmms property
Date: Wed, 16 Oct 2019 10:55:42 +0200
Message-Id: <20191016085548.105703-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 10:11:37 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdGhlIG5ld2x5IGFkZGVkICdjbW1zJyBwcm9wZXJ0eSB3aGljaCBhY2NlcHRzIGEg
bGlzdCBvZiBwaGFuZGxlCmFuZCBjaGFubmVsIGluZGV4IHBhaXJzIHRoYXQgcG9pbnQgdG8gdGhl
IENNTSB1bml0cyBhdmFpbGFibGUgZm9yIGVhY2gKRGlzcGxheSBVbml0IG91dHB1dCB2aWRlbyBj
aGFubmVsLgoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClJldmll
d2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5l
c2FzQGptb25kaS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxkdS50eHQgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxkdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9yZW5lc2FzLGR1LnR4dAppbmRleCBjOTdkZmFjYWQyODEuLjNkOTgwOWI0ODZiNiAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVu
ZXNhcyxkdS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcmVuZXNhcyxkdS50eHQKQEAgLTQ1LDYgKzQ1LDEwIEBAIFJlcXVpcmVkIFByb3BlcnRpZXM6
CiAgICAgaW5zdGFuY2UgdGhhdCBzZXJ2ZXMgdGhlIERVIGNoYW5uZWwsIGFuZCB0aGUgY2hhbm5l
bCBpbmRleCBpZGVudGlmaWVzIHRoZQogICAgIExJRiBpbnN0YW5jZSBpbiB0aGF0IFZTUC4KIAor
ICAtIHJlbmVzYXMsY21tczogQSBsaXN0IG9mIHBoYW5kbGVzIHRvIHRoZSBDTU0gaW5zdGFuY2Vz
IHByZXNlbnQgaW4gdGhlIFNvQywKKyAgICBvbmUgZm9yIGVhY2ggYXZhaWxhYmxlIERVIGNoYW5u
ZWwuIFRoZSBwcm9wZXJ0eSBzaGFsbCBub3QgYmUgc3BlY2lmaWVkIGZvcgorICAgIFNvQ3MgdGhh
dCBkbyBub3QgcHJvdmlkZSBhbnkgQ01NIChzdWNoIGFzIFYzTSBhbmQgVjNIKS4KKwogUmVxdWly
ZWQgbm9kZXM6CiAKIFRoZSBjb25uZWN0aW9ucyB0byB0aGUgRFUgb3V0cHV0IHZpZGVvIHBvcnRz
IGFyZSBtb2RlbGVkIHVzaW5nIHRoZSBPRiBncmFwaApAQCAtOTEsNiArOTUsNyBAQCBFeGFtcGxl
OiBSOEE3Nzk1IChSLUNhciBIMykgRVMyLjAgRFUKIAkJCSA8JmNwZyBDUEdfTU9EIDcyMT47CiAJ
CWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwogCQl2c3BzID0g
PCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKKwkJcmVuZXNh
cyxjbW1zID0gPCZjbW0wPiwgPCZjbW0xPiwgPCZjbW0yPiwgPCZjbW0zPjsKIAogCQlwb3J0cyB7
CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
