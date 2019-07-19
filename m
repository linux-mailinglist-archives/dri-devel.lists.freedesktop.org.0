Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907CE6E56D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 14:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A026E821;
	Fri, 19 Jul 2019 12:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8315B6E81E;
 Fri, 19 Jul 2019 12:13:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 05:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; d="scan'208";a="187989495"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 19 Jul 2019 05:13:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Jul 2019 15:13:26 +0300
Date: Fri, 19 Jul 2019 15:13:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [PATCH v2 2/5] drm/edid: Abstract away cea_edid_modes[]
Message-ID: <20190719121326.GI5942@intel.com>
References: <20190711103234.6294-1-ville.syrjala@linux.intel.com>
 <20190711103234.6294-3-ville.syrjala@linux.intel.com>
 <147a2de3-1881-2c7d-7f8a-7205ee26cfbb@intel.com>
 <20190719115751.GH5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719115751.GH5942@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Hans Verkuil <hansverk@cisco.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDI6NTc6NTFQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDAyOjE1OjM0UE0gKzA1MzAsIFNoYXJt
YSwgU2hhc2hhbmsgd3JvdGU6Cj4gPiBIaSBWaWxsZSwKPiA+IAo+ID4gT24gNy8xMS8yMDE5IDQ6
MDIgUE0sIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gPiA+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+Cj4gPiA+IFdlJ3JlIGdvaW5nIHRv
IG5lZWQgdHdvIGNlYSBtb2RlIHRhYmxlcyAob24gZm9yIFZJQ3MgPCAxMjgsCj4gPiA+IGFub3Ro
ZXIgb25lIGZvciBWSUNzID49IDE5MykuIFRvIHRoYXQgZW5kIHJlcGxhY2UgdGhlIGRpcmVjdAo+
ID4gPiBlZGlkX2NlYV9tb2Rlc1tdIGxvb2t1cHMgd2l0aCBhIGZ1bmN0aW9uIGNhbGwuIEFuZCB3
ZSdsbCByZW5hbWUKPiA+ID4gdGhlIGFycmF5IHRvIGVkaWRfY2VhX21vZGVzXzBbXSB0byBpbmRp
Y2F0aGUgaG93IGl0J3MgdG8gYmUKPiA+ID4gaW5kZXhlZC4KPiA+IAo+ID4gSSBhbSBub3QgdmVy
eSBzdXJlIGlmIGl0cyBhIGdvb2QgaWRlYSB0byBzcGxpdCBpbnRvIHR3byBkaWZmZXJlbnQgCj4g
PiB0YWJsZXMsIG9yIGFkZGluZyBtdWx0aXBsZSBkdW1teSBwbGFjZWhvbGRlciBtb2RlcyAobGlr
ZSBWSUMgMCkgZm9yIHRoZSAKPiA+IG1vZGVzIG5vdCBhdmFpbGFibGUuIEl0IGNvdWxkIGdpdmUg
dXMgY29udGludWl0eSBhbmQgd2UgY2FuIGtlZXAgb24gCj4gPiB1c2luZyBhbG1vc3QgdGhlIHNh
bWUgZnVuY3Rpb25zLiBXZSBjYW4ganVzdCBhZGQgc29tZSBjaGVja3MgZm9yIHJhbmdlIAo+ID4g
YmV0d2VlbiBWSUMgMTI4IC0gMTkzLiBKdXN0IGEgdGhvdWdodC4KPiAKPiBUaGVzZSB0aGluZ3Mg
dGFrZSAyMDggYnl0ZXMgZWFjaC4gQmxvd2luZyBhd2F5IDQwIEtpQiBmb3IgemVyb2VzCgpBbHNv
IHdlIHNob3VsZCBwcm9iYWJseSB0aGluayBhYm91dCBzaHJpbmtpbmcgdGhlc2UgdGhpbmdzIGEg
Yml0LiBBCihzdXNwaWNpb3VzbHk/KSBlYXN5IHN0YXJ0IHdvdWxkIGJlIHRvIHMvaW50L3UxNi8g
Zm9yIG1vc3Qgb2YgdGhlCnRpbWluZ3MuIFRob3VnaCBub3Qgc3VyZSBob3cgbWFueSB5ZWFycyB3
ZSBoYXZlIHVudGlsIDY0ayBkaXNwbGF5cwpiZWNvbWUgYSB0aGluZy4KCkFsc28gaGF2aW5nIGFu
IGludCBmb3Ige3dpZHRoLGhlaWdodH1fbW0gaXMgcHJvYmFibHkgb3ZlcmtpbGwuIE9yCmF0IGxl
YXN0IEkgaGF2ZW4ndCBoZWFyZCBvZiBhbnlvbmUgaGF2aW5nIDIwMDBrbSB3aWRlIGRpc3BsYXlz
IHlldC4KSSBjb3VsZG4ndCBldmVuIGZpdCBvbmUgaW4gRmlubGFuZCBhbnl3YXkuIHUxNiB3b3Vs
ZCBzdGlsbCBnaXZlCnVzIH42NW0gd2hpY2ggc2VlbXMgcGxlbnR5LgoKJ3R5cGUnIEkgdGhpbmsg
Y291bGQgZml0IGludG8gdTguCgpUaGVuIHdlIGhhdmUgJypwcml2YXRlJy4gTWF5YmUgdG90YWxs
eSB1bnVzZWQ/CgpBbHNvIG5vdCBzdXJlIGlmIHdlIHJlYWxseSBuZWVkICduYW1lW10nLiBNYXli
ZSB3ZSBjYW4ganVzdCBnZW5lcmF0ZQppdCBvbiBkZW1hbmQ/IE1pZ2h0IGJlIHRpZWQgaW4gd2l0
aCB0aGUgdWFiaSBJIGd1ZXNzIHNvIG1heWJlIGNhbid0CmtpbGwgaXQuIERlcGVuZGluZyBvbiB0
aGUgbGVuZ3RoIG9mIGEgdHlwaWNhbCBuYW1lIHN3aXRjaGluZyB0byBhCnBvaW50ZXIgbWlnaHQg
c2F2ZSBzb21lIGJ5dGVzIHRob3VnaC4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
