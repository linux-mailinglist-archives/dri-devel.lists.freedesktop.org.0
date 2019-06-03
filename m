Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A450D32F02
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 13:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAACB8925F;
	Mon,  3 Jun 2019 11:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D33989258;
 Mon,  3 Jun 2019 11:52:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 04:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,546,1549958400"; d="scan'208";a="181136611"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 04:52:50 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 04:52:50 -0700
Received: from BGSMSX107.gar.corp.intel.com (10.223.4.191) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 3 Jun 2019 04:52:50 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX107.gar.corp.intel.com ([169.254.9.156]) with mapi id 14.03.0415.000;
 Mon, 3 Jun 2019 17:22:42 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH 1/4] drm: Drop a redundant unused variable
Thread-Topic: [PATCH 1/4] drm: Drop a redundant unused variable
Thread-Index: AQHVFlUfcUXEH9yZN0a8AQOFRV1G4aaJP0KAgACZfdA=
Date: Mon, 3 Jun 2019 11:52:41 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82035A9F@BGSMSX104.gar.corp.intel.com>
References: <1559159944-21103-1-git-send-email-uma.shankar@intel.com>
 <1559159944-21103-2-git-send-email-uma.shankar@intel.com>
 <20190603081219.GH21222@phenom.ffwll.local>
In-Reply-To: <20190603081219.GH21222@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjZlMTY5ZWQtYTk0YS00ZTY1LThlOWEtZWJkYzczMjhkZTIwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNnFWeTJaQ1FraEpMQnNPTXdjN3lWMTNVTndJaTNxN2VlR00wbUk5YVlFaHRYd2Jwcm1jR2tYYndZYXlEQXpwQyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
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
Cc: "dcastagna@chromium.org" <dcastagna@chromium.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IERhbmllbCBWZXR0ZXIgW21haWx0
bzpkYW5pZWwudmV0dGVyQGZmd2xsLmNoXSBPbiBCZWhhbGYgT2YgRGFuaWVsIFZldHRlcgo+U2Vu
dDogTW9uZGF5LCBKdW5lIDMsIDIwMTkgMTo0MiBQTQo+VG86IFNoYW5rYXIsIFVtYSA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPgo+Q2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj5tYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb207IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOyBTaGFybWEsIFNoYXNoYW5r
Cj48c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT47IGVtaWwubC52ZWxpa292QGdtYWlsLmNvbTsg
YnJpYW4uc3RhcmtleUBhcm0uY29tOwo+ZGNhc3RhZ25hQGNocm9taXVtLm9yZzsgc2VhbnBhdWxA
Y2hyb21pdW0ub3JnOyBSb3BlciwgTWF0dGhldyBECj48bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT47IGpvbmFzQGt3aWJvby5zZTsgZGFuaWVsQGZmd2xsLmNoCj5TdWJqZWN0OiBSZTogW1BBVENI
IDEvNF0gZHJtOiBEcm9wIGEgcmVkdW5kYW50IHVudXNlZCB2YXJpYWJsZQo+Cj5PbiBUaHUsIE1h
eSAzMCwgMjAxOSBhdCAwMToyOTowMUFNICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToKPj4gRHJv
cCBhIHJlZHVuZGFudCBhbmQgdW51c2VkIHZhcmlhYmxlICJoZHJfb3V0cHV0X21ldGFkYXRhIiBm
cm9tCj4+IGRybV9jb25uZWN0b3IuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+PiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5r
YXJAaW50ZWwuY29tPgo+Cj5Gb3IgbmV4dCB0aW1lIGFyb3VuZDogUGxlYXNlIGFkZCBGaXhlczog
bGluZXMgdG8gaW5kaWNhdGUgd2hpY2ggYWxyZWFkeSBtZXJnZWQKPmNvbW1pdCB5b3UncmUgaW1w
cm92aW5nLgoKVGhhbmtzIERhbmllbC4gU3VyZSwgd2lsbCB0YWtlIGNhcmUgb2YgdGhhdCBpbiBm
dXR1cmUuCgpSZWdhcmRzLApVbWEgU2hhbmthcgoKPlBhdGNoIG1lcmdlZCwgdGhhbmtzLgo+LURh
bmllbAo+Cj4+IC0tLQo+PiAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwgMiAtLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPj4gaW5k
ZXggZjhmNDAwMy4uNTQ3NjU2MSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5l
Y3Rvci5oCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+PiBAQCAtMTI0NCw4
ICsxMjQ0LDYgQEAgc3RydWN0IGRybV9jb25uZWN0b3Igewo+PiAgCSAqLwo+PiAgCXN0cnVjdCBs
bGlzdF9ub2RlIGZyZWVfbm9kZTsKPj4KPj4gLQkvKiBIRFIgbWV0ZGF0YSAqLwo+PiAtCXN0cnVj
dCBoZHJfb3V0cHV0X21ldGFkYXRhIGhkcl9vdXRwdXRfbWV0YWRhdGE7Cj4+ICAJc3RydWN0IGhk
cl9zaW5rX21ldGFkYXRhIGhkcl9zaW5rX21ldGFkYXRhOyAgfTsKPj4KPj4gLS0KPj4gMS45LjEK
Pj4KPgo+LS0KPkRhbmllbCBWZXR0ZXIKPlNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
