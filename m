Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3344339C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4192E89356;
	Thu, 13 Jun 2019 07:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8DB89007
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:57:30 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by michel.telenet-ops.be with bizsmtp
 id PpxR2000l3XaVaC06pxRkQ; Wed, 12 Jun 2019 15:57:26 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hb3kj-0002XP-G1; Wed, 12 Jun 2019 15:57:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hb3kj-00056E-Ds; Wed, 12 Jun 2019 15:57:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3] dt-bindings: display: renesas: du: Document optional reset
 properties
Date: Wed, 12 Jun 2019 15:57:23 +0200
Message-Id: <20190612135723.19561-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdGhlIG9wdGlvbmFsIHByb3BlcnRpZXMgZm9yIGRlc2NyaWJpbmcgbW9kdWxlIHJl
c2V0cywgdG8Kc3VwcG9ydCByZXNldHRpbmcgZGlzcGxheSBjaGFubmVscyBvbiBSLUNhciBHZW4y
IGFuZCBHZW4zLgoKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4KQWNrZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Ci0tLQp2MzoKICAtIEFkZCBBY2tlZC1ieSwKICAtIERyb3AgTFZEUyByZXNldHMsIGFzIExW
RFMgaXMgbm93IGNvdmVyZWQgYnkgYSBzZXBhcmF0ZSBiaW5kaW5nLAogIC0gVXBkYXRlIHRoZSBl
eGFtcGxlLgoKdjI6CiAgLSBzL3BoYW5kbGVzL3BoYW5kbGUvLgotLS0KIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgICAgICAgICB8IDEwICsrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAppbmRleCBh
ZWRiMjJiNGQxNjEzZDFmLi44N2U1ZmIyY2U3NWUxMDNmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dApAQCAt
NDQsNiArNDQsMTQgQEAgUmVxdWlyZWQgUHJvcGVydGllczoKICAgICBpbnN0YW5jZSB0aGF0IHNl
cnZlcyB0aGUgRFUgY2hhbm5lbCwgYW5kIHRoZSBjaGFubmVsIGluZGV4IGlkZW50aWZpZXMgdGhl
CiAgICAgTElGIGluc3RhbmNlIGluIHRoYXQgVlNQLgogCitPcHRpb25hbCBwcm9wZXJ0aWVzOgor
ICAtIHJlc2V0czogQSBsaXN0IG9mIHBoYW5kbGUgKyByZXNldC1zcGVjaWZpZXIgcGFpcnMsIG9u
ZSBmb3IgZWFjaCBlbnRyeSBpbgorICAgIHRoZSByZXNldC1uYW1lcyBwcm9wZXJ0eS4KKyAgLSBy
ZXNldC1uYW1lczogTmFtZXMgb2YgdGhlIHJlc2V0cy4gVGhpcyBwcm9wZXJ0eSBpcyBtb2RlbC1k
ZXBlbmRlbnQuCisgICAgLSBSOEE3NzlbMDEyMzQ1Nl0gdXNlIG9uZSByZXNldCBmb3IgYSBncm91
cCBvZiBvbmUgb3IgbW9yZSBzdWNjZXNzaXZlCisgICAgICBjaGFubmVscy4gVGhlIHJlc2V0cyBt
dXN0IGJlIG5hbWVkICJkdS54IiB3aXRoICJ4IiBiZWluZyB0aGUgbnVtZXJpY2FsCisgICAgICBp
bmRleCBvZiB0aGUgbG93ZXN0IGNoYW5uZWwgaW4gdGhlIGdyb3VwLgorCiBSZXF1aXJlZCBub2Rl
czoKIAogVGhlIGNvbm5lY3Rpb25zIHRvIHRoZSBEVSBvdXRwdXQgdmlkZW8gcG9ydHMgYXJlIG1v
ZGVsZWQgdXNpbmcgdGhlIE9GIGdyYXBoCkBAIC04OCw2ICs5Niw4IEBAIEV4YW1wbGU6IFI4QTc3
OTUgKFItQ2FyIEgzKSBFUzIuMCBEVQogCQkJIDwmY3BnIENQR19NT0QgNzIyPiwKIAkJCSA8JmNw
ZyBDUEdfTU9EIDcyMT47CiAJCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwg
ImR1LjMiOworCQlyZXNldHMgPSA8JmNwZyA3MjQ+LCA8JmNwZyA3MjI+OworCQlyZXNldC1uYW1l
cyA9ICJkdS4wIiwgImR1LjIiOwogCQl2c3BzID0gPCZ2c3BkMCAwPiwgPCZ2c3BkMSAwPiwgPCZ2
c3BkMiAwPiwgPCZ2c3BkMCAxPjsKIAogCQlwb3J0cyB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
