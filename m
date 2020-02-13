Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EF15C073
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 15:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93A26F5EE;
	Thu, 13 Feb 2020 14:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CA46F5EE;
 Thu, 13 Feb 2020 14:37:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 06:37:21 -0800
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; d="scan'208";a="227248670"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 06:37:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>, Nathan Chancellor
 <natechancellor@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
In-Reply-To: <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
 <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
 <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
Date: Thu, 13 Feb 2020 16:37:15 +0200
Message-ID: <877e0qy2n8.fsf@intel.com>
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
Cc: clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMiBGZWIgMjAyMCwgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4g
d3JvdGU6Cj4gT24gMjAyMC0wMi0xMiA2OjA3IHAubS4sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3Rl
Ogo+PiBPbiBXZWQsIEZlYiAxMiwgMjAyMCBhdCAwOTo1Mjo1MkFNICswMTAwLCBNaWNoZWwgRMOk
bnplciB3cm90ZToKPj4+IE9uIDIwMjAtMDItMTEgOTozOSBwLm0uLCBOYXRoYW4gQ2hhbmNlbGxv
ciB3cm90ZToKPj4+PiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCAxMDo0MTo0OEFNICswMTAwLCBN
aWNoZWwgRMOkbnplciB3cm90ZToKPj4+Pj4gT24gMjAyMC0wMi0xMSA3OjEzIGEubS4sIE5hdGhh
biBDaGFuY2VsbG9yIHdyb3RlOgo+Pj4+Pj4gQSByZWNlbnQgY29tbWl0IGluIGNsYW5nIGFkZGVk
IC1XdGF1dG9sb2dpY2FsLWNvbXBhcmUgdG8gLVdhbGwsIHdoaWNoIGlzCj4+Pj4+PiBlbmFibGVk
IGZvciBpOTE1IHNvIHdlIHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4+Pj4+Pgo+Pj4+Pj4g
Li4vZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYzoxNDg1OjIy
OiB3YXJuaW5nOgo+Pj4+Pj4gcmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3RhbnQgNTc2NDYw
NzUyMzAzNDIzNDg3IHdpdGggZXhwcmVzc2lvbiBvZgo+Pj4+Pj4gdHlwZSAndW5zaWduZWQgaW50
JyBpcyBhbHdheXMgZmFsc2UKPj4+Pj4+IFstV3RhdXRvbG9naWNhbC1jb25zdGFudC1vdXQtb2Yt
cmFuZ2UtY29tcGFyZV0KPj4+Pj4+ICAgICAgICAgaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVM
T0MoVUxPTkdfTUFYKSkpCj4+Pj4+PiAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyB3YXJuaW5nIG9ubHkgaGFwcGVucyBv
biB4ODZfNjQgYnV0IHRoYXQgY2hlY2sgaXMgcmVsZXZhbnQgZm9yCj4+Pj4+PiAzMi1iaXQgeDg2
IHNvIHdlIGNhbm5vdCByZW1vdmUgaXQuCj4+Pj4+Cj4+Pj4+IFRoYXQncyBzdXByaXNpbmcuIEFG
QUlDVCBOX1JFTE9DKFVMT05HX01BWCkgd29ya3Mgb3V0IHRvIHRoZSBzYW1lIHZhbHVlCj4+Pj4+
IGluIGJvdGggY2FzZXMsIGFuZCByZW1haW4gaXMgYSAzMi1iaXQgdmFsdWUgaW4gYm90aCBjYXNl
cy4gSG93IGNhbiBpdCBiZQo+Pj4+PiBsYXJnZXIgdGhhbiBOX1JFTE9DKFVMT05HX01BWCkgb24g
MzItYml0IChidXQgbm90IG9uIDY0LWJpdCk/Cj4+Pj4+Cj4+Pj4KPj4+PiBIaSBNaWNoZWwsCj4+
Pj4KPj4+PiBDYW4ndCB0aGlzIGNvbmRpdGlvbiBiZSB0cnVlIHdoZW4gVUlOVF9NQVggPT0gVUxP
TkdfTUFYPwo+Pj4KPj4+IE9oLCByaWdodCwgSSB0aGluayBJIHdhcyB3cm9uZ2x5IHRoaW5raW5n
IGxvbmcgaGFkIDY0IGJpdHMgZXZlbiBvbiAzMi1iaXQuCj4+Pgo+Pj4KPj4+IEFueXdheSwgdGhp
cyBzdWdnZXN0cyBhIHBvc3NpYmxlIGJldHRlciBzb2x1dGlvbjoKPj4+Cj4+PiAjaWYgVUlOVF9N
QVggPT0gVUxPTkdfTUFYCj4+PiAJaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVMT0MoVUxPTkdf
TUFYKSkpCj4+PiAJCXJldHVybiAtRUlOVkFMOwo+Pj4gI2VuZGlmCj4+Pgo+Pj4KPj4+IE9yIGlm
IHRoYXQgY2FuJ3QgYmUgdXNlZCBmb3Igc29tZSByZWFzb24sIHNvbWV0aGluZyBsaWtlCj4+Pgo+
Pj4gCWlmICh1bmxpa2VseSgodW5zaWduZWQgbG9uZylyZW1haW4gPiBOX1JFTE9DKFVMT05HX01B
WCkpKQo+Pj4gCQlyZXR1cm4gLUVJTlZBTDsKPj4+Cj4+PiBzaG91bGQgc2lsZW5jZSB0aGUgd2Fy
bmluZy4KPj4gCj4+IEkgZG8gbGlrZSB0aGlzIG9uZSBiZXR0ZXIgdGhhbiB0aGUgZm9ybWVyLgo+
Cj4gRldJVywgb25lIGRvd25zaWRlIG9mIHRoaXMgb25lIGNvbXBhcmVkIHRvIGFsbCBhbHRlcm5h
dGl2ZXMgKHByZXN1bWFibHkpCj4gaXMgdGhhdCBpdCBtaWdodCBlbmQgdXAgZ2VuZXJhdGluZyBh
Y3R1YWwgY29kZSBldmVuIG9uIDY0LWJpdCwgd2hpY2gKPiBhbHdheXMgZW5kcyB1cCBza2lwcGlu
ZyB0aGUgcmV0dXJuLgoKSSBsaWtlIHRoaXMgYmV0dGVyIHRoYW4gdGhlIFVJTlRfTUFYID09IFVM
T05HX01BWCBjb21wYXJpc29uIGJlY2F1c2UKdGhhdCBjcmVhdGVzIGEgZGVwZW5kZW5jeSBvbiB0
aGUgdHlwZSBvZiByZW1haW4uCgpUaGVuIGFnYWluLCBhIHN1ZmZpY2llbnRseSBjbGV2ZXIgY29t
cGlsZXIgY291bGQgc2VlIHRocm91Z2ggdGhlIGNhc3QsCmFuZCBmbGFnIHRoZSB3YXJuaW5nIGFu
eXdheS4uLgoKQlIsCkphbmkuCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdy
YXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
