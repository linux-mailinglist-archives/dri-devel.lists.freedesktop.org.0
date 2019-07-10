Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9749464A4E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2C26E111;
	Wed, 10 Jul 2019 15:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03F16E10F;
 Wed, 10 Jul 2019 15:59:49 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E141D2087F;
 Wed, 10 Jul 2019 15:59:48 +0000 (UTC)
Date: Wed, 10 Jul 2019 11:59:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: Need to remove char pointers from trace events
Message-ID: <20190710115947.1de86184@gandalf.local.home>
In-Reply-To: <20190710154524.GG5942@intel.com>
References: <20190710112549.0366bb03@gandalf.local.home>
 <20190710154524.GG5942@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMCBKdWwgMjAxOSAxODo0NToyNCArMDMwMApWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gPiAJICAgIFRQX3ByaW50aygicGlw
ZSAlYywgcGxhbmUgJXMsIGZyYW1lPSV1LCBzY2FubGluZT0ldSIsCj4gPiAJCSAgICAgIHBpcGVf
bmFtZShfX2VudHJ5LT5waXBlKSwgX19lbnRyeS0+bmFtZSwKPiA+IAkJICAgICAgX19lbnRyeS0+
ZnJhbWUsIF9fZW50cnktPnNjYW5saW5lKQo+ID4gCj4gPiAKPiA+IFRoZSBpc3N1ZSBoZXJlIGlz
IHRoYXQgeW91IHJlY29yZCBhIHBvaW50ZXIgYWRkcmVzcyB0byAicGxhbmUtPm5hbWUiCj4gPiBh
bmQgdGhlbiBzb21ldGltZSBpbiB0aGUgZGlzdGFudCBmdXR1cmUgYWNjZXNzIHRoYXQgc2FtZSBh
ZGRyZXNzLgo+ID4gVGhlcmUncyB1c3VhbGx5IG5vIGd1YXJhbnRlZSB0aGF0IHRoZSBjb250ZW50
cyBhdCB0aGF0IGFkZHJlc3Mgd2lsbAo+ID4gZXhpc3Qgd2hlbiB0aGUgYnVmZmVyIGlzIHJlYWQu
ICAKPiAKPiBUaGUgb25seSB3YXkgdGhvc2UgY2FuIGRpc2FwcGVhciBpcyBpZiB0aGUgZGV2aWNl
IGdvZXMgYXdheS4gQnV0IEkgaGF2ZQo+IG5vIHByb2JsZW0gZ29pbmcgd2l0aCB5b3VyIHBhdGNo
LiBXYW50IHRvIHByb3ZpZGUgYSBwcm9wZXIgY29tbWl0IG1lc3NhZ2UKPiBmb3IgaXQ/CgpTdXJl
LCBidXQgZG9lcyB0aGF0IG1lYW4gdGhlIHRyYWNlIGRhdGEgd2lsbCBnbyBhd2F5IHdpdGggdGhl
IGRldmljZT8KSWYgbm90LCB0aGVuIHlvdSBzdGlsbCBoYXZlIHRoZSBpc3N1ZS4KCkFsc28gbm90
ZSB0aGF0IHBlcmYgYW5kIHRyYWNlLWNtZCB3aWxsIG5vdCBrbm93IGhvdyB0byByZWFkIHRoYXQg
ZGF0YQplaXRoZXIsIHNvIGFkZGluZyBpdCB0byB0aGUgcmluZyBidWZmZXIgZ2l2ZXMgdGhlbSBh
Y2Nlc3MuCgpJJ2xsIHNlbmQgYSBwYXRjaCBuZXh0LCB0aGFua3MhCgotLSBTdGV2ZQoKPiAKPiA+
IAo+ID4gVGhlIHByb3BlciB3YXkgdG8gcmVjb3JkIHN0cmluZ3MsIGlzIHRvIHJlY29yZCB0aGUg
c3RyaW5nIGludG8gdGhlIHJpbmcKPiA+IGJ1ZmZlciBpdHNlbGYsIGFuZCBub3QgcmVseSBvbiBp
dCBleGlzdGluZyBob3VycyBvciBkYXlzIGxhdGVyLgo+ID4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
