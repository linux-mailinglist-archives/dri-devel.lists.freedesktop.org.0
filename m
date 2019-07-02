Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361055D822
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 00:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739746E095;
	Tue,  2 Jul 2019 22:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240106E095;
 Tue,  2 Jul 2019 22:45:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 15:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,444,1557212400"; d="scan'208";a="171943496"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2019 15:45:36 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jul 2019 15:45:36 -0700
Received: from crsmsx104.amr.corp.intel.com (172.18.63.32) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jul 2019 15:45:36 -0700
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.124]) by
 CRSMSX104.amr.corp.intel.com ([169.254.6.189]) with mapi id 14.03.0439.000;
 Tue, 2 Jul 2019 16:45:34 -0600
From: "Weiny, Ira" <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
Subject: RE: dev_pagemap related cleanups v4
Thread-Topic: dev_pagemap related cleanups v4
Thread-Index: AQHVL9UWGRaDoyThvUmAcd/teNbddKa10fGAgAI+rID//8OxIA==
Date: Tue, 2 Jul 2019 22:45:34 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E79DEA747@CRSMSX101.amr.corp.intel.com>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701082517.GA22461@lst.de> <20190702184201.GO31718@mellanox.com>
In-Reply-To: <20190702184201.GO31718@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjc2ZTdhMmQtMWM5Zi00ZTAzLWJmY2UtNGZjYTkyNTYxNjZjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiV2VKQ1gzZk1WV2hvSmx0bEFBUjRyWFNOT0JNemtQSkdVaHlIbkdveVFhVFdxSlh0T2h3ZytucCt4dWx6djFPTSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [172.18.205.10]
MIME-Version: 1.0
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAKPiBPbiBNb24sIEp1bCAwMSwgMjAxOSBhdCAxMDoyNToxN0FNICswMjAwLCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiA+IEFuZCBJJ3ZlIGRlbW9uc3RyYXRlZCB0aGF0IEkgY2FuJ3Qgc2Vu
ZCBwYXRjaCBzZXJpZXMuLiAgV2hpbGUgdGhpcyBoYXMKPiA+IGFsbCB0aGUgcmlnaHQgcGF0Y2hl
cywgaXQgYWxzbyBoYXMgdGhlIGV4dHJhIHBhdGNoZXMgYWxyZWFkeSBpbiB0aGUKPiA+IGhtbSB0
cmVlLCBhbmQgZm91ciBleHRyYSBwYXRjaGVzIEkgd2FudGVkIHRvIHNlbmQgb25jZSB0aGlzIHNl
cmllcyBpcwo+ID4gbWVyZ2VkLiAgSSdsbCBnaXZlIHVwIGZvciBub3csIHBsZWFzZSB1c2UgdGhl
IGdpdCB1cmwgZm9yIGFueXRoaW5nCj4gPiBzZXJpb3VzLCBhcyBpdCBjb250YWlucyB0aGUgcmln
aHQgdGhpbmcuCj4gCj4gT2theSwgSSBzb3J0ZWQgaXQgYWxsIG91dCBhbmQgdGVtcG9yYXJpbHkg
cHV0IGl0IGhlcmU6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2pndW50aG9ycGUvbGludXgvY29t
bWl0cy9obW0KPiAKPiBCaXQgaW52b2x2ZWQgam9iOgo+IC0gVG9vayBJcmEncyB2NCBwYXRjaCBp
bnRvIGhtbS5naXQgYW5kIGNvbmZpcm1lZCBpdCBtYXRjaGVzIHdoYXQKPiAgIEFuZHJldyBoYXMg
aW4gbGludXgtbmV4dCBhZnRlciBhbGwgdGhlIGZpeHVwcwoKTG9va2luZyBhdCB0aGUgZmluYWwg
YnJhbmNoIHNlZW1zIGdvb2QuCgpJcmEKCj4gLSBDaGVja2VkIHlvdXIgZ2l0aHViIHY0IGFuZCB0
aGUgdjMgdGhhdCBoaXQgdGhlIG1haWxpbmcgbGlzdCB3ZXJlCj4gICBzdWJzdGFudGlhbGx5IHNp
bWlsYXIgKEkgbmV2ZXIgZGlkIGdldCBhIGNsZWFuIHY0KSBhbmQgbGFyZ2VseQo+ICAgd2VudCB3
aXRoIHRoZSBnaXRodWIgdmVyc2lvbgo+IC0gQmFzZWQgQ0gncyB2NCBzZXJpZXMgb24gLXJjNyBh
bmQgcHV0IGJhY2sgdGhlIHJlbW92YWwgaHVuayBpbiBzd2FwLmMKPiAgIHNvIGl0IGNvbXBpbGVz
Cj4gLSBNZXJnZSdkIENIJ3Mgc2VyaWVzIHRvIGhtbS5naXQgYW5kIGZpeGVkIGFsbCB0aGUgY29u
ZmxpY3RzIHdpdGggSXJhCj4gICBhbmQgUmFscGgncyBwYXRjaGVzIChzdWNoIHRoYXQgc3dhcC5j
IHJlbWFpbnMgdW5jaGFuZ2VkKQo+IC0gQWRkZWQgRGFuJ3MgYWNrJ3MgYW5kIHRlc3RlZC1ieSdz
Cj4gCj4gSSB0aGluayB0aGlzIGZhaXJseSBjbG9zZWx5IGZvbGxvd3Mgd2hhdCB3YXMgcG9zdGVk
IHRvIHRoZSBtYWlsaW5nIGxpc3QuCj4gCj4gQXMgaXQgd2FzIG1vcmUgdGhhbiBhIHNpbXBsZSAn
Z2l0IGFtJywgSSdsbCBsZXQgaXQgc2l0IG9uIGdpdGh1YiB1bnRpbCBJIGhlYXIgT0sncwo+IHRo
ZW4gSSdsbCBtb3ZlIGl0IHRvIGtlcm5lbC5vcmcncyBobW0uZ2l0IGFuZCBpdCB3aWxsIGhpdCBs
aW51eC1uZXh0LiAwLWRheQo+IHNob3VsZCBhbHNvIHJ1biBvbiB0aGlzIHdob2xlIHRoaW5nIGZy
b20gbXkgZ2l0aHViLgo+IAo+IFdoYXQgSSBrbm93IGlzIG91dHN0YW5kaW5nOgo+ICAtIFRoZSBj
b25mbGljdGluZyBBUk0gcGF0Y2hlcywgSSB1bmRlcnN0YW5kIEFuZHJldyB3aWxsIGhhbmRsZSB0
aGVzZQo+ICAgIHBvc3QtbGludXgtbmV4dAo+ICAtIFRoZSBjb25mbGljdCB3aXRoIEFNRCBHUFUg
aW4gLW5leHQsIEkgYW0gd2FpdGluZyB0byBoZWFyIGZyb20gQU1ECj4gCj4gT3RoZXJ3aXNlIEkg
dGhpbmsgd2UgYXJlIGRvbmUgd2l0aCBobW0uZ2l0IGZvciB0aGlzIGN5Y2xlLgo+IAo+IFVuZm9y
dHVuYXRlbHkgdGhpcyBpcyBzdGlsbCBub3QgZW5vdWdoIHRvIHByb2dyZXNzIHJkbWEncyBPRFAs
IHNvIHdlIHdpbGwgbmVlZAo+IHRvIGRvIHRoaXMgYWdhaW4gbmV4dCBjeWNsZSA6KCBJJ2xsIGJl
IHdvcmtpbmcgb24gcGF0Y2hlcyBvbmNlIEkgZ2V0IGFsbCB0aGUKPiBtZXJnZSB3aW5kb3cgcHJl
cCBJIGhhdmUgdG8gZG8gZG9uZS4KPiAKPiBSZWdhcmRzLAo+IEphc29uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
