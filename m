Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928711426F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 15:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE196E096;
	Thu,  5 Dec 2019 14:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BF96E096
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 14:18:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 06:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; d="scan'208";a="263293033"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 05 Dec 2019 06:18:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Dec 2019 16:18:39 +0200
Date: Thu, 5 Dec 2019 16:18:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Eric Engestrom <eric.engestrom@intel.com>
Subject: Re: [PATCH libdrm v4] modetest: Use floating vrefresh while dumping
 mode
Message-ID: <20191205141839.GG1208@intel.com>
References: <1575383856-29959-1-git-send-email-devarsh.thakkar@xilinx.com>
 <20191205131632.sozkmb4kechung7o@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205131632.sozkmb4kechung7o@intel.com>
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
Cc: Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDE6MTY6MzJQTSArMDAwMCwgRXJpYyBFbmdlc3Ryb20g
d3JvdGU6Cj4gT24gVHVlc2RheSwgMjAxOS0xMi0wMyAwNjozNzozNiAtMDgwMCwgRGV2YXJzaCBU
aGFra2FyIHdyb3RlOgo+ID4gQWRkIGZ1bmN0aW9uIHRvIGRlcml2ZSBmbG9hdGluZyB2YWx1ZSBv
ZiB2ZXJ0aWNhbAo+ID4gcmVmcmVzaCByYXRlIGZyb20gZHJtIG1vZGUgdXNpbmcgcGl4ZWwgY2xv
Y2ssCj4gPiBob3Jpem9udGFsIHRvdGFsIHNpemUgYW5kIHZlcnRpY2FsIHRvdGFsIHNpemUuCj4g
PiAKPiA+IFVzZSB0aGlzIGZ1bmN0aW9uIHRvIGZpbmQgc3VpdGFibGUgbW9kZSBoYXZpbmcgdnJl
ZnJlc2gKPiA+IHZhbHVlIHdoaWNoIGlzIG1hdGNoaW5nIHdpdGggdXNlciBwcm92aWRlZCB2cmVm
cmVzaCB2YWx1ZS4KPiA+IAo+ID4gSWYgdXNlciBkb2Vzbid0IHByb3ZpZGUgYW55IHZyZWZyZXNo
IHZhbHVlIGluIGFyZ3MgdGhlbgo+ID4gdXBkYXRlIHZlcnRpY2FsIHJlZnJlc2ggcmF0ZSB2YWx1
ZSBpbiBwaXBlIGFyZ3MgdXNpbmcgdGhpcwo+ID4gZnVuY3Rpb24uCj4gPiAKPiA+IEFsc28gdXNl
IHRoaXMgZnVuY3Rpb24gZm9yIHByaW50aW5nIGZsb2F0aW5nIHZyZWZyZXNoIHdoaWxlCj4gPiBk
dW1waW5nIGFsbCBhdmFpbGFibGUgbW9kZXMuCj4gPiAKPiA+IFRoaXMgd2lsbCBnaXZlIG1vcmUg
YWNjdXJhdGUgcGljdHVyZSB0byB1c2VyIGZvciBhdmFpbGFibGUgbW9kZXMKPiA+IGRpZmZlcmVu
dGlhdGVkIGJ5IGZsb2F0aW5nIHZlcnRpY2FsIHJlZnJlc2ggcmF0ZSBhbmQgaGVscCB1c2VyCj4g
PiBzZWxlY3QgbW9yZSBhcHByb3ByaWF0ZSBtb2RlIHVzaW5nIHN1aXRhYmxlIHJlZnJlc2ggcmF0
ZSB2YWx1ZS4KPiAKPiBBbnkgY2hhbmNlIHlvdSBjb3VsZCB1c2UgdGhlIG1lcmdlIHJlcXVlc3Rz
IGluZnJhIGluc3RlYWQgb2YgcGF0Y2hlcyBvbgo+IHRoZSBtYWlsaW5nIGxpc3Q/IDopCj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZHJtL21lcmdlX3JlcXVlc3RzCgpZdWNr
LiBJJ2xsIG5vdCB1c2UgdGhhdCBhdCBsZWFzdC4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
