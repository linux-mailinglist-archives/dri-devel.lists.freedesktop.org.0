Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58EA5F835
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 14:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B017A6E339;
	Thu,  4 Jul 2019 12:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661276E339
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 12:35:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69B8E24B;
 Thu,  4 Jul 2019 14:35:31 +0200 (CEST)
Date: Thu, 4 Jul 2019 15:35:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
Message-ID: <20190704123511.GG6569@pendragon.ideasonboard.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
 <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
 <20190702154419.20812-3-robdclark@gmail.com>
 <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562243731;
 bh=Qy9c/09MoK7SKFzpRxhQz3bdVH0WPLajOMka0caqEwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1iCIfxwE6MEBVnRGgssAZK9cHdcIL5jUXXBTcisAWjBswdN3fLX6KsiirANkTaja
 R10vuXCMHzidW0cyVoFyl+0k8hqBHIvvox06FKf5bA3w6MvEIEE/RahqHQWVmxSLuk
 QN6R33ivSnFPkHRMLENdMKrpT/hmLxucTNhb3NC0=
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBUaHUsIEp1bCAwNCwgMjAxOSBhdCAwMjozMToyMFBNICswMjAwLCBBbmRyemVq
IEhhamRhIHdyb3RlOgo+IE9uIDAyLjA3LjIwMTkgMTc6NDQsIFJvYiBDbGFyayB3cm90ZToKPiA+
IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBBZGQgYSBk
ZWJ1Z2ZzIGZpbGUgdG8gc2hvdyBzdGF0dXMgcmVnaXN0ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYwo+ID4gaW5kZXggZjFhMjQ5M2I4NmQ5Li5h
NmYyNzY0OGMwMTUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNu
NjVkc2k4Ni5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5j
Cj4gPiBAQCAtNSw2ICs1LDcgQEAKPiA+ICAgKi8KPiA+ICAKPiA+ICAjaW5jbHVkZSA8bGludXgv
Y2xrLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvZ3Bpby9jb25zdW1lci5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9pMmMuaD4KPiA+ICAjaW5j
bHVkZSA8bGludXgvaW9wb2xsLmg+Cj4gPiBAQCAtMTA5LDYgKzExMCw3IEBAIHN0cnVjdCB0aV9z
bl9icmlkZ2Ugewo+ID4gIAlzdHJ1Y3QgZHJtX2RwX2F1eAkJYXV4Owo+ID4gIAlzdHJ1Y3QgZHJt
X2JyaWRnZQkJYnJpZGdlOwo+ID4gIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvcgkJY29ubmVjdG9yOwo+
ID4gKwlzdHJ1Y3QgZGVudHJ5CQkJKmRlYnVnZnM7Cj4gPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZQkJ
Kmhvc3Rfbm9kZTsKPiA+ICAJc3RydWN0IG1pcGlfZHNpX2RldmljZQkJKmRzaTsKPiA+ICAJc3Ry
dWN0IGNsawkJCSpyZWZjbGs7Cj4gPiBAQCAtMTc4LDYgKzE4MCw0MiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRldl9wbV9vcHMgdGlfc25fYnJpZGdlX3BtX29wcyA9IHsKPiA+ICAJU0VUX1JVTlRJ
TUVfUE1fT1BTKHRpX3NuX2JyaWRnZV9zdXNwZW5kLCB0aV9zbl9icmlkZ2VfcmVzdW1lLCBOVUxM
KQo+ID4gIH07Cj4gPiAgCj4gPiArc3RhdGljIGludCBzdGF0dXNfc2hvdyhzdHJ1Y3Qgc2VxX2Zp
bGUgKnMsIHZvaWQgKmRhdGEpCj4gPiArewo+ID4gKwlzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0
YSA9IHMtPnByaXZhdGU7Cj4gPiArCXVuc2lnbmVkIGludCByZWcsIHZhbDsKPiA+ICsKPiA+ICsJ
c2VxX3B1dHMocywgIlNUQVRVUyBSRUdJU1RFUlM6XG4iKTsKCk5PIE5FRUQgVE8gU0hPVVQgOi0p
Cgo+ID4gKwo+ID4gKwlwbV9ydW50aW1lX2dldF9zeW5jKHBkYXRhLT5kZXYpOwo+ID4gKwo+ID4g
KwkvKiBJUlEgU3RhdHVzIFJlZ2lzdGVycywgc2VlIFRhYmxlIDMxIGluIGRhdGFzaGVldCAqLwo+
ID4gKwlmb3IgKHJlZyA9IDB4ZjA7IHJlZyA8PSAweGY4OyByZWcrKykgewo+ID4gKwkJcmVnbWFw
X3JlYWQocGRhdGEtPnJlZ21hcCwgcmVnLCAmdmFsKTsKPiA+ICsJCXNlcV9wcmludGYocywgIlsw
eCUwMnhdID0gMHglMDh4XG4iLCByZWcsIHZhbCk7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcG1fcnVu
dGltZV9wdXQocGRhdGEtPmRldik7Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsK
PiA+ICtERUZJTkVfU0hPV19BVFRSSUJVVEUoc3RhdHVzKTsKPiA+ICsKPiA+ICtzdGF0aWMgdm9p
ZCB0aV9zbl9kZWJ1Z2ZzX2luaXQoc3RydWN0IHRpX3NuX2JyaWRnZSAqcGRhdGEpCj4gPiArewo+
ID4gKwlwZGF0YS0+ZGVidWdmcyA9IGRlYnVnZnNfY3JlYXRlX2RpcigidGlfc242NWRzaTg2Iiwg
TlVMTCk7Cj4gCj4gSWYgc29tZSBkYXkgd2Ugd2lsbCBoYXZlIGJvYXJkIHdpdGggdHdvIHN1Y2gg
YnJpZGdlcyB0aGVyZSB3aWxsIGJlIGEKPiBwcm9ibGVtLgoKQ291bGQgd2UgdXNlIHRoZSBwbGF0
Zm9ybSBkZXZpY2UgbmFtZSBmb3IgdGhpcyA/Cgo+IEFueXdheToKPiAKPiBSZXZpZXdlZC1ieTog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiAKPiA+ICsKPiA+ICsJZGVidWdm
c19jcmVhdGVfZmlsZSgic3RhdHVzIiwgMDYwMCwgcGRhdGEtPmRlYnVnZnMsIHBkYXRhLAo+ID4g
KwkJCSZzdGF0dXNfZm9wcyk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHRpX3NuX2Rl
YnVnZnNfcmVtb3ZlKHN0cnVjdCB0aV9zbl9icmlkZ2UgKnBkYXRhKQo+ID4gK3sKPiA+ICsJZGVi
dWdmc19yZW1vdmVfcmVjdXJzaXZlKHBkYXRhLT5kZWJ1Z2ZzKTsKPiA+ICsJcGRhdGEtPmRlYnVn
ZnMgPSBOVUxMOwo+ID4gK30KPiA+ICsKCllvdSBuZWVkIHRvIGNvbmRpdGlvbmFsbHktY29tcGls
ZSB0aGlzIGJhc2VkIG9uIENPTkZJR19ERUJVR19GUy4KCj4gPiAgLyogQ29ubmVjdG9yIGZ1bmNz
ICovCj4gPiAgc3RhdGljIHN0cnVjdCB0aV9zbl9icmlkZ2UgKgo+ID4gIGNvbm5lY3Rvcl90b190
aV9zbl9icmlkZ2Uoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiA+IEBAIC04Njks
NiArOTA3LDggQEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCwKPiA+ICAKPiA+ICAJZHJtX2JyaWRnZV9hZGQoJnBkYXRhLT5icmlkZ2UpOwo+
ID4gIAo+ID4gKwl0aV9zbl9kZWJ1Z2ZzX2luaXQocGRhdGEpOwo+ID4gKwo+ID4gIAlyZXR1cm4g
MDsKPiA+ICB9Cj4gPiAgCj4gPiBAQCAtODc5LDYgKzkxOSw4IEBAIHN0YXRpYyBpbnQgdGlfc25f
YnJpZGdlX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ID4gIAlpZiAoIXBkYXRh
KQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAgCj4gPiArCXRpX3NuX2RlYnVnZnNfcmVtb3Zl
KHBkYXRhKTsKPiA+ICsKPiA+ICAJb2Zfbm9kZV9wdXQocGRhdGEtPmhvc3Rfbm9kZSk7Cj4gPiAg
Cj4gPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShwZGF0YS0+ZGV2KTsKCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
