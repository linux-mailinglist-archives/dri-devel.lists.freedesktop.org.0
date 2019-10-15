Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B463D7C00
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC406E864;
	Tue, 15 Oct 2019 16:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519766E364
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 10:44:56 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 528D8C0006;
 Tue, 15 Oct 2019 10:44:51 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v5 2/8] dt-bindings: display, renesas,
 du: Document cmms property
Date: Tue, 15 Oct 2019 12:46:15 +0200
Message-Id: <20191015104621.62514-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 16:38:12 +0000
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, airlied@linux.ie,
 mark.rutland@arm.com, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, seanpaul@chromium.org,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com
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
bCBpbmRleCBpZGVudGlmaWVzIHRoZQogICAgIExJRiBpbnN0YW5jZSBpbiB0aGF0IFZTUC4KCisg
IC0gcmVuZXNhcyxjbW1zOiBBIGxpc3Qgb2YgcGhhbmRsZXMgdG8gdGhlIENNTSBpbnN0YW5jZXMg
cHJlc2VudCBpbiB0aGUgU29DLAorICAgIG9uZSBmb3IgZWFjaCBhdmFpbGFibGUgRFUgY2hhbm5l
bC4gVGhlIHByb3BlcnR5IHNoYWxsIG5vdCBiZSBzcGVjaWZpZWQgZm9yCisgICAgU29DcyB0aGF0
IGRvIG5vdCBwcm92aWRlIGFueSBDTU0gKHN1Y2ggYXMgVjNNIGFuZCBWM0gpLgorCiBSZXF1aXJl
ZCBub2RlczoKCiBUaGUgY29ubmVjdGlvbnMgdG8gdGhlIERVIG91dHB1dCB2aWRlbyBwb3J0cyBh
cmUgbW9kZWxlZCB1c2luZyB0aGUgT0YgZ3JhcGgKQEAgLTkxLDYgKzk1LDcgQEAgRXhhbXBsZTog
UjhBNzc5NSAoUi1DYXIgSDMpIEVTMi4wIERVCiAJCQkgPCZjcGcgQ1BHX01PRCA3MjE+OwogCQlj
bG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiLCAiZHUuMiIsICJkdS4zIjsKIAkJdnNwcyA9IDwm
dnNwZDAgMD4sIDwmdnNwZDEgMD4sIDwmdnNwZDIgMD4sIDwmdnNwZDAgMT47CisJCXJlbmVzYXMs
Y21tcyA9IDwmY21tMD4sIDwmY21tMT4sIDwmY21tMj4sIDwmY21tMz47CgogCQlwb3J0cyB7CiAJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
