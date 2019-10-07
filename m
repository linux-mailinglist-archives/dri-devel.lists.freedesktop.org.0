Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ABACF3CB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BEC6E1F1;
	Tue,  8 Oct 2019 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1989BBE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:14:41 +0000 (UTC)
Received: from p200300ccff0a88001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:8800:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1iHWac-0001u4-JD; Mon, 07 Oct 2019 19:14:33 +0200
Date: Mon, 7 Oct 2019 19:14:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] drm: panels: fix spi aliases of former omap panels
Message-ID: <20191007191428.016ddcd4@aktux>
In-Reply-To: <20191007170446.yotb24s6jhe6nx3r@earth.universe>
References: <20191007164130.31534-1-andreas@kemnade.info>
 <20191007170446.yotb24s6jhe6nx3r@earth.universe>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mm080KtOnLyBqIfHx4O7fkQurN0T478z2w4kEpoDaVc=; b=l9ndA5OiI6LWjL6S22yf+FBvXn
 hRASRP6kwn3i28/ygtaLOOUtX9K2r7nPWhh0RSWMUS/jQ4iTKiZfigt2U9vBZH+t03HNcNVqX8SMm
 hWxp3ZFoWYQZZLrRRLKKs2OX3PCGxtnAcxMEmHiNhD53x7wlvrorKR6qR7gKK6mAEmyo=;
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
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, airlied@linux.ie,
 omi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tony Lindgren <tony@atomide.com>, thierry.reding@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 sam@ravnborg.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA3IE9jdCAyMDE5IDE5OjA0OjQ2ICswMjAwClNlYmFzdGlhbiBSZWljaGVsIDxzcmVA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IEhpLAo+IAo+IE9uIE1vbiwgT2N0IDA3LCAyMDE5IGF0IDA2
OjQxOjMwUE0gKzAyMDAsIEFuZHJlYXMgS2VtbmFkZSB3cm90ZToKPiA+IFdoZW4gdGhlIHBhbmVs
cyB3ZXJlIG1vdmVkIGZyb20gb21hcC9kaXNwbGF5cy8gdG8gcGFuZWwvCj4gPiBvbWFwZHNzIHBy
ZWZpeCB3YXMgc3RyaXBwZWQsIHdoaWNoIGNhdXNlIHNwaSBtb2RhbGlhcwo+ID4gdG8gbm90IGNv
bnRhaW4gdGhlIHZlbmRvci1wcmVmaXggYW55bW9yZS4KPiA+IAo+ID4gc28gd2UgaGFkIGUuZy4g
aW4gZm9ybWVyIHRpbWVzOgo+ID4gY29tcGF0aWJsZT1vbWFwZHNzLHRwbyx0ZDAyOHR0ZWMxIC0+
IG1vZGFsaWFzPXNwaTp0cG8sdGQwMjh0dGVjMQo+ID4gbm93Ogo+ID4gY29tcGF0aWJsZT10cG8s
dGQwMjh0dGVjMSAtPiBtb2RhbGlhcz1zcGk6dGQwMjh0dGVjMQo+ID4gCj4gPiBUaGlzIGlzIGNv
bnNpc3RlbnQgd2l0aCBvdGhlciBkcml2ZXJzLiBUZXN0ZWQgdGhlIHRkMDI4dHRlYy5jCj4gPiBv
bmx5LCBidXQgdGhlIHBhdHRlcm4gbG9va3MgdGhlIHNhbWUgZm9yIHRoZSBvdGhlciBvbmVzLgo+
ID4gCj4gPiBGaXhlczogNDVmMTZjODJkYjdlOCAoImRybS9vbWFwOiBkaXNwbGF5czogUmVtb3Zl
IHVudXNlZCBwYW5lbCBkcml2ZXJzIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgS2VtbmFk
ZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+Cj4gPiAtLS0gIAo+IAo+IFBhdGNoIGxvb2tzIGdvb2Qg
dG8gbWUsIGJ1dCB5b3UgaGF2ZSBvbmUgZmFsc2UgcG9zaXRpdmUuCj4gCj4gPiBbLi4uXQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2
N2R3MDEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1sczAzN3Y3ZHcwMS5j
Cj4gPiBpbmRleCA0NmNkOWEyNTAxMjk4Li44MzhkMzlhMjYzZjUzIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNoYXJwLWxzMDM3djdkdzAxLmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1sczAzN3Y3ZHcwMS5jCj4gPiBAQCAt
MjA0LDcgKzIwNCw3IEBAIHN0YXRpYyBpbnQgbHMwMzd2N2R3MDFfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIGxzMDM3djdkdzAxX29mX21hdGNoW10gPSB7Cj4gPiAtCXsgLmNvbXBhdGli
bGUgPSAic2hhcnAsbHMwMzd2N2R3MDEiLCB9LAo+ID4gKwl7IC5jb21wYXRpYmxlID0gImxzMDM3
djdkdzAxIiwgfSwKPiA+ICAJeyAvKiBzZW50aW5lbCAqLyB9LAo+ID4gIH07Cj4gPiAgICAKPiAK
PiBUaGUgRFQgY29tcGF0aWJsZSBzaG91bGQgaGF2ZSBhIHZlbmRvciBwcmVmaXguCj4gCgpvb3Bz
LCBzb3JyeSwgYnV0IEkgaXQgc2VlbXMgdGhhdCBMYXVyZW50IGFscmVhZHkgaGFzIHN1Ym1pdHRl
ZCBhIGZpeC4KClJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
