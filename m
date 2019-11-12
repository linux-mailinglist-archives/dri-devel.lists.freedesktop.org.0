Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97217FAB68
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853776E388;
	Wed, 13 Nov 2019 07:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D856E3E1;
 Tue, 12 Nov 2019 10:54:51 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 76AAA3E994;
 Tue, 12 Nov 2019 10:54:50 +0000 (UTC)
Date: Tue, 12 Nov 2019 05:54:50 -0500
From: Brian Masney <masneyb@onstation.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191112105450.GA9144@onstation.org>
References: <CAF6AEGsZkJJTNZ8SzHsSioEnkpekr1Texu5_EeBW1hP-bsOyjQ@mail.gmail.com>
 <20191107111019.GA24028@onstation.org>
 <CAF6AEGtbP=X2+DELajQq9zMZYGgmhyUhe62ncvHvyFnyZexTXg@mail.gmail.com>
 <CAOCk7NrPdGqc4vo70NmTuyszkPaPe41-e89ym2vAYBY+GTt9BA@mail.gmail.com>
 <CAJs_Fx4UJYd-k3_3AAGJo-8udThhvf6t-J=OZi3jappWjTNnFQ@mail.gmail.com>
 <CAOCk7Nq7rPmraofy+o8vWTwSAd1+dTRsoZ4QN0mRAOOz7u7TUg@mail.gmail.com>
 <20191110135321.GA6728@onstation.org>
 <CAOCk7Nr3nkUWOynxVK_0SxWKUss803_fhkdVehRajtiA9vi8ng@mail.gmail.com>
 <20191111113806.GA1420@onstation.org>
 <CAOCk7NoZN63zZQrbw-RRnbUko3OREy=15FMC7sN5M95oNb5JNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCk7NoZN63zZQrbw-RRnbUko3OREy=15FMC7sN5M95oNb5JNw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1573556090;
 bh=jjKN6d8ptQSkUyJcPph5rCkFf0mBynfnJx+7tQMICQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VORlG8Nn/3lq3rYkTopLtuLPXh2vlijLFzlNyEBCu4fJtdhpfSVehn+fa32ryyxyU
 LxnIYKoabfxZU5OhptEPMIOeM3FbFpqdhWPOiHSxLbihbLXYO2eKzMOEsJFxb6pL4R
 F+PmEubwY8vTdhKlUiQMI55U73QeJvBrbtU1alDE=
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDc6NTE6MjJBTSAtMDcwMCwgSmVmZnJleSBIdWdvIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDExLCAyMDE5IGF0IDQ6MzggQU0gQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgTm92IDEwLCAyMDE5IGF0
IDEwOjM3OjMzQU0gLTA3MDAsIEplZmZyZXkgSHVnbyB3cm90ZToKPiA+ID4gT24gU3VuLCBOb3Yg
MTAsIDIwMTkgYXQgNjo1MyBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIE5vdiAwOCwgMjAxOSBhdCAwNzo1NjoyNUFN
IC0wNzAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gPiA+ID4gVGhlcmUncyBhIFJFR19NRFA1X1BQ
X0FVVE9SRUZSRVNIX0NPTkZJRygpIG1hY3JvIHVwc3RyZWFtIGhlcmU6Cj4gPiA+ID4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNS54bWwuaCNuMTM4Mwo+
ID4gPiA+Cj4gPiA+ID4gSSdtIG5vdCBzdXJlIHdoYXQgdG8gcHV0IGluIHRoYXQgcmVnaXN0ZXIg
YnV0IEkgdHJpZWQgY29uZmlndXJpbmcgaXQKPiA+ID4gPiB3aXRoIGEgMSB0aGlzIHdheSBhbmQg
c3RpbGwgaGF2ZSB0aGUgc2FtZSBpc3N1ZS4KPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NtZF9lbmNvZGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NtZF9lbmNvZGVyLmMKPiA+ID4gPiBpbmRleCBl
ZWVmNDFmY2Q0ZTEuLjZiOWFjZjY4ZmQyYyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NtZF9lbmNvZGVyLmMKPiA+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NtZF9lbmNvZGVyLmMKPiA+ID4gPiBAQCAt
ODAsNiArODAsNyBAQCBzdGF0aWMgaW50IHBpbmdwb25nX3RlYXJjaGVja19zZXR1cChzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gPiA+ID4gICAgICAgICBtZHA1X3dyaXRlKG1kcDVfa21z
LCBSRUdfTURQNV9QUF9TWU5DX1RIUkVTSChwcF9pZCksCj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgTURQNV9QUF9TWU5DX1RIUkVTSF9TVEFSVCg0KSB8Cj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgTURQNV9QUF9TWU5DX1RIUkVTSF9DT05USU5VRSg0KSk7Cj4gPiA+ID4g
KyAgICAgICBtZHA1X3dyaXRlKG1kcDVfa21zLCBSRUdfTURQNV9QUF9BVVRPUkVGUkVTSF9DT05G
SUcocHBfaWQpLCAxKTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4g
IH0KPiA+ID4KPiA+ID4gYml0IDMxIGlzIHRoZSBlbmFibGUgYml0IChzZXQgdGhhdCB0byAxKSwg
Yml0cyAxNTowIGFyZSB0aGUKPiA+ID4gZnJhbWVfY291bnQgKGhvdyBtYW55IHRlIGV2ZW50cyBi
ZWZvcmUgdGhlIE1EUCBzZW5kcyBhIGZyYW1lLCBJJ2QKPiA+ID4gcmVjb21tZW5kIHNldCB0byAx
KS4gIFRoZW4gYWZ0ZXIgaXRzIHByb2dyYW1tZWQsIHlvdSdsbCBoYXZlIHRvIGZsdXNoCj4gPiA+
IHRoZSBjb25maWcsIGFuZCBwcm9iYWJseSB1c2UgYSBfU1RBUlQgdG8gbWFrZSBzdXJlIHRoZSBm
bHVzaCB0YWtlcwo+ID4gPiBlZmZlY3QuCj4gPgo+ID4gSSB0aGluayB0aGF0IEkgaW5pdGlhbGx5
IGdldCBhdXRvcmVmcmVzaCBlbmFibGVkIGJhc2VkIG9uIHlvdXIKPiA+IGRlc2NyaXB0aW9uIGFi
b3ZlIHNpbmNlIHRoZSBwaW5nIHBvbmcgSVJRcyBvY2N1ciBtdWNoIG1vcmUgZnJlcXVlbnRseS4K
PiA+IEhvd2V2ZXIgcHJldHR5IHF1aWNrbHkgdGhlIGVycm9yICdkc2lfZXJyX3dvcmtlcjogc3Rh
dHVzPWMnIGlzIHNob3duLAo+ID4gdGhlIGNvbnRlbnRzIG9uIHRoZSBzY3JlZW4gc2hpZnQgdG8g
dGhlIHJpZ2h0LCBhbmQgdGhlIHNjcmVlbiBubyBsb25nZXIKPiA+IHVwZGF0ZXMgYWZ0ZXIgdGhh
dC4gVGhhdCBlcnJvciBkZWNvZGVzIHRvCj4gPiBEU0lfRVJSX1NUQVRFX0RMTjBfUEhZIHwgRFNJ
X0VSUl9TVEFURV9GSUZPIGFjY29yZGluZyB0byBkc2lfaG9zdC5jLgo+ID4KPiA+IEhlcmUncyB0
aGUgcmVsZXZhbnQgY29kZSB0aGF0IEkgaGF2ZSBzbyBmYXI6Cj4gCj4gU28sIFVubGVzcyBJIG1p
c3NlZCBpdCwgeW91IGhhdmVuJ3QgZGlzYWJsZWQgdXNpbmcgX3N0YXJ0IHdoZW4KPiBhdXRvcmVm
cmVzaCBpcyBlbmFibGVkLiAgSWYgeW91IGFyZSB1c2luZyBib3RoIGF0IHRoZSBzYW1lIHRpbWUs
Cj4geW91J2xsIG92ZXJsb2FkIHRoZSBEU0kgYW5kIGdldCB0aG9zZSBraW5kcyBvZiBlcnJvcnMu
CgpUaGF0IGZpeGVkIHRoZSBpc3N1ZS4gSnVzdCB0byBjbG9zZSBvdXQgdGhpcyB0aHJlYWQsIEkg
c3VibWl0dGVkIGEKcGF0Y2ggd2l0aCB3aGF0IEkgaGF2ZSBoZXJlOgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMTkxMTEyMTA0ODU0LjIwODUwLTEtbWFzbmV5YkBvbnN0YXRpb24ub3Jn
L1QvI3UKCkknbGwgd29yayBvbiBhc3luYyBjb21taXQgc3VwcG9ydCBmb3IgdGhlIE1EUDUuCgpU
aGFua3MgSmVmZiBhbmQgUm9iIQoKQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
