Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F8E6E0C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C9A6E46B;
	Mon, 28 Oct 2019 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.orG
Delivered-To: dri-devel@lists.freedesktop.orG
X-Greylist: delayed 1667 seconds by postgrey-1.36 at gabe;
 Fri, 25 Oct 2019 15:55:46 UTC
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656BF6EAD4;
 Fri, 25 Oct 2019 15:55:46 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iO1Un-0001vM-5Z; Fri, 25 Oct 2019 23:27:21 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iO1Ue-0007uU-5p; Fri, 25 Oct 2019 23:27:12 +0800
Date: Fri, 25 Oct 2019 23:27:12 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/5] crypto: nx - Improve debugfs_create_u{32,64}()
 handling for atomics
Message-ID: <20191025152712.26q6s5gbygdxd33j@gondor.apana.org.au>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021145149.31657-2-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
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
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>, David@rox.of.borg,
 Kevin Hilman <khilman@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nayna Jain <nayna@linux.ibm.com>, amd-gfx@lists.freedesktop.org,
 Casey Leedom <leedom@chelsio.com>, linux-pm@vger.kernel.org,
 Pensando Drivers <drivers@pensando.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Paul Mackerras <paulus@samba.org>, Shannon Nelson <snelson@pensando.io>,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NTE6NDVQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IFZhcmlhYmxlcyBvZiB0eXBlIGF0b21pY3ssNjR9X3QgY2FuIGJlIHVzZWQg
ZmluZSB3aXRoCj4gZGVidWdmc19jcmVhdGVfdXszMiw2NH0sIHdoZW4gcGFzc2luZyBhIHBvaW50
ZXIgdG8gdGhlIGVtYmVkZGVkIGNvdW50ZXIuCj4gVGhpcyBhbGxvd3MgdG8gZ2V0IHJpZCBvZiB0
aGUgY2FzdHMsIHdoaWNoIHByZXZlbnRlZCBjb21waWxlciBjaGVja3MuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiAtLS0K
PiAgZHJpdmVycy9jcnlwdG8vbngvbnhfZGVidWdmcy5jIHwgMTggKysrKysrKysrLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpQYXRj
aCBhcHBsaWVkLiAgVGhhbmtzLgotLSAKRW1haWw6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9y
LmFwYW5hLm9yZy5hdT4KSG9tZSBQYWdlOiBodHRwOi8vZ29uZG9yLmFwYW5hLm9yZy5hdS9+aGVy
YmVydC8KUEdQIEtleTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJlcnQvcHVia2V5
LnR4dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
