Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB5997A0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 17:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719A36EB74;
	Thu, 22 Aug 2019 15:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3046EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 15:03:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C69E42AF;
 Thu, 22 Aug 2019 17:02:59 +0200 (CEST)
Date: Thu, 22 Aug 2019 18:02:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
Message-ID: <20190822150253.GA5027@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-4-jacopo+renesas@jmondi.org>
 <CAMuHMdVXQaqFg-m3a4xTiKLWQLz+itKQgGEBAQpHtG+MkTNzQw@mail.gmail.com>
 <20190822100051.yhguosvfz3zzykze@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822100051.yhguosvfz3zzykze@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566486180;
 bh=iftq3nJgJssug7RTlAUxv4Dz4YoWQSuHsGPqItfclIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubL4ZyHTybZNdyZ3zyxXyULmW0yoknWg1BLEC7hqPh7GTlsFxMOR6PPOpN1OSlXff
 A5zvEx0Wgx7/PiM4LZmjjXOFINmOgwF4KtWHWprNnucR/LLUQ4Krr+Iugdy7ijJiXz
 NqB81BKPG6dIoULHrTctLW1kV+knoafjdQMFcpsI=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTI6MDA6NTFQTSArMDIwMCwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0IDAyOjE2OjAyUE0gKzAy
MDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIFNhdCwgSnVsIDYsIDIwMTkgYXQg
NDowNyBQTSBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+
ID4gPiBVcGRhdGUgdGhlICd2c3BzJyBwcm9wZXJ0eSBpbiB0aGUgUi1DYXIgR2VuMyBTb0MgZGV2
aWNlIHRyZWUgZmlsZXMgdG8KPiA+ID4gbWF0Y2ggd2hhdCdzIGluIGluIHRoZSBkb2N1bWVudGF0
aW9uIGV4YW1wbGUuCj4gPgo+ID4gZG91YmxlIGluIChubyB3b3JyaWVzLCBJJ2xsIGZpeCB0aGF0
IHVwIG15c2VsZikKPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3Bv
K3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+Cj4gPiBUaGFua3MhCj4gPgo+ID4gUmV2aWV3ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPiBpLmUuIHdp
bGwgcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjUuNC4KPiA+Cj4gPiBCVFcsIGFueSBwbGFu
cyB0byBhZGQgY2hhbm5lbCBpbmRpY2VzIHRvIHRoZSB2c3BzIHByb3BlcnRpZXMgaW4gdGhlCj4g
PiByZW1haW5pbmcgRFRTIGZpbGVzPwo+IAo+IEFjY29yZGluZyB0byB3aGF0IEkgcmVhZCBpbiB0
aGUgcGFyc2luZyAndnNwcycgcHJvZXBydGllcyBwYXJzaW5nCj4gcm91dGluZSByY2FyX2R1X3Zz
cHNfaW5pdCgpLCBpZiB0aGUgY2hhbm5lbCBpbmRleCBpcyBub3Qgc3BlY2lmaWVkLCBpdAo+IGlz
IGRlZmF1bHRlZCB0byAwLgo+IAo+ICAgICAgICAgICAgLyogU3RvcmUgdGhlIFZTUCBwb2ludGVy
IGFuZCBwaXBlIGluZGV4IGluIHRoZSBDUlRDLiAqLwo+ICAgICAgICAgICAgcmNkdS0+Y3J0Y3Nb
aV0udnNwID0gJnJjZHUtPnZzcHNbal07Cj4gICAgICAgICAgICByY2R1LT5jcnRjc1tpXS52c3Bf
cGlwZSA9IGNlbGxzID49IDEgPyBhcmdzLmFyZ3NbMF0gOiAwOwo+IAo+IFRoZSBEVSBiaW5kaW5n
cyBkb2N1bWVudGF0aW9uIGRvZXMgbm90IHN0YXRlIHRoYXQgdGhlIGNoYW5uZWwgaW5kZXggaXMK
PiBvcHRpb25hbCwgc28geWVzLCBpdCBtaWdodCBiZSB3b3J0aCBjaGFuZ2luZyB0aGlzIGFuZCBz
aW1wbGlmeSB0aGUKPiBwYXJzaW5nIHJvdXRpbmcgdG8gYWx3YXlzIGFzc3VtZSB0aGUgY2hhbm5l
bCBpbmRleCBpcyB0aGVyZS4KPiAKPiBXaGF0IGRvZXMgTGF1cmVudCB0aGluaz8gSXMgdGhpcyB3
b3J0aCB0aGUgZWZmb3J0PwoKSSB0aGluayBpdCdzIHdvcnRoIHRoZSBlZmZvcnQgdG8ga2VlcCB0
aGUgdXBzdHJlYW0gRFQgc291cmNlcyBpbiBzeW5jCndpdGggdGhlIGxhdGVzdCBiaW5kaW5ncywg
YnV0IFdlIGNhbid0IGNoYW5nZSB0aGUgY29kZSBhcyB3ZSBuZWVkIHRvCmVuc3VyZSBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5LiBTbywgeWVzIHRvIHRoZSBEVCB1cGRhdGUsIGJ1dCB0aGUgZHJpdmVy
CnNob3VsZCBzdGF5IHVubW9kaWZpZWQgKG9yIHNob3VsZCByZWNlaXZlIGEgbmV3IGNvbW1lbnQg
ZXhwbGFpbmluZyB0aGUKcmVxdWlyZWQgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBpZiB0aGVyZSdz
IG5vdCBvbmUgYWxyZWFkeSkuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
