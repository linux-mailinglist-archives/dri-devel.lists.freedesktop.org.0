Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E010F97A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6136E420;
	Tue,  3 Dec 2019 08:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2338924F;
 Mon,  2 Dec 2019 13:09:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 05:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="218363457"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2019 05:09:07 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iblRq-0002ET-Sb; Mon, 02 Dec 2019 15:09:06 +0200
Date: Mon, 2 Dec 2019 15:09:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] pinctrl: baytrail: Add GPIO lookup and pinctrl-map
 for i915 DSI panel ctrl
Message-ID: <20191202130906.GH32742@smile.fi.intel.com>
References: <20191129185836.2789-1-hdegoede@redhat.com>
 <20191129185836.2789-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129185836.2789-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
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
Cc: linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDc6NTg6MzVQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBPbiBCYXkgVHJhaWwgZGV2aWNlcyB0aGUgTUlQSSBwb3dlciBvbi9vZmYgc2VxdWVu
Y2VzIGZvciBEU0kgTENEIHBhbmVscwo+IGRvIG5vdCBjb250cm9sIHRoZSBMQ0QgcGFuZWwgYW5k
IGJhY2tsaWdodCBHUElPcy4gU28gZmFyIHdlIGhhdmUgYmVlbgo+IHJlbHlpbmcgb24gdGhlc2Ug
R1BJT3MgYmVpbmcgY29uZmlndXJlZCBhcyBvdXRwdXQgYW5kIGRyaXZlbiBoaWdoIGJ5Cj4gdGhl
IFZpZGVvIEJJT1MgKEdPUCkgd2hlbiBpdCBpbml0aWFsaXplcyB0aGUgcGFuZWwuCj4gCj4gVGhp
cyBkb2VzIG5vdCB3b3JrIHdoZW4gdGhlIGRldmljZSBpcyBib290ZWQgd2l0aCBhIEhETUkgbW9u
aXRvciBjb25uZWN0ZWQKPiBhcyB0aGVuIHRoZSBHT1Agd2lsbCBpbml0aWFsaXplIHRoZSBIRE1J
IGluc3RlYWQgb2YgdGhlIHBhbmVsLCBsZWF2aW5nIHRoZQo+IHBhbmVsIGJsYWNrLCBldmVuIHRo
b3VnaCB0aGUgaTkxNSBkcml2ZXIgdHJpZXMgdG8gb3V0cHV0IGFuIGltYWdlIHRvIGl0Lgo+IAo+
IExpa2V3aXNlIG9uIHNvbWUgZGV2aWNlLW1vZGVscyB3aGVuIHRoZSBHT1AgZG9lcyBub3QgaW5p
dGlhbGl6ZSB0aGUgRFNJCj4gcGFuZWwgaXQgYWxzbyBsZWF2ZXMgdGhlIG11eCBvZiB0aGUgUFdN
MCBwaW4gaW4gZ2VuZXJpYyBHUElPIG1vZGUgaW5zdGVhZAo+IG9mIG11eGluZyBpdCB0byB0aGUg
UFdNIGNvbnRyb2xsZXIuCj4gCj4gVGhpcyBjb21taXQgYWRkcyBHUElPIGxvb2t1cHMgYW5kIGEg
cGluY3RybC1tYXAgd2hpY2ggdGhlIGk5MTUgZHJpdmVyIGNhbgo+IHVzZSB0byBnZXQgdGhlIHBh
bmVsLSBhbmQgYmFja2xpZ2h0LWVuYWJsZSBHUElPcyBhbmQgdG8gbXV4IHRoZSBQV00wIHBpbgo+
IHRvIHRoZSBQV00gY29udHJvbGxlci4KPiAKPiBOb3RlIGl0IG1heSBzZWVtIGEgYml0IHdlaXJk
IHRvIGFkZCBhIHBpbmN0cmwtbWFwIGZvciB0aGUgaTkxNSBkcml2ZXIsCj4gc28gdGhhdCBpdCBj
YW4gc2V0IHRoZSBQV00wIHBpbm11eC4gRG9pbmcgdGhpcyBmcm9tIHRoZSBMUFNTIFBXTSBkcml2
ZXIKPiB3b3VsZCBiZSBtb3JlIGxvZ2ljYWwuIEJ1dCB0aGUgb25seSB0aGluZyB0ZWxsaW5nIHVz
IHRoYXQgdGhlIHBpbiBzaG91bGQKPiBkZWZpbml0ZWx5IGJlIG11eGVkIHRvIHRoZSBQV00gY29u
dHJvbGxlciBpcyB0aGUgVkJUIHRvIHdoaWNoIHRoZSBQV00KPiBkcml2ZXIgZG9lcyBub3QgaGF2
ZSBhY2Nlc3MuCgpNeSBjb25jZXJuIGhlcmUsIGFzIG9uZSBvZiBMaW51cycsIGlzIGEgcG9sbHV0
aW9uIHRoZSBkcml2ZXIgd2l0aCBib2FyZCBjb2RlLgpBcmVuJ3Qgd2UgYWJsZSB0byBzcGxpdCB0
aGlzIHRvIGEgc2VwYXJhdGUgZmlsZSB1bmRlciBQRHg4NiByZWFsbSBhbmQgZG8gbmFzdHkKcXVp
cmtzIHRoZXJlPwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
