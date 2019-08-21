Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6E98D44
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0050F6EABE;
	Thu, 22 Aug 2019 08:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A36E346;
 Wed, 21 Aug 2019 15:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 26D0C40282;
 Wed, 21 Aug 2019 17:54:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJqRpkafwJFh; Wed, 21 Aug 2019 17:54:28 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 12DF240266;
 Wed, 21 Aug 2019 17:54:27 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 97BE93602D6;
 Wed, 21 Aug 2019 17:54:27 +0200 (CEST)
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <757909ec-e62f-37fc-fe6e-16d332e20b7c@shipmail.org>
Date: Wed, 21 Aug 2019 17:54:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820145336.15649-2-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566402867; bh=Rw7FHUHNBJBQzXObIemXUsitkasCU71r21DYahjyfcA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HOWi+VV2R5osB4t9BV6w1lrkAAAoezIKW84nbqHM+EABHXDSX8xPd4eWIz9oNJ8cO
 xLaA+5IXY8I+tFYPxx0YQwdPuZOMON8vtu/DOBR+xhCwCUU6At9rPXfcBE9oHeo7IC
 sVqNkwRdXuYt7hadrjRWCrpKkkyMKJ+nBrOdS290=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=HOWi+VV2; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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

T24gOC8yMC8xOSA0OjUzIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IEZ1bGwgYXVkaXQgb2Yg
ZXZlcnlvbmU6Cj4KPiAtIGk5MTUsIHJhZGVvbiwgYW1kZ3B1IHNob3VsZCBiZSBjbGVhbiBwZXIg
dGhlaXIgbWFpbnRhaW5lcnMuCj4KPiAtIHZyYW0gaGVscGVycyBzaG91bGQgYmUgZmluZSwgdGhl
eSBkb24ndCBkbyBjb21tYW5kIHN1Ym1pc3Npb24sIHNvCj4gICAgcmVhbGx5IG5vIGJ1c2luZXNz
IGhvbGRpbmcgc3RydWN0X211dGV4IHdoaWxlIGRvaW5nIGNvcHlfKl91c2VyLiBCdXQKPiAgICBJ
IGhhdmVuJ3QgY2hlY2tlZCB0aGVtIGFsbC4KPgo+IC0gcGFuZnJvc3Qgc2VlbXMgdG8gZG1hX3Jl
c3ZfbG9jayBvbmx5IGluIHBhbmZyb3N0X2pvYl9wdXNoLCB3aGljaAo+ICAgIGxvb2tzIGNsZWFu
Lgo+Cj4gLSB2M2QgaG9sZHMgZG1hX3Jlc3YgbG9ja3MgaW4gdGhlIHRhaWwgb2YgaXRzIHYzZF9z
dWJtaXRfY2xfaW9jdGwoKSwKPiAgICBjb3B5aW5nIGZyb20vdG8gdXNlcnNwYWNlIGhhcHBlbnMg
YWxsIGluIHYzZF9sb29rdXBfYm9zIHdoaWNoIGlzCj4gICAgb3V0c2lkZSBvZiB0aGUgY3JpdGlj
YWwgc2VjdGlvbi4KPgo+IC0gdm13Z2Z4IGhhcyBhIGJ1bmNoIG9mIGlvY3RscyB0aGF0IGRvIHRo
ZWlyIG93biBjb3B5XypfdXNlcjoKPiAgICAtIHZtd19leGVjYnVmX3Byb2Nlc3M6IEZpcnN0IHRo
aXMgZG9lcyBzb21lIGNvcGllcyBpbgo+ICAgICAgdm13X2V4ZWNidWZfY21kYnVmKCkgYW5kIGFs
c28gaW4gdGhlIHZtd19leGVjYnVmX3Byb2Nlc3MoKSBpdHNlbGYuCj4gICAgICBUaGVuIGNvbWVz
IHRoZSB1c3VhbCB0dG0gcmVzZXJ2ZS92YWxpZGF0ZSBzZXF1ZW5jZSwgdGhlbiBhY3R1YWwKPiAg
ICAgIHN1Ym1pc3Npb24vZmVuY2luZywgdGhlbiB1bnJlc2VydmluZywgYW5kIGZpbmFsbHkgc29t
ZSBtb3JlCj4gICAgICBjb3B5X3RvX3VzZXIgaW4gdm13X2V4ZWNidWZfY29weV9mZW5jZV91c2Vy
LiBHbG9zc2luZyBvdmVyIHRvbnMgb2YKPiAgICAgIGRldGFpbHMsIGJ1dCBsb29rcyBhbGwgc2Fm
ZS4KPiAgICAtIHZtd19mZW5jZV9ldmVudF9pb2N0bDogTm8gdHRtX3Jlc2VydmUvZG1hX3Jlc3Zf
bG9jayBhbnl3aGVyZSB0byBiZQo+ICAgICAgc2Vlbiwgc2VlbXMgdG8gb25seSBjcmVhdGUgYSBm
ZW5jZSBhbmQgY29weSBpdCBvdXQuCj4gICAgLSBhIHBpbGUgb2Ygc21hbGxlciBpb2N0bCBpbiB2
bXdnZnhfaW9jdGwuYywgbm8gcmVzZXJ2YXRpb25zIHRvIGJlCj4gICAgICBmb3VuZCB0aGVyZS4K
PiAgICBTdW1tYXJ5OiB2bXdnZnggc2VlbXMgdG8gYmUgZmluZSB0b28uCj4KPiAtIHZpcnRpbzog
VGhlcmUncyB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwsIHdoaWNoIGRvZXMgYWxsIHRoZQo+
ICAgIGNvcHlpbmcgZnJvbSB1c2Vyc3BhY2UgYmVmb3JlIGV2ZW4gbG9va2luZyB1cCBvYmplY3Rz
IHRocm91Z2ggdGhlaXIKPiAgICBoYW5kbGVzLCBzbyBzYWZlLiBQbHVzIHRoZSBnZXRwYXJhbS9n
ZXRjYXBzIGlvY3RsLCBhbHNvIGJvdGggc2FmZS4KPgo+IC0gcXhsIG9ubHkgaGFzIHF4bF9leGVj
YnVmZmVyX2lvY3RsLCB3aGljaCBjYWxscyBpbnRvCj4gICAgcXhsX3Byb2Nlc3Nfc2luZ2xlX2Nv
bW1hbmQuIFRoZXJlJ3MgYSBsb3ZlbHkgY29tbWVudCBiZWZvcmUgdGhlCj4gICAgX19jb3B5X2Zy
b21fdXNlcl9pbmF0b21pYyB0aGF0IHRoZSBzbG93cGF0aCBzaG91bGQgYmUgY29waWVkIGZyb20K
PiAgICBpOTE1LCBidXQgSSBndWVzcyB0aGF0IG5ldmVyIGhhcHBlbmVkLiBUcnkgbm90IHRvIGJl
IHVubHVja3kgYW5kIGdldAo+ICAgIHlvdXIgQ1MgZGF0YSBldmljdGVkIGJldHdlZW4gd2hlbiBp
dCdzIHdyaXR0ZW4gYW5kIHRoZSBrZXJuZWwgdHJpZXMKPiAgICB0byByZWFkIGl0LiBUaGUgb25s
eSBvdGhlciBjb3B5X2Zyb21fdXNlciBpcyBmb3IgcmVsb2NzLCBidXQgdGhvc2UKPiAgICBhcmUg
ZG9uZSBiZWZvcmUgcXhsX3JlbGVhc2VfcmVzZXJ2ZV9saXN0KCksIHdoaWNoIHNlZW1zIHRvIGJl
IHRoZQo+ICAgIG9ubHkgdGhpbmcgcmVzZXJ2aW5nIGJ1ZmZlcnMgKGluIHRoZSB0dG0vZG1hX3Jl
c3Ygc2Vuc2UpIGluIHRoYXQKPiAgICBjb2RlLiBTbyBsb29rcyBzYWZlLgo+Cj4gLSBBIGRlYnVn
ZnMgZmlsZSBpbiBub3V2ZWF1X2RlYnVnZnNfcHN0YXRlX3NldCgpIGFuZCB0aGUgdXNpZiBpb2N0
bCBpbgo+ICAgIHVzaWZfaW9jdGwoKSBsb29rIHNhZmUuIG5vdXZlYXVfZ2VtX2lvY3RsX3B1c2hi
dWYoKSBvdG9oIGJyZWFrcyB0aGlzCj4gICAgZXZlcnl3aGVyZSBhbmQgbmVlZHMgdG8gYmUgZml4
ZWQgdXAuCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+
IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiBD
YzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxp
ZWRAcmVkaGF0LmNvbT4KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4g
Q2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiBDYzogIlZNd2FyZSBHcmFwaGlj
cyIgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KPiBDYzogVGhvbWFzIEhl
bGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9kbWEtYnVm
L2RtYS1yZXN2LmMgfCAxMiArKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+IGluZGV4IDQyYThmM2YxMTY4MS4uM2VkY2ExMGQz
ZmFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4gKysrIGIvZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiBAQCAtMzQsNiArMzQsNyBAQAo+ICAgCj4gICAjaW5j
bHVkZSA8bGludXgvZG1hLXJlc3YuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+Cj4gICAKPiAgIC8qKgo+ICAgICogRE9DOiBSZXNl
cnZhdGlvbiBPYmplY3QgT3ZlcnZpZXcKPiBAQCAtMTA3LDYgKzEwOCwxNyBAQCB2b2lkIGRtYV9y
ZXN2X2luaXQoc3RydWN0IGRtYV9yZXN2ICpvYmopCj4gICAJCQkmcmVzZXJ2YXRpb25fc2VxY291
bnRfY2xhc3MpOwo+ICAgCVJDVV9JTklUX1BPSU5URVIob2JqLT5mZW5jZSwgTlVMTCk7Cj4gICAJ
UkNVX0lOSVRfUE9JTlRFUihvYmotPmZlbmNlX2V4Y2wsIE5VTEwpOwo+ICsKPiArCWlmIChJU19F
TkFCTEVEKENPTkZJR19MT0NLREVQKSkgewo+ICsJCWlmIChjdXJyZW50LT5tbSkKPiArCQkJZG93
bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwo+ICsJCXd3X211dGV4X2xvY2soJm9iai0+
bG9jaywgTlVMTCk7Cj4gKwkJZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJORUwpOwo+ICsJCWZz
X3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKPiArCQl3d19tdXRleF91bmxvY2soJm9iai0+
bG9jayk7Cj4gKwkJaWYgKGN1cnJlbnQtPm1tKQo+ICsJCQl1cF9yZWFkKCZjdXJyZW50LT5tbS0+
bW1hcF9zZW0pOwo+ICsJfQo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfcmVzdl9pbml0KTsK
PiAgIAoKSSBhc3N1bWUgaWYgdGhpcyB3b3VsZCBoYXZlIGJlZW4gZWFzaWx5IGRvbmUgYW5kIG1h
aW50YWluYWJsZSB1c2luZyBvbmx5IApsb2NrZGVwIGFubm90YXRpb24gaW5zdGVhZCBvZiBhY3R1
YWxseSBhY3F1aXJpbmcgdGhlIGxvY2tzLCB0aGF0IHdvdWxkIApoYXZlIGJlZW4gZG9uZT8KCk90
aGVyd2lzZSBMR1RNLgoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aGVsbHN0cm9t
QHZtd2FyZS5jb20+CgpXaWxsIHRlc3QgdGhpcyBhbmQgbGV0IHlvdSBrbm93IGlmIGl0IHRyaXBz
IG9uIHZtd2dmeCwgYnV0IGl0IHJlYWxseSAKc2hvdWxkbid0LgoKL1Rob21hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
