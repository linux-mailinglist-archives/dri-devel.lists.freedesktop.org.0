Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0399295D07
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 12:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2452A6E0AC;
	Thu, 22 Oct 2020 10:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3AF6E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 10:57:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6006CACE0;
 Thu, 22 Oct 2020 10:57:54 +0000 (UTC)
To: Hans de Goede <hdegoede@redhat.com>, airlied@linux.ie, daniel@ffwll.ch,
 sean@poorly.run, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20201021130732.4048-1-tzimmermann@suse.de>
 <d5cc8a94-e908-84a1-09b2-fef7a2e78d91@redhat.com>
 <42768db1-37a6-ee8d-aa82-d14fc8806a4b@suse.de>
 <ff855bd4-8b74-15f4-c81e-05ad39ac5885@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
Message-ID: <45390c74-c8dc-7fc4-cae8-f5f73fb2b764@suse.de>
Date: Thu, 22 Oct 2020 12:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <ff855bd4-8b74-15f4-c81e-05ad39ac5885@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucwoKT24gMjIuMTAuMjAgMTI6MTcsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4gSGksCj4g
Cj4gT24gMTAvMjIvMjAgMTE6MzAgQU0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+PiBIaQo+
Pgo+PiBPbiAyMi4xMC4yMCAxMToyMCwgSGFucyBkZSBHb2VkZSB3cm90ZToKPj4+IEhpLAo+Pj4K
Pj4+IE9uIDEwLzIxLzIwIDM6MDcgUE0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+Pj4+IFRo
ZSBkcml2ZXJzIGdtMTJ1MzIwIGFuZCB1ZGwgb3BlcmF0ZSBvbiBVU0IgZGV2aWNlcy4gVGhleSBs
ZWF2ZSB0aGUKPj4+PiBQQ0kgZGV2aWNlIGluIHN0cnVjdCBkcm1fZGV2aWNlIGVtcHR5IGFuZCBz
dG9yZSB0aGUgVVNCIGRldmljZSBpbiB0aGVpcgo+Pj4+IG93biBkcml2ZXIgc3RydWN0dXJlLgo+
Pj4+Cj4+Pj4gRml4IHRoaXMgc3BlY2lhbCBjYXNlIGFuZCBzYXZlIGEgZmV3IGJ5dGVzIGJ5IHB1
dHRpbmcgdGhlIFVTQiBkZXZpY2UKPj4+PiBpbnRvIGFuIGFub255bW91cyB1bmlvbiB3aXRoIHRo
ZSBQQ0kgZGF0YS4gSXQncyBleHBlY3RlZCB0aGF0IERSTQo+Pj4+IGNvcmUgYW5kIGhlbHBlcnMg
b25seSB0b3VjaCB0aGUgUENJLWRldmljZSBmaWVsZCBmb3IgYWN0dWFsIFBDSSBkZXZpY2VzLgo+
Pj4+Cj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4gKDMpOgo+Pj4+ICAgZHJtOiBBZGQgcmVmZXJlbmNl
IHRvIFVTQiBkZXZpY2UgdG8gc3RydWN0IGRybV9kZXZpY2UKPj4+PiAgIGRybS90aW55L2dtMTJ1
MzIwOiBTdG9yZSBVU0IgZGV2aWNlIGluIHN0cnVjdCBkcm1fZGV2aWNlLnVkZXYKPj4+PiAgIGRy
bS91ZGw6IFN0b3JlIFVTQiBkZXZpY2UgaW4gc3RydWN0IGRybV9kZXZpY2UudWRldgo+Pj4KPj4+
IFRoaXMgc2VyaWVzIGxvb2tzIGdvb2QgdG8gbWU6Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+Cj4+IFRoYW5rcyBhIGxvdC4gRm9sbG93
aW5nIERhbmllbCdzIHJlcXVlc3QsIEknbGwgZHJvcCBwYXRjaCAxIGFuZCBpbnN0ZWFkCj4+IGRv
IGFuIHVwY2FzdCBmcm9tIGRybV9kZXZpY2UuZGV2IHRvIHRoZSBVU0IgZGV2aWNlIHN0cnVjdHVy
ZS4gVGhlIGRyaXZlcgo+PiBwYXRjaGVzIDIgYW5kIDMgd2lsbCBiZSBzbGlnaHRseSBkaWZmZXJl
bnQuIFVubGVzcyB5b3Ugb2JqZWN0LCBJJydsbAo+PiB0YWtlIHRoZSByLWIgaW50byB0aGUgbmV3
IHBhdGNoZXMuCj4gCj4gSSBzb21laG93IG1pc3NlZCBEYW5pZWwncyByZXBseSBhYm91dCB0aGlz
Lgo+IAo+IFdpdGggdGhhdCBzYWlkLCBobW0gdGhhdCBpcyBnb2luZyB0byBiZSBhbiBpbnRlcmVz
dGluZyB1cC1jYXN0LCBhdCBsZWFzdAo+IGZvciB0aGUgZ20xMnUzMjAsIHRoYXQgaXMgZ29pbmcg
dG8gbG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IAlzdHJ1Y3QgdXNiX2RldmljZSAqdWRl
diA9IGludGVyZmFjZV90b191c2JkZXYodG9fdXNiX2ludGVyZmFjZShkcm1fZGV2LT5kZXYpKTsK
PiAKPiAoSSB3cm90ZSBkcm1fZGV2IGluc3RlYWQgb2YgZGV2IHRvIG1ha2UgaXQgbW9yZSBjbGVh
ciB3aGF0IGlzIGdvaW5nIG9uKQo+IAo+IEZvciB0aGUgRFJNX0RFVl9FUlJPUigpIG1hY3JvIHlv
dSBjYW4ganVzdCB1c2UgZ20xMnUzMjAtPmRldi5kZXYgLAo+IHRoYXQgd2lsbCBtYWtlIHRoZSBl
cnJvcnMgYmUgcHJpbnRlZCB3aXRoIHRoZSBpbiB1c2ItaW50ZXJmYWNlIGRldmljZS1uYW1lCj4g
YXMgcHJlZml4IGluc3RlYWQgb2YgdGhlIHVzYi1kZXZpY2UgZGV2aWNlLW5hbWUsIGJ1dCB0aGF0
IGlzIGZpbmUuCj4gCj4gSSB3b25kZXIgb2YgdGhpcyBpcyBhbGwgd29ydGggaXQgdGhlbiB0aG91
Z2gsIGp1c3QgdG8gc2F2ZSB0aG9zZSBmZXcgYnl0ZXMgPwo+IAoKRGFuaWVsIGFuZCBJIGJyaWVm
bHkgZGlzY3Vzc2VkIG9uIElSQyBpZiB3ZSBjb3VsZCBtYWtlIGRybV9kZXZpY2UucGRldgoodGhl
IFBDSSBkZXYgKSBhIGxlZ2FjeSBmaWVsZCBpbiB0aGUgbG9uZ2VyIHRlcm0uIEFsbCBMaW51eCBk
ZXZpY2VzCndvdWxkIGJlIHJldHJpZXZlZCBmcm9tIGRybV9kZXZpY2UuZGV2IHRoZW4uCgo+IFRo
ZSBmaXJzdCB2ZXJzaW9uIG1hZGUgc29tZSBzZW5zZSBzaW5jZSBpdCBtYWRlIGhvdyBkcm0gZGV2
aWNlcyB3aXRoCj4gdXNiIHJlc3AuIHBjaSBwYXJlbnRzIGFyZSBoYW5kbGVkIGNvbnNpc3RlbnQu
IE5vdyBpdCBzZWVtcyB0byBtYWtlIHRoZSBjb2RlCj4gc29tZXdoYXQgaGFyZGVyIHRvIHVuZGVy
c3RhbmQganVzdCB0byBzYXZlIHRoZSBzdG9yYWdlIGZvciBhIHNpbmdsZSBwb2ludGVyLi4uCgpX
aGF0J3MgdGhlIGltcGxpY2F0aW9uIG9mIHNldHRpbmcgZHJtX2RldmljZS5kZXYgdG8gdGhlIHZh
bHVlIG9mIHN0cnVjdAp1c2JfZGV2aWNlLmRldiA/IFRoYXQncyB0aGUgZGV2aWNlIGFsbCB0aGUg
Y29kZSBpbnRlcmFjdHMgd2l0aC4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4gCj4gUmVnYXJkcywK
PiAKPiBIYW5zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCj4gCgotLSAKVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
