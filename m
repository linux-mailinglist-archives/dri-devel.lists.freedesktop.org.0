Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54898D68
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09976EA9C;
	Thu, 22 Aug 2019 08:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D596E999;
 Wed, 21 Aug 2019 18:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DC2F63FA88;
 Wed, 21 Aug 2019 20:28:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5uKRzeDK3k9; Wed, 21 Aug 2019 20:28:02 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id CEA1A3FA78;
 Wed, 21 Aug 2019 20:28:00 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id ECE9F3601BF;
 Wed, 21 Aug 2019 20:27:59 +0200 (CEST)
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-2-daniel.vetter@ffwll.ch>
 <757909ec-e62f-37fc-fe6e-16d332e20b7c@shipmail.org>
 <20190821163453.GQ11147@phenom.ffwll.local>
 <20d98d9a-9fcf-287d-e245-123d5d1ef536@shipmail.org>
 <CAKMK7uFc55F-nQP3jB0wxV4SD+OURy4j7p1-qGSJbp10SEaTFg@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <d1390f72-5a2f-751b-c5bb-9b4fe1f6b705@shipmail.org>
Date: Wed, 21 Aug 2019 20:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFc55F-nQP3jB0wxV4SD+OURy4j7p1-qGSJbp10SEaTFg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566412080; bh=nR0clVC6JrSg5HlGEqopIPonUEE3SKDL/+QaYr//wrk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bkVjSCIu183axZOMCrTRz9jaixLes17Sr15J8GvM/z1i0sndV/TyKVDCNtGPUkfR5
 Q6FE0QQ64IddqvPFIHlQjT/3zL+khd9ZEtbmJm9pdM5WU3yFFmcIdYmLSKITXze+XT
 POBN7RU51GrLQlcG+AriCklLu9RojYUosHdBaa28=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=bkVjSCIu; 
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

T24gOC8yMS8xOSA4OjExIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDIx
LCAyMDE5IGF0IDc6MDYgUE0gVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkKPiA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+IE9uIDgvMjEvMTkgNjozNCBQTSwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPj4+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0IDA1OjU0OjI3UE0gKzAyMDAsIFRo
b21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+IE9uIDgvMjAvMTkgNDo1MyBQTSwg
RGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4gRnVsbCBhdWRpdCBvZiBldmVyeW9uZToKPj4+Pj4K
Pj4+Pj4gLSBpOTE1LCByYWRlb24sIGFtZGdwdSBzaG91bGQgYmUgY2xlYW4gcGVyIHRoZWlyIG1h
aW50YWluZXJzLgo+Pj4+Pgo+Pj4+PiAtIHZyYW0gaGVscGVycyBzaG91bGQgYmUgZmluZSwgdGhl
eSBkb24ndCBkbyBjb21tYW5kIHN1Ym1pc3Npb24sIHNvCj4+Pj4+ICAgICAgcmVhbGx5IG5vIGJ1
c2luZXNzIGhvbGRpbmcgc3RydWN0X211dGV4IHdoaWxlIGRvaW5nIGNvcHlfKl91c2VyLiBCdXQK
Pj4+Pj4gICAgICBJIGhhdmVuJ3QgY2hlY2tlZCB0aGVtIGFsbC4KPj4+Pj4KPj4+Pj4gLSBwYW5m
cm9zdCBzZWVtcyB0byBkbWFfcmVzdl9sb2NrIG9ubHkgaW4gcGFuZnJvc3Rfam9iX3B1c2gsIHdo
aWNoCj4+Pj4+ICAgICAgbG9va3MgY2xlYW4uCj4+Pj4+Cj4+Pj4+IC0gdjNkIGhvbGRzIGRtYV9y
ZXN2IGxvY2tzIGluIHRoZSB0YWlsIG9mIGl0cyB2M2Rfc3VibWl0X2NsX2lvY3RsKCksCj4+Pj4+
ICAgICAgY29weWluZyBmcm9tL3RvIHVzZXJzcGFjZSBoYXBwZW5zIGFsbCBpbiB2M2RfbG9va3Vw
X2JvcyB3aGljaCBpcwo+Pj4+PiAgICAgIG91dHNpZGUgb2YgdGhlIGNyaXRpY2FsIHNlY3Rpb24u
Cj4+Pj4+Cj4+Pj4+IC0gdm13Z2Z4IGhhcyBhIGJ1bmNoIG9mIGlvY3RscyB0aGF0IGRvIHRoZWly
IG93biBjb3B5XypfdXNlcjoKPj4+Pj4gICAgICAtIHZtd19leGVjYnVmX3Byb2Nlc3M6IEZpcnN0
IHRoaXMgZG9lcyBzb21lIGNvcGllcyBpbgo+Pj4+PiAgICAgICAgdm13X2V4ZWNidWZfY21kYnVm
KCkgYW5kIGFsc28gaW4gdGhlIHZtd19leGVjYnVmX3Byb2Nlc3MoKSBpdHNlbGYuCj4+Pj4+ICAg
ICAgICBUaGVuIGNvbWVzIHRoZSB1c3VhbCB0dG0gcmVzZXJ2ZS92YWxpZGF0ZSBzZXF1ZW5jZSwg
dGhlbiBhY3R1YWwKPj4+Pj4gICAgICAgIHN1Ym1pc3Npb24vZmVuY2luZywgdGhlbiB1bnJlc2Vy
dmluZywgYW5kIGZpbmFsbHkgc29tZSBtb3JlCj4+Pj4+ICAgICAgICBjb3B5X3RvX3VzZXIgaW4g
dm13X2V4ZWNidWZfY29weV9mZW5jZV91c2VyLiBHbG9zc2luZyBvdmVyIHRvbnMgb2YKPj4+Pj4g
ICAgICAgIGRldGFpbHMsIGJ1dCBsb29rcyBhbGwgc2FmZS4KPj4+Pj4gICAgICAtIHZtd19mZW5j
ZV9ldmVudF9pb2N0bDogTm8gdHRtX3Jlc2VydmUvZG1hX3Jlc3ZfbG9jayBhbnl3aGVyZSB0byBi
ZQo+Pj4+PiAgICAgICAgc2Vlbiwgc2VlbXMgdG8gb25seSBjcmVhdGUgYSBmZW5jZSBhbmQgY29w
eSBpdCBvdXQuCj4+Pj4+ICAgICAgLSBhIHBpbGUgb2Ygc21hbGxlciBpb2N0bCBpbiB2bXdnZnhf
aW9jdGwuYywgbm8gcmVzZXJ2YXRpb25zIHRvIGJlCj4+Pj4+ICAgICAgICBmb3VuZCB0aGVyZS4K
Pj4+Pj4gICAgICBTdW1tYXJ5OiB2bXdnZnggc2VlbXMgdG8gYmUgZmluZSB0b28uCj4+Pj4+Cj4+
Pj4+IC0gdmlydGlvOiBUaGVyZSdzIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCwgd2hpY2gg
ZG9lcyBhbGwgdGhlCj4+Pj4+ICAgICAgY29weWluZyBmcm9tIHVzZXJzcGFjZSBiZWZvcmUgZXZl
biBsb29raW5nIHVwIG9iamVjdHMgdGhyb3VnaCB0aGVpcgo+Pj4+PiAgICAgIGhhbmRsZXMsIHNv
IHNhZmUuIFBsdXMgdGhlIGdldHBhcmFtL2dldGNhcHMgaW9jdGwsIGFsc28gYm90aCBzYWZlLgo+
Pj4+Pgo+Pj4+PiAtIHF4bCBvbmx5IGhhcyBxeGxfZXhlY2J1ZmZlcl9pb2N0bCwgd2hpY2ggY2Fs
bHMgaW50bwo+Pj4+PiAgICAgIHF4bF9wcm9jZXNzX3NpbmdsZV9jb21tYW5kLiBUaGVyZSdzIGEg
bG92ZWx5IGNvbW1lbnQgYmVmb3JlIHRoZQo+Pj4+PiAgICAgIF9fY29weV9mcm9tX3VzZXJfaW5h
dG9taWMgdGhhdCB0aGUgc2xvd3BhdGggc2hvdWxkIGJlIGNvcGllZCBmcm9tCj4+Pj4+ICAgICAg
aTkxNSwgYnV0IEkgZ3Vlc3MgdGhhdCBuZXZlciBoYXBwZW5lZC4gVHJ5IG5vdCB0byBiZSB1bmx1
Y2t5IGFuZCBnZXQKPj4+Pj4gICAgICB5b3VyIENTIGRhdGEgZXZpY3RlZCBiZXR3ZWVuIHdoZW4g
aXQncyB3cml0dGVuIGFuZCB0aGUga2VybmVsIHRyaWVzCj4+Pj4+ICAgICAgdG8gcmVhZCBpdC4g
VGhlIG9ubHkgb3RoZXIgY29weV9mcm9tX3VzZXIgaXMgZm9yIHJlbG9jcywgYnV0IHRob3NlCj4+
Pj4+ICAgICAgYXJlIGRvbmUgYmVmb3JlIHF4bF9yZWxlYXNlX3Jlc2VydmVfbGlzdCgpLCB3aGlj
aCBzZWVtcyB0byBiZSB0aGUKPj4+Pj4gICAgICBvbmx5IHRoaW5nIHJlc2VydmluZyBidWZmZXJz
IChpbiB0aGUgdHRtL2RtYV9yZXN2IHNlbnNlKSBpbiB0aGF0Cj4+Pj4+ICAgICAgY29kZS4gU28g
bG9va3Mgc2FmZS4KPj4+Pj4KPj4+Pj4gLSBBIGRlYnVnZnMgZmlsZSBpbiBub3V2ZWF1X2RlYnVn
ZnNfcHN0YXRlX3NldCgpIGFuZCB0aGUgdXNpZiBpb2N0bCBpbgo+Pj4+PiAgICAgIHVzaWZfaW9j
dGwoKSBsb29rIHNhZmUuIG5vdXZlYXVfZ2VtX2lvY3RsX3B1c2hidWYoKSBvdG9oIGJyZWFrcyB0
aGlzCj4+Pj4+ICAgICAgZXZlcnl3aGVyZSBhbmQgbmVlZHMgdG8gYmUgZml4ZWQgdXAuCj4+Pj4+
Cj4+Pj4+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+Pj4+
IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4+IENj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4+Pj4gQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+Pj4+PiBDYzogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4KPj4+Pj4gQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNv
bGxhYm9yYS5jb20+Cj4+Pj4+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+Pj4+
PiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+Pj4gQ2M6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+Pj4+PiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0By
ZWRoYXQuY29tPgo+Pj4+PiBDYzogIlZNd2FyZSBHcmFwaGljcyIgPGxpbnV4LWdyYXBoaWNzLW1h
aW50YWluZXJAdm13YXJlLmNvbT4KPj4+Pj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ry
b21Adm13YXJlLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICAgZHJpdmVycy9kbWEtYnVmL2Rt
YS1yZXN2LmMgfCAxMiArKysrKysrKysrKysKPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LXJlc3YuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4+Pj4+IGluZGV4IDQyYThmM2Yx
MTY4MS4uM2VkY2ExMGQzZmFmIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1h
LXJlc3YuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+Pj4+PiBAQCAt
MzQsNiArMzQsNyBAQAo+Pj4+PiAgICAgI2luY2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+Cj4+Pj4+
ICAgICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvc2No
ZWQvbW0uaD4KPj4+Pj4gICAgIC8qKgo+Pj4+PiAgICAgICogRE9DOiBSZXNlcnZhdGlvbiBPYmpl
Y3QgT3ZlcnZpZXcKPj4+Pj4gQEAgLTEwNyw2ICsxMDgsMTcgQEAgdm9pZCBkbWFfcmVzdl9pbml0
KHN0cnVjdCBkbWFfcmVzdiAqb2JqKQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAmcmVzZXJ2
YXRpb25fc2VxY291bnRfY2xhc3MpOwo+Pj4+PiAgICAgIFJDVV9JTklUX1BPSU5URVIob2JqLT5m
ZW5jZSwgTlVMTCk7Cj4+Pj4+ICAgICAgUkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNlX2V4Y2ws
IE5VTEwpOwo+Pj4+PiArCj4+Pj4+ICsgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfTE9DS0RFUCkp
IHsKPj4+Pj4gKyAgICAgICAgICAgaWYgKGN1cnJlbnQtPm1tKQo+Pj4+PiArICAgICAgICAgICAg
ICAgICAgIGRvd25fcmVhZCgmY3VycmVudC0+bW0tPm1tYXBfc2VtKTsKPj4+Pj4gKyAgICAgICAg
ICAgd3dfbXV0ZXhfbG9jaygmb2JqLT5sb2NrLCBOVUxMKTsKPj4+Pj4gKyAgICAgICAgICAgZnNf
cmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJORUwpOwo+Pj4+PiArICAgICAgICAgICBmc19yZWNsYWlt
X3JlbGVhc2UoR0ZQX0tFUk5FTCk7Cj4+Pj4+ICsgICAgICAgICAgIHd3X211dGV4X3VubG9jaygm
b2JqLT5sb2NrKTsKPj4+Pj4gKyAgICAgICAgICAgaWYgKGN1cnJlbnQtPm1tKQo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgIHVwX3JlYWQoJmN1cnJlbnQtPm1tLT5tbWFwX3NlbSk7Cj4+Pj4+ICsg
ICB9Cj4+Pj4+ICAgICB9Cj4+Pj4+ICAgICBFWFBPUlRfU1lNQk9MKGRtYV9yZXN2X2luaXQpOwo+
Pj4+IEkgYXNzdW1lIGlmIHRoaXMgd291bGQgaGF2ZSBiZWVuIGVhc2lseSBkb25lIGFuZCBtYWlu
dGFpbmFibGUgdXNpbmcgb25seQo+Pj4+IGxvY2tkZXAgYW5ub3RhdGlvbiBpbnN0ZWFkIG9mIGFj
dHVhbGx5IGFjcXVpcmluZyB0aGUgbG9ja3MsIHRoYXQgd291bGQgaGF2ZQo+Pj4+IGJlZW4gZG9u
ZT8KPj4+IFRoZXJlJ3MgbWlnaHRfbG9jaygpLCBwbHVzIGEgcGlsZSBvZiBtYWNyb3MsIGJ1dCB0
aGV5IGRvbid0IG1hcCBvYnZpdW9zbHksCj4+PiBzbyBwcmV0dHkgZ29vZCBjaGFuY2VzIEkgYWNj
aWRlbnRhbGx5IGVuZCB1cCB3aXRoIHRoZSB3cm9uZyB0eXBlIG9mCj4+PiBhbm5vdGF0aW9uLiBF
YXNpZXIgdG8ganVzdCB0YWtlIHRoZSBsb2NrcyBxdWlja2x5LCBhbmQgc3R1ZmYgdGhhdCBhbGwg
aW50bwo+Pj4gYSBsb2NrZGVwLW9ubHkgc2VjdGlvbiB0byBhdm9pZCBvdmVyaGVhZC4KPj4+Cj4+
Pj4gT3RoZXJ3aXNlIExHVE0uCj4+Pj4KPj4+PiBSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pgo+Pj4+IFdpbGwgdGVzdCB0aGlzIGFuZCBs
ZXQgeW91IGtub3cgaWYgaXQgdHJpcHMgb24gdm13Z2Z4LCBidXQgaXQgcmVhbGx5Cj4+Pj4gc2hv
dWxkbid0Lgo+Pj4gVGhhbmtzLCBEYW5pZWwKPj4gT25lIHRoaW5nIHRoYXQgc3RyaWtlcyBtZSBp
cyB0aGF0IHRoaXMgcHV0cyByZXN0cmljdGlvbnMgb24gd2hlcmUgeW91Cj4+IGNhbiBhY3R1YWxs
eSBpbml0aWFsaXplIGEgZG1hX3Jlc3YsIGV2ZW4gaWYgbG9ja2luZyBvcmRlcnMgYXJlIG90aGVy
d2lzZQo+PiBvYmV5ZWQuIEJ1dCB0aGF0IG1pZ2h0IG5vdCBiZSBhIGJpZyBwcm9ibGVtLgo+IEht
IHllYWggLi4uIHRoZSB0cm91YmxlIGlzIGEgbmVlZCBhIG5vbi1rdGhyZWFkIHRocmVhZCBzbyB0
aGF0IEkgaGF2ZQo+IGEgY3VycmVudC0+bW0uIE90aGVyd2lzZSBJJ2QgaGF2ZSBwdXQgaXQgaW50
byBzb21lIGluaXQgc2VjdGlvbiB3aXRoIGEKPiB0ZW1wIGRtYV9idWYuIEFuZCBJIGtpbmRhIGRv
bid0IHdhbnQgdG8gY3JlYXRlIGEgZmFrZSAtPm1tIGp1c3QgZm9yCj4gbG9ja2RlcCBwcmltaW5n
LiBJIGRvbid0IGV4cGVjdCB0aGlzIHRvIGJlIGEgcmVhbCBwcm9ibGVtIGluIHByYWN0aWNlLAo+
IHNpbmNlIGJlZm9yZSB5b3UndmUgY2FsbGVkIGRtYV9yZXN2X2luaXQgdGhlIHJlc2VydmF0aW9u
IGxvY2sgZG9lc24ndAo+IGV4aXN0LCBzbyB5b3UgY2FuJ3QgaG9sZCBpdC4gQW5kIHlvdSd2ZSBw
cm9iYWJseSBqdXN0IGFsbG9jYXRlZCBpdCwgc28KPiBmc19yZWNsYWltIGlzIGdvaW5nIHRvIGJl
IGZpbmUuIEFuZCBpZiB5b3UgYWxsb2NhdGUgZG1hX3Jlc3Ygb2JqZWN0cwo+IGZyb20geW91ciBm
YXVsdCBoYW5kbGVycyBJIGhhdmUgcXVlc3Rpb25zIGFueXdheSA6LSkKCkNvbWluZyB0byB0aGlu
ayBvZiBpdCwgSSB0aGluayB2bXdnZnggc29tZXRpbWVzIGNyZWF0ZSBib3Mgd2l0aCBvdGhlciAK
Ym8ncyByZXNlcnZhdGlvbiBsb2NrIGhlbGQuIEkgZ3Vlc3MgdGhhdCB3b3VsZCB0cmlwIGJvdGgg
dGhlIG1tYXBfc2VtIApjaGVjayB0aGUgd3dfbXV0ZXggY2hlY2s/CgovVGhvbWFzCgoKL1Rob21h
cwoKCgoKPgo+IFNvIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgc2FmZS4KPiAtRGFuaWVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
