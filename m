Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5AE0414
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 14:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451F26E793;
	Tue, 22 Oct 2019 12:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1936E793;
 Tue, 22 Oct 2019 12:44:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 05:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,327,1566889200"; d="scan'208";a="209665685"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 22 Oct 2019 05:44:54 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 22 Oct 2019 15:44:54 +0300
Date: Tue, 22 Oct 2019 15:44:53 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191022124453.GK2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
 <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
 <20191021154606.GT2819@lahna.fi.intel.com>
 <CACO55tsGhvG1qapRkdu_j7R534cFa5o=Gv2s4VZDrWUrxjBFwA@mail.gmail.com>
 <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
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

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6MTY6MTRBTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IEkgdGhpbmsgdGhlcmUgaXMgc29tZXRoaW5nIEkgdG90YWxseSBmb3Jnb3QgYWJvdXQ6
Cj4gCj4gV2hlbiB0aGVyZSB3YXMgbmV2ZXIgYSBkcml2ZXIgYm91bmQgdG8gdGhlIEdQVSwgYW5k
IGlmIHJ1bnRpbWUgcG93ZXIKPiBtYW5hZ2VtZW50IGdldHMgZW5hYmxlZCBvbiB0aGF0IGRldmlj
ZSwgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSB3b3Jrcwo+IGFzIGV4cGVjdGVkIChJIGFtIG5vdCAx
MDAlIHN1cmUgb24gaWYgdGhhdCBhbHdheXMgd29ya3MsIGJ1dCBJIHdpbGwKPiByZWNoZWNrIHRo
YXQpLgoKQUZBSUssIGlmIHRoZXJlIGlzIG5vIGRyaXZlciBib3VuZCB0byB0aGUgUENJIGRldmlj
ZSBpdCBpcyBsZWZ0IHRvIEQwCnJlZ2FyZGxlc3Mgb2YgdGhlIHJ1bnRpbWUgUE0gc3RhdGUgd2hp
Y2ggY291bGQgZXhwbGFpbiB3aHkgaXQgd29ya3MgaW4KdGhhdCBjYXNlIChpdCBpcyBuZXZlciBw
dXQgaW50byBEM2hvdCkuCgpJIGxvb2tlZCBhdCB0aGUgYWNwaWR1bXAgeW91IHNlbnQgYW5kIHRo
ZXJlIGlzIG9uZSB0aGluZyB0aGF0IG1heQpleHBsYWluIHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVu
IFdpbmRvd3MgYW5kIExpbnV4LiBOb3Qgc3VyZSBpZiB5b3Ugd2VyZQphd2FyZSBvZiB0aGlzIGFs
cmVhZHksIHRob3VnaC4gVGhlIHBvd2VyIHJlc291cmNlIFBHT0YoKSBtZXRob2QgaGFzCnRoaXM6
CgogICBJZiAoKChPU1lTIDw9IDB4MDdEOSkgfHwgKChPU1lTID09IDB4MDdERikgJiYgKF9SRVYg
PT0gMHgwNSkpKSkgewogICAgICAuLi4KICAgfSAgCgpJZiBJIHJlYWQgaXQgcmlnaHQsIHRoZSBs
YXRlciBjb25kaXRpb24gdHJpZXMgdG8gZGV0ZWN0IExpbnV4IHdoaWNoCmZhaWxzIG5vd2FkYXlz
IGJ1dCBpZiB5b3UgaGF2ZSBhY3BpX3Jldl9vdmVycmlkZSBpbiB0aGUgY29tbWFuZCBsaW5lIChv
cgp0aGUgbWFjaGluZSBpcyBsaXN0ZWQgaW4gYWNwaV9yZXZfZG1pX3RhYmxlKSB0aGlzIGNoZWNr
IHBhc3NlcyBhbmQgZG9lcwpzb21lIG1hZ2ljIHdoaWNoIGlzIG5vdCBjbGVhciB0byBtZS4gVGhl
cmUgaXMgc2ltaWxhciBpbiBQR09OKCkgc2lkZQp3aGljaCBpcyB1c2VkIHRvIHR1cm4gdGhlIGRl
dmljZSBiYWNrIG9uLgoKWW91IGNhbiBjaGVjayB3aGF0IGFjdHVhbGx5IGhhcHBlbnMgd2hlbiBf
T04oKS9fT0ZGKCkgaXMgY2FsbGVkIGJ5CnBhc3Npbmcgc29tZXRoaW5nIGxpa2UgYmVsb3cgdG8g
dGhlIGtlcm5lbCBjb21tYW5kIGxpbmU6CgogIGFjcGkudHJhY2VfZGVidWdfbGF5ZXI9MHg4MCBh
Y3BpLnRyYWNlX2RlYnVnX2xldmVsPTB4MTAgYWNwaS50cmFjZV9tZXRob2RfbmFtZT1cX1NCLlBD
STAuUEVHMC5QRzAwLl9PTiBhY3BpLnRyYWNlX3N0YXRlPW1ldGhvZAoKKFNlZSBhbHNvIERvY3Vt
ZW50YXRpb24vZmlybXdhcmUtZ3VpZGUvYWNwaS9tZXRob2QtdHJhY2luZy5yc3QpLgoKVHJhY2Ug
Z29lcyB0byBzeXN0ZW0gZG1lc2cuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
