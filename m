Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DA26868D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2DA89F27;
	Mon, 14 Sep 2020 07:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A86589F27;
 Mon, 14 Sep 2020 07:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 320CF2A6016;
 Mon, 14 Sep 2020 09:52:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 9D68bPWAHq2f; Mon, 14 Sep 2020 09:52:37 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3E2D92A6042;
 Mon, 14 Sep 2020 09:52:37 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kHjHv-000XVI-WB; Mon, 14 Sep 2020 09:52:36 +0200
To: Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Harry Wentland <hwentlan@amd.com>
References: <20200821165758.1106210-1-michel@daenzer.net>
 <20200904104304.41246-1-michel@daenzer.net>
 <20200907075716.GO2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v2] drm/amdgpu/dc: Require primary plane to be enabled
 whenever the CRTC is
Message-ID: <d0c95272-9a1c-f9f0-f1b9-4e7ce1f319c7@daenzer.net>
Date: Mon, 14 Sep 2020 09:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200907075716.GO2352366@phenom.ffwll.local>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0wNyA5OjU3IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gRnJpLCBT
ZXAgMDQsIDIwMjAgYXQgMTI6NDM6MDRQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+
IEZyb206IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgo+Pgo+PiBEb24ndCBj
aGVjayBkcm1fY3J0Y19zdGF0ZTo6YWN0aXZlIGZvciB0aGlzIGVpdGhlciwgcGVyIGl0cwo+PiBk
b2N1bWVudGF0aW9uIGluIGluY2x1ZGUvZHJtL2RybV9jcnRjLmg6Cj4+Cj4+ICAgKiBIZW5jZSBk
cml2ZXJzIG11c3Qgbm90IGNvbnN1bHQgQGFjdGl2ZSBpbiB0aGVpciB2YXJpb3VzCj4+ICAgKiAm
ZHJtX21vZGVfY29uZmlnX2Z1bmNzLmF0b21pY19jaGVjayBjYWxsYmFjayB0byByZWplY3QgYW4g
YXRvbWljCj4+ICAgKiBjb21taXQuCj4+Cj4+IGF0b21pY19yZW1vdmVfZmIgZGlzYWJsZXMgdGhl
IENSVEMgYXMgbmVlZGVkIGZvciBkaXNhYmxpbmcgdGhlIHByaW1hcnkKPj4gcGxhbmUuCj4+Cj4+
IFRoaXMgcHJldmVudHMgYXQgbGVhc3QgdGhlIGZvbGxvd2luZyBwcm9ibGVtcyBpZiB0aGUgcHJp
bWFyeSBwbGFuZSBnZXRzCj4+IGRpc2FibGVkIChlLmcuIGR1ZSB0byBkZXN0cm95aW5nIHRoZSBG
QiBhc3NpZ25lZCB0byB0aGUgcHJpbWFyeSBwbGFuZSwKPj4gYXMgaGFwcGVucyBlLmcuIHdpdGgg
bXV0dGVyIGluIFdheWxhbmQgbW9kZSk6Cj4+Cj4+ICogVGhlIGxlZ2FjeSBjdXJzb3IgaW9jdGwg
cmV0dXJuZWQgRUlOVkFMIGZvciBhIG5vbi0wIGN1cnNvciBGQiBJRAo+PiAgICAod2hpY2ggZW5h
YmxlcyB0aGUgY3Vyc29yIHBsYW5lKS4KPj4gKiBJZiB0aGUgY3Vyc29yIHBsYW5lIHdhcyBlbmFi
bGVkLCBjaGFuZ2luZyB0aGUgbGVnYWN5IERQTVMgcHJvcGVydHkKPj4gICAgdmFsdWUgZnJvbSBv
ZmYgdG8gb24gcmV0dXJuZWQgRUlOVkFMLgo+Pgo+PiB2MjoKPj4gKiBNaW5vciBjaGFuZ2VzIHRv
IGNvZGUgY29tbWVudCBhbmQgY29tbWl0IGxvZywgcGVyIHJldmlldyBmZWVkYmFjay4KPj4KPj4g
R2l0TGFiOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vaXNzdWVzLzEx
MDgKPj4gR2l0TGFiOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vaXNz
dWVzLzExNjUKPj4gR2l0TGFiOiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVy
Ly0vaXNzdWVzLzEzNDQKPj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJA
cmVkaGF0LmNvbT4KPiAKPiBDb21taXQgbWVzc2FnZSBhZ3JlZXMgd2l0aCBteSB1bmRlcnN0YW5k
IG9mIHRoaXMgbWF6ZSBub3csIHNvOgo+IAo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgoKVGhhbmtzIERhbmllbCEKCgpOaWNrIC8gSGFycnksIGFueSBt
b3JlIGZlZWRiYWNrPyBJZiBub3QsIGNhbiB5b3UgYXBwbHkgdGhpcz8KCgpQLlMuIFNpbmNlIERD
TiBkb2Vzbid0IG1ha2UgYSBkaXN0aW5jdGlvbiBiZXR3ZWVuIHByaW1hcnkgb3Igb3ZlcmxheSAK
cGxhbmVzIGluIGhhcmR3YXJlLCBjb3VsZCBDaHJvbWl1bU9TIGFjaGlldmUgdGhlIHNhbWUgZWZm
ZWN0IHdpdGggb25seSAKdGhlIHByaW1hcnkgcGxhbmUgaW5zdGVhZCBvZiBvbmx5IGFuIG92ZXJs
YXkgcGxhbmU/IElmIHNvLCBtYXliZSB0aGVyZSdzIApubyBuZWVkIGZvciB0aGUgImJsYWNrIHBs
YW5lIGhhY2siLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8
ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lh
c3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
