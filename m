Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F285B727
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 10:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A423489DFF;
	Mon,  1 Jul 2019 08:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82B389DFF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 08:49:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DD7A2F8BEC;
 Mon,  1 Jul 2019 08:49:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C361001B34;
 Mon,  1 Jul 2019 08:49:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4C31E17446; Mon,  1 Jul 2019 10:48:57 +0200 (CEST)
Date: Mon, 1 Jul 2019 10:48:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/vram: Set GEM object functions for PRIME
Message-ID: <20190701084857.k7m3ysz47oes3mwj@sirius.home.kraxel.org>
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-2-tzimmermann@suse.de>
 <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>
 <216c9142-ca8e-50ae-cb0b-f63a8b57addf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <216c9142-ca8e-50ae-cb0b-f63a8b57addf@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 01 Jul 2019 08:49:07 +0000 (UTC)
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
Cc: sean@poorly.run, maxime.ripard@bootlin.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, zourongrong@gmail.com, airlied@redhat.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDk6Mjg6NTlBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwMS4wNy4xOSB1bSAwODozMiBzY2hyaWViIEdlcmQgSG9m
Zm1hbm46Cj4gPiBPbiBGcmksIEp1biAyOCwgMjAxOSBhdCAwMjoyNjo1NlBNICswMjAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBQUklNRSBmdW5jdGlvbmFsaXR5IGlzIG5vdyBwcm92
aWRlZCB2aWEgdGhlIGNhbGxiYWNrIGZ1bmN0aW9ucyBpbgo+ID4+IHN0cnVjdCBkcm1fZ2VtX29i
amVjdF9mdW5jcy4gVGhlIGRyaXZlci1zdHJ1Y3R1cmUgZnVuY3Rpb25zIGFyZSBvYnNvbGV0ZS4K
PiA+PiBBcyBhIHNpZGUgZWZmZWN0IG9mIHRoaXMgcGF0Y2gsIFZSQU0tYmFzZWQgZHJpdmVycyBn
ZXQgYmFzaWMgUFJJTUUKPiA+PiBzdXBwb3J0IGF1dG9tYXRpY2FsbHkgd2l0aG91dCBoYXZpbmcg
dG8gc2V0IGFueSBmbGFncyBvciBhZGRpdGlvbmFsCj4gPj4gZmllbGRzLgo+ID4gCj4gPj4gK3N0
YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9vYmplY3RfZnJlZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
KmdlbSkKPiA+PiArc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzX3BpbihzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSkKPiA+PiArc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX29i
amVjdF9mdW5jc191bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSkKPiA+PiArc3RhdGlj
IHZvaWQgKmRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3Nfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKmdlbSkKPiA+PiArc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX29iamVjdF9mdW5jc192dW5t
YXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0sCj4gPj4gKwkJCQkJICAgICB2b2lkICp2YWRk
cikKPiA+IAo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRy
bV9nZW1fdnJhbV9vYmplY3RfZnVuY3MgPSB7Cj4gPj4gKwkuZnJlZQk9IGRybV9nZW1fdnJhbV9v
YmplY3RfZnJlZSwKPiA+PiArCS5waW4JPSBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzX3BpbiwK
PiA+PiArCS51bnBpbgk9IGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3NfdW5waW4sCj4gPj4gKwku
dm1hcAk9IGRybV9nZW1fdnJhbV9vYmplY3RfZnVuY3Nfdm1hcCwKPiA+PiArCS52dW5tYXAJPSBk
cm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzX3Z1bm1hcAo+ID4+ICt9Owo+ID4gCj4gPiBXaHkgbmV3
IGZ1bmN0aW9ucz8gIENhbid0IHlvdSBqdXN0IGhvb2sgdXAgdGhlIGV4aXN0aW5nIHByaW1lIGZ1
bmN0aW9ucz8KPiAKPiBUaGUgZmluYWwgcGF0Y2ggd2lsbCByZW1vdmUgdGhlIGV4aXN0aW5nIGZ1
bmN0aW9ucywgc28gZHJpdmVycyB3b24ndCB1c2UKPiB0aGVtIGFjY2lkZW50YWxseS4KCkJ1dCB0
aGUgbmV3IGFuZCB0aGUgb2xkIG9uZXMgYXJlIGlkZW50aWNhbCwgcmlnaHQ/ICBTbyB3aHkgYWRk
L3JlbW92ZT8KV2h5IG5vdCBqdXN0IHJlbmFtZSB0aGVtPwoKSSdkIGFsc28gc3VnZ2VzdCB0byBu
YW1lIHRoZW0gY29uc2lzdGVudGx5IChmcmVlIGhhcyBubyBfZnVuY3MsIGFsbApvdGhlcnMgaGF2
ZSkuICBJJ2QgZHJvcCBfZnVuY3MgZnJvbSBhbGwgZnVuY3Rpb24gbmFtZXMuCgpjaGVlcnMsCiAg
R2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
