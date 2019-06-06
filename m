Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5B3855A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DEA89AA2;
	Fri,  7 Jun 2019 07:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94888934F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:40 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3DBE820013;
 Thu,  6 Jun 2019 14:21:37 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 02/20] dt-bindings: display, renesas,
 du: Document cmms property
Date: Thu,  6 Jun 2019 16:22:02 +0200
Message-Id: <20190606142220.1392-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
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
ZGkub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jl
bmVzYXMsZHUudHh0IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jl
bmVzYXMsZHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cmVuZXNhcyxkdS50eHQKaW5kZXggYWVkYjIyYjRkMTYxLi4xMDAxMTRlZjExZDUgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUu
dHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVz
YXMsZHUudHh0CkBAIC00NCw2ICs0NCwxMCBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVzOgogICAgIGlu
c3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVsLCBhbmQgdGhlIGNoYW5uZWwgaW5kZXgg
aWRlbnRpZmllcyB0aGUKICAgICBMSUYgaW5zdGFuY2UgaW4gdGhhdCBWU1AuCiAKKyAgLSBjbW1z
OiBBIGxpc3Qgb2YgcGhhbmRsZXMgdG8gdGhlIENNTSBpbnN0YW5jZXMgcHJlc2VudCBpbiB0aGUg
U29DLCBvbmUKKyAgICBmb3IgZWFjaCBhdmFpbGFibGUgRFUgY2hhbm5lbC4gVGhlIHByb3BlcnR5
IHNoYWxsIG5vdCBiZSBzcGVjaWZpZWQgZm9yCisgICAgU29DcyB0aGF0IGRvZXMgbm90IHByb3Zp
ZGUgYW55IENNTSAoc3VjaCBhcyBWM00gYW5kIFYzSCkuCisKIFJlcXVpcmVkIG5vZGVzOgogCiBU
aGUgY29ubmVjdGlvbnMgdG8gdGhlIERVIG91dHB1dCB2aWRlbyBwb3J0cyBhcmUgbW9kZWxlZCB1
c2luZyB0aGUgT0YgZ3JhcGgKQEAgLTg5LDYgKzkzLDcgQEAgRXhhbXBsZTogUjhBNzc5NSAoUi1D
YXIgSDMpIEVTMi4wIERVCiAJCQkgPCZjcGcgQ1BHX01PRCA3MjE+OwogCQljbG9jay1uYW1lcyA9
ICJkdS4wIiwgImR1LjEiLCAiZHUuMiIsICJkdS4zIjsKIAkJdnNwcyA9IDwmdnNwZDAgMD4sIDwm
dnNwZDEgMD4sIDwmdnNwZDIgMD4sIDwmdnNwZDAgMT47CisJCWNtbXMgPSA8JmNtbTAgJmNtbTEg
JmNtbTIgJmNtbTM+OwogCiAJCXBvcnRzIHsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
