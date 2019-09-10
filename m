Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BEAF64B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0104F6EA23;
	Wed, 11 Sep 2019 07:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6111C6E872;
 Tue, 10 Sep 2019 09:40:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DACD0B718;
 Tue, 10 Sep 2019 09:40:02 +0000 (UTC)
Date: Tue, 10 Sep 2019 11:40:12 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/edid: Don't look for CEA data blocks in CEA ext
 block rev < 3
Message-ID: <20190910114012.74ab6f5c@endymion>
In-Reply-To: <20190902131546.4691-1-ville.syrjala@linux.intel.com>
References: <20190902131546.4691-1-ville.syrjala@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiBNb24sICAyIFNlcCAyMDE5IDE2OjE1OjQ1ICswMzAwLCBWaWxsZSBTeXJq
YWxhIHdyb3RlOgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gCj4gQ0VBIGV4dCBibG9jayByZXZpc2lvbnMgMSBhbmQgMiBkbyBub3QgY29u
dGFpbiB0aGUgZGF0YSBibG9jawo+IGNvbGxlY3Rpb24uIEluc3RlYWQgdGhhdCBzZWN0aW9uIG9m
IHRoZSBleHRlbnNpb24gYmxvY2sgaXMKPiBtYXJrZWQgYXMgcmVzZXJ2ZWQgZm9yIDggYnl0ZSB0
aW1pbmcgZGVzY3JpcHRvcnMuIFJldmlzaW9uIDMKPiBjaGFuZ2VkIGl0IHRvIGNvbnRhaW4gdGhl
IENFQSBkYXRhIGJsb2NrIGNvbGxlY3Rpb24gaW5zdGVhZC4KPiAKPiBNb3N0IHBsYWNlcyB0aGF0
IGl0ZXJhdGUgdGhlIGRhdGEgYmxvY2tzIGFscmVhZHkgY2hlY2sgZm9yCj4gcmV2aXNpb24gPj0g
MywgYnV0IGRybV9kZXRlY3RfaGRtaV9tb25pdG9yKCkgYW5kCj4gZHJtX2RldGVjdF9tb25pdG9y
X2F1ZGlvKCkgZG8gbm90LiBTbyBpbiB0aGVvcnkgd2hlbiBlbmNvdW50ZXJpbmcKPiByZXYgMSBv
ciAyIENFQSBleHRlbnNpb24gYmxvY2sgdGhleSBjb3VsZCBlbmQgdXAgbWlzaW50ZXJwcmV0aW5n
Cj4gd2hhdGV2ZXIgZGF0YSBpcyBpbiB0aGUgcmVzZXJ2ZWQgc2VjdGlvbiBhcyBDRUEgZGF0YSBi
bG9ja3MuCj4gCj4gTGV0J3MgaGF2ZSBjZWFfZGJfb2Zmc2V0cygpIGRvIHRoZSByZXZpc2lvbiBj
aGVjayBzbyB0aGF0IHRoZQo+IGNhbGxlcnMgZG9uJ3QgZXZlbiBoYXZlIHdvcnJ5IGFib3V0IGl0
Lgo+IAo+IENjOiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuZGU+Cj4gU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCA4MmE0Y2VlZDNmY2YuLjdi
MzA3MmZjNTUwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTM2OTAsNiArMzY5MCw5IEBAIGNl
YV9yZXZpc2lvbihjb25zdCB1OCAqY2VhKQo+ICBzdGF0aWMgaW50Cj4gIGNlYV9kYl9vZmZzZXRz
KGNvbnN0IHU4ICpjZWEsIGludCAqc3RhcnQsIGludCAqZW5kKQo+ICB7Cj4gKwlpZiAoY2VhX3Jl
dmlzaW9uKGNlYSkgPCAzKQo+ICsJCXJldHVybiAtRU5PVFNVUFA7Cj4gKwo+ICAJLyogRGlzcGxh
eUlEIENUQSBleHRlbnNpb24gYmxvY2tzIGFuZCB0b3AtbGV2ZWwgQ0VBIEVESUQKPiAgCSAqIGJs
b2NrIGhlYWRlciBkZWZpbml0aW9ucyBkaWZmZXIgaW4gdGhlIGZvbGxvd2luZyBieXRlczoKPiAg
CSAqICAgMSkgQnl0ZSAyIG9mIHRoZSBoZWFkZXIgc3BlY2lmaWVzIGxlbmd0aCBkaWZmZXJlbnRs
eSwKClJldmlld2VkLWJ5OiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuZGU+CgpJIGxpa2Ug
aXQsIGJ1dCB0aGVuIHdlIG5lZWQgYSBzdWJzZXF1ZW50IHBhdGNoIHRvIHJlbW92ZSB0aGUgbm93
CnJlZHVuZGFudCBjaGVja3MgaW4gYWRkX2NlYV9tb2RlcygpLCBkcm1fZWRpZF90b19lbGQoKSwK
ZHJtX2VkaWRfdG9fc2FkKCkgYW5kIGRybV9lZGlkX3RvX3NwZWFrZXJfYWxsb2NhdGlvbigpLgoK
VGhlc2UgbGFzdCAyIGZ1bmN0aW9ucyBhcmUgdGhlIG9uZXMgbXkgb3duIHBhdGNoIG1vZGlmaWVz
LCBzbyBzb21lIGNhcmUKaXMgbmVlZGVkLiBJZiBjZWFfZGJfb2Zmc2V0cygpIG5vdyByZXR1cm5z
IGFuIGVycm9yIHdoZW4gQ0VBIHJldmlzaW9ucwo8IDMsIHRoZW4gdGhlc2UgZnVuY3Rpb25zIHdh
bnQgdG8gcmV0dXJuIDAgaW4gdGhhdCBjYXNlIChvdGhlcndpc2UgeW91CmVmZmVjdGl2ZWx5IHVu
ZG8gdGhlIGNoYW5nZSBJIHByb3Bvc2VkKS4KCkJ5IHRoZSB3YXksICBib3RoIGZ1bmN0aW9ucyBp
c3N1ZSBhIGRlYnVnIG1lc3NhZ2UgIlNBRDogaW52YWxpZCBkYXRhCmJsb2NrIG9mZnNldHMiIHdo
ZW4gY2VhX2RiX29mZnNldHMoKSByZXR1cm5zIGFuIGVycm9yLCB3aGljaCBiZWNvbWVzCm1pc2xl
YWRpbmcgYWZ0ZXIgeW91ciBjaGFuZ2UuIEkgdGhpbmsgd2Ugd2FudCB0byBtb3ZlIHRoaXMgbWVz
c2FnZQppbnNpZGUgY2VhX2RiX29mZnNldHMoKSBhbmQgb25seSBwcmludCBpdCBpbiB0aGUgLUVS
QU5HRSBjYXNlLgoKLS0gCkplYW4gRGVsdmFyZQpTVVNFIEwzIFN1cHBvcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
