Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B924258AD4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 10:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391086E41B;
	Tue,  1 Sep 2020 08:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63B786E41B;
 Tue,  1 Sep 2020 08:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 263EB2A6042;
 Tue,  1 Sep 2020 10:56:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id npbGqGs0Zm_X; Tue,  1 Sep 2020 10:56:43 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 5A8C22A6016;
 Tue,  1 Sep 2020 10:56:43 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kD25t-000euF-12; Tue, 01 Sep 2020 10:56:42 +0200
Subject: Re: [PATCH] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <58dc5ed0-307e-74c9-1a8b-1e998be04900@amd.com>
 <91391bb3-a855-1a29-2d2e-a31856c99946@daenzer.net>
 <20200824104327.559503f7@eldfell>
 <b8bc3e37-d9b3-2aeb-8580-f265f1b8c830@daenzer.net>
 <20200901075719.GX2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <52d558d2-3277-716f-6386-b8b90e6f41d3@daenzer.net>
Date: Tue, 1 Sep 2020 10:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901075719.GX2352366@phenom.ffwll.local>
Content-Language: en-CA
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0wMSA5OjU3IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVHVlLCBB
dWcgMjUsIDIwMjAgYXQgMDQ6NTU6MjhQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+
IE9uIDIwMjAtMDgtMjQgOTo0MyBhLm0uLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToKPj4gCj4+PiBT
b3VuZHMgbGlrZSB0aGUgaGVscGVycyB5b3UgcmVmZXIgdG8gYXJlIGluYWRlcXVhdGUgZm9yIHlv
dXIgY2FzZS4KPj4+IENhbid0IHlvdSBmaXggdGhlIGhlbHBlcnMgaW4gdGhlIGxvbmcgcnVuIGFu
ZCBsYW5kIHRoaXMgcGF0Y2ggYXMgYW4KPj4+IGltbWVkaWF0ZSBmaXg/Cj4+IAo+PiBJJ2QgcmF0
aGVyIGxlYXZlIHdvcmtpbmcgb24gdGhvc2UgaGVscGVycyB0byBLTVMgZGV2ZWxvcGVycy4gOikK
PiAKPiBJIHRob3VnaHQgdGhlIGlzc3VlIGlzIHRoZSBybWZiIGlvY3RsIHRyaWNrZXJ5LCB3aGlj
aCBoYXMgdGhpcyBhc3N1bXB0aW9uCj4gZnVsbHkgYmFja2VkIGluLiBUaGUgd2lnZ2xlIHJvb20g
aW4gdGhlcmUgZm9yIHNlbWFudGljIGNoYW5nZXMgaXMgaWlyYwo+IHByZXR0eSBtdWNoIG5pbCwg
aXQgdG9vayB1cyBhIHBpbGUgb2YgcGF0Y2hlcyB0byBqdXN0IGdldCB0byB0aGUgY3VycmVudAo+
IHN0YXRlLiBTbyBpdCdzIG5vdCBoZWxwZXIgY29kZSwgaXQncyBjb3JlIGxlZ2FjeSBpb2N0bCBj
b2RlIGZvciBhdG9taWMKPiBkcml2ZXJzLgoKTXkgYmFkLiBTaG91bGQgSSByZXNwaW4gd2l0aCBh
biBhbWVuZGVkIGNvbW1pdCBsb2c/CgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAg
ICAgICAgICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdh
cmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxv
cGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
