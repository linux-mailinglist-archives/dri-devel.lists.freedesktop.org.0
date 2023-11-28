Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99D7FB4EB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16810E45E;
	Tue, 28 Nov 2023 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901E10E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+tMeBtWgAVcK2Qsxs11ho0hLx98pEVC6xl378lnyRWc=; b=W8Ea3q/PNJWjDIu6wFREE8JOTe
 G7G/l9aVTPZtOj2yQf8IhUTafXrbdkjzTPblsAf9sf1415dosMFM9YL78t4+KhJrGO7pzGZXdARtw
 CVLQGgj+2XDqwaoh/DbZ7TedCflwIzKaawdmhd1b3vYIcm/79JdUp75thvdydRK1Aj/fXrwscStn3
 uPmcUqKAiTthNR0yyyJIjq6X7xK6lKo7QlUH+LoNoHpcvyteNzIC9hpF1jc8m/f7sc3R7ZZW4pRbT
 2ks88cFcugSmjIERzoishYSofFKRFxSaDS64AIB1rjLim6dvulEahy1wkLzGFaa/wo85MoWA3DfT1
 g+IqzBtg==;
Received: from 93.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.93]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7trr-007xql-Kx; Tue, 28 Nov 2023 09:54:55 +0100
Message-ID: <ccb7cda91d95f3d0bda67d561572638052bd77eb.camel@igalia.com>
Subject: Re: [PATCH v3 15/17] drm/v3d: Create a CPU job extension to copy
 timestamp query to a buffer
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 28 Nov 2023 09:54:55 +0100
In-Reply-To: <20231127185723.10348-17-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
 <20231127185723.10348-17-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.1-0ubuntu1 
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RWwgbHVuLCAyNy0xMS0yMDIzIGEgbGFzIDE1OjQ4IC0wMzAwLCBNYcOtcmEgQ2FuYWwgZXNjcmli
acOzOgooLi4uKQo+IMKgLyoqCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdjNkX2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS92M2RfZHJtLmgKPiBpbmRleCA5MzBmOGQwN2YwODguLmEz
YWUxZjIyMDI5MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3YzZF9kcm0uaAo+ICsr
KyBiL2luY2x1ZGUvdWFwaS9kcm0vdjNkX2RybS5oCj4gQEAgLTc1LDYgKzc1LDcgQEAgc3RydWN0
IGRybV92M2RfZXh0ZW5zaW9uIHsKPiDCoCNkZWZpbmUgRFJNX1YzRF9FWFRfSURfQ1BVX0lORElS
RUNUX0NTRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgwMgo+IMKgI2RlZmluZSBE
Uk1fVjNEX0VYVF9JRF9DUFVfVElNRVNUQU1QX1FVRVJZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAweDAzCj4gwqAjZGVmaW5lIERSTV9WM0RfRVhUX0lEX0NQVV9SRVNFVF9USU1FU1RBTVBfUVVF
UlnCoMKgwqDCoMKgwqDCoDB4MDQKPiArI2RlZmluZSBEUk1fVjNEX0VYVF9JRF9DUFVfQ09QWV9U
SU1FU1RBTVBfUVVFUlnCoMKgwqDCoMKgwqDCoMKgMHgwNQo+IMKgwqDCoMKgwqDCoMKgwqBfX3Uz
MiBmbGFnczsgLyogbWJ6ICovCj4gwqB9Owo+IMKgCj4gQEAgLTQ1MSw2ICs0NTIsNDYgQEAgc3Ry
dWN0IGRybV92M2RfcmVzZXRfdGltZXN0YW1wX3F1ZXJ5IHsKPiDCoMKgwqDCoMKgwqDCoMKgX191
MzIgY291bnQ7Cj4gwqB9Owo+IMKgCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgZHJtX3YzZF9jb3B5X3Rp
bWVzdGFtcF9xdWVyeSAtIGlvY3RsIGV4dGVuc2lvbiBmb3IgdGhlIENQVQo+IGpvYiB0byBjb3B5
Cj4gKyAqIHF1ZXJ5IHJlc3VsdHMgdG8gYSBidWZmZXIKPiArICoKPiArICogV2hlbiBhbiBleHRl
bnNpb24gRFJNX1YzRF9FWFRfSURfQ1BVX0NPUFlfVElNRVNUQU1QX1FVRVJZIGlzCj4gZGVmaW5l
ZCwgaXQKPiArICogcG9pbnRzIHRvIHRoaXMgZXh0ZW5zaW9uIHRvIGRlZmluZSBhIGNvcHkgdGlt
ZXN0YW1wIHF1ZXJ5Cj4gc3VibWlzc2lvbi4gVGhpcwo+ICsgKiBDUFUgam9iIHdpbGwgY29weSB0
aGUgdGltZXN0YW1wIHF1ZXJpZXMgcmVzdWx0cyB0byBhIEJPIHdpdGggdGhlCj4gb2Zmc2V0Cj4g
KyAqIGFuZCBzdHJpZGUgZGVmaW5lZCBpbiB0aGUgZXh0ZW5zaW9uLgo+ICsgKi8KPiArc3RydWN0
IGRybV92M2RfY29weV90aW1lc3RhbXBfcXVlcnkgewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBk
cm1fdjNkX2V4dGVuc2lvbiBiYXNlOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBEZWZpbmUgaWYg
c2hvdWxkIHdyaXRlIHRvIGJ1ZmZlciB1c2luZyA2NCBvciAzMiBiaXRzICovCj4gK8KgwqDCoMKg
wqDCoMKgX191OCBkb182NGJpdDsKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyogRGVmaW5lIGlmIGl0
IGNhbiB3cml0ZSB0byBidWZmZXIgZXZlbiBpZiB0aGUgcXVlcnkgaXMgbm90Cj4gYXZhaWxhYmxl
ICovCj4gK8KgwqDCoMKgwqDCoMKgX191OCBkb19wYXJ0aWFsOwo+ICsKPiArwqDCoMKgwqDCoMKg
wqAvKiBEZWZpbmUgaWYgaXQgc2hvdWxkIHdyaXRlIGF2YWlsYWJpbGl0eSBiaXQgdG8gYnVmZmVy
ICovCj4gK8KgwqDCoMKgwqDCoMKgX191OCBhdmFpbGFiaWxpdHlfYml0Owo+ICsKPiArwqDCoMKg
wqDCoMKgwqAvKiBtYnogKi8KPiArwqDCoMKgwqDCoMKgwqBfX3U4IHBhZDsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgLyogT2Zmc2V0IG9mIHRoZSBidWZmZXIgaW4gdGhlIEJPICovCj4gK8KgwqDCoMKg
wqDCoMKgX191MzIgb2Zmc2V0Owo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBTdHJpZGUgb2YgdGhl
IGJ1ZmZlciBpbiB0aGUgQk8gKi8KPiArwqDCoMKgwqDCoMKgwqBfX3UzMiBzdHJpZGU7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoC8qIE51bWJlciBvZiBxdWVyaWVzICovCj4gK8KgwqDCoMKgwqDCoMKg
X191MzIgY291bnQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qIEFycmF5IG9mIHF1ZXJpZXMnIG9m
ZnNldHMgd2l0aGluIHRoZSB0aW1lc3RhbXAgQk8gZm9yCj4gdGhlaXIgdmFsdWUgKi8KPiArwqDC
oMKgwqDCoMKgwqBfX3U2NCBvZmZzZXRzOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBBcnJheSBv
ZiB0aW1lc3RhbXAncyBzeW5jb2JqcyB0byBpbmRpY2F0ZSBpdHMgYXZhaWxhYmlsaXR5Cj4gKi8K
PiArwqDCoMKgwqDCoMKgwqBfX3U2NCBzeW5jczsKPiArfTsKPiArCj4gwqBzdHJ1Y3QgZHJtX3Yz
ZF9zdWJtaXRfY3B1IHsKPiDCoMKgwqDCoMKgwqDCoMKgLyogUG9pbnRlciB0byBhIHUzMiBhcnJh
eSBvZiB0aGUgQk9zIHRoYXQgYXJlIHJlZmVyZW5jZWQgYnkKPiB0aGUgam9iLgo+IMKgwqDCoMKg
wqDCoMKgwqAgKgo+IEBAIC00NjIsNiArNTAzLDEwIEBAIHN0cnVjdCBkcm1fdjNkX3N1Ym1pdF9j
cHUgewo+IMKgwqDCoMKgwqDCoMKgwqAgKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBGb3IgRFJNX1Yz
RF9FWFRfSURfQ1BVX1JFU0VUX1RJTUVTVEFNUF9RVUVSWSwgaXQgbXVzdAo+IGNvbnRhaW4gb25s
eQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBvbmUgQk8sIHRoYXQgY29udGFpbnMgdGhlIHRpbWVzdGFt
cC4KPiArwqDCoMKgwqDCoMKgwqAgKgo+ICvCoMKgwqDCoMKgwqDCoCAqIEZvciBEUk1fVjNEX0VY
VF9JRF9DUFVfQ09QWV9USU1FU1RBTVBfUVVFUlksIGl0IG11c3QKPiBjb250YWluIHR3bwo+ICvC
oMKgwqDCoMKgwqDCoCAqIEJPcy4gVGhlIGZpcnN0IGlzIHRoZSBCTyBmb3Igd2hpY2ggdGhlIHRp
bWVzdGFtcCBxdWVyaWVzCj4gcmVzdWx0cwo+ICvCoMKgwqDCoMKgwqDCoCAqIHdpbGwgYmUgd3Jp
dHRlbiB0by4gVGhlIHNlY29uZCBpcyB0aGUgQk8gdGhhdCBjb250YWlucyB0aGUKPiB0aW1lc3Rh
bXAuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwoKKC4uLikgVGhlIGZpcnN0IGlzIHRoZSBCTyB3aGVy
ZSB0aGUgdGltZXN0YW1wIHF1ZXJpZXMgd2lsbCBiZSB3cml0dGVuCnRvLiAoLi4uKQoKSWFnbwoK
PiDCoMKgwqDCoMKgwqDCoMKgX191NjQgYm9faGFuZGxlczsKPiDCoAoK

