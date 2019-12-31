Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D812D801
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 11:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD75A6E209;
	Tue, 31 Dec 2019 10:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BAD6E209
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 10:38:15 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B892206DB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577788695;
 bh=m7kqKRaz9I7n5UoZ+mA+Vd26mdg3UIRo076jMwTZUKs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q3XoN1vz6LEKRxchVQUr7q5oeq2tsBMYmGeUf4u/OvhOMxaAKr4vG/QYUDqaVVHwX
 QGqDAcHdwH5Mob7lbwJF9zVBS0hCj69c3rl/IKR5Ux6RX3MBMMNew0m75CxF8EULHk
 mjKvIEbQ3et3gumhM7Po42lSgQbrtY8SxP2QHFpg=
Received: by mail-lj1-f172.google.com with SMTP id y4so21623570ljj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 02:38:15 -0800 (PST)
X-Gm-Message-State: APjAAAWYolFv67YSfZxqk2MiSMTYATsC/j9/OiXwrqU3/F5Z3CJVZtnW
 G/rMEFLzoD7TKCb5+/vFe5/w6tkt5RJU0XuGCnc=
X-Google-Smtp-Source: APXvYqzMKfKZfiRH2jKjUg/iq48Ir3TkHa0dR/6uA47j3MXuIg/2O24VXSsRqlCLUUsAC2Ywf0ObYtS3A/s2A3dYGAc=
X-Received: by 2002:a05:651c:232:: with SMTP id
 z18mr37049562ljn.85.1577788693398; 
 Tue, 31 Dec 2019 02:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com> <20191230154405.GC4918@pi3>
 <2922135223b01126277ef92a53e6b294bc17bb5c.camel@samsung.com>
 <20191231092254.GA6939@pi3>
 <99427c18b1fcca3bc21e69609500abdbbef59167.camel@samsung.com>
 <20191231100234.GA7024@pi3>
 <29ed54c7700e35fb95fff4f4f5580eba24ffbb35.camel@samsung.com>
In-Reply-To: <29ed54c7700e35fb95fff4f4f5580eba24ffbb35.camel@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 31 Dec 2019 11:38:02 +0100
X-Gmail-Original-Message-ID: <CAJKOXPezRMb0OnpcRWrRheKbBjyzqNXG3TDX-MQkjAm2sTSr1w@mail.gmail.com>
Message-ID: <CAJKOXPezRMb0OnpcRWrRheKbBjyzqNXG3TDX-MQkjAm2sTSr1w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>
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
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-pm@vger.kernel.org,
 =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
 <b.zolnierkie@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>,
 myungjoo.ham@samsung.com, leonard.crestez@nxp.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzMSBEZWMgMjAxOSBhdCAxMToyMywgQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNh
bXN1bmcuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgb3JkZXIgb2YgcGF0Y2hlcyBzaG91bGQgcmVm
bGVjdCBmaXJzdCBvZiBhbGwgcmVhbCBkZXBlbmRlbmN5Lgo+ID4gV2hldGhlciBpdCBjb21waWxl
cywgd29ya3MgYXQgYWxsIGFuZCBkb2VzIG5vdCBicmVhayBhbnl0aGluZy4gIExvZ2ljYWwKPiA+
IGRlcGVuZGVuY3kgb2YgIndoZW4gdGhlIGZlYXR1cmUgd2lsbCBzdGFydCB3b3JraW5nIiBpcwo+
ID4gaXJyZWxldmFudCB0byBEVFMgYmVjYXVzZSBEVFMgZ29lcyBpbiBzZXBhcmF0ZSB3YXkgYW5k
IGRyaXZlciBpcwo+ID4gaW5kZXBlbmRlbnQgb2YgaXQuCj4KPiBUaGUgb3JkZXIgb2YgcGF0Y2hl
cyBkb2VzIGluZGVlZCByZWZsZWN0IHJlYWwgZGVwZW5kZW5jeS4gSSBjYW4gYWxzbyByZW9yZGVy
Cj4gdGhlbSAocHJlc2VydmluZyB0aGUgZGVwZW5kZW5jaWVzKSBzbyB0aGF0IERUUyBwYXRjaGVz
IGdvIGZpcnN0IGluIHRoZSBzZXJpZXMKPiBpZiB0aGlzIGlzIHRoZSBtb3JlIHByZWZlcnJlZCB3
YXkuCgpJdCBsb29rcyB3cm9uZyB0aGVuLiBEcml2ZXIgc2hvdWxkIG5vdCBkZXBlbmQgb24gRFRT
LiBJIGNhbm5vdCBmaW5kCnRoZSBwYXRjaCBjaGFuZ2luZyBiaW5kaW5ncyAoc2hvdWxkIGJlIGZp
cnN0IGluIHBhdGNoc2V0KSB3aGljaCBjb3VsZAphbHNvIHBvaW50IHRvIHRoaXMgcHJvYmxlbS4K
Ckl0IHNlZW1zIHlvdSBhZGRlZCByZXF1aXJlbWVudCBmb3IgaW50ZXJjb25uZWN0IHByb3BlcnRp
ZXMgd2hpbGUgaXQKc2hvdWxkIGJlIHJhdGhlciBvcHRpb25hbC4KCj4gPiA+IEkgc3RpbGwgdGhp
bmsgdGhlIG9yZGVyIG9mIHRoZXNlIHBhdGNoZXMgaXMgdGhlIG1vc3QgbG9naWNhbCBvbmUgZm9y
IHNvbWVvbmUKPiA+ID4gcmVhZGluZyB0aGlzIFJGQyBhcyBhIHdob2xlLgo+ID4KPiA+IEkgYW0g
c29ycnkgYnV0IGl0IGJyaW5ncyBvbmx5IGNvbmZ1c2lvbi4gRFRTIGlzIG9ydGhvZ29uYWwgb2Yg
dGhlCj4gPiBkcml2ZXIgY29kZS4gWW91IGNvdWxkIGV2ZW4gcG9zdCB0aGUgcGF0Y2hzZXQgd2l0
aG91dCBEVFMgKGFsdGhvdWdoIHRoZW4KPiA+IGl0IHdvdWxkIHJhaXNlIHF1ZXN0aW9ucyB3aGVy
ZSBpcyB0aGUgdXNlciBvZiBpdCwgYnV0IHN0aWxsLCB5b3UKPiA+IGNvdWxkKS4KPiA+Cj4gPiBG
dXJ0aGVyLCBEVFMgZGVzY3JpYmVzIGFsc28gaGFyZHdhcmUgc28geW91IGNvdWxkIHNlbmQgY2Vy
dGFpbiBEVFMKPiA+IHBhdGNoZXMgd2l0aG91dCBkcml2ZXIgaW1wbGVtZW50YXRpb24gdG8gZGVz
Y3JpYmUgdGhlIGhhcmR3YXJlLgo+ID4KPiA+IERyaXZlciBjb2RlIGFuZCBEVFMgYXJlIGtpbmQg
b2YgZGlmZmVyZW50IHdvcmxkcyBzbyBtaXhpbmcgdGhlbSB1cCBmb3IKPiA+IGxvZ2ljYWwgcmV2
aWV3IGRvZXMgbm90IHJlYWxseSBtYWtlIGFueSBzZW5zZS4KPiA+Cj4gPiBOb3QgbWVudGlvbmlu
ZyBpdCBpcyBkaWZmZXJlbnQgdGhhbiBtb3N0IG9mIG90aGVyIHBhdGNoZXMgb24gbWFpbGluZwo+
ID4gbGlzdHMuCj4gPgo+ID4gQlRXLCBpdCBpcyB0aGUgc2FtZSBhcyBiaW5kaW5ncyB3aGljaCBz
aG91bGQgKGFsbW9zdCkgYWx3YXlzIGdvIGZpcnN0IGFzCj4gPiBzZXBhcmF0ZSBwYXRjaGVzLgo+
Cj4gVGhhbmtzIGZvciBlbGFib3JhdGluZyBvbiB0aGlzLCBJIGFwcHJlY2lhdGUgaXQuCj4gUmVn
YXJkaW5nIHlvdXIgb3JpZ2luYWwgY29uY2VybiwgcGF0Y2hlcyAwNCAmIDA2IGFyZSBzZXBhcmF0
ZSBmb3Igc2V2ZXJhbAo+IHJlYXNvbnMsIG9uZSBvZiB3aGljaCBpcyB0aGF0IHRoZXkgYXJlIHJl
bGF0ZWQgdG8gdHdvIGRpZmZlcmVudCBkcml2ZXJzCj4gKGV4eW5vcy1idXMgdnMuIGV4eW5vcy1t
aXhlcikuCgpJdCdzIG9rYXkgdGhlbiAoZm9yIHRoZW0gdG8gYmUgc3BsaXQpLgoKPgo+ID4gPgo+
ID4gPiA+IEluIGNlcnRhaW4gY2FzZXMgZGVwZW5kZW5jeSBvbiBEVFMgY2hhbmdlcyBpcyBvazoK
PiA+ID4gPiAxLiBDbGVhbmluZyB1cCBkZXByZWNhdGVkIHByb3BlcnRpZXMsCj4gPiA+ID4gMi4g
SWdub3JpbmcgdGhlIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yIGUuZy4gbmV3IHBsYXRmb3Jt
cy4KPiA+ID4gPgo+ID4gPiA+IE5vbmUgb2YgdGhlc2UgYXJlIGFwcGxpY2FibGUgaGVyZS4KPiA+
ID4gPgo+ID4gPiA+IFlvdSBuZWVkIHRvIHJld29yayBpdCwgcHV0IERUUyBjaGFuZ2VzIGF0IHRo
ZSBlbmQuIFRoaXMgY2xlYXJseSBzaG93cwo+ID4gPiA+IHRoYXQgdGhlcmUgaXMgbm8gd3Jvbmcg
ZGVwZW5kZW5jeS4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQWRqdXN0IHRoZSB0aXRs
ZSB0byBtYXRjaCB0aGUgY29udGVudHMgLSB5b3UgYXJlIG5vdCBhZGRpbmcgYmluZGluZ3MgYnV0
Cj4gPiA+ID4gPiA+IHByb3BlcnRpZXMgdG8gYnVzIG5vZGVzLiBBbHNvIHRoZSBwcmVmaXggaXMg
QVJNOiAobG9vayBhdCByZWNlbnQKPiA+ID4gPiA+ID4gY29tbWl0cykuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gT0suCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpIGIvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiA+ID4gPiA+ID4g
PiBpbmRleCA0Y2UzZDc3YTY3MDQuLmQ5ZDcwZWFjZmNhZiAxMDA2NDQKPiA+ID4gPiA+ID4gPiAt
LS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaQo+ID4g
PiA+ID4gPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItb2Ryb2lkLWNvbW1v
bi5kdHNpCj4gPiA+ID4gPiA+ID4gQEAgLTkwLDYgKzkwLDcgQEAKPiA+ID4gPiA+ID4gPiAgJmJ1
c19kbWMgewo+ID4gPiA+ID4gPiA+ICAgICBleHlub3MscHBtdS1kZXZpY2UgPSA8JnBwbXVfZG1j
MF8zPiwgPCZwcG11X2RtYzFfMz47Cj4gPiA+ID4gPiA+ID4gICAgIHZkZC1zdXBwbHkgPSA8JmJ1
Y2sxX3JlZz47Cj4gPiA+ID4gPiA+ID4gKyAgICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47Cj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgZG9lcyBub3QgbG9vayBsaWtlIHByb3BlcnR5IG9m
IE9kcm9pZCBidXQgRXh5bm9zNDQxMiBvciBFeHlub3M0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFN0
cmFuZ2VseSBlbm91Z2gsIHRoaXMgZmlsZSBpcyB3aGVyZSB0aGUgJ2V4eW5vcyxwYXJlbnQtYnVz
JyAoYWthLiAnZGV2ZnJlcScpCj4gPiA+ID4gPiBwcm9wZXJ0aWVzIGFyZSBsb2NhdGVkIChhbmQg
ZXZlcnl0aGluZyBpbiB0aGlzIFJGQyBjb25jZXJucyBkZXZmcmVxKS4KPiA+ID4gPgo+ID4gPiA+
IEkgY2Fubm90IGZpbmQgZXh5bm9zLHBhcmVudC1idXMgaW4gZXh5bm9zNDQxMi1vZHJvaWQtY29t
bW9uLmR0c2kuIENhbgo+ID4gPiA+IHlvdSBlbGFib3JhdGU/Cj4gPiA+Cj4gPiA+IEN1cnJlbnRs
eSBhIG5hbWUgY2hhbmdlIGlzIGJlaW5nIG1hZGU6ICdkZXZmcmVxJyAtPiAnZXh5bm9zLHBhcmVu
dC1idXMnCj4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEzMDQ1NDkv
Cj4gPiA+IChhIGRlcGVuZGVuY3kgb2YgdGhpcyBSRkM7IGFsc28gYXZhaWxhYmxlIGluIGRldmZy
ZXEtdGVzdGluZyBicmFuY2gpCj4gPgo+ID4gSSBzZWUuIFRoYXQgcHJvcGVydHkgYWxzbyBkb2Vz
IG5vdCBsb29rIGxpa2UgYm9hcmQgKE9kcm9pZCkgc3BlY2lmaWMgc28KPiA+IGl0IHNob3VsZCBi
ZSBtb3ZlZCB0byBFeHlub3M0NDEyIERUU0kuCj4KPiBNYWtlcyBzZW5zZSB0byBtZS4gSnVzdCBm
cm9tIGxvb2tpbmcgYXQgdGhlIHBhdGNoIEkgcmVmZXJlbmNlZCBhYm92ZSwgdGhlcmUgaXMKPiBh
IHNpZ25pZmljYW50IGxldmVsIG9mIGNvZGUgZHVwbGljYXRpb24gYmV0d2Vlbgo+ICogYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1pdG9wLXNjcC1jb3JlLmR0c2kKPiAqIGFyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczQ0MTItbWlkYXMuZHRzaQo+ICogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiB3aXRoIHJlbGF0aW9uIHRvIHRoZSBkZXZmcmVxKi9l
eHlub3MsKiBwcm9wZXJ0aWVzLgoKSWYgeW91IGhhdmUgaW4gbWluZCBhbGwgdGhlIG5vZGVzIHdp
dGggInN0YXR1cz1va2F5IiwgaXQncyBmaW5lIHRvCmR1cGxpY2F0ZSB0aGVtLgoKQmVzdCByZWdh
cmRzLApLcnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
