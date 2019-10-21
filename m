Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48364DEEDB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D4C89C9D;
	Mon, 21 Oct 2019 14:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566889C9D;
 Mon, 21 Oct 2019 14:08:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 07:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="209449335"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 07:08:52 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 17:08:52 +0300
Date: Mon, 21 Oct 2019 17:08:52 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191021140852.GM2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDM6NTQ6MDlQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+ID4gSSByZWFsbHkgd291bGQgbGlrZSB0byBwcm92aWRlIHlvdSBtb3JlIGluZm9ybWF0
aW9uIGFib3V0IHN1Y2gKPiA+IHdvcmthcm91bmQgYnV0IEknbSBub3QgYXdhcmUgb2YgYW55IDst
KSBJIGhhdmUgbm90IHNlZW4gYW55IGlzc3VlcyBsaWtlCj4gPiB0aGlzIHdoZW4gRDNjb2xkIGlz
IHByb3Blcmx5IGltcGxlbWVudGVkIGluIHRoZSBwbGF0Zm9ybS4gIFRoYXQncyB3aHkKPiA+IEkn
bSBiaXQgc2tlcHRpY2FsIHRoYXQgdGhpcyBoYXMgYW55dGhpbmcgdG8gZG8gd2l0aCBzcGVjaWZp
YyBJbnRlbCBQQ0llCj4gPiBwb3J0cy4gTW9yZSBsaWtlbHkgaXQgaXMgc29tZSBwb3dlciBzZXF1
ZW5jZSBpbiB0aGUgX09OL19PRkYoKSBtZXRob2RzCj4gPiB0aGF0IGlzIHJ1biBkaWZmZXJlbnRs
eSBvbiBXaW5kb3dzLgo+IAo+IHllYWguLiBtYXliZS4gSSByZWFsbHkgZG9uJ3Qga25vdyB3aGF0
J3MgdGhlIGFjdHVhbCByb290IGNhdXNlLiBJIGp1c3QKPiBrbm93IHRoYXQgd2l0aCB0aGlzIHdv
cmthcm91bmQgaXQgd29ya3MgcGVyZmVjdGx5IGZpbmUgb24gbXkgYW5kIHNvbWUKPiBvdGhlciBz
eXN0ZW1zIGl0IHdhcyB0ZXN0ZWQgb24uIERvIHlvdSBrbm93IHdobyB3b3VsZCBiZSBiZXN0IHRv
Cj4gYXBwcm9hY2ggdG8gZ2V0IHByb3BlciBkb2N1bWVudGF0aW9uIGFib3V0IHRob3NlIG1ldGhv
ZHMgYW5kIHdoYXQgYXJlCj4gdGhlIGFjdHVhbCBwcmVyZXF1aXNpdGVzIG9mIHRob3NlIG1ldGhv
ZHM/CgpUaG9zZSBzaG91bGQgYmUgZG9jdW1lbnRlZCBpbiB0aGUgQUNQSSBzcGVjLiBDaGFwdGVy
IDcgc2hvdWxkIGV4cGxhaW4KcG93ZXIgcmVzb3VyY2VzIGFuZCB0aGUgZGV2aWNlIHBvd2VyIG1l
dGhvZHMgaW4gZGV0YWlsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
