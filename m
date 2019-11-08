Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EBF45BA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 12:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39716F947;
	Fri,  8 Nov 2019 11:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Fri, 08 Nov 2019 11:31:25 UTC
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21D6F947
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 11:31:25 +0000 (UTC)
Received: from 79.184.254.83.ipv4.supernova.orange.pl (79.184.254.83) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id c76056e31ef5e5d1; Fri, 8 Nov 2019 12:24:42 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4/5] power: avs: smartreflex: Remove superfluous cast in
 debugfs_create_file() call
Date: Fri, 08 Nov 2019 12:24:42 +0100
Message-ID: <4367615.jSCgeRn5tF@kreacher>
In-Reply-To: <20191021145149.31657-5-geert+renesas@glider.be>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-5-geert+renesas@glider.be>
MIME-Version: 1.0
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Breno =?ISO-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org, Casey Leedom <leedom@chelsio.com>,
 linux-pm@vger.kernel.org, Pensando Drivers <drivers@pensando.io>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Shannon Nelson <snelson@pensando.io>, linuxppc-dev@lists.ozlabs.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBPY3RvYmVyIDIxLCAyMDE5IDQ6NTE6NDggUE0gQ0VUIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToKPiBUaGVyZSBpcyBubyBuZWVkIHRvIGNhc3QgYSB0eXBlZCBwb2ludGVyIHRv
IGEgdm9pZCBwb2ludGVyIHdoZW4gY2FsbGluZwo+IGEgZnVuY3Rpb24gdGhhdCBhY2NlcHRzIHRo
ZSBsYXR0ZXIuICBSZW1vdmUgaXQsIGFzIHRoZSBjYXN0IHByZXZlbnRzCj4gZnVydGhlciBjb21w
aWxlciBjaGVja3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KCkdyZWcsIGhhdmUgeW91IHRha2VuIHRoaXMgb25lIGJ5IGFu
eSBjaGFuY2U/Cgo+IC0tLQo+ICBkcml2ZXJzL3Bvd2VyL2F2cy9zbWFydHJlZmxleC5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wb3dlci9hdnMvc21hcnRyZWZsZXguYyBiL2RyaXZlcnMvcG93
ZXIvYXZzL3NtYXJ0cmVmbGV4LmMKPiBpbmRleCA0Njg0ZTdkZjgzM2E4MWU5Li41Mzc2ZjNkMjJm
MzFlYWRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcG93ZXIvYXZzL3NtYXJ0cmVmbGV4LmMKPiAr
KysgYi9kcml2ZXJzL3Bvd2VyL2F2cy9zbWFydHJlZmxleC5jCj4gQEAgLTkwNSw3ICs5MDUsNyBA
QCBzdGF0aWMgaW50IG9tYXBfc3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgCXNyX2luZm8tPmRiZ19kaXIgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoc3JfaW5mby0+bmFtZSwg
c3JfZGJnX2Rpcik7Cj4gIAo+ICAJZGVidWdmc19jcmVhdGVfZmlsZSgiYXV0b2NvbXAiLCBTX0lS
VUdPIHwgU19JV1VTUiwgc3JfaW5mby0+ZGJnX2RpciwKPiAtCQkJICAgICh2b2lkICopc3JfaW5m
bywgJnBtX3NyX2ZvcHMpOwo+ICsJCQkgICAgc3JfaW5mbywgJnBtX3NyX2ZvcHMpOwo+ICAJZGVi
dWdmc19jcmVhdGVfeDMyKCJlcnJ3ZWlnaHQiLCBTX0lSVUdPLCBzcl9pbmZvLT5kYmdfZGlyLAo+
ICAJCQkgICAmc3JfaW5mby0+ZXJyX3dlaWdodCk7Cj4gIAlkZWJ1Z2ZzX2NyZWF0ZV94MzIoImVy
cm1heGxpbWl0IiwgU19JUlVHTywgc3JfaW5mby0+ZGJnX2RpciwKPiAKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
