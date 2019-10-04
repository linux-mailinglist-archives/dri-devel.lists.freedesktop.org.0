Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E874DCB4C0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04116EAA8;
	Fri,  4 Oct 2019 07:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152446EAA8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:02:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59CB8592;
 Fri,  4 Oct 2019 09:02:34 +0200 (CEST)
Date: Fri, 4 Oct 2019 10:02:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 0/4] Add RZ/G2N DU support
Message-ID: <20190930231125.GA10149@pendragon.ideasonboard.com>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570172554;
 bh=+8JuRiBylKBi8jvQtiwjfnTISZPsR2OZbRJ1IJE/Qjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0wsefBx4ByR1SKVDBPpdCB/G1spyTdTPPXi/abj8hinwRwwIZeYXWfSZ28WXADCp
 ojOpgdUQh9RBmePajh/c12wfnBme7Aeto3lm66hIMeYwk0vgKDKmnz6ZS/UTc9QaWH
 n+rZekhxnkk3BJoV7NSjbNNqIaHajANR5xvdMIB4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoZXM7CgpPbiBNb24sIFNlcCAzMCwgMjAx
OSBhdCAxMDoxNTowMUFNICswMTAwLCBCaWp1IERhcyB3cm90ZToKPiBUaGlzIHBhdGNoIHNlcmll
cyBhaW1zIHRvIGFkZCBiaW5kaW5nL2RyaXZlciBzdXBwb3J0IGZvcgo+IFI4QTc3NEIxKGEuay5h
IFJaL0cyTikgRFUgKHdoaWNoIGlzIHZlcnkgc2ltaWxhciB0byB0aGUgUjhBNzc5NjUgRFUpOwo+
IGl0IGhhcyBvbmUgUkdCIG91dHB1dCwgb25lIExWRFMgb3V0cHV0IGFuZCBvbmUgSERNSSBvdXRw
dXQuCj4gCj4gQmlqdSBEYXMgKDQpOgo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6
IGR1OiBEb2N1bWVudCB0aGUgcjhhNzc0YjEgYmluZGluZ3MKPiAgIGRybTogcmNhci1kdTogQWRk
IFI4QTc3NEIxIHN1cHBvcnQKPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRz
OiBEb2N1bWVudCByOGE3NzRiMSBiaW5kaW5ncwo+ICAgZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQg
cjhhNzc0YjEgc3VwcG9ydAoKRm9yIHRoZSB3aG9sZSBzZXJpZXMsCgpSZXZpZXdlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKYW5kIGFw
cGxpZWQgdG8gbXkgdHJlZS4KCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2Fz
LGx2ZHMudHh0ICAgICAgIHwgIDEgKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JlbmVzYXMsZHUudHh0ICAgICB8ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfZHJ2LmMgICAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAgICB8ICAxICsK
PiAgNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
