Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1022B3327
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 10:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C53288065;
	Sun, 15 Nov 2020 09:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EB16E993
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:14:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F4F8AC24;
 Sun, 15 Nov 2020 09:14:19 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: Deepak Rawat <drawat.floss@gmail.com>,
 "Tang, Shaofeng" <shaofeng.tang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <SN6PR11MB2558D831991447B9B5C8E646E2270@SN6PR11MB2558.namprd11.prod.outlook.com>
 <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <45960d1f-5304-1d5a-53fd-9896e4c322aa@suse.de>
Date: Sun, 15 Nov 2020 10:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <121f5f8df1e56294ade98f08a943b9fbb514c5e0.camel@gmail.com>
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
Cc: "Huang, Yuanjun" <yuanjun.huang@intel.com>, "Jiang,
 Fei" <fei.jiang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGVlcGFrCgpBbSAxMS4wOS4yMCB1bSAwMjozOCBzY2hyaWViIERlZXBhayBSYXdhdDoKPiBP
biBUaHUsIDIwMjAtMDktMTAgYXQgMDg6MTkgKzAwMDAsIFRhbmcsIFNoYW9mZW5nIHdyb3RlOgo+
PiBIaSBEZWVwYWssCj4+ICAKPj4gRG8geW91IGhhdmUgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHBh
dGNoIG5vdz8KPj4gSSB0YWtlIGEgdHJ5IHdpdGggaXQuIGFuZCBtZWV0IHNvbWUgdHlwbyBhbmQg
4oCcaW5jb21wYXRpYmxlIHBvaW50ZXLigJ0KPj4gZXJyb3IuCj4+IElmIHlvdSBoYXZlIGEgbmV3
IHZlcnNpb24sIGNvdWxkIHlvdSBzaGFyZSBpdCB3aXRoIHVzPwo+Pgo+IAo+IEhpIFNoYW9mZW5n
LAo+IAo+IEl0IHNlZW1zIHlvdSBhcmUgcnVubmluZyB0aGlzIHdpdGggZ2VuIDIgVk0sIEkgaGF2
ZSBhIHBhdGNoIHRvIHN1cHBvcnQKPiBnZW4gMiBWTSdzIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9k
ZWVwYWstcmF3YXQvbGludXguZ2l0IGJyYW5jaCBoeXBlcnZfdAo+IGlueS4KCkknbSBpbnRlcmVz
dGVkIGluIG1lcmdpbmcgdGhpcyBkcml2ZXIgaW50byB0aGUgRFJNIHVwc3RyZWFtLiBXaGF0J3Mg
dGhlCnN0YXR1cz8gQXJlIHlvdSBzdGlsbCB3b3JraW5nIG9uIGl0PwoKQmVzdCByZWdhcmRzClRo
b21hcwoKPiAKPiBJZiB5b3Ugc3RpbGwgcnVuIGludG8gZXJyb3IgYWZ0ZXIgYXBwbHlpbmcgZ2Vu
MiBwYXRjaCwgZmVlbCBmcmVlIHRvCj4gcmVhY2ggb3V0IHdpdGggZGV0YWlscy4KPiAKPiBEZWVw
YWsKPiAKPj4gIAo+PiBCUiwgU2hhb2ZlbmcKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SApNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
