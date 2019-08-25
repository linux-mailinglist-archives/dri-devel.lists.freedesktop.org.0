Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06D9C6C6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723389A4A;
	Mon, 26 Aug 2019 00:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90516E101
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2019 13:50:43 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 08232C0006;
 Sun, 25 Aug 2019 13:50:38 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH v3 02/14] dt-bindings: display, renesas,
 du: Document cmms property
Date: Sun, 25 Aug 2019 15:51:42 +0200
Message-Id: <20190825135154.11488-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, mark.rutland@arm.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh+dt@kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
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
L2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQKaW5kZXggYzk3ZGZhY2FkMjgxLi5jMjI2NWUyYTFhZjIg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jl
bmVzYXMsZHUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3JlbmVzYXMsZHUudHh0CkBAIC00NSw2ICs0NSwxMCBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVz
OgogICAgIGluc3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVsLCBhbmQgdGhlIGNoYW5u
ZWwgaW5kZXggaWRlbnRpZmllcyB0aGUKICAgICBMSUYgaW5zdGFuY2UgaW4gdGhhdCBWU1AuCgor
ICAtIGNtbXM6IEEgbGlzdCBvZiBwaGFuZGxlcyB0byB0aGUgQ01NIGluc3RhbmNlcyBwcmVzZW50
IGluIHRoZSBTb0MsIG9uZQorICAgIGZvciBlYWNoIGF2YWlsYWJsZSBEVSBjaGFubmVsLiBUaGUg
cHJvcGVydHkgc2hhbGwgbm90IGJlIHNwZWNpZmllZCBmb3IKKyAgICBTb0NzIHRoYXQgZG8gbm90
IHByb3ZpZGUgYW55IENNTSAoc3VjaCBhcyBWM00gYW5kIFYzSCkuCisKIFJlcXVpcmVkIG5vZGVz
OgoKIFRoZSBjb25uZWN0aW9ucyB0byB0aGUgRFUgb3V0cHV0IHZpZGVvIHBvcnRzIGFyZSBtb2Rl
bGVkIHVzaW5nIHRoZSBPRiBncmFwaApAQCAtOTEsNiArOTUsNyBAQCBFeGFtcGxlOiBSOEE3Nzk1
IChSLUNhciBIMykgRVMyLjAgRFUKIAkJCSA8JmNwZyBDUEdfTU9EIDcyMT47CiAJCWNsb2NrLW5h
bWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4yIiwgImR1LjMiOwogCQl2c3BzID0gPCZ2c3BkMCAw
PiwgPCZ2c3BkMSAwPiwgPCZ2c3BkMiAwPiwgPCZ2c3BkMCAxPjsKKwkJY21tcyA9IDwmY21tMCAm
Y21tMSAmY21tMiAmY21tMz47CgogCQlwb3J0cyB7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
LS0KMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
