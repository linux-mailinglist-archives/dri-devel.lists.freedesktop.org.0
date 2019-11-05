Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA03EFE81
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C33A6EA58;
	Tue,  5 Nov 2019 13:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F0C6E9AC;
 Tue,  5 Nov 2019 10:08:06 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id D806B3E8F7;
 Tue,  5 Nov 2019 10:08:04 +0000 (UTC)
Date: Tue, 5 Nov 2019 05:08:04 -0500
From: Brian Masney <masneyb@onstation.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191105100804.GA9492@onstation.org>
References: <20191105000129.GA6536@onstation.org>
 <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1572948485;
 bh=KfnIsJjT3r6plldCySNd3bmNluaRX31wCcNiy0r6Xts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IxBhVMZS5/JpU1eXgyW7Fv/ilzktRpbORgO1mzIb3PZ5lNrugn5u3ATQ9cNwuha1E
 noZYlzhYK/Q5PDYDmWXe/MuCrmSuA6oFs/5vz/dn1UZEm8jAVoAAiQ1PjB7Q+oTFs4
 O1twcRr93yW/W5G65ZNSOc5vHZAcwId3oMz6ZtSs=
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDQ6MTk6MDdQTSAtMDgwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQgNDowMSBQTSBCcmlhbiBNYXNuZXkgPG1hc25leWJA
b25zdGF0aW9uLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGV5IFJvYiwKPiA+Cj4gPiBTaW5jZSBjb21t
aXQgMmQ5OWNlZDc4N2UzICgiZHJtL21zbTogYXN5bmMgY29tbWl0IHN1cHBvcnQiKSwgdGhlIGZy
YW1lCj4gPiBidWZmZXIgY29uc29sZSBvbiBteSBOZXh1cyA1IGJlZ2FuIHRocm93aW5nIHRoZXNl
IGVycm9yczoKPiA+Cj4gPiBtc20gZmQ5MDAwMDAubWRzczogcHAgZG9uZSB0aW1lIG91dCwgbG09
MAo+ID4KPiA+IFRoZSBkaXNwbGF5IHN0aWxsIHdvcmtzLgo+ID4KPiA+IEkgc2VlIHRoYXQgbWRw
NV9mbHVzaF9jb21taXQoKSB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgOWY2YjY1NjQyYmQyCj4g
PiAoImRybS9tc206IGFkZCBrbXMtPmZsdXNoX2NvbW1pdCgpIikgd2l0aCBhIFRPRE8gY29tbWVu
dCBhbmQgdGhlIGNvbW1pdAo+ID4gZGVzY3JpcHRpb24gbWVudGlvbnMgZmx1c2hpbmcgcmVnaXN0
ZXJzLiBJIGFzc3VtZSB0aGF0IHRoaXMgaXMgdGhlCj4gPiBwcm9wZXIgZml4LiBJZiBzbywgY2Fu
IHlvdSBwb2ludCBtZSB0byB3aGVyZSB0aGVzZSByZWdpc3RlcnMgYXJlCj4gPiBkZWZpbmVkIGFu
ZCBJIGNhbiB3b3JrIG9uIHRoZSBtZHA1IGltcGxlbWVudGF0aW9uLgo+IAo+IFNlZSBtZHA1X2N0
bF9jb21taXQoKSwgd2hpY2ggd3JpdGVzIHRoZSBDVExfRkxVU0ggcmVnaXN0ZXJzLi4gdGhlIGlk
ZWEKPiB3b3VsZCBiZSB0byBkZWZlciB3cml0aW5nIENUTF9GTFVTSFtjdGxfaWRdID0gZmx1c2hf
bWFzayB1bnRpbAo+IGttcy0+Zmx1c2goKSAod2hpY2ggaGFwcGVucyBmcm9tIGEgdGltZXIgc2hv
cnRseSBiZWZvcmUgdmJsYW5rKS4KPiAKPiBCdXQgSSB0aGluayB0aGUgYXN5bmMgZmx1c2ggY2Fz
ZSBzaG91bGQgbm90IGNvbWUgdXAgd2l0aCBmYmNvbj8gIEl0Cj4gd2FzIHJlYWxseSBhZGRlZCB0
byBjb3BlIHdpdGggaHdjdXJzb3IgdXBkYXRlcyAoYW5kIHVzZXJzcGFjZSB0aGF0Cj4gYXNzdW1l
cyBpdCBjYW4gZG8gYW4gdW5saW1pdGVkICMgb2YgY3Vyc29yIHVwZGF0ZXMgcGVyIGZyYW1lKS4u
IHRoZQo+IGludGVudGlvbiB3YXMgdGhhdCBub3RoaW5nIHNob3VsZCBjaGFuZ2UgaW4gdGhlIHNl
cXVlbmNlIGZvciBtZHA1IChidXQKPiBJIGd1ZXNzIHRoYXQgd2FzIG5vdCB0aGUgY2FzZSkuCgpU
aGUgJ3BwIGRvbmUgdGltZSBvdXQnIGVycm9ycyBnbyBhd2F5IGlmIEkgcmV2ZXJ0IHRoZSBmb2xs
b3dpbmcgdGhyZWUKY29tbWl0czoKCmNkNmQ5MjMxNjdiMSAoImRybS9tc20vZHB1OiBhc3luYyBj
b21taXQgc3VwcG9ydCIpCmQ5MzRhNzEyYzVlNiAoImRybS9tc206IGFkZCBhdG9taWMgdHJhY2Vz
IikKMmQ5OWNlZDc4N2UzICgiZHJtL21zbTogYXN5bmMgY29tbWl0IHN1cHBvcnQiKQoKSSByZXZl
cnRlZCB0aGUgZmlyc3Qgb25lIHRvIGZpeCBhIGNvbXBpbGVyIGVycm9yLCBhbmQgdGhlIHNlY29u
ZCBvbmUgc28KdGhhdCB0aGUgbGFzdCBwYXRjaCBjYW4gYmUgcmV2ZXJ0ZWQgd2l0aG91dCBhbnkg
bWVyZ2UgY29uZmxpY3RzLgoKSSBzZWUgdGhhdCBjcnRjX2ZsdXNoKCkgY2FsbHMgbWRwNV9jdGxf
Y29tbWl0KCkuIEkgdHJpZWQgdG8gdXNlCmNydGNfZmx1c2hfYWxsKCkgaW4gbWRwNV9mbHVzaF9j
b21taXQoKSBhbmQgdGhlIGNvbnRlbnRzIG9mIHRoZSBmcmFtZQpidWZmZXIgZGFuY2UgYXJvdW5k
IHRoZSBzY3JlZW4gbGlrZSBpdHMgb3V0IG9mIHN5bmMuIEkgcmVuYW1lZApjcnRjX2ZsdXNoX2Fs
bCgpIHRvIG1kcDVfY3J0Y19mbHVzaF9hbGwoKSBhbmQgcmVtb3ZlZCB0aGUgc3RhdGljCmRlY2xh
cmF0aW9uLiBIZXJlJ3MgdGhlIHJlbGV2YW50IHBhcnQgb2Ygd2hhdCBJIHRyaWVkOgoKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCkBAIC0xNzEsNyArMTcxLDE1IEBAIHN0YXRp
YyB2b2lkIG1kcDVfcHJlcGFyZV9jb21taXQoc3RydWN0IG1zbV9rbXMgKmttcywgc3RydWN0IGRy
bV9hdG9taWNfc3RhdGUgKnN0CiAKIHN0YXRpYyB2b2lkIG1kcDVfZmx1c2hfY29tbWl0KHN0cnVj
dCBtc21fa21zICprbXMsIHVuc2lnbmVkIGNydGNfbWFzaykKIHsKLSAgICAgICAvKiBUT0RPICov
CisgICAgICAgc3RydWN0IG1kcDVfa21zICptZHA1X2ttcyA9IHRvX21kcDVfa21zKHRvX21kcF9r
bXMoa21zKSk7CisgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjOworCisgICAgICAgZm9yX2Vh
Y2hfY3J0Y19tYXNrKG1kcDVfa21zLT5kZXYsIGNydGMsIGNydGNfbWFzaykgeworICAgICAgICAg
ICAgICAgaWYgKCFjcnRjLT5zdGF0ZS0+YWN0aXZlKQorICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKKworICAgICAgICAgICAgICAgbWRwNV9jcnRjX2ZsdXNoX2FsbChjcnRjKTsKKyAg
ICAgICB9CiB9CgpBbnkgdGlwcyB3b3VsZCBiZSBhcHByZWNpYXRlZC4KCkJyaWFuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
