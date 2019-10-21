Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03BDEDA3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 15:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157076E0D1;
	Mon, 21 Oct 2019 13:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A126E0CC;
 Mon, 21 Oct 2019 13:33:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 06:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="209444857"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 06:33:28 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 16:33:28 +0300
Date: Mon, 21 Oct 2019 16:33:28 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191021133328.GI2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
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
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTE6NDg6MjJQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDExOjM3IFBNIEJqb3JuIEhlbGdhYXMgPGhl
bGdhYXNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gWytjYyBsaW51eC1hY3BpXQo+ID4KPiA+
IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA5OjE4OjMyUE0gKzAyMDAsIEthcm9sIEhlcmJzdCB3
cm90ZToKPiA+ID4gYnV0IHNldHRpbmcgdGhlIFBDSV9ERVZfRkxBR1NfTk9fRDMgZmxhZyBkb2Vz
IHByZXZlbnQgdXNpbmcgdGhlCj4gPiA+IHBsYXRmb3JtIG1lYW5zIG9mIHB1dHRpbmcgdGhlIGRl
dmljZSBpbnRvIEQzY29sZCwgcmlnaHQ/IFRoYXQncwo+ID4gPiBhY3R1YWxseSB3aGF0IHNob3Vs
ZCBzdGlsbCBoYXBwZW4sIGp1c3QgdGhlIEQzaG90IHN0ZXAgc2hvdWxkIGJlCj4gPiA+IHNraXBw
ZWQuCj4gPgo+ID4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgd2hlbiB3ZSBwdXQgYSBkZXZp
Y2UgaW4gRDNjb2xkIG9uIGFuIEFDUEkKPiA+IHN5c3RlbSwgd2UgZG8gc29tZXRoaW5nIGxpa2Ug
dGhpczoKPiA+Cj4gPiAgIHBjaV9zZXRfcG93ZXJfc3RhdGUoRDNjb2xkKQo+ID4gICAgIGlmIChQ
Q0lfREVWX0ZMQUdTX05PX0QzKQo+ID4gICAgICAgcmV0dXJuIDAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwtLSBub3RoaW5nIGF0IGFsbCBpZiBxdWlya2VkCj4gPiAgICAgcGNp
X3Jhd19zZXRfcG93ZXJfc3RhdGUKPiA+ICAgICAgIHBjaV93cml0ZV9jb25maWdfd29yZChQQ0lf
UE1fQ1RSTCwgRDNob3QpICA8LS0gc2V0IHRvIEQzaG90Cj4gPiAgICAgX19wY2lfY29tcGxldGVf
cG93ZXJfdHJhbnNpdGlvbihEM2NvbGQpCj4gPiAgICAgICBwY2lfcGxhdGZvcm1fcG93ZXJfdHJh
bnNpdGlvbihEM2NvbGQpCj4gPiAgICAgICAgIHBsYXRmb3JtX3BjaV9zZXRfcG93ZXJfc3RhdGUo
RDNjb2xkKQo+ID4gICAgICAgICAgIGFjcGlfcGNpX3NldF9wb3dlcl9zdGF0ZShEM2NvbGQpCj4g
PiAgICAgICAgICAgICBhY3BpX2RldmljZV9zZXRfcG93ZXIoQUNQSV9TVEFURV9EM19DT0xEKQo+
ID4gICAgICAgICAgICAgICAuLi4KPiA+ICAgICAgICAgICAgICAgICBhY3BpX2V2YWx1YXRlX29i
amVjdCgiX09GRiIpICAgICA8LS0gc2V0IHRvIEQzY29sZAo+ID4KPiA+IEkgZGlkIG5vdCB1bmRl
cnN0YW5kIHRoZSBjb25uZWN0aW9uIHdpdGggcGxhdGZvcm0gKEFDUEkpIHBvd2VyCj4gPiBtYW5h
Z2VtZW50IGZyb20geW91ciBwYXRjaC4gIEl0IHNvdW5kcyBsaWtlIHlvdSB3YW50IHRoaXMgZW50
aXJlIHBhdGgKPiA+IGV4Y2VwdCB0aGF0IHlvdSB3YW50IHRvIHNraXAgdGhlIFBDSV9QTV9DVFJM
IHdyaXRlPwo+ID4KPiAKPiBleGFjdGx5LiBJIGFtIHJ1bm5pbmcgd2l0aCB0aGlzIHdvcmthcm91
bmQgZm9yIGEgd2hpbGUgbm93IGFuZCBuZXZlcgo+IGhhZCBhbnkgZmFpbHMgd2l0aCBpdCBhbnlt
b3JlLiBUaGUgR1BVIGdldHMgdHVybmVkIG9mZiBjb3JyZWN0bHkgYW5kIEkKPiBzZWUgdGhlIHNh
bWUgcG93ZXIgc2F2aW5ncywganVzdCB0aGF0IHRoZSBHUFUgY2FuIGJlIHBvd2VyZWQgb24gYWdh
aW4uCj4gCj4gPiBUaGF0IHNlZW1zIGxpa2Ugc29tZXRoaW5nIFJhZmFlbCBzaG91bGQgd2VpZ2gg
aW4gb24uICBJIGRvbid0IGtub3cKPiA+IHdoeSB3ZSBzZXQgdGhlIGRldmljZSB0byBEM2hvdCB3
aXRoIFBDSV9QTV9DVFJMIGJlZm9yZSB1c2luZyB0aGUgQUNQSQo+ID4gbWV0aG9kcywgYW5kIEkg
ZG9uJ3Qga25vdyB3aGF0IHRoZSBlZmZlY3Qgb2Ygc2tpcHBpbmcgdGhhdCBpcy4gIEl0Cj4gPiBz
ZWVtcyBhIGxpdHRsZSBtZXNzeSB0byBzbGljZSBvdXQgdGhpcyB0aW55IHBpZWNlIGZyb20gdGhl
IG1pZGRsZSwgYnV0Cj4gPiBtYXliZSBpdCBtYWtlcyBzZW5zZS4KPiA+Cj4gCj4gYWZhaWsgd2hl
biBJIHdhcyB0YWxraW5nIHdpdGggb3RoZXJzIGluIHRoZSBwYXN0IGFib3V0IGl0LCBXaW5kb3dz
IGlzCj4gZG9pbmcgdGhhdCBiZWZvcmUgdXNpbmcgQUNQSSBjYWxscywgYnV0IG1heWJlIHRoZXkg
aGF2ZSBzb21lIHNpbWlsYXIKPiB3b3JrYXJvdW5kcyBmb3IgY2VydGFpbiBpbnRlbCBicmlkZ2Vz
IGFzIHdlbGw/IEkgYW0gc3VyZSBpdCBhZmZlY3RzCj4gbW9yZSB0aGFuIHRoZSBvbmUgSSBhbSBi
bGFja2xpc3RpbmcgaGVyZSwgYnV0IEkgcmF0aGVyIHdhbnQgdG8gY2hlY2sKPiBlYWNoIGRldmlj
ZSBiZWZvcmUgYmxhY2tsaXN0aW5nIGFsbCBrYWJ5bGFrZSBhbmQgc2t5IGxha2UgYnJpZGdlcyAo
YXMKPiB0aG9zZSBhcmUgdGhlIG9uZXMgd2VyZSB0aGlzIGlzc3VlIGNhbiBiZSBvYnNlcnZlZCku
Cj4gCj4gU2FkbHkgd2UgaGFkIG5vIGx1Y2sgZ2V0dGluZyBhbnkgaW5mb3JtYXRpb24gYWJvdXQg
c3VjaCB3b3JrYXJvdW5kIG91dAo+IG9mIE52aWRpYSBvciBJbnRlbC4KCkkgcmVhbGx5IHdvdWxk
IGxpa2UgdG8gcHJvdmlkZSB5b3UgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBzdWNoCndvcmthcm91
bmQgYnV0IEknbSBub3QgYXdhcmUgb2YgYW55IDstKSBJIGhhdmUgbm90IHNlZW4gYW55IGlzc3Vl
cyBsaWtlCnRoaXMgd2hlbiBEM2NvbGQgaXMgcHJvcGVybHkgaW1wbGVtZW50ZWQgaW4gdGhlIHBs
YXRmb3JtLiAgVGhhdCdzIHdoeQpJJ20gYml0IHNrZXB0aWNhbCB0aGF0IHRoaXMgaGFzIGFueXRo
aW5nIHRvIGRvIHdpdGggc3BlY2lmaWMgSW50ZWwgUENJZQpwb3J0cy4gTW9yZSBsaWtlbHkgaXQg
aXMgc29tZSBwb3dlciBzZXF1ZW5jZSBpbiB0aGUgX09OL19PRkYoKSBtZXRob2RzCnRoYXQgaXMg
cnVuIGRpZmZlcmVudGx5IG9uIFdpbmRvd3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
