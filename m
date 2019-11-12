Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F66F93A7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 16:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FE46EB52;
	Tue, 12 Nov 2019 15:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EAC6EB52
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:08:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 07:08:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; d="scan'208";a="234896522"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 12 Nov 2019 07:08:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 12 Nov 2019 17:08:40 +0200
Date: Tue, 12 Nov 2019 17:08:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bas Vermeulen <bvermeul@blackstar.nl>
Subject: Re: How to create a drm_display_mode for a new display
Message-ID: <20191112150840.GP1208@intel.com>
References: <36fff77b-1e11-7faa-1c31-3fc719a4d354@blackstar.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36fff77b-1e11-7faa-1c31-3fc719a4d354@blackstar.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDM6MTg6MjFQTSArMDEwMCwgQmFzIFZlcm1ldWxlbiB3
cm90ZToKPiBIZWxsbywKPiAKPiBJIGFtIHRyeWluZyB0byBjcmVhdGUgYSBuZXcgZGlzcGxheSBt
b2RlIGZvciBhIG5ldyBkaXNwbGF5IEkgaGF2ZSB0byAKPiBzdXBwb3J0Lgo+IAo+IEkgaGF2ZSB0
aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uOgo+IAo+IERvdGNsb2NrIC0gZnJlcXVlbmN5IHBlcmlv
ZCAtIDEvVENMUCAtIDg5LjYgTUh6Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVENEUCAtIDExLDE2IG5zCj4gCj4gSHN5bmMgLSBQ
ZXJpb2QgLSBUSCAtIDIwNDggZG90Y2xvY2ssIDQzLDc1IEtIeiwgMjIsODYgdXMKPiAgwqDCoMKg
wqDCoMKgwqAgUHVsc2UgV2lkdGggLSBUSHAgLSA0MCBkb3RjbG9jaywgMCw0NSB1cyAtIGFjdGl2
ZSBsb3csIHN5bmMgCj4gcHVsc2UgaGlnaCwgcG9sYXJpdHkrCj4gCj4gVnN5bmMgLSBQZXJpb2Qg
LSBUViAtIDcyOSBkb3RjbG9jaywgNjAgSHosIDE2LDY2IG1zCj4gIMKgwqDCoMKgwqDCoMKgIFB1
bHNlIFdpZHRoIC0gVFZwIC0gMiBsaW5lLCA0NSw3MiB1cyAtIGFjdGl2ZSBsb3csIHN5bmMgcHVs
c2UgCj4gaGlnaCwgcG9sYXJpdHkrCj4gCj4gRW5hYmxlIC0gUHVsc2UgV2lkdGggLSBUSGQgLSAx
OTIwIGRvdGNsb2NrCj4gCj4gViBEaXNwbGF5IC0gVGVybSAtIFRWZCAtIDcyMCBsaW5lCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU3RhcnQgLSBURmQgLSA1IGxpbmUKPiAKPiBQaGFzZSAtIEhz
eW5jLUVuYWJsZSAtIFRIZSAtIDg4IGRvdGNsb2NrCj4gIMKgwqDCoMKgwqDCoMKgIEhzeW5jLVZz
eW5jIC0gVFZoIC0gMCBkb3RjbG9jawoKWW91IGRvbid0IGhhcHBlbiB0byBoYXZlIGFuIGFjdHVh
bCB0aW1pbmcgZGlhZ3JhbSB0byBnbyBhbG9uZyB3aXRoCnRob3NlPwoKPiAKPiBJIG1hZGUgdGhl
IGZvbGxvd2luZyBkcm1fZGlzcGxheV9tb2RlIG91dCBvZiBpdDoKPiAKPiB7IERSTV9NT0RFKCIx
OTIweDcyMCIsIERSTV9NT0RFX1RZUEVfRFJJVkVSLCA4OTYwMCwgMTkyMCwgMTkyMCwKPiAgwqDC
oMKgwqDCoMKgwqDCoCAxOTYwLCAyMDQ4LCAwLCA3MjAsIDcyMiwgNzI0LCA3MjksIDAsCgpUaGUg
emVybyBsZW5ndGggaG9yaXpvbnRhbCBmcm9udCBwb3JjaCBpcyBwZXJoYXBzIGEgYml0IG9kZCwK
YnV0IGxvb2tzIGxpa2UgaXQgY291bGQgYmUgY29ycmVjdCBnaXZlbiBUSHA9PTQwIGFuZCBUSGU9
PTg4LgoKQWxzbyBub3Qgc3VyZSBhYm91dCB0aGUgdGhlIHZlcnRpY2FsIGZyb250IHZzLiBiYWNr
IHBvcmNoLgpNYXliZSB0cnkgc3dhcHBpbmcgdGhvc2UgYXJvdW5kPwoKPiAgwqDCoMKgwqDCoMKg
wqDCoCBEUk1fTU9ERV9GTEFHX05IU1lOQyB8IERSTV9NT0RFX0ZMQUdfTlZTWU5DKSwKCk5vdCBz
dXJlIHRob3NlIGFyZSBjb3JyZWN0LiBJdCBkb2VzIHNheXMgImFjdGl2ZSBsb3ciIGJ1dCB0aGVu
IGl0IGhhcwp0aGF0ICJzeW5jIHB1bHNlIGhpZ2gsIHBvbGFyaXR5KyIgc3R1ZmYgYXMgd2VsbC4g
Q29uZnVzaW5nLiBDb3VsZApiZSB3b3J0aCBhIHNob3QgdG8gdHJ5IGZsaXBwaW5nIHRoZXNlLgoK
LS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
