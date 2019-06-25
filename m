Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90542552BF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 17:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44716E137;
	Tue, 25 Jun 2019 15:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB8E6E137;
 Tue, 25 Jun 2019 15:00:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BBA5AF4C;
 Tue, 25 Jun 2019 15:00:54 +0000 (UTC)
Date: Tue, 25 Jun 2019 17:00:53 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
Message-ID: <20190625150053.GJ11400@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
 <20190625072317.GC30350@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625072317.GC30350@lst.de>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDI1LTA2LTE5IDA5OjIzOjE3LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBN
b24sIEp1biAyNCwgMjAxOSBhdCAxMToyNDo0OEFNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6
Cj4gPiBJIGFza2VkIGZvciB0aGlzIHNpbXBseSBiZWNhdXNlIGl0IHdhcyBub3QgZXhwb3J0ZWQg
aGlzdG9yaWNhbGx5LiBJbgo+ID4gZ2VuZXJhbCBJIHdhbnQgdG8gZXN0YWJsaXNoIGV4cGxpY2l0
IGV4cG9ydC10eXBlIGNyaXRlcmlhIHNvIHRoZQo+ID4gY29tbXVuaXR5IGNhbiBzcGVuZCBsZXNz
IHRpbWUgZGViYXRpbmcgd2hlbiB0byB1c2UgRVhQT1JUX1NZTUJPTF9HUEwKPiA+IFsxXS4KPiA+
IAo+ID4gVGhlIHRob3VnaHQgaW4gdGhpcyBpbnN0YW5jZSBpcyB0aGF0IGl0IGlzIG5vdCBoaXN0
b3JpY2FsbHkgZXhwb3J0ZWQKPiA+IHRvIG1vZHVsZXMgYW5kIGl0IGlzIHNhZmVyIGZyb20gYSBt
YWludGVuYW5jZSBwZXJzcGVjdGl2ZSB0byBzdGFydAo+ID4gd2l0aCBHUEwtb25seSBmb3IgbmV3
IHN5bWJvbHMgaW4gY2FzZSB3ZSBkb24ndCB3YW50IHRvIG1haW50YWluIHRoYXQKPiA+IGludGVy
ZmFjZSBsb25nLXRlcm0gZm9yIG91dC1vZi10cmVlIG1vZHVsZXMuCj4gPiAKPiA+IFllcywgd2Ug
YWx3YXlzIHJlc2VydmUgdGhlIHJpZ2h0IHRvIHJlbW92ZSAvIGNoYW5nZSBpbnRlcmZhY2VzCj4g
PiByZWdhcmRsZXNzIG9mIHRoZSBleHBvcnQgdHlwZSwgYnV0IGhpc3RvcnkgaGFzIHNob3duIHRo
YXQgZXh0ZXJuYWwKPiA+IHByZXNzdXJlIHRvIGtlZXAgYW4gaW50ZXJmYWNlIHN0YWJsZSAoY29u
dHJhcnkgdG8KPiA+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdGFibGUtYXBpLW5vbnNlbnNlLnJz
dCkgdGVuZHMgdG8gYmUgbGVzcyBmb3IKPiA+IEdQTC1vbmx5IGV4cG9ydHMuCj4gCj4gRnVsbHkg
YWdyZWVkLiAgSW4gdGhlIGVuZCB0aGUgZGVjaXNpb24gaXMgd2l0aCB0aGUgTU0gbWFpbnRhaW5l
cnMsCj4gdGhvdWdoLCBhbHRob3VnaCBJJ2QgcHJlZmVyIHRvIGtlZXAgaXQgYXMgaW4gdGhpcyBz
ZXJpZXMuCgpJIGFtIHNvcnJ5IGJ1dCBJIGFtIG5vdCByZWFsbHkgY29udmluY2VkIGJ5IHRoZSBh
Ym92ZSByZWFzb25pbmcgd3J0LiB0bwp0aGUgYWxsb2NhdG9yIEFQSSBhbmQgaXQgaGFzIGJlZW4g
YSBzdWJqZWN0IG9mIG1hbnkgY2hhbmdlcyBvdmVyIHRpbWUuIEkKZG8gbm90IHJlbWVtYmVyIGEg
c2luZ2xlIGNhc2Ugd2hlcmUgd2Ugd291bGQgYmUgYmVuZGluZyB0aGUgYWxsb2NhdG9yCkFQSSBi
ZWNhdXNlIG9mIGV4dGVybmFsIG1vZHVsZXMgYW5kIEkgYW0gcHJldHR5IHN1cmUgd2Ugd2lsbCBw
dXNoIGJhY2sKaGVhdmlseSBpZiB0aGF0IHdhcyB0aGUgY2FzZSBpbiB0aGUgZnV0dXJlLgoKU28g
aW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgSSB3b3VsZCBnbyB3aXRoIGNvbnNpc3RlbmN5IGFuZCBl
eHBvcnQgdGhlCnNhbWUgd2F5IHdlIGRvIHdpdGggb3RoZXIgZnVuY3Rpb25zLiBBbHNvIHdlIGRv
IG5vdCB3YW50IHBlb3BsZSB0bwpyZWludmVudCB0aGlzIEFQSSBhbmQgc2NyZXcgdGhhdCBsaWtl
IHdlIGhhdmUgc2VlbiBpbiBvdGhlciBjYXNlcyB3aGVuCmV4dGVybmFsIG1vZHVsZXMgdHJ5IHJl
aW1wbGVtZW50IGNvcmUgZnVuY3Rpb25hbGl0eSB0aGVtc2VsdmVzLgoKVGhhbmtzIQotLSAKTWlj
aGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
