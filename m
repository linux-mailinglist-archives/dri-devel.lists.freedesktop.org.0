Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F651003
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8DD89C2C;
	Mon, 24 Jun 2019 15:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31B89C29;
 Mon, 24 Jun 2019 15:12:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 08:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,412,1557212400"; d="scan'208";a="166358305"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 24 Jun 2019 08:12:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Jun 2019 18:12:26 +0300
Date: Mon, 24 Jun 2019 18:12:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 0/5] drm: Aspect ratio fixes
Message-ID: <20190624151226.GP5942@intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
 <CADnq5_N1zk4gQA2cwQ60-KjE6DszyK8Kqvzk3hse7+Q8mbibYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_N1zk4gQA2cwQ60-KjE6DszyK8Kqvzk3hse7+Q8mbibYA@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDc6Mjg6MzBQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDEwOjI2IEFNIFZpbGxlIFN5cmphbGEKPiA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPgo+ID4gSWxpYSBw
b2ludGVkIG91dCBzb21lIG9kZGJhbGwgY3JhcCBpbiB0aGUgaTkxNSBhc3BlY3QgcmF0aW8gaGFu
ZGxpbmcuCj4gPiBXaGlsZSBsb29raW5nIGF0IHRoYXQgSSBub3RpY2VkIGEgYnVuY2ggb2YgZmFp
bCBpbiB0aGUgY29yZSBhcyB3ZWxsLgo+ID4gVGhpcyBzZXJpZXMgYWltcyB0byBmaXggaXQgYWxs
Lgo+ID4KPiA+IENjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4gPgo+ID4g
VmlsbGUgU3lyasOkbMOkICg1KToKPiA+ICAgZHJtOiBEbyBub3QgdXNlIGJpdHdpc2UgT1IgdG8g
c2V0IHBpY3VyZV9hc3BlY3RfcmF0aW8KPiA+ICAgZHJtOiBEbyBub3QgYWNjZXB0IGdhcmJhZ2Ug
bW9kZSBhc3BlY3QgcmF0aW8gZmxhZ3MKPiA+ICAgZHJtOiBXQVJOIG9uIGlsbGVnYWwgYXNwZWN0
IHJhdGlvIHdoZW4gY29udmVydGluZyBhIG1vZGUgdG8gdW1vZGUKPiAKPiBQYXRjaGVzIDEtMzoK
PiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoK
VGhhbmtzLiAxLTMgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgotLSAKVmlsbGUgU3lyasOkbMOk
CkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
