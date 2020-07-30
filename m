Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CEB2335D4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 17:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C67D6E8EB;
	Thu, 30 Jul 2020 15:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE476E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 15:45:18 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 30 Jul 2020 08:45:13 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id A72F3B278D;
 Thu, 30 Jul 2020 11:45:15 -0400 (EDT)
Subject: Re: [PATCH] ttm: ttm_bo_swapout_all doesn't use it's argument.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Dave Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20200728034254.20114-1-airlied@gmail.com>
 <976bf436-55aa-bfcf-cf74-1e02c2794d06@amd.com>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <abe4847a-63a2-5aae-f16d-79d1d8969d8a@vmware.com>
Date: Thu, 30 Jul 2020 17:45:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <976bf436-55aa-bfcf-cf74-1e02c2794d06@amd.com>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2ggbG9va3MgZ29vZCB0byBtZSB0b28uClJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdn
ZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4KClNlZW1zIGluZGVlZCBsaWtlIHdlIHNob3VsZCBkbyBz
b21lIGNsZWFudXAuCgpSb2xhbmQKCkFtIDI4LjA3LjIwIHVtIDA5OjM3IHNjaHJpZWIgQ2hyaXN0
aWFuIEvDtm5pZzoKPiBBbSAyOC4wNy4yMCB1bSAwNTo0MiBzY2hyaWViIERhdmUgQWlybGllOgo+
PiBGcm9tOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Pgo+PiBKdXN0IGRyb3Ag
dGhlIGFyZ3VtZW50IGZyb20gdGhpcy4KPj4KPj4gVGhpcyBkb2VzIGFzayB0aGUgcXVlc3Rpb24g
aWYgdGhpcyBpcyB0aGUgZnVuY3Rpb24gdm13Z2Z4Cj4+IHNob3VsZCBiZSB1c2luZyBvciBzaG91
bGQgaXQgYmUgZG9pbmcgYW4gZXZpY3QgYWxsIGxpa2UKPj4gdGhlIG90aGVyIGRyaXZlcnMuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gCj4g
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiAKPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmPCoMKgwqDCoMKgwqDC
oCB8IDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAyICst
Cj4+IMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmjCoMKgwqDCoMKgwqDCoCB8IDIgKy0K
Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+PiBpbmRleCBiMDM3NDc3MTdlYzcuLmYyOTdmZDVlMDJkNCAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IEBAIC0xODM4LDcgKzE4MzgsNyBAQCBpbnQgdHRt
X2JvX3N3YXBvdXQoc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IsCj4+IHN0cnVjdCB0dG1fb3Bl
cmF0aW9uX2N0eCAqY3R4KQo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3N3YXBv
dXQpOwo+PiDCoCAtdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYpCj4+ICt2b2lkIHR0bV9ib19zd2Fwb3V0X2FsbCh2b2lkKQo+PiDCoCB7Cj4+IMKgwqDC
oMKgwqAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIC5pbnRlcnJ1cHRpYmxlID0gZmFsc2UsCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jCj4+IGluZGV4IDQ3MDQyODM4Nzg3OC4uZmIzOTgyNmY3MmMxIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+PiBAQCAtMTM1Miw3ICsxMzUyLDcgQEAgc3RhdGlj
IGludCB2bXdfcG1fZnJlZXplKHN0cnVjdCBkZXZpY2UgKmtkZXYpCj4+IMKgwqDCoMKgwqAgdm13
X2V4ZWNidWZfcmVsZWFzZV9waW5uZWRfYm8oZGV2X3ByaXYpOwo+PiDCoMKgwqDCoMKgIHZtd19y
ZXNvdXJjZV9ldmljdF9hbGwoZGV2X3ByaXYpOwo+PiDCoMKgwqDCoMKgIHZtd19yZWxlYXNlX2Rl
dmljZV9lYXJseShkZXZfcHJpdik7Cj4+IC3CoMKgwqAgdHRtX2JvX3N3YXBvdXRfYWxsKCZkZXZf
cHJpdi0+YmRldik7Cj4+ICvCoMKgwqAgdHRtX2JvX3N3YXBvdXRfYWxsKCk7Cj4+IMKgwqDCoMKg
wqAgaWYgKGRldl9wcml2LT5lbmFibGVfZmIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB2bXdfZmlm
b19yZXNvdXJjZV9kZWMoZGV2X3ByaXYpOwo+PiDCoMKgwqDCoMKgIGlmIChhdG9taWNfcmVhZCgm
ZGV2X3ByaXYtPm51bV9maWZvX3Jlc291cmNlcykgIT0gMCkgewo+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgK
Pj4gaW5kZXggYjFjNzA1YTkzNTE3Li5hOWUxM2IyNTI4MjAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaAo+PiBAQCAtNjkyLDcgKzY5Miw3IEBAIHNzaXplX3QgdHRtX2JvX2lvKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LAo+PiBzdHJ1Y3QgZmlsZSAqZmlscCwKPj4gwqAgwqAgaW50IHR0bV9i
b19zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCk7Cj4+IC12b2lkIHR0bV9i
b19zd2Fwb3V0X2FsbChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4+ICt2b2lkIHR0bV9i
b19zd2Fwb3V0X2FsbCh2b2lkKTsKPj4gwqAgwqAgLyoqCj4+IMKgwqAgKiB0dG1fYm9fdXNlc19l
bWJlZGRlZF9nZW1fb2JqZWN0IC0gY2hlY2sgaWYgdGhlIGdpdmVuIGJvIHVzZXMgdGhlCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
