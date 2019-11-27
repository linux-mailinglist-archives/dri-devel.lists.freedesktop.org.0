Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140610AEED
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 12:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234FB6E527;
	Wed, 27 Nov 2019 11:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562886E523;
 Wed, 27 Nov 2019 11:49:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 03:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="217370597"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 27 Nov 2019 03:48:57 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 27 Nov 2019 13:48:56 +0200
Date: Wed, 27 Nov 2019 13:48:56 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191127114856.GZ11621@lahna.fi.intel.com>
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDY6MTA6MzZQTSAtMDUwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBIZXktdGhpcyBpcyBhbG1vc3QgY2VydGFpbmx5IG5vdCB0aGUgcmlnaHQgcGxhY2UgaW4g
dGhpcyB0aHJlYWQgdG8gcmVzcG9uZCwKPiBidXQgdGhpcyB0aHJlYWQgaGFzIGdvdHRlbiBzbyBk
ZWVwIGV2b2x1dGlvbiBjYW4ndCBwdXNoIHRoZSBzdWJqZWN0IGZ1cnRoZXIgdG8KPiB0aGUgcmln
aHQsIGhlaC4gU28gSSdsbCBqdXN0IHJlc3BvbmQgaGVyZS4KCjopCgo+IEkndmUgYmVlbiBmb2xs
b3dpbmcgdGhpcyBhbmQgaGVscGluZyBvdXQgS2Fyb2wgd2l0aCB0ZXN0aW5nIGhlcmUgYW5kIHRo
ZXJlLgo+IFRoZXkgaGFkIG1lIHRlc3QgQmpvcm4ncyBQQ0kgYnJhbmNoIG9uIHRoZSBYMSBFeHRy
ZW1lIDJuZCBnZW5lcmF0aW9uLCB3aGljaAo+IGhhcyBhIHR1cmluZyBHUFUgYW5kIDgwODY6MTkw
MSBQQ0kgYnJpZGdlLgo+IAo+IEkgd2FzIGFib3V0IHRvIHNheSAidGhlIHBhdGNoIGZpeGVkIHRo
aW5ncywgaG9vcmF5ISIgYnV0IGl0IHNlZW1zIHRoYXQgYWZ0ZXIKPiB0cnlpbmcgcnVudGltZSBz
dXNwZW5kL3Jlc3VtZSBhIGNvdXBsZSB0aW1lcyB0aGluZ3MgZmFsbCBhcGFydCBhZ2FpbjoKCllv
dSBtZWFuICRzdWJqZWN0IHBhdGNoLCBubz8KCj4gWyAgNjg2Ljg4MzI0N10gbm91dmVhdSAwMDAw
OjAxOjAwLjA6IERSTTogc3VzcGVuZGluZyBvYmplY3QgdHJlZS4uLgo+IFsgIDc1Mi44NjY0ODRd
IEFDUEkgRXJyb3I6IEFib3J0aW5nIG1ldGhvZCBcX1NCLlBDSTAuUEVHMC5QRUdQLk5WUE8gZHVl
IHRvIHByZXZpb3VzIGVycm9yIChBRV9BTUxfTE9PUF9USU1FT1VUKSAoMjAxOTA4MTYvcHNwYXJz
ZS01MjkpCj4gWyAgNzUyLjg2NjUwOF0gQUNQSSBFcnJvcjogQWJvcnRpbmcgbWV0aG9kIFxfU0Iu
UENJMC5QR09OIGR1ZSB0byBwcmV2aW91cyBlcnJvciAoQUVfQU1MX0xPT1BfVElNRU9VVCkgKDIw
MTkwODE2L3BzcGFyc2UtNTI5KQo+IFsgIDc1Mi44NjY1MjFdIEFDUEkgRXJyb3I6IEFib3J0aW5n
IG1ldGhvZCBcX1NCLlBDSTAuUEVHMC5QRzAwLl9PTiBkdWUgdG8gcHJldmlvdXMgZXJyb3IgKEFF
X0FNTF9MT09QX1RJTUVPVVQpICgyMDE5MDgxNi9wc3BhcnNlLTUyOSkKClRoaXMgaXMgcHJvYmFi
bHkgdGhlIGN1bHByaXQuIFRoZSBzYW1lIEFNTCBjb2RlIGZhaWxzIHRvIHByb3Blcmx5IHR1cm4K
b24gdGhlIGRldmljZS4KCklzIGFjcGlkdW1wIGZyb20gdGhpcyBzeXN0ZW0gYXZhaWxhYmxlIHNv
bWV3aGVyZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
