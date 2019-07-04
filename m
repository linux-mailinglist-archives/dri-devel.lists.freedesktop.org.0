Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAB5FE0F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 23:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F94B6E1B9;
	Thu,  4 Jul 2019 21:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D31C6E1B9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 21:10:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4F3C24B;
 Thu,  4 Jul 2019 23:10:24 +0200 (CEST)
Date: Fri, 5 Jul 2019 00:10:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
Message-ID: <20190704211004.GH5024@pendragon.ideasonboard.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
 <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
 <20190702154419.20812-3-robdclark@gmail.com>
 <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
 <20190704123511.GG6569@pendragon.ideasonboard.com>
 <CAF6AEGvYJ6iA5B+thJuBC=pFStuhsn87xrrcWAZyroWj5xKMZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvYJ6iA5B+thJuBC=pFStuhsn87xrrcWAZyroWj5xKMZA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562274624;
 bh=rH5bR+9lFkKtZCDqwCe8OuU9RTZKTQrIQJBkM0CbF3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FCDjPpeCNkj1EFXAIg9h/NzwKcGsKZmLD7agdaR1+cVt7JK7zHSn1M4g4HlG/aOvH
 1qGga4AH5et1WH+DOXF7QSWYGsZibj8vneYOfJZVMVbNpsKkcj4Fumwl4JfHAl8Ude
 A2HXM0xBa6cY8K0LRFVuMfpl4D0sbHRWItMo/Wqo=
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDY6NTY6NTZBTSAtMDcwMCwgUm9iIENs
YXJrIHdyb3RlOgo+IE9uIFRodSwgSnVsIDQsIDIwMTkgYXQgNTozNSBBTSBMYXVyZW50IFBpbmNo
YXJ0d3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAwNCwgMjAxOSBhdCAwMjozMToyMFBNICswMjAwLCBB
bmRyemVqIEhhamRhIHdyb3RlOgo+ID4gPiBPbiAwMi4wNy4yMDE5IDE3OjQ0LCBSb2IgQ2xhcmsg
d3JvdGU6Cj4gPiA+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+
ID4gPiA+Cj4gPiA+ID4gQWRkIGEgZGVidWdmcyBmaWxlIHRvIHNob3cgc3RhdHVzIHJlZ2lzdGVy
cy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNo
cm9taXVtLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aS1zbjY1ZHNpODYuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiA+ID4gaW5kZXggZjFhMjQ5M2I4NmQ5Li5hNmYy
NzY0OGMwMTUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1z
bjY1ZHNpODYuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRz
aTg2LmMKPiA+ID4gPiBAQCAtNSw2ICs1LDcgQEAKPiA+ID4gPiAgICovCj4gPiA+ID4KPiA+ID4g
PiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZGVidWdm
cy5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+ID4gPiA+ICAj
aW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4K
PiA+ID4gPiBAQCAtMTA5LDYgKzExMCw3IEBAIHN0cnVjdCB0aV9zbl9icmlkZ2Ugewo+ID4gPiA+
ICAgICBzdHJ1Y3QgZHJtX2RwX2F1eCAgICAgICAgICAgICAgIGF1eDsKPiA+ID4gPiAgICAgc3Ry
dWN0IGRybV9icmlkZ2UgICAgICAgICAgICAgICBicmlkZ2U7Cj4gPiA+ID4gICAgIHN0cnVjdCBk
cm1fY29ubmVjdG9yICAgICAgICAgICAgY29ubmVjdG9yOwo+ID4gPiA+ICsgICBzdHJ1Y3QgZGVu
dHJ5ICAgICAgICAgICAgICAgICAgICpkZWJ1Z2ZzOwo+ID4gPiA+ICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgICAgICAgICAgICAgICpob3N0X25vZGU7Cj4gPiA+ID4gICAgIHN0cnVjdCBtaXBpX2Rz
aV9kZXZpY2UgICAgICAgICAgKmRzaTsKPiA+ID4gPiAgICAgc3RydWN0IGNsayAgICAgICAgICAg
ICAgICAgICAgICAqcmVmY2xrOwo+ID4gPiA+IEBAIC0xNzgsNiArMTgwLDQyIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0aV9zbl9icmlkZ2VfcG1fb3BzID0gewo+ID4gPiA+ICAg
ICBTRVRfUlVOVElNRV9QTV9PUFModGlfc25fYnJpZGdlX3N1c3BlbmQsIHRpX3NuX2JyaWRnZV9y
ZXN1bWUsIE5VTEwpCj4gPiA+ID4gIH07Cj4gPiA+ID4KPiA+ID4gPiArc3RhdGljIGludCBzdGF0
dXNfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKmRhdGEpCj4gPiA+ID4gK3sKPiA+ID4g
PiArICAgc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGEgPSBzLT5wcml2YXRlOwo+ID4gPiA+ICsg
ICB1bnNpZ25lZCBpbnQgcmVnLCB2YWw7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICBzZXFfcHV0cyhz
LCAiU1RBVFVTIFJFR0lTVEVSUzpcbiIpOwo+ID4KPiA+IE5PIE5FRUQgVE8gU0hPVVQgOi0pCj4g
Pgo+ID4gPiA+ICsKPiA+ID4gPiArICAgcG1fcnVudGltZV9nZXRfc3luYyhwZGF0YS0+ZGV2KTsK
PiA+ID4gPiArCj4gPiA+ID4gKyAgIC8qIElSUSBTdGF0dXMgUmVnaXN0ZXJzLCBzZWUgVGFibGUg
MzEgaW4gZGF0YXNoZWV0ICovCj4gPiA+ID4gKyAgIGZvciAocmVnID0gMHhmMDsgcmVnIDw9IDB4
Zjg7IHJlZysrKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgcmVnbWFwX3JlYWQocGRhdGEtPnJlZ21h
cCwgcmVnLCAmdmFsKTsKPiA+ID4gPiArICAgICAgICAgICBzZXFfcHJpbnRmKHMsICJbMHglMDJ4
XSA9IDB4JTA4eFxuIiwgcmVnLCB2YWwpOwo+ID4gPiA+ICsgICB9Cj4gPiA+ID4gKwo+ID4gPiA+
ICsgICBwbV9ydW50aW1lX3B1dChwZGF0YS0+ZGV2KTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgIHJl
dHVybiAwOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtERUZJTkVfU0hPV19BVFRSSUJV
VEUoc3RhdHVzKTsKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHRpX3NuX2RlYnVnZnNf
aW5pdChzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YSkKPiA+ID4gPiArewo+ID4gPiA+ICsgICBw
ZGF0YS0+ZGVidWdmcyA9IGRlYnVnZnNfY3JlYXRlX2RpcigidGlfc242NWRzaTg2IiwgTlVMTCk7
Cj4gPiA+Cj4gPiA+IElmIHNvbWUgZGF5IHdlIHdpbGwgaGF2ZSBib2FyZCB3aXRoIHR3byBzdWNo
IGJyaWRnZXMgdGhlcmUgd2lsbCBiZSBhCj4gPiA+IHByb2JsZW0uCj4gPgo+ID4gQ291bGQgd2Ug
dXNlIHRoZSBwbGF0Zm9ybSBkZXZpY2UgbmFtZSBmb3IgdGhpcyA/Cj4gCj4gaG1tLCB5ZWFoLCB0
aGF0IHdvdWxkIHNvbHZlIHRoZSAyeCBicmlkZ2VzIGlzc3VlCj4gCj4gPiA+IEFueXdheToKPiA+
ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
Cj4gPiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJzdGF0dXMi
LCAwNjAwLCBwZGF0YS0+ZGVidWdmcywgcGRhdGEsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAmc3RhdHVzX2ZvcHMpOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgdm9p
ZCB0aV9zbl9kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YSkKPiA+ID4g
PiArewo+ID4gPiA+ICsgICBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUocGRhdGEtPmRlYnVnZnMp
Owo+ID4gPiA+ICsgICBwZGF0YS0+ZGVidWdmcyA9IE5VTEw7Cj4gPiA+ID4gK30KPiA+ID4gPiAr
Cj4gPgo+ID4gWW91IG5lZWQgdG8gY29uZGl0aW9uYWxseS1jb21waWxlIHRoaXMgYmFzZWQgb24g
Q09ORklHX0RFQlVHX0ZTLgo+IAo+IEhtbSwgaXMgdGhhdCByZWFsbHkgdHJ1ZT8gIERlYnVnZnMg
YXBwZWFycyB0byBiZSBzdWZmaWNlbnRseSBzdHViJ2Qgdy8KPiBpbmxpbmUgbm8tb3BzIGluIHRo
ZSAhQ09ORklHX0RFQlVHX0ZTIGNhc2UKCllvdSdyZSByaWdodCwgbXkgYmFkLiBJIHdvbmRlciBp
ZiB0aGUgY29tcGlsZXIgd2lsbCBvcHRpbWlzZSB0aGUgYWJvdmUKdHdvIGZ1bmN0aW9ucyBvdXQu
IEl0IG1pZ2h0IHdhcnJhbnQgYSBDT05GSUdfREVCVUdfRlMgY2hlY2sgaGVyZSBmb3IKdGhhdCBy
ZWFzb24sIGJ1dCB0aGF0J3MgcmVhbGx5IGJpa2VzaGVkZGluZy4gU28gd2l0aCB0aGUgMnggYnJp
ZGdlcwppc3N1ZSBhZGRyZXNzZWQsIEkgdGhpbmsgdGhlIHBhdGNoIHdpbGwgYmUgZ29vZC4KCi0t
IApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
