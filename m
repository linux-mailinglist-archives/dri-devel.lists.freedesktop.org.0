Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0358576374
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 12:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85D06ED16;
	Fri, 26 Jul 2019 10:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237596ED17
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 10:25:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DFB19803B3;
 Fri, 26 Jul 2019 12:25:30 +0200 (CEST)
Date: Fri, 26 Jul 2019 12:25:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 0/3] drm/panel: jh057n00900: Move dsi init sequence to
 prepare
Message-ID: <20190726102529.GB15658@ravnborg.org>
References: <cover.1564132646.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1564132646.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=6BhD04cj4S09DCeAZc4A:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8uCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAxMToyMTo0MEFNICswMjAwLCBHdWlk
byBHw7xudGhlciB3cm90ZToKPiBJZiB0aGUgcGFuZWwgaXMgd3JhcHBlZCBpbiBhIHBhbmVsX2Jy
aWRnZSBpdCBnZXRzIHByZXBhcigpZWQgYmVmb3JlIHRoZQo+IHVwc3RyZWFtIERTSSBicmlkZ2Ug
d2hpY2ggY2FuIGNhdXNlIGhhbmdzIChlLmcuIHdpdGggaW14LW53bCBzaW5jZSBjbG9ja3MKPiBh
cmUgbm90IGVuYWJsZWQgeWV0KS4gVG8gYXZvaWQgdGhpcyBtb3ZlIHRoZSBwYW5lbCdzIGZpcnN0
IERTSSBhY2Nlc3MgdG8KPiBlbmFibGUoKSBzbyB0aGUgdXBzdHJlYW0gYnJpZGdlIGNhbiBwcmVw
YXJlIHRoZSBEU0kgaG9zdCBjb250cm9sbGVyIGluCj4gaXQncyBwcmVfZW5hYmxlKCkuCj4gCj4g
VGhlIHNlY29uZCBwYXRjaCBtYWtlcyB0aGUgZGlzYWJsZSgpIGNhbGwgc3ltbWV0cmljIHRvIHRo
ZSBhYm92ZSBhbmQgdGhlIHRoaXJkCj4gb25lIGp1c3QgZWFzZXMgZGVidWdnaW5nLgo+IAo+IEd1
aWRvIEfDvG50aGVyICgzKToKPiAgIGRybS9wYW5lbDogamgwNTduMDA5MDA6IE1vdmUgcGFuZWwg
RFNJIGluaXQgdG8gZW5hYmxlKCkKPiAgIGRybS9wYW5lbDogamgwNTduMDA5MDA6IE1vdmUgbWlw
aV9kc2lfZGNzX3NldF9kaXNwbGF5X29mZiB0byBkaXNhYmxlKCkKPiAgIGRybS9wYW5lbDogamgw
NTduMDA5MDA6IFByaW50IGVycm9yIGNvZGUgb24gYWxsIERSTV9ERVZfRVJST1IoKXMKClBhdGNo
IDEgKyAzIGFyZSBib3RoOgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgoKU2VlIGNvbW1lbnQgb24gcGF0Y2ggMi4KCldoaWxlIHlvdSBhcmUgdG91Y2hpbmcgdGhp
cyBkcml2ZXIgY2FuIHlvdSBtYWtlIGFuIGV4dHJhIHBhdGNoPwoKVG9kYXkgdGhlIGRyaXZlciBj
YWxscyB0aGUgaW50ZXJuYWwgcHJlcGFyZSxlbmFibGUsZGlzYWJsZSx1bnByZXBhcmUKZnVuY3Rp
b25zLgpUaGUgcmlnaHQgd2F5IHRvIGRvIGl0IGlzIHRvIHVzZSB0aGUKZHJtX3BhbmVsXyhwcmVw
YXJlLGVuYWJsZSxkaXNhYmxlLHVucHJlcGFyZSkgdmFyaWFudHMuCgpUaGUgYmVuZWZpdCBpcyB0
aGF0IHdlIGNhbiBtb3ZlIGEgbGl0dGxlIGxvZ2ljIHRvIHRoZXNlIGZ1bmN0aW9ucwphbmQgdGhl
IGRyaXZlcnMgd2lsbCB0aGVuIGJlbmVmaXQgZnJvbSB0aGlzLgoKVHdvIHRoaW5ncyBJIGhhdmUg
aW4gbXkgbG9jYWwgcXVldWU6Ci0gTW92ZSBib29sIGZvciBwcmVwYXJlZC9lbmFibGVkCiAgKHRv
IHByb3RlY3QgdGhhdCB3ZSBkbyBub3QgcHJlcGFyZS9lbmFibGUgdHdpY2UpCi0gYmFja2xpZ2h0
IHN1cHBvcnQKClRoaXMgZHJpdmVyIHdpbGwgYmVuZWZpdCBmb3JtIGJvdGggYW5kIHRoaXMgbGl0
dGxlIG1vZGlmaWNhdGlvbiB3aWxsCm1ha2UgaXQgc2ltcGxlciB0byBpbnRyb2R1Y2UuCkkgY2Fu
IGFsc28gcHJlcGFyZSB0aGUgcGF0Y2ggaWYgeW91IHByZWZlci4KCglTYW0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
