Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DAB881C0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 19:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E78A6EE61;
	Fri,  9 Aug 2019 17:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50FE6EE61;
 Fri,  9 Aug 2019 17:56:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 10:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="350560074"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 09 Aug 2019 10:56:24 -0700
Received: from crsmsx151.amr.corp.intel.com (172.18.7.86) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 9 Aug 2019 10:56:23 -0700
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.115]) by
 CRSMSX151.amr.corp.intel.com ([169.254.3.186]) with mapi id 14.03.0439.000;
 Fri, 9 Aug 2019 11:56:21 -0600
From: "Weiny, Ira" <ira.weiny@intel.com>
To: Jan Kara <jack@suse.cz>
Subject: RE: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Thread-Topic: [PATCH 00/34] put_user_pages(): miscellaneous call sites
Thread-Index: AQHVSNjU1EYxEMQcyke2Y16AlWiV+abn98YAgAA6ZwCAABzEgIAAB8CAgABJHoCABynCAIAAAqCAgAC1jYCAAmuxgIAANKMg
Date: Fri, 9 Aug 2019 17:56:20 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E79E7F367@CRSMSX101.amr.corp.intel.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
 <20190807084649.GQ11812@dhcp22.suse.cz>
 <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
 <20190809083435.GA17568@quack2.suse.cz>
In-Reply-To: <20190809083435.GA17568@quack2.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjgzZWFlNTQtZDMwNC00YTZiLThiNDktMzI0ZWY3MGNjMDdiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY2tWUXpQWXg4RTZvTlVIZFwvOFVSVWNwbCs3V2JDTG5GcHNpZTB3bzRRaEhFUExOQzZXZGtLeFkzNUhuNjVBOEYifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "john.hubbard@gmail.com" <john.hubbard@gmail.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAKPiBPbiBXZWQgMDctMDgtMTkgMTk6MzY6MzcsIElyYSBXZWlueSB3cm90ZToKPiA+IE9uIFdl
ZCwgQXVnIDA3LCAyMDE5IGF0IDEwOjQ2OjQ5QU0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3cm90ZToK
PiA+ID4gPiBTbyBJIHRoaW5rIHlvdXIgZGVidWcgb3B0aW9uIGFuZCBteSBzdWdnZXN0ZWQgcmVu
YW1pbmcgc2VydmUgYSBiaXQKPiA+ID4gPiBkaWZmZXJlbnQgcHVycG9zZXMgKGFuZCB0aHVzIGJv
dGggbWFrZSBzZW5zZSkuIElmIHlvdSBkbyB0aGUKPiA+ID4gPiByZW5hbWluZywgeW91IGNhbiBq
dXN0IGdyZXAgdG8gc2VlIHVuY29udmVydGVkIHNpdGVzLiBBbHNvIHdoZW4KPiA+ID4gPiBzb21l
b25lIG1lcmdlcyBuZXcgR1VQIHVzZXIgKHVuYXdhcmUgb2YgdGhlIG5ldyBydWxlcykgd2hpbGUg
eW91Cj4gPiA+ID4gc3dpdGNoIEdVUCB0byB1c2UgcGlucyBpbnN0ZWFkIG9mIG9yZGluYXJ5IHJl
ZmVyZW5jZXMsIHlvdSdsbCBnZXQKPiA+ID4gPiBjb21waWxhdGlvbiBlcnJvciBpbiBjYXNlIG9m
IHJlbmFtaW5nIGluc3RlYWQgb2YgaGFyZCB0byBkZWJ1Zwo+ID4gPiA+IHJlZmNvdW50IGxlYWsg
d2l0aG91dCB0aGUgcmVuYW1pbmcuIEFuZCBzdWNoIGNvbmZsaWN0IGlzIGFsbW9zdAo+ID4gPiA+
IGJvdW5kIHRvIGhhcHBlbiBnaXZlbiB0aGUgc2l6ZSBvZiBHVVAgcGF0Y2ggc2V0Li4uIEFsc28g
dGhlCj4gPiA+ID4gcmVuYW1pbmcgc2VydmVzIGFnYWluc3QgdGhlICJjb2RpbmcgaW5lcnRpYSIg
LSBpLmUuLCBHVVAgaXMgYXJvdW5kIGZvcgo+IGFnZXMgc28gcGVvcGxlIGp1c3QgdXNlIGl0IHdp
dGhvdXQgY2hlY2tpbmcgYW55IGRvY3VtZW50YXRpb24gb3IgY29tbWVudHMuCj4gPiA+ID4gQWZ0
ZXIgc3dpdGNoaW5nIGhvdyBHVVAgd29ya3MsIHdoYXQgdXNlZCB0byBiZSBjb3JyZWN0IGlzbid0
Cj4gPiA+ID4gYW55bW9yZSBzbyByZW5hbWluZyB0aGUgZnVuY3Rpb24gc2VydmVzIGFzIGEgd2Fy
bmluZyB0aGF0Cj4gPiA+ID4gc29tZXRoaW5nIGhhcyByZWFsbHkgY2hhbmdlZC4KPiA+ID4KPiA+
ID4gRnVsbHkgYWdyZWVkIQo+ID4KPiA+IE9rIFByaW9yIHRvIHRoaXMgSSd2ZSBiZWVuIGJhc2lu
ZyBhbGwgbXkgd29yayBmb3IgdGhlIFJETUEvRlMgREFYCj4gPiBzdHVmZiBpbiBKb2hucyBwdXRf
dXNlcl9wYWdlcygpLi4uICAoSW5jbHVkaW5nIHdoZW4gSSBwcm9wb3NlZCBmYWlsaW5nCj4gPiB0
cnVuY2F0ZSB3aXRoIGEgbGVhc2UgaW4gSnVuZSBbMV0pCj4gPgo+ID4gSG93ZXZlciwgYmFzZWQg
b24gdGhlIHN1Z2dlc3Rpb25zIGluIHRoYXQgdGhyZWFkIGl0IGJlY2FtZSBjbGVhciB0aGF0Cj4g
PiBhIG5ldyBpbnRlcmZhY2Ugd2FzIGdvaW5nIHRvIG5lZWQgdG8gYmUgYWRkZWQgdG8gcGFzcyBp
biB0aGUgIlJETUEKPiA+IGZpbGUiIGluZm9ybWF0aW9uIHRvIEdVUCB0byBhc3NvY2lhdGUgZmls
ZSBwaW5zIHdpdGggdGhlIGNvcnJlY3QgcHJvY2Vzc2VzLi4uCj4gPgo+ID4gSSBoYXZlIG1hbnkg
ZHJhd2luZ3Mgb24gbXkgd2hpdGUgYm9hcmQgd2l0aCAiYSB3aG9sZSBsb3Qgb2YgbGluZXMiIG9u
Cj4gPiB0aGVtIHRvIG1ha2Ugc3VyZSB0aGF0IGlmIGEgcHJvY2VzcyBvcGVucyBhIGZpbGUsIG1t
YXBzIGl0LCBwaW5zIGl0Cj4gPiB3aXRoIFJETUEsIF9jbG9zZXNfIGl0LCBhbmQgdW1tYXBzIGl0
OyB0aGF0IHRoZSByZXN1bHRpbmcgZmlsZSBwaW4gY2FuCj4gPiBzdGlsbCBiZSB0cmFjZWQgYmFj
ayB0byB0aGUgUkRNQSBjb250ZXh0IGFuZCBhbGwgdGhlIHByb2Nlc3NlcyB3aGljaAo+ID4gbWF5
IGhhdmUgYWNjZXNzIHRvIGl0Li4uLiAgTm8gbWF0dGVyIHdoZXJlIHRoZSBvcmlnaW5hbCBjb250
ZXh0IG1heQo+ID4gaGF2ZSBjb21lIGZyb20uICBJIGJlbGlldmUgSSBoYXZlIGFjY29tcGxpc2hl
ZCB0aGF0Lgo+ID4KPiA+IEJlZm9yZSBJIGdvIG9uLCBJIHdvdWxkIGxpa2UgdG8gc2F5IHRoYXQg
dGhlICJpbWJhbGFuY2UiIG9mCj4gPiBnZXRfdXNlcl9wYWdlcygpIGFuZCBwdXRfcGFnZSgpIGJv
dGhlcnMgbWUgZnJvbSBhIHB1cmlzdCBzdGFuZHBvaW50Li4uCj4gPiBIb3dldmVyLCBzaW5jZSB0
aGlzIGRpc2N1c3Npb24gY3JvcHBlZCB1cCBJIHdlbnQgYWhlYWQgYW5kIHBvcnRlZCBteQo+ID4g
d29yayB0byBMaW51cycgY3VycmVudCBtYXN0ZXIKPiA+ICg1LjMtcmMzKykgYW5kIGluIGRvaW5n
IHNvIEkgb25seSBoYWQgdG8gc3RlYWwgYSBiaXQgb2YgSm9obnMgY29kZS4uLgo+ID4gU29ycnkg
Sm9obi4uLiAgOi0oCj4gPgo+ID4gSSBkb24ndCBoYXZlIHRoZSBjb21taXQgbWVzc2FnZXMgYWxs
IGNsZWFuZWQgdXAgYW5kIEkga25vdyB0aGVyZSBtYXkKPiA+IGJlIHNvbWUgZGlzY3Vzc2lvbiBv
biB0aGVzZSBuZXcgaW50ZXJmYWNlcyBidXQgSSB3YW50ZWQgdG8gdGhyb3cgdGhpcwo+ID4gc2Vy
aWVzIG91dCB0aGVyZSBiZWNhdXNlIEkgdGhpbmsgaXQgbWF5IGJlIHdoYXQgSmFuIGFuZCBNaWNo
YWwgYXJlCj4gPiBkcml2aW5nIGF0IChvciBhdCBsZWFzdCBpbiB0aGF0IGRpcmVjdGlvbi4KPiA+
Cj4gPiBSaWdodCBub3cgb25seSBSRE1BIGFuZCBEQVggRlMncyBhcmUgc3VwcG9ydGVkLiAgT3Ro
ZXIgdXNlcnMgb2YgR1VQCj4gPiB3aWxsIHN0aWxsIGZhaWwgb24gYSBEQVggZmlsZSBhbmQgcmVn
dWxhciBmaWxlcyB3aWxsIHN0aWxsIGJlIGF0Cj4gPiByaXNrLlsyXQo+ID4KPiA+IEkndmUgcHVz
aGVkIHRoaXMgd29yayAoYmFzZWQgNS4zLXJjMysgKDMzOTIwZjFlYzViZikpIGhlcmVbM106Cj4g
Pgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3dlaW55Mi9saW51eC1rZXJuZWwvdHJlZS9saW51cy1y
ZG1hZnNkYXgtYjAtdjMKPiA+Cj4gPiBJIHRoaW5rIHRoZSBtb3N0IHJlbGV2YW50IHBhdGNoIHRv
IHRoaXMgY29udmVyc2F0aW9uIGlzOgo+ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS93ZWlueTIv
bGludXgtCj4ga2VybmVsL2NvbW1pdC81ZDM3NzY1M2JhNWNmMTFjM2I3MTZmOTAKPiA+IDRiMDU3
YmVlNjY0MWFhZjYKPiA+Cj4gPiBJIHN0b2xlIEphbnMgc3VnZ2VzdGlvbiBmb3IgYSBuYW1lIGFz
IHRoZSBuYW1lIEkgdXNlZCB3aGlsZQo+ID4gcHJvdG90eXBpbmcgd2FzIHByZXR0eSBiYWQuLi4g
IFNvIFRoYW5rcyBKYW4uLi4gIDstKQo+IAo+IEZvciB5b3VyIGZ1bmN0aW9uLCBJJ2QgY2hvb3Nl
IGEgbmFtZSBsaWtlIHZhZGRyX3Bpbl9sZWFzZWRfcGFnZXMoKSBzbyB0aGF0Cj4gYXNzb2NpYXRp
b24gd2l0aCBhIGxlYXNlIGlzIGNsZWFyIGZyb20gdGhlIG5hbWUgOikKCk15IGd1dCB3YXMgdG8g
anVzdCBjaGFuZ2UgdGhpcyBhcyB5b3Ugc3VnZ2VzdGVkLiAgQnV0IHRoZSBmYWN0IGlzIHRoYXQg
dGhlc2UgY2FsbHMgY2FuIGdldCB1c2VkIG9uIGFub255bW91cyBwYWdlcyBhcyB3ZWxsLiAgU28g
dGhlICJsZWFzZWQiIHNlbWFudGljIG1heSBub3QgYXBwbHkuLi4gIE9UT0ggaWYgYSBmaWxlIGlz
IGVuY291bnRlcmVkIGl0IHdpbGwgZmFpbCB0aGUgcGluLi4uICA6LS8gIEknbSBnb2luZyB0byBs
ZWF2ZSBpdCBmb3Igbm93IGFuZCBnZXQgdGhlIHBhdGNoZXMgc3VibWl0dGVkIHRvIHRoZSBsaXN0
Li4uCgo+IEFsc28gSSdkIGNob29zZSB0aGUKPiBjb3VudGVycGFydCB0byBiZSB2YWRkcl91bnBp
bl9sZWFzZWRfcGFnZVtzXSgpLiBFc3BlY2lhbGx5IGhhdmluZyBwdXRfcGFnZQo+IGluIHRoZSBu
YW1lIGxvb2tzIGNvbmZ1c2luZyB0byBtZS4uLgoKQWggeWVzLCB0b3RhbGx5IGFncmVlIHdpdGgg
dGhlICJwaW4vdW5waW4iIHN5bW1ldHJ5LiAgSSd2ZSBjaGFuZ2VkIGZyb20gInB1dCIgdG8gInVu
cGluIi4uLgoKVGhhbmtzLApJcmEKCj4gCj4gCQkJCQkJCQlIb256YQo+IAo+IC0tCj4gSmFuIEth
cmEgPGphY2tAc3VzZS5jb20+Cj4gU1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
