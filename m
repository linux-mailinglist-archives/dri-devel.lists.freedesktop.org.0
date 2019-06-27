Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AF5826A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650C088FFB;
	Thu, 27 Jun 2019 12:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211B388FFB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:22:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BB7490C87;
 Thu, 27 Jun 2019 12:22:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E5695C1B4;
 Thu, 27 Jun 2019 12:22:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 975B711AAF; Thu, 27 Jun 2019 14:22:18 +0200 (CEST)
Date: Thu, 27 Jun 2019 14:22:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
Message-ID: <20190627122218.aiqa5qbujwqgd24m@sirius.home.kraxel.org>
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190627073239.GF12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627073239.GF12905@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 12:22:19 +0000 (UTC)
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gSW1vIGdldCBtYXliZSBhbm90aGVyIHR0bStnZW0gc3Rha2Vob2xkZXIgdG8gcmV2
aWV3IHRoaXMgKFRob21hcyBmb3IgdnJhbQo+IGhlbHBlcnMgb3IgQmVuIGZvciBub3V2ZWF1KSBh
bmQgdGhlbiB0aGlzIGNhbiBsYW5kLiBJIHRoaW5rIFRob21hcwo+IEhlbGxzdHJvbSB0dW5lZCBk
b3duIGhpcyBjYXRlZ29yaWNhbCAibmFrIiB0byAid2UnbGwgc2VlIHdoZXJlIHRoaXMgZ29lcywK
PiBJIG1pZ2h0IG5lZWQgdG8ganVtcCBpbiBhbmQgaGVscCBjb3Vyc2UtY29ycmVjdCIuCgpZZXAs
IHNlZW1zIGhlIGFsc28gaXMgb24gc3VtbWVyIHZhY2F0aW9uIG5vdyAuLi4KCj4gYnR3IEkgYWxz
byByZXN1Ym1pdHRlZCBteSBwcmltZSByZXN2X29iaiBjbGVhbnVwIHNlcmllczoKPiAKPiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYyNzM1LwoKV2hhdCBpcyB0aGUg
bWVyZ2UgcGxhbiBmb3IgdGhpcz8gIExvb2tzIGxpa2UgdGhpcyBpcyBwcmV0dHkgbXVjaCByZWFk
eQp0byBnby4KCj4gSSB0aGluayB0aGUgb25seSBjb25mbGljdHMgd2l0aCB5b3VyIHNlcmllcyBo
ZXJlIGlzIHRoYXQgdGhlIHNldHRpbmcgb2YKPiBnZW1fYm8ucmVzdiB0aGF0IEkgYWRkIGluIHJh
ZGVvbi9hbWRncHUvbm91dmVhdSBjYW4gYmUgcmVtb3ZlZCBhZ2FpbiB3aGVuCj4geW91ciBzdHVm
ZiBsYW5kcy4KClllcCwgZG9lc24ndCBsb29rIHRvbyBiYWQuICBJIGNhbiByZWJhc2Ugb24gdG9w
IG9mIHlvdXIgc2VyaWVzLCBJIHBsYW4KdG8gc2VuZCB2MyBhbnl3YXksIEkgaGF2ZSBzb21lIHNt
YWxsZXIgKGNvbW1lbnQpIHVwZGF0ZXMgcGVuZGluZy4KCmNoZWVycywKICBHZXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
