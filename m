Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37118DC6B6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 16:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2B6EB59;
	Fri, 18 Oct 2019 14:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F45C6EB58;
 Fri, 18 Oct 2019 14:00:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 07:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="280234107"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 18 Oct 2019 07:00:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Oct 2019 17:00:20 +0300
Date: Fri, 18 Oct 2019 17:00:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v7] unstable/drm-lease: DRM lease protocol support
Message-ID: <20191018140020.GD1208@intel.com>
References: <20191018122130.0f880724@eldfell.localdomain>
 <BXSMP84X56T9.317VNFYFVMCWW@homura>
 <20191018164329.412b14ca@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018164329.412b14ca@eldfell.localdomain>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, wayland-devel@lists.freedesktop.org,
 Drew DeVault <sir@cmpwn.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDQ6NDM6MjlQTSArMDMwMCwgUGVra2EgUGFhbGFuZW4g
d3JvdGU6Cj4gT24gRnJpLCAxOCBPY3QgMjAxOSAwNzo1NDo1MCAtMDQwMAo+ICJEcmV3IERlVmF1
bHQiIDxzaXJAY21wd24uY29tPiB3cm90ZToKPiAKPiA+IE9uIEZyaSBPY3QgMTgsIDIwMTkgYXQg
MTI6MjEgUE0gUGVra2EgUGFhbGFuZW4gd3JvdGU6Cj4gPiA+IE9uZSB0aGluZyBJIGRpZCBub3Qg
a25vdyB0aGUgbGFzdCB0aW1lIHdhcyB0aGF0IGFwcGFyZW50bHkKPiA+ID4gc3lzdGVtZC1sb2dp
bmQgbWF5IG5vdCBsaWtlIHRvIGdpdmUgb3V0IG5vbi1tYXN0ZXIgRFJNIGZkcy4gVGhhdCBtaWdo
dAo+ID4gPiBuZWVkIGZpeGluZyBpbiBsb2dpbmQgaW1wbGVtZW50YXRpb25zLiBJIGhvcGUgc29t
ZW9uZSB3b3VsZCBzdGVwIHVwIHRvCj4gPiA+IGxvb2sgaW50byB0aGF0Lgo+ID4gPgo+ID4gPiBU
aGlzIHByb3RvY29sIGFpbXMgdG8gZGVsaXZlciBhIGhhcm1sZXNzICJyZWFkLW9ubHkiIERSTSBk
ZXZpY2UgZmlsZQo+ID4gPiBkZXNjcmlwdGlvbiB0byBhIGNsaWVudCwgc28gdGhhdCB0aGUgY2xp
ZW50IGNhbiBlbnVtZXJhdGUgYWxsIERSTQo+ID4gPiByZXNvdXJjZXMsIGZldGNoIEVESUQgYW5k
IG90aGVyIHByb3BlcnRpZXMgdG8gYmUgYWJsZSB0byBkZWNpZGUgd2hpY2gKPiA+ID4gY29ubmVj
dG9yIGl0IHdvdWxkIHdhbnQgdG8gbGVhc2UuIFRoZSBjbGllbnQgc2hvdWxkIG5vdCBiZSBhYmxl
IHRvCj4gPiA+IGNoYW5nZSBhbnkgS01TIHN0YXRlIHRocm91Z2ggdGhpcyBmZCwgYW5kIGl0IHNo
b3VsZCBub3QgYmUgYWJsZSB0byBlLmcuCj4gPiA+IHNweSBvbiBkaXNwbGF5IGNvbnRlbnRzLiBU
aGUgYXNzdW1wdGlvbiBpcyB0aGF0IGEgbm9uLW1hc3RlciBEUk0gZmQKPiA+ID4gZnJvbSBhIGZy
ZXNoIG9wZW4oKSB3b3VsZCBiZSBmaW5lIGZvciB0aGlzLCBidXQgaXMgaXQ/ICAKPiA+IAo+ID4g
V2hhdCBJIGRvIGZvciB3bHJvb3RzIGlzIGNhbGwgZHJtR2V0RGV2aWNlTmFtZUZyb21GZDIsIHdo
aWNoIHJldHVybnMgdGhlCj4gPiBwYXRoIHRvIHRoZSBkZXZpY2UgZmlsZSwgYW5kIHRoZW4gSSBv
cGVuKCkgaXQgYW5kIHVzZQo+ID4gZHJtSXNNYXN0ZXIvZHJtRHJvcE1hc3RlciB0byBtYWtlIHN1
cmUgaXQncyBub3QgYSBtYXN0ZXIgZmQuIFRoaXMgc2VlbXMKPiA+IHRvIHdvcmsgY29ycmVjdGx5
IGluIHByYWN0aWNlLgo+IAo+IFRoYXQgaXMgbmljZS4KPiAKPiBQZXJzb25hbGx5IEknbSBzcGVj
aWZpY2FsbHkgd29ycmllZCBhYm91dCBhIHNldHVwIHdoZXJlIHRoZSB1c2VyIGhhcyBubwo+IGFj
Y2VzcyBwZXJtaXNzaW9ucyB0byBvcGVuIHRoZSBEUk0gZGV2aWNlIG5vZGUgZGlyZWN0bHksIGFz
IGlzIChvcgo+IHNob3VsZCBiZSkgdGhlIGNhc2Ugd2l0aCBpbnB1dCBkZXZpY2VzLgo+IAo+IEhv
d2V2ZXIsIHNpbmNlIERSTSBoYXMgdGhlIG1hc3RlciBjb25jZXB0IHdoaWNoIGlucHV0IGRldmlj
ZXMgZG8gbm90LAo+IG1heWJlIHRoZXJlIGlzIG5vIHJlYXNvbiB0byBwcmV2ZW50IGEgbm9ybWFs
IHVzZXIgZnJvbSBvcGVuaW5nIGEgRFJNCj4gZGV2aWNlIGRpcmVjdGx5LiBUaGF0IGlzLCBpZiBv
dXIgYXNzdW1wdGlvbiB0aGF0IGEgbm9uLW1hc3RlciBEUk0gZmQgaXMKPiBoYXJtbGVzcyBob2xk
cy4KCklmIHRoZXJlIGlzIG5vIG1hc3RlciB0aGVuIHRoZSBmaXJzdCBndXkgdG8gb3BlbiB0aGUg
ZGV2aWNlCmF1dG9tYWdpY2FsbHkgYmVjb21lcyB0aGUgbWFzdGVyLiBNYXliZSBhIHRoZW9yZXRp
Y2FsIERvUwp2ZWN0b3IgaWYgeW91IGNhbiBzbmVhayBpbiBhbmQgb3BlbiB0aGUgZGV2aWNlIGJl
dHdlZW4KZHJvcG1hc3Rlci9zZXRtYXN0ZXI/CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
