Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E286620
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4666E886;
	Thu,  8 Aug 2019 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67826E883
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:43:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5EF3C7BDD1;
 Thu,  8 Aug 2019 15:43:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F3FA5D70D;
 Thu,  8 Aug 2019 15:43:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 293C89D42; Thu,  8 Aug 2019 17:43:54 +0200 (CEST)
Date: Thu, 8 Aug 2019 17:43:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 00/17] drm: add gem ttm helpers, rework mmap workflow.
Message-ID: <20190808154354.5ubon7d6yxalod4y@sirius.home.kraxel.org>
References: <20190808134417.10610-1-kraxel@redhat.com>
 <CAL_Jsq+iSWpKsdCjzhq-=utg=cLArUgariZEdEs5BqKAotcpQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+iSWpKsdCjzhq-=utg=cLArUgariZEdEs5BqKAotcpQA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 08 Aug 2019 15:43:55 +0000 (UTC)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDg6Mzk6MTFBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVGh1LCBBdWcgOCwgMjAxOSBhdCA3OjQ0IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4KPiA+IEdlcmQgSG9mZm1hbm4gKDE3KToK
PiA+ICAgZHJtL3R0bTogdHVybiB0dG1fYm9fZGV2aWNlLnZtYV9tYW5hZ2VyIGludG8gYSBwb2lu
dGVyCj4gPiAgIGRybS90dG06IGFkZCBnZW1fdHRtX2JvX2RldmljZV9pbml0KCkKPiA+ICAgZHJt
L3ZyYW06IHN3aXRjaCB2cmFtIGhlbHBlcnMgdG8gdGhlIG5ldyBnZW1fdHRtX2JvX2RldmljZV9p
bml0KCkKPiA+ICAgZHJtL3F4bDogc3dpdGNoIHF4bCB0byB0aGUgbmV3IGdlbV90dG1fYm9fZGV2
aWNlX2luaXQoKQo+ID4gICBkcm06IGFkZCBtbWFwKCkgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MK
PiA+ICAgZHJtL3NobWVtOiBzd2l0Y2ggc2htZW0gaGVscGVyIHRvIGRybV9nZW1fb2JqZWN0X2Z1
bmNzLT5tbWFwCj4gPiAgIGRybS9zaG1lbTogZHJvcCBERUZJTkVfRFJNX0dFTV9TSE1FTV9GT1BT
Cj4gPiAgIGRybS90dG06IGZhY3RvciBvdXQgdHRtX2JvX21tYXBfdm1hX3NldHVwCj4gPiAgIGRy
bS90dG06IGFkZCBkcm1fZ2VtX3R0bV9tbWFwKCkKPiA+ICAgZHJtL3ZyYW06IHN3aXRjaCB2cmFt
IGhlbHBlciB0byBkcm1fZ2VtX29iamVjdF9mdW5jcy0+bW1hcCBjb2RlcGF0aAo+ID4gICBkcm0v
dnJhbTogZHJvcCB2ZXJpZnlfYWNjZXNzCj4gPiAgIGRybTogZHJvcCBEUk1fVlJBTV9NTV9GSUxF
X09QRVJBVElPTlMKPiA+ICAgZHJtL3F4bDogdXNlIGRybV9nZW1fb2JqZWN0X2Z1bmNzCj4gPiAg
IGRybS9xeGw6IGRyb3AgcXhsX3R0bV9mYXVsdAo+ID4gICBkcm0vcXhsOiBzd2l0Y2ggcXhsIHRv
IGRybV9nZW1fb2JqZWN0X2Z1bmNzLT5tbWFwIGNvZGVwYXRoCj4gPiAgIGRybS9xeGw6IGRyb3Ag
dmVyaWZ5X2FjY2Vzcwo+ID4gICBkcm0vcXhsOiB1c2UgREVGSU5FX0RSTV9HRU1fRk9QUygpCj4g
Cj4gUGVyaGFwcyBpbnN0ZWFkIG9mIGNoYW5naW5nIGRyaXZlcnMgdG8gdXNlIERFRklORV9EUk1f
R0VNX0ZPUFMsIG1ha2UKPiB0aGF0IHRoZSBkZWZhdWx0IGlmIC5mb3BzIGlzIE5VTEwgKGFuZCBw
ZXJoYXBzIGFsc28gaWYgdGhlIGRyaXZlciBzZXRzCj4gRFJJVkVSX0dFTSkuIFRoYXQgd291bGQg
YmUgaW4gbGluZSB3aXRoIG90aGVyIHJlY2VudCByZXdvcmsgbWFraW5nCj4gdmFyaW91cyBmdW5j
dGlvbiBwdHJzIG9wdGlvbmFsLgoKTm90IHNvIGVhc3kgZm9yIGZvcHMgZHVlIHRvIC5vd25lciA9
IFRISVNfTU9EVUxFCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
