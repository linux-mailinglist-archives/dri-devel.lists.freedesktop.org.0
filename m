Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C72DCE6F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0566A6EBA6;
	Fri, 18 Oct 2019 18:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 16 Oct 2019 15:17:21 UTC
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B316E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 15:17:21 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by xavier.telenet-ops.be with bizsmtp
 id EFCG2100M05gfCL01FCGCw; Wed, 16 Oct 2019 17:12:17 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iKkyG-0003wY-SA; Wed, 16 Oct 2019 17:12:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iKkyG-00082z-PS; Wed, 16 Oct 2019 17:12:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4] dt-bindings: display: renesas: du: Document optional reset
 properties
Date: Wed, 16 Oct 2019 17:12:15 +0200
Message-Id: <20191016151215.30892-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
cmc+Ci0tLQp2NDoKICAtIFVzZSAiQWxsIGJ1dCBSOEE3Nzc5IiBpbnN0ZWFkIG9mICJSOEE3Nzlb
MDEyMzQ1Nl0iLCB0byByZWR1Y2UgZnV0dXJlCiAgICBjaHVybiwKCnYzOgogIC0gQWRkIEFja2Vk
LWJ5LAogIC0gRHJvcCBMVkRTIHJlc2V0cywgYXMgTFZEUyBpcyBub3cgY292ZXJlZCBieSBhIHNl
cGFyYXRlIGJpbmRpbmcsCiAgLSBVcGRhdGUgdGhlIGV4YW1wbGUuCgp2MjoKICAtIHMvcGhhbmRs
ZXMvcGhhbmRsZS8uCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2Fz
LGR1LnR4dCAgICAgICAgIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9yZW5lc2FzLGR1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0CmluZGV4IGM5N2RmYWNhZDI4MTE4ZmEuLjU5YmU3NDYy
YTRjOGJiOGUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0CkBAIC00NSw2ICs0NSwxNCBAQCBSZXF1aXJlZCBQ
cm9wZXJ0aWVzOgogICAgIGluc3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVsLCBhbmQg
dGhlIGNoYW5uZWwgaW5kZXggaWRlbnRpZmllcyB0aGUKICAgICBMSUYgaW5zdGFuY2UgaW4gdGhh
dCBWU1AuCiAKK09wdGlvbmFsIHByb3BlcnRpZXM6CisgIC0gcmVzZXRzOiBBIGxpc3Qgb2YgcGhh
bmRsZSArIHJlc2V0LXNwZWNpZmllciBwYWlycywgb25lIGZvciBlYWNoIGVudHJ5IGluCisgICAg
dGhlIHJlc2V0LW5hbWVzIHByb3BlcnR5LgorICAtIHJlc2V0LW5hbWVzOiBOYW1lcyBvZiB0aGUg
cmVzZXRzLiBUaGlzIHByb3BlcnR5IGlzIG1vZGVsLWRlcGVuZGVudC4KKyAgICAtIEFsbCBidXQg
UjhBNzc3OSB1c2Ugb25lIHJlc2V0IGZvciBhIGdyb3VwIG9mIG9uZSBvciBtb3JlIHN1Y2Nlc3Np
dmUKKyAgICAgIGNoYW5uZWxzLiBUaGUgcmVzZXRzIG11c3QgYmUgbmFtZWQgImR1LngiIHdpdGgg
IngiIGJlaW5nIHRoZSBudW1lcmljYWwKKyAgICAgIGluZGV4IG9mIHRoZSBsb3dlc3QgY2hhbm5l
bCBpbiB0aGUgZ3JvdXAuCisKIFJlcXVpcmVkIG5vZGVzOgogCiBUaGUgY29ubmVjdGlvbnMgdG8g
dGhlIERVIG91dHB1dCB2aWRlbyBwb3J0cyBhcmUgbW9kZWxlZCB1c2luZyB0aGUgT0YgZ3JhcGgK
QEAgLTkwLDYgKzk4LDggQEAgRXhhbXBsZTogUjhBNzc5NSAoUi1DYXIgSDMpIEVTMi4wIERVCiAJ
CQkgPCZjcGcgQ1BHX01PRCA3MjI+LAogCQkJIDwmY3BnIENQR19NT0QgNzIxPjsKIAkJY2xvY2st
bmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1LjIiLCAiZHUuMyI7CisJCXJlc2V0cyA9IDwmY3Bn
IDcyND4sIDwmY3BnIDcyMj47CisJCXJlc2V0LW5hbWVzID0gImR1LjAiLCAiZHUuMiI7CiAJCXZz
cHMgPSA8JnZzcGQwIDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+OwogCiAJ
CXBvcnRzIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
