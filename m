Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39F17665B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FB96E858;
	Mon,  2 Mar 2020 21:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2020 21:50:19 UTC
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41E6E858
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 21:50:19 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id A17E43CC125;
 Mon,  2 Mar 2020 21:40:14 +0000 (UTC)
Subject: Re: [PATCH 27/33] drm/panel-simple: Fix dotclock for Sharp LQ035Q7DB03
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-28-ville.syrjala@linux.intel.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <dbdfa047-e8b5-ee08-2824-1069b8292d89@mleia.com>
Date: Mon, 2 Mar 2020 23:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200302203452.17977-28-ville.syrjala@linux.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20200302_214014_682424_D5F1010C 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiAzLzIvMjAgMTA6MzQgUE0sIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gRnJv
bTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBU
aGUgY3VycmVudGx5IGxpc3RlZCBkb3RjbG9jayBkaXNhZ3JlZXMgd2l0aCB0aGUgY3VycmVudGx5
Cj4gbGlzdGVkIHZyZWZyZXNoIHJhdGUuIENoYW5nZSB0aGUgZG90Y2xvY2sgdG8gbWF0Y2ggdGhl
IHZyZWZyZXNoLgo+IAo+IFNvbWVvbmUgdGVsbCBtZSB3aGljaCAoaWYgZWl0aGVyKSBvZiB0aGUg
ZG90Y2xvY2sgb3IgdnJlcmVzaCBpcwo+IGNvcnJlY3Q/Cgp5ZXMsIEkgd2lsbCB0ZWxsIHlvdSwg
c2VlIG15IGFuc3dlciBiZWxvdy4KCkFkZGluZyBMaW51cyBhcyBhIHBlcnNvbiB3aG8gbWF5IGJl
IGludGVyZXN0ZWQgaW4gUEwxMTEgc3BlY2lmaWNzLgoKPiBDYzogVmxhZGltaXIgWmFwb2xza2l5
IDx2ekBtbGVpYS5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCj4gaW5kZXggMzAxMmI0N2MxZTRlLi43NTI2YWYyZDZkOTUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTI5NDksNyArMjk0OSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBzaGFycF9scTA3MHkzZGczYiA9IHsKPiAgfTsK
PiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzaGFycF9scTAzNXE3
ZGIwM19tb2RlID0gewo+IC0JLmNsb2NrID0gNTUwMCwKPiArCS5jbG9jayA9IDU0MTksCj4gIAku
aGRpc3BsYXkgPSAyNDAsCj4gIAkuaHN5bmNfc3RhcnQgPSAyNDAgKyAxNiwKPiAgCS5oc3luY19l
bmQgPSAyNDAgKyAxNiArIDcsCj4gCgpIZXJlIC5jbG9jayBpcyBjb3JyZWN0LCB5b3UgbWF5IGZp
bmQgdGhlIHVzYWdlIG9mIHRoZSBwYW5lbCBpbgpscGMzMjUwLXBoeTMyNTAuZHRzIGV4YW1wbGUs
IGFuZCB0aGUgUEwxMTEgY29udHJvbGxlciBvbiB0aGUgU29DCndvbid0IGJlIGFibGUgdG8gcHJv
dmlkZSB0aGUgZXhhY3RseSBjb21wdXRlZCBgLmNsb2NrID0gNTQxOScuCgpTbywgSSBoYXZlIHRv
IE5BSyB0aGlzIGNoYW5nZSwgaW4gdGhpcyBleGFtcGxlIHRoZSBkaWZmZXJlbmNlCmJldHdlZW4g
dGhlIGRlY2xhcmVkIGFuZCB0aGUgY29tcHV0ZWQgLnZyZXJlc2ggaXMgb25lIEh6LCB3aGljaApJ
IGhvcGUgY2FuIGJlIGFjY2VwdGVkIGFzIG5lZ2xpZ2libGUgYW5kIGlnbm9yYWJsZSwgb3RoZXJ3
aXNlLAppZiB5b3UgaW5zaXN0LCBwbGVhc2UgY29ycmVjdCB0aGUgLnZyZWZyZXNoIGZyb20gNjAg
dG8gNjEuCgotLQpCZXN0IHdpc2hlcywKVmxhZGltaXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
