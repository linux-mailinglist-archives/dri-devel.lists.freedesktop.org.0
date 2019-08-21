Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2FB98D32
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF556EA7A;
	Thu, 22 Aug 2019 08:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2806E34E;
 Wed, 21 Aug 2019 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D8F913F83A;
 Wed, 21 Aug 2019 19:06:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bhs2e6tZ8dcg; Wed, 21 Aug 2019 19:06:35 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C6E703F835;
 Wed, 21 Aug 2019 19:06:29 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F089B3602D6;
 Wed, 21 Aug 2019 19:06:28 +0200 (CEST)
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-2-daniel.vetter@ffwll.ch>
 <757909ec-e62f-37fc-fe6e-16d332e20b7c@shipmail.org>
 <20190821163453.GQ11147@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <20d98d9a-9fcf-287d-e245-123d5d1ef536@shipmail.org>
Date: Wed, 21 Aug 2019 19:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190821163453.GQ11147@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566407189; bh=jSwfhniFiCf+g4dkWEUXK+3KGoP3Mg4U5IS+yib8gJM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Md6IE/ykVylrC9WoYZrEttOh0905OtLDn+s/wpCAy/ZqLbrTIGS5bo0yM4c1Wvnlb
 2ibaMqCCVyCHqnROz//r9beASvavkWF66qRCWZudh7D1bv5NDbsV80x9sp0UKwQOZ1
 HGe5Xsy23ijKMyEbXAqiflv9UmmIALLf9TOjFNcY=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Md6IE/yk; 
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

T24gOC8yMS8xOSA2OjM0IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDIx
LCAyMDE5IGF0IDA1OjU0OjI3UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdy
b3RlOgo+PiBPbiA4LzIwLzE5IDQ6NTMgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+PiBGdWxs
IGF1ZGl0IG9mIGV2ZXJ5b25lOgo+Pj4KPj4+IC0gaTkxNSwgcmFkZW9uLCBhbWRncHUgc2hvdWxk
IGJlIGNsZWFuIHBlciB0aGVpciBtYWludGFpbmVycy4KPj4+Cj4+PiAtIHZyYW0gaGVscGVycyBz
aG91bGQgYmUgZmluZSwgdGhleSBkb24ndCBkbyBjb21tYW5kIHN1Ym1pc3Npb24sIHNvCj4+PiAg
ICAgcmVhbGx5IG5vIGJ1c2luZXNzIGhvbGRpbmcgc3RydWN0X211dGV4IHdoaWxlIGRvaW5nIGNv
cHlfKl91c2VyLiBCdXQKPj4+ICAgICBJIGhhdmVuJ3QgY2hlY2tlZCB0aGVtIGFsbC4KPj4+Cj4+
PiAtIHBhbmZyb3N0IHNlZW1zIHRvIGRtYV9yZXN2X2xvY2sgb25seSBpbiBwYW5mcm9zdF9qb2Jf
cHVzaCwgd2hpY2gKPj4+ICAgICBsb29rcyBjbGVhbi4KPj4+Cj4+PiAtIHYzZCBob2xkcyBkbWFf
cmVzdiBsb2NrcyBpbiB0aGUgdGFpbCBvZiBpdHMgdjNkX3N1Ym1pdF9jbF9pb2N0bCgpLAo+Pj4g
ICAgIGNvcHlpbmcgZnJvbS90byB1c2Vyc3BhY2UgaGFwcGVucyBhbGwgaW4gdjNkX2xvb2t1cF9i
b3Mgd2hpY2ggaXMKPj4+ICAgICBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbCBzZWN0aW9uLgo+Pj4K
Pj4+IC0gdm13Z2Z4IGhhcyBhIGJ1bmNoIG9mIGlvY3RscyB0aGF0IGRvIHRoZWlyIG93biBjb3B5
XypfdXNlcjoKPj4+ICAgICAtIHZtd19leGVjYnVmX3Byb2Nlc3M6IEZpcnN0IHRoaXMgZG9lcyBz
b21lIGNvcGllcyBpbgo+Pj4gICAgICAgdm13X2V4ZWNidWZfY21kYnVmKCkgYW5kIGFsc28gaW4g
dGhlIHZtd19leGVjYnVmX3Byb2Nlc3MoKSBpdHNlbGYuCj4+PiAgICAgICBUaGVuIGNvbWVzIHRo
ZSB1c3VhbCB0dG0gcmVzZXJ2ZS92YWxpZGF0ZSBzZXF1ZW5jZSwgdGhlbiBhY3R1YWwKPj4+ICAg
ICAgIHN1Ym1pc3Npb24vZmVuY2luZywgdGhlbiB1bnJlc2VydmluZywgYW5kIGZpbmFsbHkgc29t
ZSBtb3JlCj4+PiAgICAgICBjb3B5X3RvX3VzZXIgaW4gdm13X2V4ZWNidWZfY29weV9mZW5jZV91
c2VyLiBHbG9zc2luZyBvdmVyIHRvbnMgb2YKPj4+ICAgICAgIGRldGFpbHMsIGJ1dCBsb29rcyBh
bGwgc2FmZS4KPj4+ICAgICAtIHZtd19mZW5jZV9ldmVudF9pb2N0bDogTm8gdHRtX3Jlc2VydmUv
ZG1hX3Jlc3ZfbG9jayBhbnl3aGVyZSB0byBiZQo+Pj4gICAgICAgc2Vlbiwgc2VlbXMgdG8gb25s
eSBjcmVhdGUgYSBmZW5jZSBhbmQgY29weSBpdCBvdXQuCj4+PiAgICAgLSBhIHBpbGUgb2Ygc21h
bGxlciBpb2N0bCBpbiB2bXdnZnhfaW9jdGwuYywgbm8gcmVzZXJ2YXRpb25zIHRvIGJlCj4+PiAg
ICAgICBmb3VuZCB0aGVyZS4KPj4+ICAgICBTdW1tYXJ5OiB2bXdnZnggc2VlbXMgdG8gYmUgZmlu
ZSB0b28uCj4+Pgo+Pj4gLSB2aXJ0aW86IFRoZXJlJ3MgdmlydGlvX2dwdV9leGVjYnVmZmVyX2lv
Y3RsLCB3aGljaCBkb2VzIGFsbCB0aGUKPj4+ICAgICBjb3B5aW5nIGZyb20gdXNlcnNwYWNlIGJl
Zm9yZSBldmVuIGxvb2tpbmcgdXAgb2JqZWN0cyB0aHJvdWdoIHRoZWlyCj4+PiAgICAgaGFuZGxl
cywgc28gc2FmZS4gUGx1cyB0aGUgZ2V0cGFyYW0vZ2V0Y2FwcyBpb2N0bCwgYWxzbyBib3RoIHNh
ZmUuCj4+Pgo+Pj4gLSBxeGwgb25seSBoYXMgcXhsX2V4ZWNidWZmZXJfaW9jdGwsIHdoaWNoIGNh
bGxzIGludG8KPj4+ICAgICBxeGxfcHJvY2Vzc19zaW5nbGVfY29tbWFuZC4gVGhlcmUncyBhIGxv
dmVseSBjb21tZW50IGJlZm9yZSB0aGUKPj4+ICAgICBfX2NvcHlfZnJvbV91c2VyX2luYXRvbWlj
IHRoYXQgdGhlIHNsb3dwYXRoIHNob3VsZCBiZSBjb3BpZWQgZnJvbQo+Pj4gICAgIGk5MTUsIGJ1
dCBJIGd1ZXNzIHRoYXQgbmV2ZXIgaGFwcGVuZWQuIFRyeSBub3QgdG8gYmUgdW5sdWNreSBhbmQg
Z2V0Cj4+PiAgICAgeW91ciBDUyBkYXRhIGV2aWN0ZWQgYmV0d2VlbiB3aGVuIGl0J3Mgd3JpdHRl
biBhbmQgdGhlIGtlcm5lbCB0cmllcwo+Pj4gICAgIHRvIHJlYWQgaXQuIFRoZSBvbmx5IG90aGVy
IGNvcHlfZnJvbV91c2VyIGlzIGZvciByZWxvY3MsIGJ1dCB0aG9zZQo+Pj4gICAgIGFyZSBkb25l
IGJlZm9yZSBxeGxfcmVsZWFzZV9yZXNlcnZlX2xpc3QoKSwgd2hpY2ggc2VlbXMgdG8gYmUgdGhl
Cj4+PiAgICAgb25seSB0aGluZyByZXNlcnZpbmcgYnVmZmVycyAoaW4gdGhlIHR0bS9kbWFfcmVz
diBzZW5zZSkgaW4gdGhhdAo+Pj4gICAgIGNvZGUuIFNvIGxvb2tzIHNhZmUuCj4+Pgo+Pj4gLSBB
IGRlYnVnZnMgZmlsZSBpbiBub3V2ZWF1X2RlYnVnZnNfcHN0YXRlX3NldCgpIGFuZCB0aGUgdXNp
ZiBpb2N0bCBpbgo+Pj4gICAgIHVzaWZfaW9jdGwoKSBsb29rIHNhZmUuIG5vdXZlYXVfZ2VtX2lv
Y3RsX3B1c2hidWYoKSBvdG9oIGJyZWFrcyB0aGlzCj4+PiAgICAgZXZlcnl3aGVyZSBhbmQgbmVl
ZHMgdG8gYmUgZml4ZWQgdXAuCj4+Pgo+Pj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KPj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4+PiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4+PiBDYzog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPj4+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1
LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+Pj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5u
ZXQ+Cj4+PiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+IENjOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPj4+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dz
QHJlZGhhdC5jb20+Cj4+PiBDYzogIlZNd2FyZSBHcmFwaGljcyIgPGxpbnV4LWdyYXBoaWNzLW1h
aW50YWluZXJAdm13YXJlLmNvbT4KPj4+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9t
QHZtd2FyZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMg
fCAxMiArKysrKysrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIGIvZHJpdmVy
cy9kbWEtYnVmL2RtYS1yZXN2LmMKPj4+IGluZGV4IDQyYThmM2YxMTY4MS4uM2VkY2ExMGQzZmFm
IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPj4+ICsrKyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4+PiBAQCAtMzQsNiArMzQsNyBAQAo+Pj4gICAgI2lu
Y2x1ZGUgPGxpbnV4L2RtYS1yZXN2Lmg+Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+
Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+Cj4+PiAgICAvKioKPj4+ICAgICAqIERP
QzogUmVzZXJ2YXRpb24gT2JqZWN0IE92ZXJ2aWV3Cj4+PiBAQCAtMTA3LDYgKzEwOCwxNyBAQCB2
b2lkIGRtYV9yZXN2X2luaXQoc3RydWN0IGRtYV9yZXN2ICpvYmopCj4+PiAgICAJCQkmcmVzZXJ2
YXRpb25fc2VxY291bnRfY2xhc3MpOwo+Pj4gICAgCVJDVV9JTklUX1BPSU5URVIob2JqLT5mZW5j
ZSwgTlVMTCk7Cj4+PiAgICAJUkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNlX2V4Y2wsIE5VTEwp
Owo+Pj4gKwo+Pj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfTE9DS0RFUCkpIHsKPj4+ICsJCWlm
IChjdXJyZW50LT5tbSkKPj4+ICsJCQlkb3duX3JlYWQoJmN1cnJlbnQtPm1tLT5tbWFwX3NlbSk7
Cj4+PiArCQl3d19tdXRleF9sb2NrKCZvYmotPmxvY2ssIE5VTEwpOwo+Pj4gKwkJZnNfcmVjbGFp
bV9hY3F1aXJlKEdGUF9LRVJORUwpOwo+Pj4gKwkJZnNfcmVjbGFpbV9yZWxlYXNlKEdGUF9LRVJO
RUwpOwo+Pj4gKwkJd3dfbXV0ZXhfdW5sb2NrKCZvYmotPmxvY2spOwo+Pj4gKwkJaWYgKGN1cnJl
bnQtPm1tKQo+Pj4gKwkJCXVwX3JlYWQoJmN1cnJlbnQtPm1tLT5tbWFwX3NlbSk7Cj4+PiArCX0K
Pj4+ICAgIH0KPj4+ICAgIEVYUE9SVF9TWU1CT0woZG1hX3Jlc3ZfaW5pdCk7Cj4+IEkgYXNzdW1l
IGlmIHRoaXMgd291bGQgaGF2ZSBiZWVuIGVhc2lseSBkb25lIGFuZCBtYWludGFpbmFibGUgdXNp
bmcgb25seQo+PiBsb2NrZGVwIGFubm90YXRpb24gaW5zdGVhZCBvZiBhY3R1YWxseSBhY3F1aXJp
bmcgdGhlIGxvY2tzLCB0aGF0IHdvdWxkIGhhdmUKPj4gYmVlbiBkb25lPwo+IFRoZXJlJ3MgbWln
aHRfbG9jaygpLCBwbHVzIGEgcGlsZSBvZiBtYWNyb3MsIGJ1dCB0aGV5IGRvbid0IG1hcCBvYnZp
dW9zbHksCj4gc28gcHJldHR5IGdvb2QgY2hhbmNlcyBJIGFjY2lkZW50YWxseSBlbmQgdXAgd2l0
aCB0aGUgd3JvbmcgdHlwZSBvZgo+IGFubm90YXRpb24uIEVhc2llciB0byBqdXN0IHRha2UgdGhl
IGxvY2tzIHF1aWNrbHksIGFuZCBzdHVmZiB0aGF0IGFsbCBpbnRvCj4gYSBsb2NrZGVwLW9ubHkg
c2VjdGlvbiB0byBhdm9pZCBvdmVyaGVhZC4KPgo+PiBPdGhlcndpc2UgTEdUTS4KPj4KPj4gUmV2
aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+Cj4+
IFdpbGwgdGVzdCB0aGlzIGFuZCBsZXQgeW91IGtub3cgaWYgaXQgdHJpcHMgb24gdm13Z2Z4LCBi
dXQgaXQgcmVhbGx5Cj4+IHNob3VsZG4ndC4KPiBUaGFua3MsIERhbmllbAoKT25lIHRoaW5nIHRo
YXQgc3RyaWtlcyBtZSBpcyB0aGF0IHRoaXMgcHV0cyByZXN0cmljdGlvbnMgb24gd2hlcmUgeW91
IApjYW4gYWN0dWFsbHkgaW5pdGlhbGl6ZSBhIGRtYV9yZXN2LCBldmVuIGlmIGxvY2tpbmcgb3Jk
ZXJzIGFyZSBvdGhlcndpc2UgCm9iZXllZC4gQnV0IHRoYXQgbWlnaHQgbm90IGJlIGEgYmlnIHBy
b2JsZW0uCgovVGhvbWFzCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
