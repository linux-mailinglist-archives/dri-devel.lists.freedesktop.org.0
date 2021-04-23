Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEFF36904A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 12:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1F46EB6C;
	Fri, 23 Apr 2021 10:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976706EB6A;
 Fri, 23 Apr 2021 10:25:41 +0000 (UTC)
IronPort-SDR: jQbp6j471mOjctQk8vP9WXC2+tCJrTyeU/QAUpkQZj5PhzkgYK+6UjB4nUUd/xLbNSy/anzckt
 cwK2CoTBhmjg==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="183177981"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="183177981"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 03:25:40 -0700
IronPort-SDR: eZhKDjuhol7YhiGYVlQp6dOphKMesg1EmOkeIZu+aVLlv44TY2eDllCzO1Pdu+2lmBQa7ff03S
 shiLlf0zzt0A==
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="421717672"
Received: from gbocanex-mobl.ger.corp.intel.com (HELO [10.252.49.5])
 ([10.252.49.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 03:25:38 -0700
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Rename DP_PSR_SELECTIVE_UPDATE to
 better mach eDP spec
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>
References: <20210421220224.200729-1-jose.souza@intel.com>
 <c59186be4be98826c8fe5e88e0032cdf6a16025b.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <b250e029-2b10-baa6-5822-42df586c6477@linux.intel.com>
Date: Fri, 23 Apr 2021 12:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <c59186be4be98826c8fe5e88e0032cdf6a16025b.camel@intel.com>
Content-Language: en-US
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjItMDQtMjAyMSBvbSAxMzowMCBzY2hyZWVmIE11biwgR3dhbi1neWVvbmc6Cj4gVGhlIGNo
YW5nZWQgbmFtZSBsb29rcyBtb3JlIGFjY3VyYXRlIHRvIHRoZSBlZHAgMS40YiBzcGVjLgo+IExv
b2tzIGdvb2QgdG8gbWUuCj4KPiBSZXZpZXdlZC1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5
ZW9uZy5tdW5AaW50ZWwuY29tPgo+Cj4gT24gV2VkLCAyMDIxLTA0LTIxIGF0IDE1OjAyIC0wNzAw
LCBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIHdyb3RlOgo+PiBEUF9QU1JfRU5fQ0ZHIGJpdCA1IGFr
YSAiU2VsZWN0aXZlIFVwZGF0ZSBSZWdpb24gU2NhbiBMaW5lIENhcHR1cmUKPj4gSW5kaWNhdGlv
biIgaW4gZURQIHNwZWMgaGFzIGEgYW1iaWd1b3VzIG5hbWUsIHNvIHJlbmFtaW5nIHRvIGJldHRl
cgo+PiBtYXRjaCBzcGVjaWZpY2F0aW9uLgo+Pgo+PiBXaGlsZSBhdCBpdCwgcmVwbGFjaW5nIGJp
dCBzaGl0IGJ5IEJJVCgpIG1hY3JvIGFuZCBhZGRpbmcgdGhlIHZlcnNpb24KPj4gc29tZSByZWdp
c3RlcnMgd2VyZSBhZGRlZCB0byBlRFAgc3BlY2lmaWNhdGlvbi4KPj4KPj4gQ2M6IDxkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgo+PiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPgo+PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4K
Pj4gQ2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
Cj4+IC0tLQo+PiDCoGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDE2ICsrKysrKysrLS0t
LS0tLS0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4+IGluZGV4IDFlODVjMjAyMWYyZi4uZDZmNmEwODRhMTkw
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPj4gKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4+IEBAIC02ODcsMTQgKzY4NywxNCBAQCBzdHJ1Y3Qg
ZHJtX2RldmljZTsKPj4gwqAjZGVmaW5lIERQX0RTQ19FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDE2MMKgwqAgLyogRFAgMS40ICovCj4+IMKgIyBk
ZWZpbmUgRFBfREVDT01QUkVTU0lPTl9FTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAo
MSA8PCAwKQo+PiDCoAo+PiAtI2RlZmluZSBEUF9QU1JfRU5fQ0ZHwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MTcwwqDCoCAvKiBYWFggMS4yPyAqLwo+PiAtIyBk
ZWZpbmUgRFBfUFNSX0VOQUJMRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKDEgPDwgMCkKPj4gLSMgZGVmaW5lIERQX1BTUl9NQUlOX0xJTktfQUNUSVZFwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKDEgPDwgMSkKPj4gLSMgZGVmaW5lIERQX1BTUl9DUkNfVkVSSUZJQ0FUSU9O
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMikKPj4gLSMgZGVmaW5lIERQX1BTUl9GUkFNRV9D
QVBUVVJFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgMykKPj4gLSMgZGVmaW5lIERQ
X1BTUl9TRUxFQ1RJVkVfVVBEQVRFwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDEgPDwgNCkKPj4gLSMg
ZGVmaW5lIERQX1BTUl9JUlFfSFBEX1dJVEhfQ1JDX0VSUk9SU8KgwqDCoMKgICgxIDw8IDUpCj4+
IC0jIGRlZmluZSBEUF9QU1JfRU5BQkxFX1BTUjLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKDEgPDwgNikgLyogZURQIDEuNGEgKi8KPj4gKyNkZWZpbmUgRFBfUFNSX0VOX0NGR8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDE3MMKgwqAg
LyogWFhYIDEuMj8gKi8KPj4gKyMgZGVmaW5lIERQX1BTUl9FTkFCTEXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgwKQo+PiArIyBkZWZpbmUgRFBf
UFNSX01BSU5fTElOS19BQ1RJVkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoMSkK
Pj4gKyMgZGVmaW5lIERQX1BTUl9DUkNfVkVSSUZJQ0FUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgQklUKDIpCj4+ICsjIGRlZmluZSBEUF9QU1JfRlJBTUVfQ0FQVFVSRcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgzKQo+PiArIyBkZWZpbmUgRFBfUFNSX1NV
X1JFR0lPTl9TQ0FOTElORV9DQVBUVVJFwqDCoMKgwqDCoEJJVCg0KSAvKiBlRFAgMS40YSAqLwo+
PiArIyBkZWZpbmUgRFBfUFNSX0lSUV9IUERfV0lUSF9DUkNfRVJST1JTwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBCSVQoNSkgLyogZURQCj4+IDEuNGEgKi8KPj4gKyMgZGVmaW5lIERQ
X1BTUl9FTkFCTEVfUFNSMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBC
SVQoNikgLyogZURQIDEuNGEgKi8KPj4gwqAKPj4gwqAjZGVmaW5lIERQX0FEQVBURVJfQ1RSTMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFh
MAo+PiDCoCMgZGVmaW5lIERQX0FEQVBURVJfQ1RSTF9GT1JDRV9MT0FEX1NFTlNFwqDCoCAoMSA8
PCAwKQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdm
eAoKVGhpcyBzaG91bGQgcHJvYmFibHkgZ28gdGhyb3VoIGRybS1taXNjLW5leHQsIEkgZG9uJ3Qg
c2VlIHRoZSBuZXh0IHBhdGNoIGRlcGVuZGluZyBvbiB0aGlzPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
