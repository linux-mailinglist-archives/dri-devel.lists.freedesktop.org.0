Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E2E9C0A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 14:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7406E9DA;
	Wed, 30 Oct 2019 13:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8D76E9CE;
 Wed, 30 Oct 2019 13:07:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 06:07:43 -0700
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; d="scan'208";a="193962381"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 06:07:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Chris Chiu <chiu@endlessm.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, David Airlie <airlied@linux.ie>, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Unexpected screen flicker during i915 initialization
In-Reply-To: <CAB4CAwcMqyOLJFPcVyoGuiXo-ujeyzL2TJkpZ3qAc1HymJ2x7A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAB4CAwcMqyOLJFPcVyoGuiXo-ujeyzL2TJkpZ3qAc1HymJ2x7A@mail.gmail.com>
Date: Wed, 30 Oct 2019 15:07:34 +0200
Message-ID: <87o8xy8jqh.fsf@intel.com>
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzMCBPY3QgMjAxOSwgQ2hyaXMgQ2hpdSA8Y2hpdUBlbmRsZXNzbS5jb20+IHdyb3Rl
Ogo+IEhpIGd1eXMsCj4gICAgIFdlIGhhdmUgMiBsYXB0b3BzLCBBU1VTIFo0MDZNQSBhbmQgQWNl
ciBUcmF2ZWxNYXRlIEIxMTgsIGJvdGgKPiBwb3dlcmVkIGJ5IHRoZSBzYW1lIEludGVsIE41MDAw
IEdlbW5pTGFrZSBDUFUuIE9uIHRoZSBBY2VyIGxhcHRvcCwgdGhlCj4gcGFuZWwgd2lsbCBibGlu
ayBvbmNlIGR1cmluZyBib290IHdoaWNoIG5ldmVyIGhhcHBlbnMgb24gdGhlIEFTVVMKPiBsYXB0
b3AuIEl0IGNhdWdodCBteSBhdHRlbnRpb24gYW5kIEkgZmluZCB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZW0KPiBidXQgSSBuZWVkIGhlbHAgZm9yIG1vcmUgaW5mb3JtYXRpb24sCj4KPiAgICAg
VGhlIG1ham9yIGRpZmZlcmVuY2UgaGFwcGVucyBpbiBieHRfc2FuaXRpemVfY2RjbGsoKSBvbiB0
aGUKPiBmb2xsb3dpbmcgY29uZGl0aW9uIGNoZWNrLgo+ICAgICAgICAgaWYgKGNkY3RsID09IGV4
cGVjdGVkKQo+ICAgICAgICAgICAgICAgICAvKiBBbGwgd2VsbDsgbm90aGluZyB0byBzYW5pdGl6
ZSAqLwo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAgICAgT24gdGhlIHByb2JsZW1hdGlj
IEFjZXIgbGFwdG9wLCB0aGUgdmFsdWUgb2YgY2RjdGwgaXMgMHgyN2Egd2hpbGUKPiB0aGUgc2Ft
ZSBjZGN0bCBpcyAweDI3OCBvbiBBU1VTIG1hY2hpbmUuIER1ZSB0byB0aGUgMHgyN2EgaXMgbm90
IGVxdWFsCj4gdG8gdGhlIGV4cGVjdGVkIHZhbHVlIDB4Mjc4IHNvIGl0IG5lZWRzIHRvIGJlIHNh
bml0aXplZCBieSBhc3NpZ25pbmcKPiAtMSB0byAgZGV2X3ByaXYtPmNkY2xrLmh3LnZjby4gVGhl
biB0aGUgY29uc2VxdWVudCBieHRfc2V0X2NkY2xrKCkKPiB3aWxsIGZvcmNlIHRoZSBmdWxsIFBM
TCBkaXNhYmxlIGFuZCBlbmFibGUuIEFuZCB0aGF0J3MgdGhlIGZsaWNrZXIKPiAoYmxpbmspIHdl
IG9ic2VydmVkIGR1cmluZyBib290Lgo+Cj4gICAgIEFsdGhvdWdoIEkgY2FuJ3QgZmluZCB0aGUg
ZGVmaW5pdGlvbiBhYm91dCB0aGUgQklUKDIpIG9mIENEQ0xLX0NUTAo+IHdoaWNoIGNhdXNlIHRo
aXMgZGlmZmVyZW5jZS4gQ2FuIGFueW9uZSBzdWdnZXN0IHdoYXQgZXhhY3RseSB0aGUKPiBwcm9i
bGVtIGlzIGFuZCBob3cgc2hvdWxkIHdlIGRlYWwgd2l0aCBpdD8gVGhhbmtzLgoKVGhlIDExIGxl
YXN0IHNpZ25pZmljYW50IGJpdHMgb2YgdGhhdCByZWdpc3RlciBhcmUgdGhlIGNkY2xrIGZyZXF1
ZW5jeQppbiAxMC4xIGZpeGVkIHBvaW50IGZvcm1hdC4gQXBwYXJlbnRseSB0aGUgQWNlciBCSU9T
IG9yIEdPUCBoYXMgYQpkaWZmZXJlbnQgaWRlYSBvZiBob3cgdG8gY2FsY3VsYXRlIHRoZSB2YWx1
ZSBmcm9tIHdoYXQgaTkxNSBhbmQgdGhlIEFzdXMKdGhpbmsuCgpUbyBoYW5kbGUgdGhpcyBpbiBp
OTE1LCB3ZSdkIG5lZWQgdG8gYWxsb3cgc29tZSBkZXZpYXRpb24gZnJvbSB0aGUKZXhwZWN0ZWQg
dmFsdWUsIGFuZCBvbmx5IHN3aXRjaCB0byB1c2Ugb3VyIHZhbHVlIGF0IHRoZSBuZXh0IG1vZGVz
ZXQuIFdlCmRvIG5lZWQgdGhlIHNhbml0aXphdGlvbiB0aG91Z2gsIGJlY2F1c2Ugc29tZXRpbWVz
IHRoZXJlIGhhdmUgYmVlbgpjb21wbGV0ZWx5IGJvZ3VzIHZhbHVlcyB0byBiZWdpbiB3aXRoLgoK
UGxlYXNlIGZpbGUgYSBidWcgb3ZlciBhdCBbMV0gYW5kIHJlZmVyZW5jZSB0aGlzIHRocmVhZC4K
CkJSLApKYW5pLgoKClsxXSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL2VudGVyX2J1Zy5j
Z2k/cHJvZHVjdD1EUkkmY29tcG9uZW50PURSTS9JbnRlbAoKCi0tIApKYW5pIE5pa3VsYSwgSW50
ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
