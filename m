Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F71A7438
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B088918A;
	Tue, 14 Apr 2020 07:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Mon, 13 Apr 2020 17:38:46 UTC
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E7E89F43;
 Mon, 13 Apr 2020 17:38:46 +0000 (UTC)
Received: from [192.168.1.6] (x4d0d8c93.dyn.telefonica.de [77.13.140.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D4604206442E6;
 Mon, 13 Apr 2020 19:32:03 +0200 (CEST)
Subject: Re: [regression 5.7-rc1] System does not power off, just halts
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Prike Liang <Prike.Liang@amd.com>, Alex Deucher <alexander.deucher@amd.com>
References: <f4eaf0ca-6cd6-c224-9205-bf64ca533ff5@molgen.mpg.de>
Message-ID: <dcc4851e-0ab5-683a-2cf2-687d64a3c9da@molgen.mpg.de>
Date: Mon, 13 Apr 2020 19:32:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f4eaf0ca-6cd6-c224-9205-bf64ca533ff5@molgen.mpg.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: regressions@leemhuis.info, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Mengbing Wang <Mengbing.Wang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBQcmlrZSwgZGVhciBBbGV4LCBkZWFyIExpbnV4IGZvbGtzLAoKCkFtIDEzLjA0LjIwIHVt
IDEwOjQ0IHNjaHJpZWIgUGF1bCBNZW56ZWw6Cgo+IEEgcmVncmVzc2lvbiBiZXR3ZWVuIGNhdXNl
cyBhIHN5c3RlbSB3aXRoIHRoZSBBTUQgYm9hcmQgTVNJIEIzNTBNIE1PUlRBUiAKPiAoTVMtN0Ez
Nykgd2l0aCBhbiBBTUQgUnl6ZW4gMyAyMjAwRyBub3QgdG8gcG93ZXIgb2ZmIGFueSBtb3JlIGJ1
dCBqdXN0IAo+IHRvIGhhbHQuCj4gCj4gVGhlIHJlZ3Jlc3Npb24gaXMgaW50cm9kdWNlZCBpbiA5
ZWJlNTQyMmFkNmMuLmIwMzIyMjdjNjI5My4gSSBhbSBpbiB0aGUgCj4gcHJvY2VzcyB0byBiaXNl
Y3QgdGhpcywgYnV0IG1heWJlIHNvbWVib2R5IGFscmVhZHkgaGFzIGFuIGlkZWEuCgpJIGZvdW5k
IHRoZSBFYXN0ZXIgZWdnOgoKPiBjb21taXQgNDg3ZWNhMTFhMzIxZWYzM2JjZjRjYTVhZGIzYzBj
NDk1NGRiMWI1OAo+IEF1dGhvcjogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+Cj4g
RGF0ZTogICBUdWUgQXByIDcgMjA6MjE6MjYgMjAyMCArMDgwMAo+IAo+ICAgICBkcm0vYW1kZ3B1
OiBmaXggZ2Z4IGhhbmcgZHVyaW5nIHN1c3BlbmQgd2l0aCB2aWRlbyBwbGF5YmFjayAodjIpCj4g
ICAgIAo+ICAgICBUaGUgc3lzdGVtIHdpbGwgYmUgaGFuZyB1cCBkdXJpbmcgUzMgc3VzcGVuZCBi
ZWNhdXNlIG9mIFNNVSBpcyBwZW5kaW5nCj4gICAgIGZvciBHQyBub3QgcmVzcG9zZSB0aGUgcmVn
aXN0ZXIgQ1BfSFFEX0FDVElWRSBhY2Nlc3MgcmVxdWVzdC5UaGlzIGlzc3VlCj4gICAgIHJvb3Qg
Y2F1c2Ugb2YgYWNjZXNzaW5nIHRoZSBHQyByZWdpc3RlciB1bmRlciBlbnRlciBHRlggQ0dHUEcg
YW5kIGNhbgo+ICAgICBiZSBmaXhlZCBieSBkaXNhYmxlIEdGWCBDR1BHIGJlZm9yZSBwZXJmb3Jt
IHN1c3BlbmQuCj4gICAgIAo+ICAgICB2MjogVXNlIGRpc2FibGUgdGhlIEdGWCBDR1BHIGluc3Rl
YWQgb2YgUkxDIHNhZmUgbW9kZSBndWFyZC4KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYtYnk6IFBy
aWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgo+ICAgICBUZXN0ZWQtYnk6IE1lbmdiaW5n
IFdhbmcgPE1lbmdiaW5nLldhbmdAYW1kLmNvbT4KPiAgICAgUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiAgICAgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKCkl0IHJldmVydHMgY2xlYW5seSBvbiB0b3Agb2YgNS43LXJjMSwgYW5kIHRoaXMgZml4ZXMg
dGhlIGlzc3VlLgoKR3JlZywgcGxlYXNlIGRvIG5vdCBhcHBseSB0aGlzIHRvIHRoZSBzdGFibGUg
c2VyaWVzLiBUaGUgY29tbWl0IG1lc3NhZ2UgCmRvZXNu4oCZdCBldmVuIHJlZmVyZW5jZSBhIGlz
c3VlL2J1ZyByZXBvcnQsIGFuZCBkb2VzbuKAmXQgZ2l2ZSBhIGRldGFpbGVkIApwcm9ibGVtIGRl
c2NyaXB0aW9uLiBXaGF0IHN5c3RlbSBpcyBpdD8KCkRhdmUsIEFsZXgsIGhvdyB0byBwcm9jZWVk
PyBSZXZlcnQ/IEkgY3JlYXRlZCBpc3N1ZSAxMDk0IFsxXS4KCgpLaW5kIHJlZ2FyZHMsCgpQYXVs
CgoKWzFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8x
MDk0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
