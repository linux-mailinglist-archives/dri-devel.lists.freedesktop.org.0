Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BE61AFE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F7E89A35;
	Mon,  8 Jul 2019 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64D89D4B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:06:48 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 59FD1C000A;
 Sat,  6 Jul 2019 14:06:45 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 02/19] dt-bindings: display, renesas,
 du: Document cmms property
Date: Sat,  6 Jul 2019 16:07:29 +0200
Message-Id: <20190706140746.29132-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdGhlIG5ld2x5IGFkZGVkICdjbW1zJyBwcm9wZXJ0eSB3aGljaCBhY2NlcHRzIGEg
bGlzdCBvZiBwaGFuZGxlCmFuZCBjaGFubmVsIGluZGV4IHBhaXJzIHRoYXQgcG9pbnQgdG8gdGhl
IENNTSB1bml0cyBhdmFpbGFibGUgZm9yIGVhY2gKRGlzcGxheSBVbml0IG91dHB1dCB2aWRlbyBj
aGFubmVsLgoKU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9u
ZGkub3JnPgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUudHh0IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKaW5kZXggYWVkYjIyYjRkMTYxLi4wZjQyYWY1YjkxY2Yg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jl
bmVzYXMsZHUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3JlbmVzYXMsZHUudHh0CkBAIC00NCw2ICs0NCwxMCBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVz
OgogICAgIGluc3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVsLCBhbmQgdGhlIGNoYW5u
ZWwgaW5kZXggaWRlbnRpZmllcyB0aGUKICAgICBMSUYgaW5zdGFuY2UgaW4gdGhhdCBWU1AuCiAK
KyAgLSBjbW1zOiBBIGxpc3Qgb2YgcGhhbmRsZXMgdG8gdGhlIENNTSBpbnN0YW5jZXMgcHJlc2Vu
dCBpbiB0aGUgU29DLCBvbmUKKyAgICBmb3IgZWFjaCBhdmFpbGFibGUgRFUgY2hhbm5lbC4gVGhl
IHByb3BlcnR5IHNoYWxsIG5vdCBiZSBzcGVjaWZpZWQgZm9yCisgICAgU29DcyB0aGF0IGRvIG5v
dCBwcm92aWRlIGFueSBDTU0gKHN1Y2ggYXMgVjNNIGFuZCBWM0gpLgorCiBSZXF1aXJlZCBub2Rl
czoKIAogVGhlIGNvbm5lY3Rpb25zIHRvIHRoZSBEVSBvdXRwdXQgdmlkZW8gcG9ydHMgYXJlIG1v
ZGVsZWQgdXNpbmcgdGhlIE9GIGdyYXBoCkBAIC04OSw2ICs5Myw3IEBAIEV4YW1wbGU6IFI4QTc3
OTUgKFItQ2FyIEgzKSBFUzIuMCBEVQogCQkJIDwmY3BnIENQR19NT0QgNzIxPjsKIAkJY2xvY2st
bmFtZXMgPSAiZHUuMCIsICJkdS4xIiwgImR1LjIiLCAiZHUuMyI7CiAJCXZzcHMgPSA8JnZzcGQw
IDA+LCA8JnZzcGQxIDA+LCA8JnZzcGQyIDA+LCA8JnZzcGQwIDE+OworCQljbW1zID0gPCZjbW0w
ICZjbW0xICZjbW0yICZjbW0zPjsKIAogCQlwb3J0cyB7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
