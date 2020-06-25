Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DB020A5C2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 21:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312D6EBC8;
	Thu, 25 Jun 2020 19:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E546E342;
 Thu, 25 Jun 2020 19:27:59 +0000 (UTC)
IronPort-SDR: Ho8mcATI/sJlJZuhC+HYzkmSslgZerr7CrwhkB+viomPiPaFJDbJMKBuKCNZMFeAeQunCh0nub
 kvdgDvFI/XxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144124577"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144124577"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:27:58 -0700
IronPort-SDR: xqE9pdlTGxw8xcy+WvoYgJiqj0+nCef21t0Oi6fvGVrf1mQc93deMtqjrpFDV5OlgacItpDq/0
 DcKwL2sAQEDw==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="453118038"
Received: from azinatyx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:27:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
In-Reply-To: <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
Date: Thu, 25 Jun 2020 22:27:52 +0300
Message-ID: <874kqzndxj.fsf@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, venkata.s.dhanalakota@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNiBKdW4gMjAyMCwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90
ZToKPiBXVFVGPwo+Cj4gSG93IGRpZCB0aGlzIGV2ZXIgbGFuZCBpbiBteSB0cmVlLCB0aGVyZSBp
cyBubyBBQ0sgb24gdGhpcyBmcm9tIGFueW9uZQo+IGluIGNvcmUgZG1hLWJ1ZiwKPgo+IEludGVs
IHRlYW0sIGNsZWFuIHlvdXIgaG91c2UgdXAgaGVyZSwgSSdtIGdvaW5nIHRvIGhhdmUgdG8gYXNr
IHlvdSB0bwo+IHN0b3AgQ2hyaXMgbWVyZ2luZyBzdHVmZiB3aXRob3V0IG92ZXJzaWdodCwgaWYg
dGhpcyBzb3J0IG9mIHRoaW5nCj4gaGFwcGVucywgdGhpcyBpcyB0b3RhbGx5IHVuYWNjZXB0YWJs
ZS4KClRoZXJlJ3Mgbm8gYXJndW1lbnQsIGFuIGFjayBpcyByZXF1aXJlZC4KCkluIGZhaXJuZXNz
IHRvIHRoZSBpOTE1IG1haW50YWluZXJzLCB0aG91Z2gsIHRoaXMgcGFydGljdWxhciBjb21taXQg
d2FzCm1lcmdlZCB2aWEgZHJtLW1pc2MtbmV4dCBbMV0uCgpBcyBhIHNpZGUgbm90ZSwgdGhlcmUg
c2VlbSB0byBiZSBleHRyYSBjaGVja3MgaW4gcGxhY2UgZm9yIGFja3Mgd2hlbgphcHBseWluZyBu
b24taTkxNSBwYXRjaGVzIHRvIGRybS1pbnRlbDsgdGhlcmUgYXJlIG5vIHN1Y2ggY2hlY2tzIGZv
cgpkcm0tbWlzYy4KCgpCUiwKSmFuaS4KCgpbMV0gaHR0cDovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjAwNDE0MDkwNzM4LkdBMTY4MjdAbGludXgtdXE5ZwoKPgo+IERhdmUuCj4KPgo+ICBTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAgICAgVGVz
dGVkLWJ5OiBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgPHZlbmthdGEucy5kaGFuYWxha290
YUBpbnRlbC5jb20+Cj4gICAgIFJldmlld2VkLWJ5OiBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtv
dGEgPHZlbmthdGEucy5kaGFuYWxha290YUBpbnRlbC5jb20+Cj4KPgo+IE9uIFRodSwgMjUgSnVu
IDIwMjAgYXQgMjI6NDMsIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4gd3JvdGU6Cj4+Cj4+IEFtIDI1LjA2LjIwIHVtIDE0OjM0IHNjaHJpZWIgTGlvbmVsIExhbmR3
ZXJsaW46Cj4+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA1ZGUzNzZiYjQzNGY4MGExMzEzOGYwZWJl
ZGM4MzUxYWI3M2Q4YjBkLgo+PiA+Cj4+ID4gVGhpcyBjaGFuZ2UgYnJlYWtzIHN5bmNocm9uaXph
dGlvbiBvZiBhIHRpbWVsaW5lLgo+PiA+IGRtYV9mZW5jZV9jaGFpbl9maW5kX3NlcW5vKCkgbWln
aHQgYmUgYSBiaXQgb2YgYSBjb25mdXNpbmcgbmFtZSBidXQKPj4gPiB0aGlzIGZ1bmN0aW9uIGlz
IG5vdCB0cnlpbmcgdG8gZmluZCBhIHBhcnRpY3VsYXIgc2Vxbm8sIGlzIHN1cHBvc2VkIHRvCj4+
ID4gZ2l2ZSBhIGZlbmNlIHRvIHdhaXQgb24gZm9yIGEgcGFydGljdWxhciBwb2ludCBpbiB0aGUg
dGltZWxpbmUuCj4+ID4KPj4gPiBJbiBhIHRpbWVsaW5lLCBhIHBhcnRpY3VsYXIgdmFsdWUgaXMg
cmVhY2hlZCB3aGVuIGFsbCB0aGUgcG9pbnRzIHVwIHRvCj4+ID4gYW5kIGluY2x1ZGluZyB0aGF0
IHZhbHVlIGhhdmUgc2lnbmFsZWQuCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBMaW9uZWwgTGFu
ZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Cj4+ID4gLS0t
Cj4+ID4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMgfCA3IC0tLS0tLS0KPj4g
PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UtY2hhaW4uYwo+PiA+IGluZGV4IGM0MzViYmJhODUxYy4uM2QxMjM1MDJmZjEyIDEwMDY0
NAo+PiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+PiA+ICsrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+PiA+IEBAIC05OSwxMiArOTksNiBA
QCBpbnQgZG1hX2ZlbmNlX2NoYWluX2ZpbmRfc2Vxbm8oc3RydWN0IGRtYV9mZW5jZSAqKnBmZW5j
ZSwgdWludDY0X3Qgc2Vxbm8pCj4+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4g
Pgo+PiA+ICAgICAgIGRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaCgqcGZlbmNlLCAmY2hhaW4tPmJh
c2UpIHsKPj4gPiAtICAgICAgICAgICAgIGlmICgoKnBmZW5jZSktPnNlcW5vIDwgc2Vxbm8pIHsg
LyogYWxyZWFkeSBzaWduYWxlZCAqLwo+PiA+IC0gICAgICAgICAgICAgICAgICAgICBkbWFfZmVu
Y2VfcHV0KCpwZmVuY2UpOwo+PiA+IC0gICAgICAgICAgICAgICAgICAgICAqcGZlbmNlID0gTlVM
TDsKPj4gPiAtICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ID4gLSAgICAgICAgICAgICB9
Cj4+ID4gLQo+PiA+ICAgICAgICAgICAgICAgaWYgKCgqcGZlbmNlKS0+Y29udGV4dCAhPSBjaGFp
bi0+YmFzZS5jb250ZXh0IHx8Cj4+ID4gICAgICAgICAgICAgICAgICAgdG9fZG1hX2ZlbmNlX2No
YWluKCpwZmVuY2UpLT5wcmV2X3NlcW5vIDwgc2Vxbm8pCj4+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+PiA+IEBAIC0yMjgsNyArMjIyLDYgQEAgRVhQT1JUX1NZTUJPTChkbWFfZmVu
Y2VfY2hhaW5fb3BzKTsKPj4gPiAgICAqIEBjaGFpbjogdGhlIGNoYWluIG5vZGUgdG8gaW5pdGlh
bGl6ZQo+PiA+ICAgICogQHByZXY6IHRoZSBwcmV2aW91cyBmZW5jZQo+PiA+ICAgICogQGZlbmNl
OiB0aGUgY3VycmVudCBmZW5jZQo+PiA+IC0gKiBAc2Vxbm86IHRoZSBzZXF1ZW5jZSBudW1iZXIg
KHN5bmNwdCkgb2YgdGhlIGZlbmNlIHdpdGhpbiB0aGUgY2hhaW4KPj4gPiAgICAqCj4+ID4gICAg
KiBJbml0aWFsaXplIGEgbmV3IGNoYWluIG5vZGUgYW5kIGVpdGhlciBzdGFydCBhIG5ldyBjaGFp
biBvciBhZGQgdGhlIG5vZGUgdG8KPj4gPiAgICAqIHRoZSBleGlzdGluZyBjaGFpbiBvZiB0aGUg
cHJldmlvdXMgZmVuY2UuCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPj4gSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
