Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C9798D2D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF0A6EA73;
	Thu, 22 Aug 2019 08:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE266E449;
 Thu, 22 Aug 2019 06:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 501953F393;
 Thu, 22 Aug 2019 08:42:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Quk9Zj-YYZ_v; Thu, 22 Aug 2019 08:42:48 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id BDADB3F2D9;
 Thu, 22 Aug 2019 08:42:45 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2D40A3601BA;
 Thu, 22 Aug 2019 08:42:43 +0200 (CEST)
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-2-daniel.vetter@ffwll.ch>
 <757909ec-e62f-37fc-fe6e-16d332e20b7c@shipmail.org>
 <20190821163453.GQ11147@phenom.ffwll.local>
 <20d98d9a-9fcf-287d-e245-123d5d1ef536@shipmail.org>
 <CAKMK7uFc55F-nQP3jB0wxV4SD+OURy4j7p1-qGSJbp10SEaTFg@mail.gmail.com>
 <d1390f72-5a2f-751b-c5bb-9b4fe1f6b705@shipmail.org>
 <20190821195110.GR11147@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <4fef24d2-dd6c-3595-806d-eb9df92ee23c@shipmail.org>
Date: Thu, 22 Aug 2019 08:42:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190821195110.GR11147@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566456164; bh=o5kJeMRMrbfonTB4geG/bm8rdi/NgABcwqM8/PJlxAQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IHbt2Bm4rzu9SZqUINO6JjILy6N4pAZ37xW3fcoRb/3yovj9ptNUkrflLwv1Y6iIq
 NEEmegWRQEpJORzm3TT7TgcIxy+iyHxXboId+0At0sNBqjqaf2xpISTPxbiklKJ+p2
 I8qxXKRA/c9zVdCt3KOSvR4ScvGRXe3QgUpxcESk=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="IHbt2Bm4";
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMS8xOSA5OjUxIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDIx
LCAyMDE5IGF0IDA4OjI3OjU5UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdy
b3RlOgo+PiBPbiA4LzIxLzE5IDg6MTEgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+PiBPbiBX
ZWQsIEF1ZyAyMSwgMjAxOSBhdCA3OjA2IFBNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpCj4+
PiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Pj4gT24gOC8yMS8xOSA2OjM0IFBN
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwNTo1
NDoyN1BNICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4+Pj4+IE9u
IDgvMjAvMTkgNDo1MyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+PiBGdWxsIGF1ZGl0
IG9mIGV2ZXJ5b25lOgo+Pj4+Pj4+Cj4+Pj4+Pj4gLSBpOTE1LCByYWRlb24sIGFtZGdwdSBzaG91
bGQgYmUgY2xlYW4gcGVyIHRoZWlyIG1haW50YWluZXJzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gLSB2cmFt
IGhlbHBlcnMgc2hvdWxkIGJlIGZpbmUsIHRoZXkgZG9uJ3QgZG8gY29tbWFuZCBzdWJtaXNzaW9u
LCBzbwo+Pj4+Pj4+ICAgICAgIHJlYWxseSBubyBidXNpbmVzcyBob2xkaW5nIHN0cnVjdF9tdXRl
eCB3aGlsZSBkb2luZyBjb3B5XypfdXNlci4gQnV0Cj4+Pj4+Pj4gICAgICAgSSBoYXZlbid0IGNo
ZWNrZWQgdGhlbSBhbGwuCj4+Pj4+Pj4KPj4+Pj4+PiAtIHBhbmZyb3N0IHNlZW1zIHRvIGRtYV9y
ZXN2X2xvY2sgb25seSBpbiBwYW5mcm9zdF9qb2JfcHVzaCwgd2hpY2gKPj4+Pj4+PiAgICAgICBs
b29rcyBjbGVhbi4KPj4+Pj4+Pgo+Pj4+Pj4+IC0gdjNkIGhvbGRzIGRtYV9yZXN2IGxvY2tzIGlu
IHRoZSB0YWlsIG9mIGl0cyB2M2Rfc3VibWl0X2NsX2lvY3RsKCksCj4+Pj4+Pj4gICAgICAgY29w
eWluZyBmcm9tL3RvIHVzZXJzcGFjZSBoYXBwZW5zIGFsbCBpbiB2M2RfbG9va3VwX2JvcyB3aGlj
aCBpcwo+Pj4+Pj4+ICAgICAgIG91dHNpZGUgb2YgdGhlIGNyaXRpY2FsIHNlY3Rpb24uCj4+Pj4+
Pj4KPj4+Pj4+PiAtIHZtd2dmeCBoYXMgYSBidW5jaCBvZiBpb2N0bHMgdGhhdCBkbyB0aGVpciBv
d24gY29weV8qX3VzZXI6Cj4+Pj4+Pj4gICAgICAgLSB2bXdfZXhlY2J1Zl9wcm9jZXNzOiBGaXJz
dCB0aGlzIGRvZXMgc29tZSBjb3BpZXMgaW4KPj4+Pj4+PiAgICAgICAgIHZtd19leGVjYnVmX2Nt
ZGJ1ZigpIGFuZCBhbHNvIGluIHRoZSB2bXdfZXhlY2J1Zl9wcm9jZXNzKCkgaXRzZWxmLgo+Pj4+
Pj4+ICAgICAgICAgVGhlbiBjb21lcyB0aGUgdXN1YWwgdHRtIHJlc2VydmUvdmFsaWRhdGUgc2Vx
dWVuY2UsIHRoZW4gYWN0dWFsCj4+Pj4+Pj4gICAgICAgICBzdWJtaXNzaW9uL2ZlbmNpbmcsIHRo
ZW4gdW5yZXNlcnZpbmcsIGFuZCBmaW5hbGx5IHNvbWUgbW9yZQo+Pj4+Pj4+ICAgICAgICAgY29w
eV90b191c2VyIGluIHZtd19leGVjYnVmX2NvcHlfZmVuY2VfdXNlci4gR2xvc3Npbmcgb3ZlciB0
b25zIG9mCj4+Pj4+Pj4gICAgICAgICBkZXRhaWxzLCBidXQgbG9va3MgYWxsIHNhZmUuCj4+Pj4+
Pj4gICAgICAgLSB2bXdfZmVuY2VfZXZlbnRfaW9jdGw6IE5vIHR0bV9yZXNlcnZlL2RtYV9yZXN2
X2xvY2sgYW55d2hlcmUgdG8gYmUKPj4+Pj4+PiAgICAgICAgIHNlZW4sIHNlZW1zIHRvIG9ubHkg
Y3JlYXRlIGEgZmVuY2UgYW5kIGNvcHkgaXQgb3V0Lgo+Pj4+Pj4+ICAgICAgIC0gYSBwaWxlIG9m
IHNtYWxsZXIgaW9jdGwgaW4gdm13Z2Z4X2lvY3RsLmMsIG5vIHJlc2VydmF0aW9ucyB0byBiZQo+
Pj4+Pj4+ICAgICAgICAgZm91bmQgdGhlcmUuCj4+Pj4+Pj4gICAgICAgU3VtbWFyeTogdm13Z2Z4
IHNlZW1zIHRvIGJlIGZpbmUgdG9vLgo+Pj4+Pj4+Cj4+Pj4+Pj4gLSB2aXJ0aW86IFRoZXJlJ3Mg
dmlydGlvX2dwdV9leGVjYnVmZmVyX2lvY3RsLCB3aGljaCBkb2VzIGFsbCB0aGUKPj4+Pj4+PiAg
ICAgICBjb3B5aW5nIGZyb20gdXNlcnNwYWNlIGJlZm9yZSBldmVuIGxvb2tpbmcgdXAgb2JqZWN0
cyB0aHJvdWdoIHRoZWlyCj4+Pj4+Pj4gICAgICAgaGFuZGxlcywgc28gc2FmZS4gUGx1cyB0aGUg
Z2V0cGFyYW0vZ2V0Y2FwcyBpb2N0bCwgYWxzbyBib3RoIHNhZmUuCj4+Pj4+Pj4KPj4+Pj4+PiAt
IHF4bCBvbmx5IGhhcyBxeGxfZXhlY2J1ZmZlcl9pb2N0bCwgd2hpY2ggY2FsbHMgaW50bwo+Pj4+
Pj4+ICAgICAgIHF4bF9wcm9jZXNzX3NpbmdsZV9jb21tYW5kLiBUaGVyZSdzIGEgbG92ZWx5IGNv
bW1lbnQgYmVmb3JlIHRoZQo+Pj4+Pj4+ICAgICAgIF9fY29weV9mcm9tX3VzZXJfaW5hdG9taWMg
dGhhdCB0aGUgc2xvd3BhdGggc2hvdWxkIGJlIGNvcGllZCBmcm9tCj4+Pj4+Pj4gICAgICAgaTkx
NSwgYnV0IEkgZ3Vlc3MgdGhhdCBuZXZlciBoYXBwZW5lZC4gVHJ5IG5vdCB0byBiZSB1bmx1Y2t5
IGFuZCBnZXQKPj4+Pj4+PiAgICAgICB5b3VyIENTIGRhdGEgZXZpY3RlZCBiZXR3ZWVuIHdoZW4g
aXQncyB3cml0dGVuIGFuZCB0aGUga2VybmVsIHRyaWVzCj4+Pj4+Pj4gICAgICAgdG8gcmVhZCBp
dC4gVGhlIG9ubHkgb3RoZXIgY29weV9mcm9tX3VzZXIgaXMgZm9yIHJlbG9jcywgYnV0IHRob3Nl
Cj4+Pj4+Pj4gICAgICAgYXJlIGRvbmUgYmVmb3JlIHF4bF9yZWxlYXNlX3Jlc2VydmVfbGlzdCgp
LCB3aGljaCBzZWVtcyB0byBiZSB0aGUKPj4+Pj4+PiAgICAgICBvbmx5IHRoaW5nIHJlc2Vydmlu
ZyBidWZmZXJzIChpbiB0aGUgdHRtL2RtYV9yZXN2IHNlbnNlKSBpbiB0aGF0Cj4+Pj4+Pj4gICAg
ICAgY29kZS4gU28gbG9va3Mgc2FmZS4KPj4+Pj4+Pgo+Pj4+Pj4+IC0gQSBkZWJ1Z2ZzIGZpbGUg
aW4gbm91dmVhdV9kZWJ1Z2ZzX3BzdGF0ZV9zZXQoKSBhbmQgdGhlIHVzaWYgaW9jdGwgaW4KPj4+
Pj4+PiAgICAgICB1c2lmX2lvY3RsKCkgbG9vayBzYWZlLiBub3V2ZWF1X2dlbV9pb2N0bF9wdXNo
YnVmKCkgb3RvaCBicmVha3MgdGhpcwo+Pj4+Pj4+ICAgICAgIGV2ZXJ5d2hlcmUgYW5kIG5lZWRz
IHRvIGJlIGZpeGVkIHVwLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4+Pj4+PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+Pj4+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KPj4+Pj4+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+Cj4+Pj4+Pj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+Pj4+
Pj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4+Pj4+Pj4g
Q2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4+Pj4+Pj4gQ2M6IERhdmUgQWlybGll
IDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4+Pj4+Pj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgo+Pj4+Pj4+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4+
Pj4+Pj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZt
d2FyZS5jb20+Cj4+Pj4+Pj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJl
LmNvbT4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgICAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEt
cmVzdi5jIHwgMTIgKysrKysrKysrKysrCj4+Pj4+Pj4gICAgICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtcmVzdi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPj4+Pj4+PiBpbmRleCA0
MmE4ZjNmMTE2ODEuLjNlZGNhMTBkM2ZhZiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2Rt
YS1idWYvZG1hLXJlc3YuYwo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5j
Cj4+Pj4+Pj4gQEAgLTM0LDYgKzM0LDcgQEAKPj4+Pj4+PiAgICAgICNpbmNsdWRlIDxsaW51eC9k
bWEtcmVzdi5oPgo+Pj4+Pj4+ICAgICAgI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+Pj4+Pj4+
ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4KPj4+Pj4+PiAgICAgIC8qKgo+Pj4+Pj4+ICAg
ICAgICogRE9DOiBSZXNlcnZhdGlvbiBPYmplY3QgT3ZlcnZpZXcKPj4+Pj4+PiBAQCAtMTA3LDYg
KzEwOCwxNyBAQCB2b2lkIGRtYV9yZXN2X2luaXQoc3RydWN0IGRtYV9yZXN2ICpvYmopCj4+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICZyZXNlcnZhdGlvbl9zZXFjb3VudF9jbGFzcyk7Cj4+
Pj4+Pj4gICAgICAgUkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNlLCBOVUxMKTsKPj4+Pj4+PiAg
ICAgICBSQ1VfSU5JVF9QT0lOVEVSKG9iai0+ZmVuY2VfZXhjbCwgTlVMTCk7Cj4+Pj4+Pj4gKwo+
Pj4+Pj4+ICsgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfTE9DS0RFUCkpIHsKPj4+Pj4+PiArICAg
ICAgICAgICBpZiAoY3VycmVudC0+bW0pCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICBkb3du
X3JlYWQoJmN1cnJlbnQtPm1tLT5tbWFwX3NlbSk7Cj4+Pj4+Pj4gKyAgICAgICAgICAgd3dfbXV0
ZXhfbG9jaygmb2JqLT5sb2NrLCBOVUxMKTsKPj4+Pj4+PiArICAgICAgICAgICBmc19yZWNsYWlt
X2FjcXVpcmUoR0ZQX0tFUk5FTCk7Cj4+Pj4+Pj4gKyAgICAgICAgICAgZnNfcmVjbGFpbV9yZWxl
YXNlKEdGUF9LRVJORUwpOwo+Pj4+Pj4+ICsgICAgICAgICAgIHd3X211dGV4X3VubG9jaygmb2Jq
LT5sb2NrKTsKPj4+Pj4+PiArICAgICAgICAgICBpZiAoY3VycmVudC0+bW0pCj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICB1cF9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwo+Pj4+Pj4+
ICsgICB9Cj4+Pj4+Pj4gICAgICB9Cj4+Pj4+Pj4gICAgICBFWFBPUlRfU1lNQk9MKGRtYV9yZXN2
X2luaXQpOwo+Pj4+Pj4gSSBhc3N1bWUgaWYgdGhpcyB3b3VsZCBoYXZlIGJlZW4gZWFzaWx5IGRv
bmUgYW5kIG1haW50YWluYWJsZSB1c2luZyBvbmx5Cj4+Pj4+PiBsb2NrZGVwIGFubm90YXRpb24g
aW5zdGVhZCBvZiBhY3R1YWxseSBhY3F1aXJpbmcgdGhlIGxvY2tzLCB0aGF0IHdvdWxkIGhhdmUK
Pj4+Pj4+IGJlZW4gZG9uZT8KPj4+Pj4gVGhlcmUncyBtaWdodF9sb2NrKCksIHBsdXMgYSBwaWxl
IG9mIG1hY3JvcywgYnV0IHRoZXkgZG9uJ3QgbWFwIG9idml1b3NseSwKPj4+Pj4gc28gcHJldHR5
IGdvb2QgY2hhbmNlcyBJIGFjY2lkZW50YWxseSBlbmQgdXAgd2l0aCB0aGUgd3JvbmcgdHlwZSBv
Zgo+Pj4+PiBhbm5vdGF0aW9uLiBFYXNpZXIgdG8ganVzdCB0YWtlIHRoZSBsb2NrcyBxdWlja2x5
LCBhbmQgc3R1ZmYgdGhhdCBhbGwgaW50bwo+Pj4+PiBhIGxvY2tkZXAtb25seSBzZWN0aW9uIHRv
IGF2b2lkIG92ZXJoZWFkLgo+Pj4+Pgo+Pj4+Pj4gT3RoZXJ3aXNlIExHVE0uCj4+Pj4+Pgo+Pj4+
Pj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+
Cj4+Pj4+Pgo+Pj4+Pj4gV2lsbCB0ZXN0IHRoaXMgYW5kIGxldCB5b3Uga25vdyBpZiBpdCB0cmlw
cyBvbiB2bXdnZngsIGJ1dCBpdCByZWFsbHkKPj4+Pj4+IHNob3VsZG4ndC4KPj4+Pj4gVGhhbmtz
LCBEYW5pZWwKPj4+PiBPbmUgdGhpbmcgdGhhdCBzdHJpa2VzIG1lIGlzIHRoYXQgdGhpcyBwdXRz
IHJlc3RyaWN0aW9ucyBvbiB3aGVyZSB5b3UKPj4+PiBjYW4gYWN0dWFsbHkgaW5pdGlhbGl6ZSBh
IGRtYV9yZXN2LCBldmVuIGlmIGxvY2tpbmcgb3JkZXJzIGFyZSBvdGhlcndpc2UKPj4+PiBvYmV5
ZWQuIEJ1dCB0aGF0IG1pZ2h0IG5vdCBiZSBhIGJpZyBwcm9ibGVtLgo+Pj4gSG0geWVhaCAuLi4g
dGhlIHRyb3VibGUgaXMgYSBuZWVkIGEgbm9uLWt0aHJlYWQgdGhyZWFkIHNvIHRoYXQgSSBoYXZl
Cj4+PiBhIGN1cnJlbnQtPm1tLiBPdGhlcndpc2UgSSdkIGhhdmUgcHV0IGl0IGludG8gc29tZSBp
bml0IHNlY3Rpb24gd2l0aCBhCj4+PiB0ZW1wIGRtYV9idWYuIEFuZCBJIGtpbmRhIGRvbid0IHdh
bnQgdG8gY3JlYXRlIGEgZmFrZSAtPm1tIGp1c3QgZm9yCj4+PiBsb2NrZGVwIHByaW1pbmcuIEkg
ZG9uJ3QgZXhwZWN0IHRoaXMgdG8gYmUgYSByZWFsIHByb2JsZW0gaW4gcHJhY3RpY2UsCj4+PiBz
aW5jZSBiZWZvcmUgeW91J3ZlIGNhbGxlZCBkbWFfcmVzdl9pbml0IHRoZSByZXNlcnZhdGlvbiBs
b2NrIGRvZXNuJ3QKPj4+IGV4aXN0LCBzbyB5b3UgY2FuJ3QgaG9sZCBpdC4gQW5kIHlvdSd2ZSBw
cm9iYWJseSBqdXN0IGFsbG9jYXRlZCBpdCwgc28KPj4+IGZzX3JlY2xhaW0gaXMgZ29pbmcgdG8g
YmUgZmluZS4gQW5kIGlmIHlvdSBhbGxvY2F0ZSBkbWFfcmVzdiBvYmplY3RzCj4+PiBmcm9tIHlv
dXIgZmF1bHQgaGFuZGxlcnMgSSBoYXZlIHF1ZXN0aW9ucyBhbnl3YXkgOi0pCj4+IENvbWluZyB0
byB0aGluayBvZiBpdCwgSSB0aGluayB2bXdnZnggc29tZXRpbWVzIGNyZWF0ZSBib3Mgd2l0aCBv
dGhlciBibydzCj4+IHJlc2VydmF0aW9uIGxvY2sgaGVsZC4gSSBndWVzcyB0aGF0IHdvdWxkIHRy
aXAgYm90aCB0aGUgbW1hcF9zZW0gY2hlY2sgdGhlCj4+IHd3X211dGV4IGNoZWNrPwo+IElmIHlv
dSBkbyB0aGF0LCB5ZXMgd2UncmUgYnVzdGVkLiBEbyB5b3UgZG8gdGhhdD8KClllcywgd2UgZG8s
IGluIGEgY291cGxlIG9mIHBsYWNlcyBpdCBzZWVtcywgYW5kIGl0IGFsc28gYXBwZWFycyBsaWtl
IFRUTSAKaXMgZG9pbmcgaXQgYWNjb3JkaW5nIHRvIENocmlzdGlhbi4KCj4KPiBJIGd1ZXNzIG5l
ZWRzIGEgbmV3IGlkZWEgZm9yIHdoZXJlIHRvIHB1dCB0aGlzIC4uLiB3aGlsZSBtYWtpbmcgc3Vy
ZQo+IGV2ZXJ5b25lIGdldHMgaXQuIFNvIHNvbWUgZXZpbCB0cmljayBsaWtlIHB1dHRpbmcgaXQg
aW4gZHJtX29wZW4oKSB3b24ndAo+IHdvcmssIHNpbmNlIEkgYWxzbyB3YW50IHRvIG1ha2Ugc3Vy
ZSBldmVyeW9uZSBlbHNlIHVzaW5nIGRtYS1idWYgZm9sbG93cwo+IHRoZXNlIHJ1bGVzLgoKSU1P
IGl0IHNob3VsZCBiZSBzdWZmaWNpZW50IHRvIGVzdGFibGlzaCB0aGlzIGxvY2tpbmcgb3JkZXIg
b25jZSwgYnV0IEkgCmd1ZXNzIGRtYS1idWYgbW9kdWxlIGluaXQgdGltZSB3b24ndCB3b3JrIGJl
Y2F1c2Ugd2UgbWlnaHQgbm90IGhhdmUgYW4gCm1tIHN0cnVjdHVyZT8KCi9UaG9tYXMKCj4KPiBJ
ZGVhcz8KPiAtRGFuaWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
