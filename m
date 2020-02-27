Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFFD171152
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 08:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442516E4CA;
	Thu, 27 Feb 2020 07:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17BE6E4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 07:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0DBF53F619;
 Thu, 27 Feb 2020 08:16:53 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iJco5cwq; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9s2FL3lWlzPa; Thu, 27 Feb 2020 08:16:52 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id ED2B23F56A;
 Thu, 27 Feb 2020 08:16:49 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 54FBC360161;
 Thu, 27 Feb 2020 08:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1582787809; bh=czSVFr3N8XD20OuzmIfwTeJukmx6qXdkbu8G6D4uGW4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iJco5cwq3tifyUhkXULafE2E2SK5e+v+J9B7XYh2qG+7F11JINzsBKZmLzRA9B/2w
 y2kbglX6cpm9cvR95UVbBEo93uBouanPt0rjIpjhuPqoTbLAvcCHybEOPYpbD0Irog
 n46IYsNNHpyrXpXirNOiX5dCn1yFly6CK5V20pqU=
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
To: Chia-I Wu <olvaffe@gmail.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <CAPaKu7R4VFYnk9UdpguZnkWeKk2ELVnoQ60=i72RN2GkME1ukw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <614ed528-8d6d-0179-6149-218566d4af06@shipmail.org>
Date: Thu, 27 Feb 2020 08:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPaKu7R4VFYnk9UdpguZnkWeKk2ELVnoQ60=i72RN2GkME1ukw@mail.gmail.com>
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
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>,
 David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yNy8yMCAxOjAyIEFNLCBDaGlhLUkgV3Ugd3JvdGU6Cj4gT24gV2VkLCBGZWIgMjYsIDIw
MjAgYXQgMTA6MjUgQU0gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkKPiA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz4gd3JvdGU6Cj4+IEhpLCBHZXJkLAo+Pgo+Pgo+Pgo+PiAgICAjZGVmaW5lIHRv
X2RybV9nZW1fc2htZW1fb2JqKG9iaikgXAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9o
ZWxwZXIuYwo+PiBpbmRleCBhNDIxYTJlZWQ0OGEuLmFhZDkzMjRkY2Y0ZiAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPj4gQEAgLTI1NCwxMSArMjU0LDE2IEBA
IHN0YXRpYyB2b2lkICpkcm1fZ2VtX3NobWVtX3ZtYXBfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3No
bWVtX29iamVjdCAqc2htZW0pCj4+ICAgICAgICBpZiAocmV0KQo+PiAgICAgICAgICAgICAgICBn
b3RvIGVycl96ZXJvX3VzZTsKPj4KPj4gLSAgICAgaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKPj4g
KyAgICAgaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkgewo+PiAgICAgICAgICAgICAgICBzaG1lbS0+
dmFkZHIgPSBkbWFfYnVmX3ZtYXAob2JqLT5pbXBvcnRfYXR0YWNoLT5kbWFidWYpOwo+PiAtICAg
ICBlbHNlCj4+ICsgICAgIH0gZWxzZSB7Cj4+ICsgICAgICAgICAgICAgcGdwcm90X3QgcHJvdCA9
IFBBR0VfS0VSTkVMOwo+PiArCj4+ICsgICAgICAgICAgICAgaWYgKCFzaG1lbS0+bWFwX2NhY2hl
ZCkKPj4gKyAgICAgICAgICAgICAgICAgICAgIHByb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKHBy
b3QpOwo+PiAgICAgICAgICAgICAgICBzaG1lbS0+dmFkZHIgPSB2bWFwKHNobWVtLT5wYWdlcywg
b2JqLT5zaXplID4+IFBBR0VfU0hJRlQsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBWTV9NQVAsIHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZNX01BUCwgcHJvdCkKPj4KPj4gV291bGRuJ3Qg
YSB2bWFwIHdpdGggcGdwcm90X3dyaXRlY29tYmluZSgpIGNyZWF0ZSBjb25mbGljdGluZyBtYXBw
aW5ncwo+PiB3aXRoIHRoZSBsaW5lYXIga2VybmVsIG1hcCB3aGljaCBpcyBub3Qgd3JpdGUtY29t
YmluZWQ/IE9yIGRvIHlvdSBjaGFuZ2UKPj4gdGhlIGxpbmVhciBrZXJuZWwgbWFwIG9mIHRoZSBz
aG1lbSBwYWdlcyBzb21ld2hlcmU/IHZtYXAgYnlwYXNzZXNzIGF0Cj4+IGxlYXN0IHRoZSB4ODYg
UEFUIGNvcmUgbWFwcGluZyBjb25zaXN0ZW5jeSBjaGVjayBhbmQgdGhpcyBjb3VsZAo+PiBwb3Rl
bnRpYWxseSBjYXVzZSBzcHVyaW91c2x5IG92ZXJ3cml0dGVuIG1lbW9yeS4KPiBZZWFoLCBJIHRo
aW5rIHRoaXMgY3JlYXRlcyBhIGNvbmZsaWN0aW5nIGFsaWFzLiAgSXQgc2VlbXMgYSBjYWxsIHRv
Cj4gc2V0X3BhZ2VzX2FycmF5X3djIGhlcmUgb3IgY2hhbmdlcyBlbHNld2hlcmUgaXMgbmVlZGVk
Li4KPgo+IEJ1dCB0aGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlIGluIHRoZSBzaG1lbSBoZWxw
ZXIuICBUaGVyZSBpcyBhbHNvCj4gbm8gdW5pdmVyc2FsIGZpeCAoZS5nLiwgc2V0X3BhZ2VzX2Fy
cmF5X3djIGlzIHg4NiBvbmx5KT8gIEkgd291bGQgaG9wZQo+IHRoaXMgc2VyaWVzIGNhbiBiZSBt
ZXJnZWQgc29vbmVyIHRvIGZpeCB0aGUgcmVncmVzc2lvbiBmaXJzdC4KClRoZSBwcm9ibGVtIGlz
IHRoaXMgaXNuJ3QgZG9hYmxlIHdpdGggc2htZW0sIHNpbmNlIHRoYXQgd291bGQgY3JlYXRlIApp
bnRlcmVzdGluZyBwcm9ibGVtcyB3aGVuIHBhZ2VzIGFyZSBzd2FwcGVkIG91dC4KClNvIEkgd291
bGQgYXJndWUgdGhhdCB0aGUgY29ycmVjdCBmaXggaXMgdG8gcmV2ZXJ0IGNvbW1pdCAwYmU4OTU4
OTM2MDdmIAooImRybS9zaG1lbTogc3dpdGNoIHNobWVtIGhlbHBlciB0byAmZHJtX2dlbV9vYmpl
Y3RfZnVuY3MubW1hcCIpCgpJZiBzb21lIGRyaXZlcnMgY2FuIGFyZ3VlIHRoYXQgaW4gdGhlaXIg
cGFydGljdWxhciBlbnZpcm9ubWVudCBpdCdzIHNhZmUgCnRvIHVzZSB3cml0ZWNvbWJpbmUgaW4g
dGhpcyB3YXksIHRoZW4gbW9kaWZ5aW5nIHRoZSBwYWdlIHByb3RlY3Rpb24gCnNob3VsZCBiZSBt
b3ZlZCBvdXQgdG8gdGhvc2UgZHJpdmVycyBkb2N1bWVudGluZyB0aGF0IGFzc3VtcHRpb24uIFVz
aW5nIApwZ3Byb3RfZGVjcnlwdGVkKCkgaW4gdGhpcyB3YXkgY291bGQgbmV2ZXIgYmUgc2FmZS4K
CkJ1dCBJTU8gdGhpcyBzaG91bGQgbmV2ZXIgYmUgcGFydCBvZiBnZW5lcmljIGhlbHBlcnMuCgov
VGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
