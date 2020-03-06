Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052A17CD82
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B8E6E147;
	Sat,  7 Mar 2020 10:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5ED736E84B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 09:52:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FAB331B;
 Fri,  6 Mar 2020 01:52:05 -0800 (PST)
Received: from [192.168.1.161] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 693DB3F6C4;
 Fri,  6 Mar 2020 01:52:03 -0800 (PST)
Subject: Re: [PATCH] drm: komeda: Make rt_pm_ops dependent on CONFIG_PM
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20200304145412.33936-1-vincenzo.frascino@arm.com>
 <20200305184255.GH364558@e110455-lin.cambridge.arm.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <be7a17bf-86f8-a086-9783-3f4a211cf9e3@arm.com>
Date: Fri, 6 Mar 2020 09:52:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200305184255.GH364558@e110455-lin.cambridge.arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsCgpPbiAzLzUvMjAgNjo0MiBQTSwgTGl2aXUgRHVkYXUgd3JvdGU6Cj4gT24gV2Vk
LCBNYXIgMDQsIDIwMjAgYXQgMDI6NTQ6MTJQTSArMDAwMCwgVmluY2Vuem8gRnJhc2Npbm8gd3Jv
dGU6Cj4+IGtvbWVkYV9ydF9wbV9zdXNwZW5kKCkgYW5kIGtvbWVkYV9ydF9wbV9yZXN1bWUoKSBh
cmUgY29tcGlsZWQgb25seSB3aGVuCj4+IENPTkZJR19QTSBpcyBlbmFibGVkLiBIYXZpbmcgaXQg
ZGlzYWJsZWQgdHJpZ2dlcnMgdGhlIGZvbGxvd2luZyB3YXJuaW5nCj4+IGF0IGNvbXBpbGUgdGlt
ZToKPj4KPj4gbGludXgvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZHJ2LmM6MTU2OjEyOgo+PiB3YXJuaW5nOiDigJhrb21lZGFfcnRfcG1fcmVzdW1l4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KPj4gIHN0YXRpYyBpbnQga29tZWRh
X3J0X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn4KPj4gbGludXgvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZHJ2LmM6MTQ5OjEyOgo+PiB3YXJuaW5nOiDigJhrb21lZGFfcnRfcG1fc3VzcGVuZOKA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCj4+ICBzdGF0aWMgaW50
IGtvbWVkYV9ydF9wbV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4KPj4gTWFrZSBrb21l
ZGFfcnRfcG1fc3VzcGVuZCgpIGFuZCBrb21lZGFfcnRfcG1fcmVzdW1lKCkgZGVwZW5kZW50IG9u
Cj4+IENPTkZJR19QTSB0byBhZGRyZXNzIHRoZSBpc3N1ZS4KPj4KPj4gQ2M6ICJKYW1lcyAoUWlh
bikgV2FuZyIgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+PiBDYzogTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+Cj4+IENjOiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Cj4+IENjOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+
Cj4+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnpvIEZyYXNjaW5v
IDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPgo+IAo+IEFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8
bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaCwgSSB3aWxsIHB1
c2ggaXQgaW50byBkcm0tbWlzYy1maXhlcyB0b21vcnJvdy4KPiAKClRoYW5rIHlvdSEKCj4gQmVz
dCByZWdhcmRzLAo+IExpdml1Cj4gCj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgfCAyICsrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rydi5jCj4+IGluZGV4IGVhNWNkMWUxNzMwNC4uZGQzYWUzZDg4Njg3IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+
PiBAQCAtMTQ2LDYgKzE0Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGtv
bWVkYV9vZl9tYXRjaFtdID0gewo+PiAgCj4+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBrb21l
ZGFfb2ZfbWF0Y2gpOwo+PiAgCj4+ICsjaWZkZWYgQ09ORklHX1BNCj4+ICBzdGF0aWMgaW50IGtv
bWVkYV9ydF9wbV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gIHsKPj4gIAlzdHJ1Y3Qg
a29tZWRhX2RydiAqbWRydiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiBAQCAtMTU5LDYgKzE2
MCw3IEBAIHN0YXRpYyBpbnQga29tZWRhX3J0X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4+ICAKPj4gIAlyZXR1cm4ga29tZWRhX2Rldl9yZXN1bWUobWRydi0+bWRldik7Cj4+ICB9Cj4+
ICsjZW5kaWYgLyogQ09ORklHX1BNICovCj4+ICAKPj4gIHN0YXRpYyBpbnQgX19tYXliZV91bnVz
ZWQga29tZWRhX3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiAgewo+PiAtLSAKPj4g
Mi4yNS4xCj4+Cj4gCgotLSAKUmVnYXJkcywKVmluY2Vuem8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
