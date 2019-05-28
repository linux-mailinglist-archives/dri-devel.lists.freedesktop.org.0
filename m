Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD932BCEA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 03:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C07389A4A;
	Tue, 28 May 2019 01:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770B689A4A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 01:39:14 +0000 (UTC)
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3FFB2053B;
 Tue, 28 May 2019 01:39:09 +0000 (UTC)
Date: Tue, 28 May 2019 09:38:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller support
Message-ID: <20190528013800.GB6885@dragon>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <1558964213.4039.2.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558964213.4039.2.camel@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559007554;
 bh=Ma5P1NlWfDPd/p8+Di2DSazF2a2RvIx5ucDAtm56qyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTTy5BWXR3m2+CSJM3gOqIHwKbyNl054ZMW71m8yNb1pd/nRZpseyohKVSWZSgQCo
 jbSIY/Vq1Yf8nv5Ymv2x/3r8VipdERmW5F+EILSHjyXtAoo7BslSx3abuB+yK7ud6+
 7vJlX3DpLuAWI4x9Mi7e4lxejUl2c38YA5tKj5mc=
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
Cc: David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgpPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwMzozNjo1M1BNICswMjAwLCBMdWNh
cyBTdGFjaCB3cm90ZToKPiBXZSBoYXZlIGJlZW4gbG9va2luZyBhdCBob3cgdG8gc3VwcG9ydCBE
Q1NTIGluIG1haW5saW5lIGZvciBhIHdoaWxlLAo+IGJ1dCBtb3N0IG9mIHRoZSBhY3R1YWwgd29y
ayBnb3QgcHVzaGVkIGJlaGluZCBpbiBzY2hlZHVsZSBkdWUgdG8gb3RoZXIKPiBwcmlvcml0aWVz
LgoKSSBoYXZlIHNvbWUgdGltZSB0byBjb250cmlidXRlLiAgV291bGQgeW91IHN1Z2dlc3QgaG93
IEkgc2hvdWxkIGhlbHAKaGVyZT8KCjEuIFlvdSBndXlzIGFscmVhZHkgaGF2ZSBzb21ldGhpbmcg
Y2xvc2UgdG8gY29tcGxldGlvbiBhbmQgZG8gbm90IG5lZWQKICAgbW9yZSBoYW5kcy4KMi4gWW91
IGd1eXMgYWxyZWFkeSBoYXZlIHNvbWUgcHJlbGltaW5hcnkgY29kZSBhbmQgY2FuIHVzZSBoZWxw
IGZyb20KICAgb3RoZXJzLgozLiBZb3UgZ3V5cyBoYXZlbid0IGdvdCBhbnl0aGluZyB0byBzdGFy
dCB3aXRoLCBidXQganVzdCBzb21lIGRlc2lnbgogICBwcmluY2lwbGVzIHRoYXQgYW55b25lIHdo
byB3YW50cyB0byB3b3JrIG9uIGl0IHNob3VsZCBjb25zaWRlci4KCldoaWNoIGlzIHRoZSBvbmUg
dGhhdCB5b3Ugd2FudCBtZSB0byByZWFkPwoKPiBPbmUgdGhpbmcgSSBjYW4gY2FuIHNheSBmb3Ig
Y2VydGFpbiBpcyB0aGF0IERDU1Mgc2hvdWxkIG5vdCBiZQo+IGludGVncmF0ZWQgaW50byBpbXgt
ZHJtLiBJdCdzIGEgdG90YWxseSBkaWZmZXJlbnQgaGFyZHdhcmUgYW5kCj4gZG93bnN0cmVhbSBj
bGVhcmx5IHNob3dzIHRoYXQgaXQncyBub3QgYSBnb29kIGlkZWEgdG8gY3JhbSBpdCBpbnRvIGlt
eC0KPiBkcm0uCgpJIGhhdmVuJ3QgZ29uZSBkZWVwZXIgaW50byB0aGUgdmVuZG9yIGNvZGUsIGJ1
dCBmcm9tIGEgYnJpZWYgbG9va2luZyBJCmRpZG4ndCBzZWUgc28gbWFueSBwcm9ibGVtcyB3aXRo
IGludGVncmF0aW5nIERDU1MgaW50byBpbXgtZHJtLiAgSXQncwpub3Qgc28gdW5yZWFzb25hYmxl
IHRvIHRha2UgaW14LWRybSBhcyBhbiBpbXgtZGlzcGxheS1zdWJzeXN0ZW0gd2hpY2gKY2FuIGhh
dmUgbXVsdGlwbGUgQ1JUQ3MuICBTbyBjYW4geW91IHBsZWFzZSBlbGFib3JhdGUgYSBiaXQgb24g
d2h5IGl0J3MKcmVhbGx5IGEgYmFkIGlkZWE/Cgo+IEFsc28gdGhlIGFydGlmaWNpYWwgc3BsaXQg
YmV0d2VlbiBoYXJkd2FyZSBjb250cm9sIGluCj4gZHJpdmVycy9ncHUvaW14L2Rjc3MgYW5kIHRo
ZSBEUk0gZHJpdmVyIGlzIGp1c3QgY2FyZ28tY3VsdCBmcm9tIHRoZQo+IElQVS9pbXgtZHJtIHNw
bGl0LiBGb3IgdGhlIElQVSB3ZSBkaWQgaXQgYXMgdGhlIElQVSBoYXMgbGVncyBpbiBib3RoCj4g
RFJNIGZvciB0aGUgb3V0cHV0IHBhcnRzIGFuZCBWNEwyIGZvciB0aGUgaW5wdXQgcGFydHMuIEFz
IHRoZSBEQ1NTIGhhcwo+IG5vIHZpZGVvIGlucHV0IGNhcGFiaWxpdGllcyB0aGUgZHJpdmVyIGNv
dWxkIGJlIHNpbXBsaWZpZWQgYSBsb3QgYnkKPiBtb3ZpbmcgaXQgYWxsIGludG8gYSBzaW5nbGUg
RFJNIGRyaXZlci4KCkFncmVlZCBvbiB0aGlzLgoKU2hhd24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
