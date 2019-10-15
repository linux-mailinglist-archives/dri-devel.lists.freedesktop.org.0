Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B356D7864
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A106E81F;
	Tue, 15 Oct 2019 14:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFF96E81F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:26:41 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6066B324;
 Tue, 15 Oct 2019 16:26:37 +0200 (CEST)
Subject: Re: [PATCH v5 3/8] drm: rcar-du: Add support for CMM
To: Jacopo Mondi <jacopo@jmondi.org>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-4-jacopo+renesas@jmondi.org>
 <2aefe646-45db-aafa-b22b-e1cf9616259d@ideasonboard.com>
 <20191015133320.uj4y5twxfkyopqi5@uno.localdomain>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2e6e5e8d-e502-5957-5708-4e4d7ef84d8e@ideasonboard.com>
Date: Tue, 15 Oct 2019 15:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015133320.uj4y5twxfkyopqi5@uno.localdomain>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571149598;
 bh=hSdNGSSn5zc6mkejUmeqIoT8CVOAQ/twmh0YdLHeH+o=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mEDe4FAheoUDNwti7vv8FKUNaowQCfW1YFt/S+SvDJtxZOPsbMHfBKWw3G+DMAI01
 rpFSW2xzRslhHapJtvtGno4nMPinthakiNafukrcXzCkhp65xy2pph3khkkI+rJgS5
 t0nzccfeMmxoU7me05bt9PnE4edElreGkhEmqRaw=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, seanpaul@chromium.org,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, uli+renesas@fpond.eu,
 ezequiel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTUvMTAvMjAxOSAxNDozMywgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEhpIEtpZXJhbiwgdGhh
bmtzIGZvciByZXZpZXcKCjxzbmlwPgoKPj4+ICtjb25maWcgRFJNX1JDQVJfQ01NCj4+PiArCWJv
b2wgIlItQ2FyIERVIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pIFN1cHBvcnQiCj4+PiAr
CWRlcGVuZHMgb24gRFJNICYmIE9GCj4+PiArCWRlcGVuZHMgb24gRFJNX1JDQVJfRFUKPj4KPj4K
Pj4gRFJNX1JDQVJfRFUgYWxyZWFkeSBkZXBlbmRzIG9uIGJvdGggRFJNICYmIE9GLCBzbyBJIHdv
bmRlciBpZiB0aG9zZSBhcmUKPj4gbmVlZGVkIHRvIGJlIHNwZWNpZmllZCBleHBsaWNpdGx5Lgo+
Pgo+PiBEb2Vzbid0IGh1cnQgb2YgY291cnNlLCBidXQgSSBzZWUgRFJNX1JDQVJfRFdfSERNSSBk
b2VzIHRoZSBzYW1lLCBhbmQgc28KPj4gZG9lcyBEUk1fUkNBUl9MVkRTLCBzbyBJIGRvbid0IHRo
aW5rIHlvdSBuZWVkIHRvIHJlbW92ZSBpdC4KPj4KPiAKPiBJIGRpZCB0aGUgc2FtZSBhcyBpdCBp
cyBkb25lIGZvciBIRE1JIGFuZCBMVkRTIGhlcmUuIFRoZSBleHRyYQo+IGRlcGVuZGVuY2llcyBj
b3VsZCBiZSBkcm9wcGVkIHllcywgSSBjaG9zZSB0byBiZSBjb25zaXN0ZW50LgoKQ29uc2lzdGVu
dCBpcyBmaW5lIHdpdGggbWUuCgoKPHNuaXA+Cgo+Pj4gK3N0cnVjdCByY2FyX2NtbSB7Cj4+PiAr
CXZvaWQgX19pb21lbSAqYmFzZTsKPj4+ICsKPj4+ICsJLyoKPj4+ICsJICogQGx1dDoJCTFELUxV
VCBzdGF0dXMKPj4+ICsJICogQGx1dC5lbmFibGVkOgkxRC1MVVQgZW5hYmxlZCBmbGFnCj4+PiAr
CSAqLwo+Pj4gKwlzdHJ1Y3Qgewo+Pj4gKwkJYm9vbCBlbmFibGVkOwo+Pj4gKwl9IGx1dDsKPj4K
Pj4gVGhpcyB1c2VkIHRvIGJlIGEgbW9yZSBjb21wbGV4IHN0cnVjdHVyZSBpbiBhbiBlYXJsaWVy
IHZlcnNpb24gc3RvcmluZyBhCj4+IGNhY2hlZCB2ZXJzaW9uIG9mIHRoZSB0YWJsZS4gTm93IHRo
YXQgdGhlIGNhY2hlZCBlbnRyeSBpcyByZW1vdmVkLCBkb2VzCj4+IHRoaXMgbmVlZCB0byBiZSBz
dWNoIGEgY29tcGxleCBzdHJ1Y3R1cmUgcmF0aGVyIHRoYW4ganVzdCBzYXksIGEgYm9vbAo+PiBs
dXRfZW5hYmxlZD8KPj4KPj4gKFdlIHdpbGwgc29vbiBhZGQgYW4gZXF1aXZhbGVudCBjbHVfZW5h
YmxlZCB0b28sIGJ1dCBJIGRvbid0IGtub3cgd2hhdAo+PiBvdGhlciBwZXItdGFibGUgb3B0aW9u
cyB3ZSdsbCBuZWVkLikKPj4KPj4gSW4gZmFjdCwgd2UnbGwgcG90ZW50aWFsbHkgaGF2ZSBvdGhl
ciBvcHRpb25zIHNwZWNpZmljIHRvIHRoZSBIR08sIGFuZAo+PiBDU0MgYXQgc29tZSBwb2ludCBp
biB0aGUgZnV0dXJlIC0gc28gZ3JvdXBpbmcgYnkgZW50aXR5IGlzIGluZGVlZCBhIGdvb2QKPj4g
dGhpbmcgSU1PLgo+IAo+IFlvdSBhcmUgcmlnaHQsIEkgcG9uZGVyZWQgYSBiaXQgaXQgdGhpcyB3
YXMgd29ydGggaXQsIGJ1dCBJIGFzc3VtZSB0aGUKPiBvdGhlciBDTU0gZnVuY3Rpb25zIHdvdWxk
IGhhdmUgcmVxdWlyZWQgc29tZSBtb3JlIGNvbXBsZXggZmllbGRzIHNvIEkKPiBjaG9zZSB0byBr
ZWVwIGl0IHNlcGFyYXRlLiBJIGhhdmUgbm8gcHJvYmxlbSB0byBtYWtlIHRoaXMgYQo+IGx1dF9l
bmFibGVkLCBidXQgSSBmZWFyIGFzIHNvb24gYXMgd2Ugc3VwcG9ydCBzYXksIGRvdWJsZSBidWZm
ZXJpbmcKPiBmb3IgdGhlIGx1dCwgaGF2aW5nIGEgZGVkaWNhdGVkIHN0cnVjdCB3b3VsZCBiZSBu
aWNlLgo+IAo+IElzIGl0IG9rIGlmIEkga2VlcCB0aGlzIHRoZSB3YXkgaXQgaXM/CgpDZXJ0YWlu
bHkgZmluZSBmb3IgbWUuIChUaGF0J3Mgd2hhdCBJIHRyaWVkIHRvIGltcGx5IHdpdGggInNvIGdy
b3VwaW5nCmJ5IGVudGl0eSBpcyBpbmRlZWQgYSBnb29kIHRoaW5nIElNTy4iKQoKPHNuaXA+Ci0t
CktpZXJhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
