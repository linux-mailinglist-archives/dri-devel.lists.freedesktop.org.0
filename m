Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C8573B0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 23:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FD46E519;
	Wed, 26 Jun 2019 21:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556C26E519;
 Wed, 26 Jun 2019 21:36:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 14:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="360890792"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2019 14:36:21 -0700
Date: Wed, 26 Jun 2019 14:36:21 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 23/25] mm: sort out the DEVICE_PRIVATE Kconfig mess
Message-ID: <20190626213620.GA8399@iweiny-DESK2.sc.intel.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-24-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626122724.13313-24-hch@lst.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MjJQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIFpPTkVfREVWSUNFIHN1cHBvcnQgZG9lc24ndCBkZXBlbmQgb24gYW55
dGhpbmcgSE1NIHJlbGF0ZWQsIGp1c3Qgb24KPiB2YXJpb3VzIGJpdHMgb2YgYXJjaCBzdXBwb3J0
IGFzIGluZGljYXRlZCBieSB0aGUgYXJjaGl0ZWN0dXJlLiAgQWxzbwo+IGRvbid0IHNlbGVjdCB0
aGUgb3B0aW9uIGZyb20gbm91dmVhdSBhcyBpdCBpc24ndCBwcmVzZW50IGluIG1hbnkgc2V0dXBz
LAo+IGFuZCBkZXBlbmQgb24gaXQgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlu
eUBpbnRlbC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIHwg
MiArLQo+ICBtbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L0tjb25maWcKPiBpbmRleCBkYmEyNjEzZjcxODAuLjYzMDNkMjAzYWIxZCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvS2NvbmZpZwo+IEBAIC04NSwxMCArODUsMTAgQEAgY29uZmlnIERSTV9O
T1VWRUFVX0JBQ0tMSUdIVAo+ICBjb25maWcgRFJNX05PVVZFQVVfU1ZNCj4gIAlib29sICIoRVhQ
RVJJTUVOVEFMKSBFbmFibGUgU1ZNIChTaGFyZWQgVmlydHVhbCBNZW1vcnkpIHN1cHBvcnQiCj4g
IAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+ICsJZGVwZW5kcyBvbiBERVZJQ0VfUFJJVkFURQo+
ICAJZGVwZW5kcyBvbiBEUk1fTk9VVkVBVQo+ICAJZGVwZW5kcyBvbiBTVEFHSU5HCj4gIAlzZWxl
Y3QgSE1NX01JUlJPUgo+IC0Jc2VsZWN0IERFVklDRV9QUklWQVRFCj4gIAlkZWZhdWx0IG4KPiAg
CWhlbHAKPiAgCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBlbmFibGUgZXhwZXJpbWVudGFs
IHN1cHBvcnQgZm9yCj4gZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCj4gaW5k
ZXggNmYzNWI4NWIzMDUyLi5lZWNmMDM3YTU0YjMgMTAwNjQ0Cj4gLS0tIGEvbW0vS2NvbmZpZwo+
ICsrKyBiL21tL0tjb25maWcKPiBAQCAtNjc3LDEzICs2NzcsMTMgQEAgY29uZmlnIEFSQ0hfSEFT
X0hNTV9NSVJST1IKPiAgCj4gIGNvbmZpZyBBUkNIX0hBU19ITU0KPiAgCWJvb2wKPiAtCWRlZmF1
bHQgeQo+ICAJZGVwZW5kcyBvbiAoWDg2XzY0IHx8IFBQQzY0KQo+ICAJZGVwZW5kcyBvbiBaT05F
X0RFVklDRQo+ICAJZGVwZW5kcyBvbiBNTVUgJiYgNjRCSVQKPiAgCWRlcGVuZHMgb24gTUVNT1JZ
X0hPVFBMVUcKPiAgCWRlcGVuZHMgb24gTUVNT1JZX0hPVFJFTU9WRQo+ICAJZGVwZW5kcyBvbiBT
UEFSU0VNRU1fVk1FTU1BUAo+ICsJZGVmYXVsdCB5Cj4gIAo+ICBjb25maWcgTUlHUkFURV9WTUFf
SEVMUEVSCj4gIAlib29sCj4gQEAgLTcwOSw4ICs3MDksNyBAQCBjb25maWcgSE1NX01JUlJPUgo+
ICAKPiAgY29uZmlnIERFVklDRV9QUklWQVRFCj4gIAlib29sICJVbmFkZHJlc3NhYmxlIGRldmlj
ZSBtZW1vcnkgKEdQVSBtZW1vcnksIC4uLikiCj4gLQlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+
IC0Jc2VsZWN0IEhNTQo+ICsJZGVwZW5kcyBvbiBaT05FX0RFVklDRQo+ICAJc2VsZWN0IERFVl9Q
QUdFTUFQX09QUwo+ICAKPiAgCWhlbHAKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
