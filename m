Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9116A1DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F40899DB;
	Mon, 24 Feb 2020 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 907 seconds by postgrey-1.36 at gabe;
 Sat, 22 Feb 2020 16:31:39 UTC
Received: from mx1.yrkesakademin.fi (mx1.yrkesakademin.fi [85.134.45.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27B6E95E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 16:31:39 +0000 (UTC)
Subject: Re: Regression in 5.4 kernel on 32-bit Radeon IBM T40
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Christoph
 Hellwig <hch@lst.de>, Woody Suwalski <terraluna977@gmail.com>
References: <400f6ce9-e360-0860-ca2a-fb8bccdcdc9b@gmail.com>
 <20200109141436.GA22111@lst.de>
 <9ad75215-3ff1-ee76-9985-12fd78d6aa5f@amd.com>
From: Thomas Backlund <tmb@mageia.org>
Message-ID: <801e4196-5e22-e805-4d45-0245efdaa508@mageia.org>
Date: Sat, 22 Feb 2020 18:16:28 +0200
MIME-Version: 1.0
In-Reply-To: <9ad75215-3ff1-ee76-9985-12fd78d6aa5f@amd.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVuIDA5LTAxLTIwMjAga2wuIDE3OjEyLCBza3JldiBDaHJpc3RpYW4gS8O2bmlnOgo+IEhpIENo
cmlzdG9waCwKPiAKPiBBbSAwOS4wMS4yMCB1bSAxNToxNCBzY2hyaWViIENocmlzdG9waCBIZWxs
d2lnOgo+PiBIaSBXb29keSwKPj4KPj4gc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBJJ3ZlIGJl
ZW4gb2ZmIHRvIGEgdmFjYXRpb24gb3ZlciB0aGUgaG9saWRheXMuCj4+Cj4+IE9uIFNhdCwgRGVj
IDE0LCAyMDE5IGF0IDEwOjE3OjE1UE0gLTA1MDAsIFdvb2R5IFN1d2Fsc2tpIHdyb3RlOgo+Pj4g
UmVncmVzc2lvbiBpbiA1LjQga2VybmVsIG9uIDMyLWJpdCBSYWRlb24gSUJNIFQ0MAo+Pj4gdHJp
Z2dlcmVkIGJ5Cj4+PiBjb21taXQgMzNiM2FkMzc4OGFiYTg0NmZjOGI5YTA2NWZlMjY4NWEwYjY0
ZjcxMwo+Pj4gQXV0aG9yOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4+IERhdGU6
wqDCoCBUaHUgQXVnIDE1IDA5OjI3OjAwIDIwMTkgKzAyMDAKPj4+Cj4+PiBIb3dkeSwKPj4+IFRo
ZSBhYm92ZSBwYXRjaCBoYXMgdHJpZ2dlcmVkIGEgZGlzcGxheSBwcm9ibGVtIG9uIElCTSBUaGlu
a3BhZCBUNDAsIAo+Pj4gd2hlcmUKPj4+IHRoZSBzY3JlZW4gaXMgY292ZXJlZCB3aXRoIGEgbG90
cyBvZiByYW5kb20gc2hvcnQgYmxhY2sgaG9yaXpvbnRhbCAKPj4+IGxpbmVzLAo+Pj4gb3IgZGlz
dG9ydGVkIGxldHRlcnMgaW4gWCB0ZXJtcy4KPj4+Cj4+PiBUaGUgY3VscHJpdCBzZWVtcyB0byBi
ZSB0aGF0IHRoZSBkbWFfZ2V0X3JlcXVpcmVkX21hc2soKSBpcyByZXR1cm5pbmcgYQo+Pj4gdmFs
dWUgMHgzZmZmZmZmZgo+Pj4gd2hpY2ggaXMgc21hbGxlciB0aGFuIGRtYV9nZXRfbWFzaygpMHhm
ZmZmZmZmZi5UaGF0IHJlc3VsdHMgaW4KPj4+IGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoKT09MCBp
biB0dG1fYm9fZGV2aWNlKCksIGFuZCB1c2luZyA0MC1iaXRzIGRtYQo+Pj4gaW5zdGVhZCBvZiAz
Mi1iaXRzLgo+PiBXaGljaCBpcyB0aGUgaW50ZW5kZWQgYmVoYXZpb3IgYXNzdW1pbmcgeW91ciBz
eXN0ZW0gaGFzIDFHQiBvZiBtZW1vcnkuCj4+IERvZXMgaXQ/Cj4gCj4gQXNzdW1pbmcgdGhlIHN5
c3RlbSBkb2Vzbid0IGhhdmUgdGhlIDFHQiBzcGxpdCB1cCBzb21laG93IGNyYXp5IG92ZXIgdGhl
IAo+IGFkZHJlc3Mgc3BhY2UgdGhhdCBzaG91bGQgaW5kZWVkIHdvcmsgYXMgaW50ZW5kZWQuCj4g
Cj4+Cj4+PiBJZiBJIGhhcmRjb2RlICIxIiBhcyB0aGUgbGFzdCBwYXJhbWV0ZXIgdG8gdHRtX2Jv
X2RldmljZV9pbml0KCkgaW4gCj4+PiBwbGFjZSBvZgo+Pj4gYSBjYWxsIHRvIGRtYV9hZGRyZXNz
aW5nX2xpbWl0ZWQoKSx0aGUgcHJvYmxlbSBnb2VzIGF3YXkuCj4+IEknbGwgbmVlZCBzb21lIGhl
bHAgZnJvbSB0aGUgZHJtIC8gcmFkZW9uIC8gVFRNIG1haW50YWluZXJzIGlmIHRoZXJlIGFyZQo+
PiBhbnkgb3RoZXIgc2lkZSBlZmZlY3RzIGZyb20gbm90IHBhc3NpbmcgdGhlIG5lZWRfZG1hMzIg
cGFyYW10ZXJzLgo+PiBPYnZpb3VzbHkgaWYgdGhlIGRldmljZSBkb2Vzbid0IGhhdmUgbW9yZSB0
aGFuIDMyLWJpdHMgd29ydGggb2YgZHJhbSBhbmQKPj4gbm8gRE1BIG9mZnNldCB3ZSBjYW4ndCBm
ZWVkIHVuYWRkcmVzc2FibGUgbWVtb3J5IHRvIHRoZSBkZXZpY2UuCj4+IFVuZm9ydHVuYXRlbHkg
SSBoYXZlIGEgdmVyeSBoYXJkIHRpbWUgZm9sbG93aW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+
PiB0aGUgVFRNIHBvb2wgaWYgaXQgZG9lcyBhbnl0aGluZyBlbHNlIGluIHRoaXMgY2FzZS4KPiAK
PiBUaGUgb25seSBvdGhlciB0aGluZyB3aGljaCBjb21lcyB0byBtaW5kIGlzIHVzaW5nIGh1Z2Ug
cGFnZXMuIENhbiB5b3UgCj4gdHJ5IGEga2VybmVsIHdpdGggQ09ORklHX1RSQU5TUEFSRU5UX0hV
R0VQQUdFIGRpc2FibGVkPwo+IAoKCkFueSBwcm9ncmVzcyBvbiB0aGlzID8KCldlIGhhdmUgYSBi
dWdyZXBvcnQgaW4gTWFnZWlhIHdpdGggdGhlIGh3OgpEZWxsIEluc3Bpcm9uIDUxMDAsIDMyLWJp
dCBQNCBwcm9jZXNzb3IsIDJHQiBvZiBSQU0sIFJhZGVvbiBNb2JpbGl0eSAKNzUwMCAoUlYyMDAp
IGdyYXBoaWNzCgp0aGF0IGdldHMgZGlzcGxheSBpc3N1ZXMgdG9vIGFuZCByZXZlcnRpbmcgdGhl
IG9mZmVuZGluZyBjb21taXQgcmVzdG9yZXMgCm5vcm1hbCBiZWhhdmlvdXIuCgphbmQgdGhlIHNh
bWUgaXNzdWUgaXMgc3RpbGwgdGhlcmUgd2l0aCA1LjUgc2VyaWVzIGtlcm5lbHMuCgotLQpUaG9t
YXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
