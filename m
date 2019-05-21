Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18EA25783
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 20:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E40893C0;
	Tue, 21 May 2019 18:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7C893C0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 18:24:00 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16632229-1500050 for multiple; Tue, 21 May 2019 19:23:54 +0100
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAL_JsqLzefOvopTCuyBsNhJDGbFV3JdVce0x398vMaGy3-+fVw@mail.gmail.com>
References: <20190520092306.27633-1-steven.price@arm.com>
 <20190520092306.27633-3-steven.price@arm.com>
 <CAL_JsqLzefOvopTCuyBsNhJDGbFV3JdVce0x398vMaGy3-+fVw@mail.gmail.com>
Message-ID: <155846303227.23981.8007374203089408422@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v3 2/2] drm/panfrost: Use drm_gem_shmem_map_offset()
Date: Tue, 21 May 2019 19:23:52 +0100
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgSGVycmluZyAoMjAxOS0wNS0yMSAxNjoyNDoyNykKPiBPbiBNb24sIE1heSAy
MCwgMjAxOSBhdCA0OjIzIEFNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+IHdy
b3RlOgo+ID4KPiAKPiBZb3UgZm9yZ290IHRvIHVwZGF0ZSB0aGUgc3ViamVjdC4gSSBjYW4gZml4
dXAgd2hlbiBhcHBseWluZywgYnV0IEknZAo+IGxpa2UgYW4gYWNrIGZyb20gQ2hyaXMgb24gcGF0
Y2ggMS4KCkkgc3RpbGwgdGhpbmsgaXQgaXMgaW5jb3JyZWN0IGFzIHRoZSBsaW1pdGF0aW9uIGlz
IHB1cmVseSBhbiBpc3N1ZSB3aXRoCnRoZSBzaG1lbSBiYWNrZW5kIGFuZCBub3QgYSBnZW5lcmlj
IEdFTSBsaW1pdGF0aW9uLiBJdCBtYXR0ZXJzIGlmIHlvdQpoYXZlIGEgaGlzdG9yeSBvZiBwYXNz
aW5nIG5hbWVzIGFuZCB3YW50IGEgY29uc2lzdGVudCBhcGkgYWNyb3NzIG9iamVjdHMKd2hlbiB0
aGUgYXBwcyB0aGVtc2VsdmVzIG5vIGxvbmdlciBjYW4gdGVsbCB0aGUgZGlmZmVyZW5jZSwgYW5k
CmNlcnRhaW5seSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGRtYWJ1ZiBmZC4gaTkxNSBwcm92
aWRlcyBhbiBpbmRpcmVjdAptbWFwIGludGVyZmFjZSB0aGF0IHVzZXMgdGhlIGRtYSBtYXBwaW5n
IHJlZ2FyZGxlc3Mgb2Ygc291cmNlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
