Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA7DEB93
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 14:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C766E02F;
	Mon, 21 Oct 2019 12:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B446E027;
 Mon, 21 Oct 2019 12:06:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 05:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="209431575"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 05:06:11 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 15:06:11 +0300
Date: Mon, 21 Oct 2019 15:06:11 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191021120611.GB2819@lahna.fi.intel.com>
References: <20191016144449.24646-1-kherbst@redhat.com>
 <20191021114017.GY2819@lahna.fi.intel.com>
 <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDI6MDA6NDZQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDE6NDAgUE0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEthcm9sLAo+ID4K
PiA+IFNvcnJ5IGZvciBjb21tZW50aW5nIGxhdGUsIEkganVzdCBjYW1lIGJhY2sgZnJvbSB2YWNh
dGlvbi4KPiA+Cj4gPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwNDo0NDo0OVBNICswMjAwLCBL
YXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+IEZpeGVzIHN0YXRlIHRyYW5zaXRpb25zIG9mIE52aWRp
YSBQYXNjYWwgR1BVcyBmcm9tIEQzY29sZCBpbnRvIGhpZ2hlciBkZXZpY2UKPiA+ID4gc3RhdGVz
Lgo+ID4gPgo+ID4gPiB2MjogY29udmVydCB0byBwY2lfZGV2IHF1aXJrCj4gPiA+ICAgICBwdXQg
YSBwcm9wZXIgdGVjaG5pY2FsIGV4cGxhbmF0aW9uIG9mIHRoZSBpc3N1ZSBhcyBhIGluLWNvZGUg
Y29tbWVudAo+ID4gPiB2MzogZGlzYWJsZSBpdCBvbmx5IGZvciBjZXJ0YWluIGNvbWJpbmF0aW9u
cyBvZiBpbnRlbCBhbmQgbnZpZGlhIGhhcmR3YXJlCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgo+ID4gPiBDYzogQmpvcm4gSGVsZ2Fh
cyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiA+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+Cj4gPiA+IENjOiBSYWZhZWwgSi4gV3lzb2NraSA8cmp3QHJqd3lzb2NraS5uZXQ+Cj4g
PiA+IENjOiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+Cj4gPiA+
IENjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCj4gPiA+IENjOiBsaW51eC1wbUB2Z2VyLmtl
cm5lbC5vcmcKPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4g
Q2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVy
cy9wY2kvcGNpLmMgICAgfCAxMSArKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL3BjaS9xdWlya3Mu
YyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPgo+
ID4gSSBtYXkgYmUgbWlzc2luZyBzb21ldGhpbmcgYnV0IHdoeSB5b3UgY2FuJ3QgZG8gdGhpcyBp
biB0aGUgbm91dmVhdQo+ID4gZHJpdmVyIGl0c2VsZj8KPiAKPiBXaGF0IGRvIHlvdSBtZWFuIHBy
ZWNpc2VseT8gTW92ZSB0aGUgcXVpcmsgaW50byBub3V2ZWF1LCBidXQga2VlcCB0aGUKPiBjaGFu
Z2VzIHRvIHBjaSBjb3JlPwoKTm8sIGp1c3QgYmxvY2sgcnVudGltZSBQTSBmcm9tIHRoZSBkZXZp
Y2UgaW4gbm91dmVhdSBkcml2ZXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
