Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADD2A1C1D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 06:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0586E08A;
	Sun,  1 Nov 2020 05:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0972A6E088;
 Sun,  1 Nov 2020 05:32:20 +0000 (UTC)
IronPort-SDR: FlAo/KVXhhVqQfb2MByNHYJN1t5pYRH6LiiV1nPRnhEPXCCGtvedOgry9Urjw/pqDhSADpsyzv
 74uoqS09oN5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="165270187"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="165270187"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 22:32:20 -0700
IronPort-SDR: LoF8Q4IOYRBSOZvb3WqJ+FdcQoSOFjONA7weLwhVo30aKEQsBaTOVpQKQaKaJiOy51kyNwdHiB
 zcD0vekTioPw==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537564623"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 22:32:17 -0700
Subject: Re: [RFC 01/13] drm/edid: Add additional HFVSDB fields for HDMI2.1
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-2-ankit.k.nautiyal@intel.com>
 <7137c1244ee3409da343a6c4a1de38ee@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <aaf40f1d-3ec7-af5d-8c21-fb92483a4e38@intel.com>
Date: Sun, 1 Nov 2020 11:01:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7137c1244ee3409da343a6c4a1de38ee@intel.com>
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFVtYSBmb3IgdGhlIHJldmlldyBhbmQgaGlnaGxpZ2h0aW5nIHRoZSBpc3N1ZXMgaW4g
dGhlIHBhdGNoLXNlcmllcy4KCkkgYWdyZWUgdG8gbW9zdCBvZiB0aGUgY29tbWVudHMgYW5kIHdp
bGwgYmUgYWRkcmVzc2luZyBjb21tZW50cyBhbmQgCmNvcnJlY3Rpb25zIGluIHRoZSBuZXh0wqAg
dmVyc2lvbiBzaG9ydGx5LgoKUGxlYXNlIGZpbmQgbXkgcmVzcG9uc2UgaW5saW5lLgoKT24gMTAv
MTkvMjAyMCAyOjE3IEFNLCBTaGFua2FyLCBVbWEgd3JvdGU6Cj4KPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogTmF1dGl5YWwsIEFua2l0IEsgPGFua2l0LmsubmF1dGl5YWxA
aW50ZWwuY29tPgo+PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxNSwgMjAyMCA0OjIzIFBNCj4+
IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47
Cj4+IEt1bGthcm5pLCBWYW5kaXRhIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT47IHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tOwo+PiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJt
YUBpbnRlbC5jb20+Cj4+IFN1YmplY3Q6IFtSRkMgMDEvMTNdIGRybS9lZGlkOiBBZGQgYWRkaXRp
b25hbCBIRlZTREIgZmllbGRzIGZvciBIRE1JMi4xCj4+Cj4+IEZyb206IFN3YXRpIFNoYXJtYSA8
c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+Cj4+Cj4+IFRoZSBIRE1JMi4xIGV4dGVuZHMgSEZWU0JE
IChIRE1JIEZvcnVtIFZlbmRvciBTcGVjaWZpYyBEYXRhIGJsb2NrKSB0byBoYXZlCj4gVHlwbyBp
biBIRlZTREIKCgpXaWxsIGZpeCBpbiB0aGUgbmV4dCBwYXRjaCBzZXQuCgo+PiBmaWVsZHMgcmVs
YXRlZCB0byBuZXdseSBkZWZpbmVkIG1ldGhvZHMgb2YgRlJMIChGaXhlZCBSYXRlIExpbmspIGxl
dmVscywgbnVtYmVyCj4+IG9mIGxhbmVzIHN1cHBvcnRlZCwgRFNDIENvbG9yIGJpdCBkZXB0aCwg
VlJSIG1pbi9tYXgsIEZWQSAoRmFzdCBWYWN0aXZlKSwgQUxMTQo+PiBldGMuCj4+Cj4+IFRoaXMg
cGF0Y2ggYWRkcyB0aGUgbmV3IEhGVlNEQiBmaWVsZHMgdGhhdCBhcmUgcmVxdWlyZWQgZm9yIEhE
TUkyLjEuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNoYXJtYSwgU3dhdGkyIDxzd2F0aTIuc2hhcm1h
QGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQW5raXQgTmF1dGl5YWwgPGFua2l0LmsubmF1
dGl5YWxAaW50ZWwuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL2RybS9kcm1fZWRpZC5oIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmggYi9p
bmNsdWRlL2RybS9kcm1fZWRpZC5oIGluZGV4Cj4+IGIyN2EwZTIxNjljOC4uMWNjNWMyYzczMjgy
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oCj4+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9lZGlkLmgKPj4gQEAgLTIyOSw2ICsyMjksMzYgQEAgc3RydWN0IGRldGFpbGVkX3Rp
bWluZyB7Cj4+ICAgICAgIERSTV9FRElEX1lDQkNSNDIwX0RDXzM2IHwgXAo+PiAgICAgICBEUk1f
RURJRF9ZQ0JDUjQyMF9EQ18zMCkKPj4KPj4gKy8qIEhETUkgMi4xIGFkZGl0aW9uYWwgZmllbGRz
ICovCj4+ICsjZGVmaW5lIERSTV9FRElEX01BWF9GUkxfUkFURV9NQVNLMHhmMAo+PiArI2RlZmlu
ZSBEUk1fRURJRF9GQVBBX1NUQVJUX0xPQ0FUSU9OKDEgPDwgMCkKPj4gKyNkZWZpbmUgRFJNX0VE
SURfQUxMTSgxIDw8IDEpCj4+ICsjZGVmaW5lIERSTV9FRElEX0ZWQSgxIDw8IDIpCj4+ICsKPj4g
Ky8qIERlZXAgQ29sb3Igc3BlY2lmaWMgKi8KPj4gKyNkZWZpbmUgRFJNX0VESURfRENfMzBCSVRf
NDIwKDEgPDwgMCkKPj4gKyNkZWZpbmUgRFJNX0VESURfRENfMzZCSVRfNDIwKDEgPDwgMSkKPj4g
KyNkZWZpbmUgRFJNX0VESURfRENfNDhCSVRfNDIwKDEgPDwgMikKPj4gKwo+PiArLyogVlJSIHNw
ZWNpZmljICovCj4+ICsjZGVmaW5lIERSTV9FRElEX0NOTVZSUigxIDw8IDMpCj4+ICsjZGVmaW5l
IERSTV9FRElEX0NJTkVNQV9WUlIoMSA8PCA0KQo+PiArI2RlZmluZSBEUk1fRURJRF9NREVMVEEo
MSA8PCA1KQo+PiArI2RlZmluZSBEUk1fRURJRF9WUlJfTUFYX1VQUEVSX01BU0sweGMwCj4+ICsj
ZGVmaW5lIERSTV9FRElEX1ZSUl9NQVhfTE9XRVJfTUFTSzB4ZmYKPj4gKyNkZWZpbmUgRFJNX0VE
SURfVlJSX01JTl9NQVNLMHgzZgo+PiArCj4+ICsvKiBEU0Mgc3BlY2lmaWMgKi8KPj4gKyNkZWZp
bmUgRFJNX0VESURfRFNDXzEwQlBDKDEgPDwgMCkKPj4gKyNkZWZpbmUgRFJNX0VESURfRFNDXzEy
QlBDKDEgPDwgMSkKPj4gKyNkZWZpbmUgRFJNX0VESURfRFNDXzE2QlBDKDEgPDwgMikKPj4gKyNk
ZWZpbmUgRFJNX0VESURfRFNDX0FMTF9CUFAoMSA8PCAzKQo+PiArI2RlZmluZSBEUk1fRURJRF9E
U0NfTkFUSVZFXzQyMCgxIDw8IDYpCj4+ICsjZGVmaW5lIERSTV9FRElEX0RTQ18xUDIoMSA8PCA3
KQo+PiArI2RlZmluZSBEUk1fRURJRF9EU0NfTUFYX0ZSTF9SQVRFMHhmCj4gVGhpcyBzaG91bGQg
YmUgc2V0IGFzIG1hc2sgYW5kIG1hZGUgaXQgYXMgMHhmMAoKQWdyZWVkLCB3aWxsIHRha2UgY2Fy
ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKUmVnYXJkcywKCkFua2l0Cgo+Cj4+ICsjZGVmaW5lIERS
TV9FRElEX0RTQ19NQVhfU0xJQ0VTMHhmCj4+ICsjZGVmaW5lIERSTV9FRElEX0RTQ19UT1RBTF9D
SFVOS19LQllURVMweDNmCj4+ICsKPj4gICAvKiBFTEQgSGVhZGVyIEJsb2NrICovCj4+ICAgI2Rl
ZmluZSBEUk1fRUxEX0hFQURFUl9CTE9DS19TSVpFNAo+Pgo+PiAtLQo+PiAyLjE3LjEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
