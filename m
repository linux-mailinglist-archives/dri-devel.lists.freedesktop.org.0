Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FCA17F1A
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 19:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49C689740;
	Wed,  8 May 2019 17:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6A5891EB;
 Wed,  8 May 2019 17:32:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 10:32:09 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 08 May 2019 10:32:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 May 2019 20:32:06 +0300
Date: Wed, 8 May 2019 20:32:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v6 2/6] drm: Add a VSC structure for handling Pixel
 Encoding/Colorimetry Formats
Message-ID: <20190508173206.GW24299@intel.com>
References: <20190508081757.28042-1-gwan-gyeong.mun@intel.com>
 <20190508081757.28042-3-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508081757.28042-3-gwan-gyeong.mun@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMTE6MTc6NTNBTSArMDMwMCwgR3dhbi1neWVvbmcgTXVu
IHdyb3RlOgo+IFNEUCBWU0MgSGVhZGVyIGFuZCBEYXRhIEJsb2NrIGZvbGxvdyBEUCAxLjRhIHNw
ZWMsIHNlY3Rpb24gMi4yLjUuNy41LAo+IGNoYXB0ZXIgIlZTQyBTRFAgUGF5bG9hZCBmb3IgUGl4
ZWwgRW5jb2RpbmcvQ29sb3JpbWV0cnkgRm9ybWF0Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHd2Fu
LWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gLS0t
Cj4gIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+IGlu
ZGV4IDk3Y2U3OTBhNWI1YS4uMzc5M2JlYTdiN2ZlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+IEBA
IC0xMDk2LDYgKzEwOTYsMjMgQEAgc3RydWN0IGVkcF92c2NfcHNyIHsKPiAgCXU4IERCOF8zMVsy
NF07IC8qIFJlc2VydmVkICovCj4gIH0gX19wYWNrZWQ7Cj4gIAo+ICtzdHJ1Y3QgZHBfdnNjX3Nk
cCB7Cj4gKwlzdHJ1Y3QgZHBfc2RwX2hlYWRlciBzZHBfaGVhZGVyOwo+ICsJdTggREIwOyAvKiBT
dGVyZW8gSW50ZXJmYWNlICovCj4gKwl1OCBEQjE7IC8qIDAgLSBQU1IgU3RhdGU7IDEgLSBVcGRh
dGUgUkZCOyAyIC0gQ1JDIFZhbGlkICovCj4gKwl1OCBEQjI7IC8qIENSQyB2YWx1ZSBiaXRzIDc6
MCBvZiB0aGUgUiBvciBDciBjb21wb25lbnQgKi8KPiArCXU4IERCMzsgLyogQ1JDIHZhbHVlIGJp
dHMgMTU6OCBvZiB0aGUgUiBvciBDciBjb21wb25lbnQgKi8KPiArCXU4IERCNDsgLyogQ1JDIHZh
bHVlIGJpdHMgNzowIG9mIHRoZSBHIG9yIFkgY29tcG9uZW50ICovCj4gKwl1OCBEQjU7IC8qIENS
QyB2YWx1ZSBiaXRzIDE1Ojggb2YgdGhlIEcgb3IgWSBjb21wb25lbnQgKi8KPiArCXU4IERCNjsg
LyogQ1JDIHZhbHVlIGJpdHMgNzowIG9mIHRoZSBCIG9yIENiIGNvbXBvbmVudCAqLwo+ICsJdTgg
REI3OyAvKiBDUkMgdmFsdWUgYml0cyAxNTo4IG9mIHRoZSBCIG9yIENiIGNvbXBvbmVudCAqLwo+
ICsJdTggREI4XzE1WzhdOyAgLyogUmVzZXJ2ZWQgKi8KPiArCXU4IERCMTY7IC8qIFBpeGVsIEVu
Y29kaW5nIGFuZCBDb2xvcmltZXRyeSBGb3JtYXRzICovCj4gKwl1OCBEQjE3OyAvKiBEeW5hbWlj
IFJhbmdlIGFuZCBDb21wb25lbnQgQml0IERlcHRoICovCj4gKwl1OCBEQjE4OyAvKiBDb250ZW50
IFR5cGUgKi8KPiArCXU4IERCMTlfMzFbMTNdOyAvKiBSZXNlcnZlZCAqLwo+ICt9IF9fcGFja2Vk
OwoKSXNuJ3QgdGhpcyB0aGUgc2FtZSB0aGluZyB3ZSBoYXZlIGZvciBlZHAgYWxyZWFkeT8gSnVz
dCByZW5hbWUgdGhlIGVkcApzdHJ1Y3QgYW5kIGFkZCB0aGUgbWlzc2luZyBzdHVmZj8KCj4gKwo+
ICAjZGVmaW5lIEVEUF9WU0NfUFNSX1NUQVRFX0FDVElWRQkoMTw8MCkKPiAgI2RlZmluZSBFRFBf
VlNDX1BTUl9VUERBVEVfUkZCCQkoMTw8MSkKPiAgI2RlZmluZSBFRFBfVlNDX1BTUl9DUkNfVkFM
VUVTX1ZBTElECSgxPDwyKQo+IC0tIAo+IDIuMjEuMAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
