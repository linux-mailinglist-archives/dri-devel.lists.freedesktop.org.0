Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA8182F11
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 12:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9596E192;
	Thu, 12 Mar 2020 11:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591676E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 11:25:14 +0000 (UTC)
Date: Thu, 12 Mar 2020 11:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1584012312;
 bh=0lzmC89L6l4u6zAMzrxO/D8PvkL5jMVmXbIJuuLya8o=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=i+V+CsStrdcNARHpEYHDhmQvndAiJs/SyOhflhqg6YqEogIbmvLzqWwo6qXMBhRpA
 64D31T3Q8hNa8JjuJ+kUNrBdCz+JLDKSew2wssjvJPVMe8ukN6dEoJFPFfXsmnEK6t
 1z3cb6DVYTLcoS5wuBsrAg3vwaxRw1xhREROsuSA=
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Variable Refresh Rate & flickering screens
Message-ID: <tQBNlPxJxKY8FDg82d7XAuqLUkgBj4ATufP43APGI17BfwCiRpJCpUOSZiAq0V-6QONBC8S_dpI4sHsb-qQkhfkKX4usw6hSSUG_pXO3uX0=@emersion.fr>
In-Reply-To: <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
References: <bRy2hTFvMya3tNzlzsjQv6uzpsgC18d0NYQx1A9Otma6wCsYLHH9X6esb47-9KWzUjVNWTi3VXCVLVGX-dlW17P0YeCFCg4OZ4KEykC0Czw=@emersion.fr>
 <647ff0e7-f186-4e16-f9b9-0908a3171051@daenzer.net>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Scott Anderson <scott@anderso.nz>, Harry Wentland <hwentlan@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Anthony.Koo@amd.com" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIE1hcmNoIDEyLCAyMDIwIDExOjQ1IEFNLCBNaWNoZWwgRMOkbnplciA8bWlj
aGVsQGRhZW56ZXIubmV0PiB3cm90ZToKCj4gT24gMjAyMC0wMy0xMSA5OjA5IHAubS4sIFNpbW9u
IFNlciB3cm90ZToKPgo+ID4gSGkgYWxsLAo+ID4gSSd2ZSBiZWVuIHdvcmtpbmcgb24gYWRkaW5n
IFZSUiBzdXBwb3J0IHRvIFN3YXkgWzFdIChhIFdheWxhbmQKPiA+IGNvbXBvc2l0b3IpLiBUaGUg
Y29tcG9zaXRvciBqdXN0IHNldHMgdGhlIFZSUl9FTkFCTEVEIHByb3BlcnR5Lgo+ID4gVGhpcyB3
b3JrcyBmaW5lIGZvciBzb21lIHNjcmVlbnMsIGJ1dCBjYXVzZXMgZmxjaWtlcmluZyBmb3Igb3Ro
ZXIKPiA+IHNjcmVlbnMgYXMgZXhwZWN0ZWQgWzJdLiBGaXhpbmcgdGhlIGZsaWNrZXJpbmcgaXMg
c29tZXRoaW5nIHdlJ3ZlCj4gPiB0YWxrZWQgYWJvdXQgbGFzdCBYREMgWzNdLiBUaGUgZmxpY2tl
cmluZyBpcyBjYXVzZWQgYnkgcGh5c2ljYWwKPiA+IGxpbWl0YXRpb25zIG9mIHRoZSBzY3JlZW46
IGNoYW5naW5nIHRoZSByZWZyZXNoIHJhdGUgdG9vIHF1aWNrbHkKPiA+IHJlc3VsdHMgaW4gYnJp
Z2h0bmVzcyBpc3N1ZXMuCj4gPiBUaGUgYXBwcm9hY2ggdGFrZW4gYnkgeGY4Ni12aWRlby1hbWRn
cHUgaXMgdG8gb25seSBlbmFibGUgVlJSIGlmIGFuIGFwcAo+ID4gaXMgZnVsbHNjcmVlbiBhbmQg
bm90IHByZXNlbnQgaW4gYSBzcGVjaWFsIE1lc2EgYmxhY2tsaXN0IChlLmcuIEZpcmVmb3gKPiA+
IGlzIGluIHRoZSBibGFja2xpc3QgYmVjYXVzZSBpdCBkb2Vzbid0IHJlbmRlciBhdCBhIGZpeGVk
IGludGVydmFsKS4KPiA+IEZvciBXYXlsYW5kLCBJJ2QgcHJlZmVyIHRvIGF2b2lkIGhhdmluZyBh
IGJsYWNrbGlzdC4gSSdkIGxpa2UgdG8gYmUKPiA+IGFibGUgdG8gdXNlIFZSUiBpbiB0aGUgZ2Vu
ZXJhbCBjYXNlIChub3QganVzdCBmb3IgZnVsbHNjcmVlbiBhcHBzKS4KPiA+IEEgd2F5IHRvIGZp
eCB0aGUgZmxpY2tlcmluZyB3b3VsZCBiZSB0byBpbXBsZW1lbnQgYSBzbGV3IHJhdGUgYW5kIG1h
a2UKPiA+IGl0IHNvIHJlZnJlc2ggcmF0ZSB2YXJpYXRpb25zIGFyZSBjYXBwZWQgYnkgdGhlIHNs
ZXcgcmF0ZS4KPgo+IE9uZSBwb3RlbnRpYWwgaXNzdWUgSSBzZWUgd2l0aCB0aGlzIGlzIHRoZSBj
dXJzb3IsIHdoaWNoIGNhbiBmZWVsCj4gYXdrd2FyZCBpZiBpdCBvbmx5IG1vdmVzIGF0IDMwIEh6
LiBJIHdvbmRlciBpZiBhIHNsZXcgcmF0ZSB3aGljaCBjYW4KPiByZWxpYWJseSBwcmV2ZW50IGZs
aWNrZXJpbmcgYWxsb3dzIHRoZSBmcmFtZXJhdGUgdG8gcmFtcCB1cCBxdWlja2x5Cj4gZW5vdWdo
IGZvciB0aGlzIG5vdCB0byBiZSBhbm5veWluZy4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBv
dXQsIHRoYXQncyBhIHZhbGlkIGNvbmNlcm4uCgpNeSBWUlIgbW9uaXRvciBoYXMgYSA0MC02MEh6
IFZSUiByYW5nZS4gV2l0aCB0aGUgY3VycmVudCBTd2F5CmltcGxlbWVudGF0aW9uIGFuZCBkcm1f
bW9uaXRvciBbMV0sIEkgY2FuIGNoZWNrIHRoYXQgbW92aW5nIG15IG1vdXNlIG9uCnRoZSBtb25p
dG9yIG1ha2VzIHRoZSByZWZyZXNoIGludGVydmFsIGdvIGZyb20gfjI1bXMgdG8gfjE2LjZtcyAo
aWUuCjQwSHogdG8gNjBIeikuIFJpZ2h0IG5vdyB0aGVyZSdzIG5vIHNsZXcgcmF0ZSwgc28gaXQg
Z29lcyBmcm9tIG1pbiB0bwptYXggaW5zdGFudGx5LiBJIGRvbid0IG5vdGljZSBhbnkgZmxpY2tl
cmluZyBhbmQgdGhlcmUncyBubyBsYWcuCgpMb29raW5nIGF0IHRoZSBsaXN0IG9mIG1vbml0b3Jz
IFsyXSBvbiBXaWtpcGVkaWEsIGl0IGRvZXNuJ3Qgc2VlbSBsaWtlCnRoZXJlJ3MgYW55IG1vbml0
b3Igc3VwcG9ydGluZyBsZXNzIHRoYW4gMzVIei4KCldlJ2QgbmVlZCB0byBwZXJmb3JtIGV4cGVy
aW1lbnRzIG9uIG1vcmUgaGFyZHdhcmUsIGJ1dCBmbGlja2VyaW5nIGhhcwpiZWVuIG5vdGljZWQg
Ynkgb3VyIHVzZXJzIG9uIGhpZ2hlci1lbmQgbW9uaXRvcnMgd2hpY2ggc3VwcG9ydCAxNDRIei4K
SSB0aGluayB0aGUgc2xldyByYXRlIHdvdWxkIHByZXZlbnQgZ29pbmcgZnJvbSAzNUh6IHRvIDE0
NEh6IGRpcmVjdGx5LApidXQgcHJvYmFibHkgbm90IGZyb20gNDBIeiB0byA2MEh6LiBJIHRoaW5r
IHRoYXQgd291bGQgYmUgYWNjZXB0YWJsZS4KCklmIGl0J3Mgbm90LCB3ZSBjYW4gYWx3YXlzIHR3
ZWFrIHRoZSBtaW5pbXVtIHJlZnJlc2ggcmF0ZS4KCnRsO2RyIG5lZWQgdG8gdGVzdCBvbiBtb3Jl
IGhhcmR3YXJlLCBidXQgc2hvdWxkIHByb2JhYmx5IGJlIGZpbmUuCgpbMV06IGh0dHBzOi8vZ2l0
aHViLmNvbS9lbWVyc2lvbi9kcm1fbW9uaXRvcgpbMl06IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9y
Zy93aWtpL0ZyZWVTeW5jI0xpc3Rfb2Zfc3VwcG9ydGVkX21vbml0b3JzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
