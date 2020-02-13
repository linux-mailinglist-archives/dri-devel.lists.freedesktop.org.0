Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2515CDEE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 23:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546036E030;
	Thu, 13 Feb 2020 22:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06476E030;
 Thu, 13 Feb 2020 22:15:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 14:15:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,438,1574150400"; d="scan'208";a="227391043"
Received: from unknown (HELO localhost) ([10.252.53.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 14:04:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
In-Reply-To: <20200213214812.GA7980@ubuntu-m2-xlarge-x86>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
 <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
 <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net> <877e0qy2n8.fsf@intel.com>
 <20200213214812.GA7980@ubuntu-m2-xlarge-x86>
Date: Fri, 14 Feb 2020 00:05:24 +0200
Message-ID: <87mu9mw3bv.fsf@intel.com>
MIME-Version: 1.0
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
Cc: clang-built-linux@googlegroups.com,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBGZWIgMjAyMCwgTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDQ6Mzc6MTVQTSArMDIw
MCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4+IE9uIFdlZCwgMTIgRmViIDIwMjAsIE1pY2hlbCBEw6Ru
emVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IHdyb3RlOgo+PiA+IE9uIDIwMjAtMDItMTIgNjowNyBw
Lm0uLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPj4gPj4gT24gV2VkLCBGZWIgMTIsIDIwMjAg
YXQgMDk6NTI6NTJBTSArMDEwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+ID4+PiBPbiAyMDIw
LTAyLTExIDk6MzkgcC5tLiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4+ID4+Pj4gT24gVHVl
LCBGZWIgMTEsIDIwMjAgYXQgMTA6NDE6NDhBTSArMDEwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6
Cj4+ID4+Pj4+IE9uIDIwMjAtMDItMTEgNzoxMyBhLm0uLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90
ZToKPj4gPj4+Pj4+IEEgcmVjZW50IGNvbW1pdCBpbiBjbGFuZyBhZGRlZCAtV3RhdXRvbG9naWNh
bC1jb21wYXJlIHRvIC1XYWxsLCB3aGljaCBpcwo+PiA+Pj4+Pj4gZW5hYmxlZCBmb3IgaTkxNSBz
byB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+PiA+Pj4+Pj4KPj4gPj4+Pj4+IC4uL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmM6MTQ4NToyMjogd2Fy
bmluZzoKPj4gPj4+Pj4+IHJlc3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50IDU3NjQ2MDc1
MjMwMzQyMzQ4NyB3aXRoIGV4cHJlc3Npb24gb2YKPj4gPj4+Pj4+IHR5cGUgJ3Vuc2lnbmVkIGlu
dCcgaXMgYWx3YXlzIGZhbHNlCj4+ID4+Pj4+PiBbLVd0YXV0b2xvZ2ljYWwtY29uc3RhbnQtb3V0
LW9mLXJhbmdlLWNvbXBhcmVdCj4+ID4+Pj4+PiAgICAgICAgIGlmICh1bmxpa2VseShyZW1haW4g
PiBOX1JFTE9DKFVMT05HX01BWCkpKQo+PiA+Pj4+Pj4gICAgICAgICAgICAgfn5+fn5+fn5+fn5+
fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiA+Pj4+Pj4KPj4gPj4+Pj4+IFRoaXMgd2Fybmlu
ZyBvbmx5IGhhcHBlbnMgb24geDg2XzY0IGJ1dCB0aGF0IGNoZWNrIGlzIHJlbGV2YW50IGZvcgo+
PiA+Pj4+Pj4gMzItYml0IHg4NiBzbyB3ZSBjYW5ub3QgcmVtb3ZlIGl0Lgo+PiA+Pj4+Pgo+PiA+
Pj4+PiBUaGF0J3Mgc3VwcmlzaW5nLiBBRkFJQ1QgTl9SRUxPQyhVTE9OR19NQVgpIHdvcmtzIG91
dCB0byB0aGUgc2FtZSB2YWx1ZQo+PiA+Pj4+PiBpbiBib3RoIGNhc2VzLCBhbmQgcmVtYWluIGlz
IGEgMzItYml0IHZhbHVlIGluIGJvdGggY2FzZXMuIEhvdyBjYW4gaXQgYmUKPj4gPj4+Pj4gbGFy
Z2VyIHRoYW4gTl9SRUxPQyhVTE9OR19NQVgpIG9uIDMyLWJpdCAoYnV0IG5vdCBvbiA2NC1iaXQp
Pwo+PiA+Pj4+Pgo+PiA+Pj4+Cj4+ID4+Pj4gSGkgTWljaGVsLAo+PiA+Pj4+Cj4+ID4+Pj4gQ2Fu
J3QgdGhpcyBjb25kaXRpb24gYmUgdHJ1ZSB3aGVuIFVJTlRfTUFYID09IFVMT05HX01BWD8KPj4g
Pj4+Cj4+ID4+PiBPaCwgcmlnaHQsIEkgdGhpbmsgSSB3YXMgd3JvbmdseSB0aGlua2luZyBsb25n
IGhhZCA2NCBiaXRzIGV2ZW4gb24gMzItYml0Lgo+PiA+Pj4KPj4gPj4+Cj4+ID4+PiBBbnl3YXks
IHRoaXMgc3VnZ2VzdHMgYSBwb3NzaWJsZSBiZXR0ZXIgc29sdXRpb246Cj4+ID4+Pgo+PiA+Pj4g
I2lmIFVJTlRfTUFYID09IFVMT05HX01BWAo+PiA+Pj4gCWlmICh1bmxpa2VseShyZW1haW4gPiBO
X1JFTE9DKFVMT05HX01BWCkpKQo+PiA+Pj4gCQlyZXR1cm4gLUVJTlZBTDsKPj4gPj4+ICNlbmRp
Zgo+PiA+Pj4KPj4gPj4+Cj4+ID4+PiBPciBpZiB0aGF0IGNhbid0IGJlIHVzZWQgZm9yIHNvbWUg
cmVhc29uLCBzb21ldGhpbmcgbGlrZQo+PiA+Pj4KPj4gPj4+IAlpZiAodW5saWtlbHkoKHVuc2ln
bmVkIGxvbmcpcmVtYWluID4gTl9SRUxPQyhVTE9OR19NQVgpKSkKPj4gPj4+IAkJcmV0dXJuIC1F
SU5WQUw7Cj4+ID4+Pgo+PiA+Pj4gc2hvdWxkIHNpbGVuY2UgdGhlIHdhcm5pbmcuCj4+ID4+IAo+
PiA+PiBJIGRvIGxpa2UgdGhpcyBvbmUgYmV0dGVyIHRoYW4gdGhlIGZvcm1lci4KPj4gPgo+PiA+
IEZXSVcsIG9uZSBkb3duc2lkZSBvZiB0aGlzIG9uZSBjb21wYXJlZCB0byBhbGwgYWx0ZXJuYXRp
dmVzIChwcmVzdW1hYmx5KQo+PiA+IGlzIHRoYXQgaXQgbWlnaHQgZW5kIHVwIGdlbmVyYXRpbmcg
YWN0dWFsIGNvZGUgZXZlbiBvbiA2NC1iaXQsIHdoaWNoCj4+ID4gYWx3YXlzIGVuZHMgdXAgc2tp
cHBpbmcgdGhlIHJldHVybi4KPj4gCj4+IEkgbGlrZSB0aGlzIGJldHRlciB0aGFuIHRoZSBVSU5U
X01BWCA9PSBVTE9OR19NQVggY29tcGFyaXNvbiBiZWNhdXNlCj4+IHRoYXQgY3JlYXRlcyBhIGRl
cGVuZGVuY3kgb24gdGhlIHR5cGUgb2YgcmVtYWluLgo+PiAKPj4gVGhlbiBhZ2FpbiwgYSBzdWZm
aWNpZW50bHkgY2xldmVyIGNvbXBpbGVyIGNvdWxkIHNlZSB0aHJvdWdoIHRoZSBjYXN0LAo+PiBh
bmQgZmxhZyB0aGUgd2FybmluZyBhbnl3YXkuLi4KPgo+IFdvdWxkIHlvdSBwcmVmZXIgYSBwYXRj
aCB0aGF0IGFkZHMgdGhhdCBjYXN0IHJhdGhlciB0aGFuIHNpbGVuY2luZyB0aGUKPiB3YXJuaW5n
IG91dHJpZ2h0PyBJdCBkb2VzIGFwcGVhciB0byB3b3JrIGZvciBjbGFuZy4KCkknZCB0YWtlIHRo
ZSBjYXN0LgoKSWYgdGhhdCBmYWlscyBmb3Igd2hhdGV2ZXIgcmVhc29uLCBwZXItZmlsZQoKQ0ZM
QUdTX2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLm8gPSAkKGNhbGwgY2MtZGlzYWJsZS13YXJuaW5n
LCB0YXV0b2xvZ2ljYWwtY29uc3RhbnQtb3V0LW9mLXJhbmdlLWNvbXBhcmUpCgpvdmVyIHN1YmRp
ci1jY2ZsYWdzLXkgd291bGQgYmUgcHJlZmVycmFibGUgSSB0aGluay4KCkJSLApKYW5pLgoKCgo+
Cj4gQ2hlZXJzLAo+IE5hdGhhbgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
