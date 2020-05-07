Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D941C8EE7
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 16:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FCB6E9C4;
	Thu,  7 May 2020 14:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C8016E9C4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 14:30:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3908D6E;
 Thu,  7 May 2020 07:30:30 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C5393F68F;
 Thu,  7 May 2020 07:30:29 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/panfrost: add devfreq regulator support
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCcfrMhu5Mi7YZTttw2k+hGui0GFAmOhPh_9fv4Te27M0+A@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <13285d84-5a5e-c695-2a8b-7ca50c976b90@arm.com>
Date: Thu, 7 May 2020 15:30:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCcfrMhu5Mi7YZTttw2k+hGui0GFAmOhPh_9fv4Te27M0+A@mail.gmail.com>
Content-Language: en-GB
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMDUvMjAyMCAyMzowNywgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEhpIFN0ZXZlbiwK
PiAKPiBPbiBUdWUsIDE0IEFwciAyMDIwIGF0IDE1OjEwLCBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKPj4KPj4gSGkgQ2zDqW1lbnQsCj4+Cj4+IE9uIDEzLzA0LzIw
MjAgMTg6MjgsIENsw6ltZW50IFDDqXJvbiB3cm90ZToKPj4+IEhpIFN0ZXZlbiwKPj4+Cj4gCj4g
PHNuaXA+Cj4gCj4+IEdldHRpbmcgYSBiYWNrdHJhY2UgZnJvbSB0aGUgdHdvIG9jY3VycmVuY2Vz
LCBJIHNlZSBvbmUgYWRkZWQgZnJvbToKPj4KPj4gICAgIChkZWJ1Z2ZzX2NyZWF0ZV9kaXIpIGZy
b20gWzxjMDQ2MzNmOD5dIChjcmVhdGVfcmVndWxhdG9yKzB4ZTAvMHgyMjApCj4+ICAgICAoY3Jl
YXRlX3JlZ3VsYXRvcikgZnJvbSBbPGMwNDY4MWQ4Pl0gKF9yZWd1bGF0b3JfZ2V0KzB4MTY4LzB4
MjA0KQo+PiAgICAgKF9yZWd1bGF0b3JfZ2V0KSBmcm9tIFs8YzA0NjgyZTA+XSAocmVndWxhdG9y
X2J1bGtfZ2V0KzB4NjQvMHhmNCkKPj4gICAgIChyZWd1bGF0b3JfYnVsa19nZXQpIGZyb20gWzxj
MDQ2OTZmMD5dCj4+IChkZXZtX3JlZ3VsYXRvcl9idWxrX2dldCsweDQwLzB4NzQpCj4+ICAgICAo
ZGV2bV9yZWd1bGF0b3JfYnVsa19nZXQpIGZyb20gWzxiZjAwYWY0ND5dCj4+IChwYW5mcm9zdF9k
ZXZpY2VfaW5pdCsweDFiNC8weDQ4YyBbcGFuZnJvc3RdKQo+PiAgICAgKHBhbmZyb3N0X2Rldmlj
ZV9pbml0IFtwYW5mcm9zdF0pIGZyb20gWzxiZjAwYTRkND5dCj4+IChwYW5mcm9zdF9wcm9iZSsw
eDk0LzB4MTg0IFtwYW5mcm9zdF0pCj4+ICAgICAocGFuZnJvc3RfcHJvYmUgW3BhbmZyb3N0XSkg
ZnJvbSBbPGMwNGVlNjk0Pl0KPj4gKHBsYXRmb3JtX2Rydl9wcm9iZSsweDQ4LzB4OTQpCj4+Cj4+
IEFuZCB0aGUgb3RoZXI6Cj4+Cj4+ICAgICAoZGVidWdmc19jcmVhdGVfZGlyKSBmcm9tIFs8YzA0
NjMzZjg+XSAoY3JlYXRlX3JlZ3VsYXRvcisweGUwLzB4MjIwKQo+PiAgICAgKGNyZWF0ZV9yZWd1
bGF0b3IpIGZyb20gWzxjMDQ2ODFkOD5dIChfcmVndWxhdG9yX2dldCsweDE2OC8weDIwNCkKPj4g
ICAgIChfcmVndWxhdG9yX2dldCkgZnJvbSBbPGMwNWMxMjgwPl0gKGRldl9wbV9vcHBfc2V0X3Jl
Z3VsYXRvcnMrMHg2Yy8weDE4NCkKPj4gICAgIChkZXZfcG1fb3BwX3NldF9yZWd1bGF0b3JzKSBm
cm9tIFs8YmYwMGI0YWM+XQo+PiAocGFuZnJvc3RfZGV2ZnJlcV9pbml0KzB4MzgvMHgxYWMgW3Bh
bmZyb3N0XSkKPj4gICAgIChwYW5mcm9zdF9kZXZmcmVxX2luaXQgW3BhbmZyb3N0XSkgZnJvbSBb
PGJmMDBhNTA4Pl0KPj4gKHBhbmZyb3N0X3Byb2JlKzB4YzgvMHgxODQgW3BhbmZyb3N0XSkKPj4g
ICAgIChwYW5mcm9zdF9wcm9iZSBbcGFuZnJvc3RdKSBmcm9tIFs8YzA0ZWU2OTQ+XQo+PiAocGxh
dGZvcm1fZHJ2X3Byb2JlKzB4NDgvMHg5NCkKPj4KPj4gQm90aCBhcmUgY3JlYXRlZCBhdCAvcmVn
dWxhdG9yL3ZkZF9ncHUKPiAKPiBJJ20gcHJlcGFyaW5nIGEgbmV3IHZlcnNpb24gd2l0aCBzb21l
IGNsZWFuIGZyb20gbGltYSBkZXZmcmVxLgo+IE15IHdvcmtpbmcgYnJhbmNoIDoKPiBodHRwczov
L2dpdGh1Yi5jb20vY2xlbWVudHBlcm9uL2xpbnV4L2NvbW1pdHMvcGFuZnJvc3RfZGV2ZnJlcQoK
SSBoYWQgYSBsb29rIGF0IHRoYXQgYnJhbmNoIGFuZCBnYXZlIGl0IGEgcXVpY2sgc3BpbiBvbiBt
eSBGaXJlZmx5IApSSzMyODggYW5kIGRpZG4ndCBub3RpY2UgYW55IGlzc3Vlcy4KCj4gVHdvIHN0
cmFuZ2UgdGhpbmdzIEkgb2JzZXJ2ZToKPiAgIC0gQWZ0ZXIgMzBzZWMgdGhlIHJlZ3VsYXRvciBp
cyByZWxlYXNlZCBieSBPUFAgPz8/Cj4gWyAgIDMzLjc1NzYyN10gdmRkLWdwdTogZGlzYWJsaW5n
Cj4gSW50cm9kdWNlIHRoZSByZWd1bGF0b3Igc3VwcG9ydCBpbiB0aGlzIGNvbW1pdDoKPiBodHRw
czovL2dpdGh1Yi5jb20vY2xlbWVudHBlcm9uL2xpbnV4L2NvbW1pdC9iZTMxMGMzN2I4MjAxMGUy
OTNiN2YxMjljY2RjYjcxMWEyYWJiMmNlCgpJIGNhbid0IHNlZSBhbnl0aGluZyB3cm9uZyB3aXRo
IHRoaXMgY29tbWl0LCBidXQgZXF1YWxseSBpbiBteSBEVFMgSSAKaGF2ZSBhICJyZWd1bGF0b3It
YWx3YXlzLW9uIiBmb3IgdmRkX2dwdS4gTXkgaW5pdGlhbCB0aG91Z2h0IHdhcyB0aGF0IAp0aGlz
IGNvdWxkIGJlIHJ1bnRpbWUgUE0gb2YgdGhlIEdQVSAtIGJ1dCBJIGNhbid0IHNlZSBob3cgCnBh
bmZyb3N0X2RldmljZV9zdXNwZW5kKCkgd291bGQgZW5kIHVwIHR1cm5pbmcgb2ZmIHRoZSByZWd1
bGF0b3IuIFNvIAp1bmxlc3MgdGhlcmUncyBzb21lIHdheSB0aGF0IHRoZSByZWd1bGF0b3IgaXRz
ZWxmIHN1c3BlbmRzIChidXQgaXQgCnNob3VsZCBrbm93IGl0J3MgaW4gdXNlKSBJJ3ZlIG5vIGNs
dWUgd2h5IHRoaXMgd291bGQgYmUgaGFwcGVuaW5nLgoKU2luY2UgeW91J3ZlIGdvdCBhIHJlcHJv
ZHVjdGlvbiAtIGNhbiB5b3UgZ2V0IGEgYmFja3RyYWNlIHdoZXJlIHRoZSAKcmVndWxhdG9yIGlz
IGdldHRpbmcgZGlzYWJsZWQ/Cgo+ICAgLSBUaGUgQ29vbGluZyBtYXAgaXMgbm90IHByb2JlIGNv
cnJlY3RseSA6Cj4gWyAgICAyLjU0NTc1Nl0gcGFuZnJvc3QgMTgwMDAwMC5ncHU6IFtkcm06cGFu
ZnJvc3RfZGV2ZnJlcV9pbml0Cj4gW3BhbmZyb3N0XV0gRmFpbGVkIHRvIHJlZ2lzdGVyIGNvb2xp
bmcgZGV2aWNlCj4gSW50cm9kdWNlIGluIHRoaXMgY29tbWl0IDoKPiBodHRwczovL2dpdGh1Yi5j
b20vY2xlbWVudHBlcm9uL2xpbnV4L2NvbW1pdC8wMjUyYzM4ZmQ1NWFkNzgzNjZhYzRiMTcxNGUy
ODVjODhkYjM0NTU3Cj4gCj4gRG8geW91IGhhdmUgYW4gaGludCBhYm91dCB3aGF0IEknbSBtaXNz
aW5nID8KClNvcnJ5LCBteSBrbm93bGVkZ2Ugb2YgdGhlIGNvb2xpbmcgZnJhbWV3b3JrIGlzIHZl
cnkgbGltaXRlZC4gV2hhdCAKeW91J3ZlIGdvdCBsb29rcyBwbGF1c2libGUsIGJ1dCBJJ20gYWZy
YWlkIEkgY2FuJ3QgcmVhbGx5IGhlbHAgYmV5b25kIAp0aGF0ISBBcyBiZWZvcmUgLSBjYW4geW91
IHRyeSBhZGRpbmcgc29tZSBwcmludGsoKXMgaW4gZS5nLiAKb2ZfZGV2ZnJlcV9jb29saW5nX3Jl
Z2lzdGVyX3Bvd2VyKCkgYW5kIGZpbmQgb3V0IHdoZXJlIGl0IGlzIGJhaWxpbmcgb3V0PwoKU3Rl
dmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
