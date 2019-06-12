Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506441EC4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A77893C9;
	Wed, 12 Jun 2019 08:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC530893C9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:15:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 867FB307D863;
 Wed, 12 Jun 2019 08:15:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DC457BE7B;
 Wed, 12 Jun 2019 08:15:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46C1C16E05; Wed, 12 Jun 2019 10:15:01 +0200 (CEST)
Date: Wed, 12 Jun 2019 10:15:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/9] drm/ast: Pin and map cursor source BO during update
Message-ID: <20190612081501.hc37vrtgqerynj4w@sirius.home.kraxel.org>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611130344.18988-5-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 12 Jun 2019 08:15:04 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6MDM6MzlQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGFzdCBkcml2ZXIgdXNlZCB0byBsb2NrIHRoZSBjdXJzb3Igc291cmNl
IEJPIGR1cmluZyB1cGRhdGVzLiBMb2NraW5nCj4gc2hvdWxkIGJlIGRvbmUgaW50ZXJuYWxseSBi
eSB0aGUgQk8ncyBpbXBsZW1lbnRhdGlvbiwgc28gd2UgcGluIGl0IGluc3RlYWQKPiB0byBzeXN0
ZW0gbWVtb3J5LiBUaGUgbWFwcGluZyBpbmZvcm1hdGlvbiBpcyBhbHNvIHN0b3JlZCBpbiB0aGUg
Qk8uIE5vCj4gbmVlZCB0byBoYXZlIGFuIGV4dHJhIGFyZ3VtZW50IHRvIHRoZSBrbWFwIGZ1bmN0
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAyOSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwo+IGluZGV4IGNi
NmU4MjQ5YTdkYi4uYmUzZDkxZDdmZGU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwo+IEBA
IC0xMTgzLDcgKzExODMsNiBAQCBzdGF0aWMgaW50IGFzdF9jdXJzb3Jfc2V0KHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKPiAgCXU2NCBncHVfYWRkcjsKPiAgCXUzMiBjc3VtOwo+ICAJaW50IHJldDsK
PiAtCXN0cnVjdCB0dG1fYm9fa21hcF9vYmogdW9ial9tYXA7Cj4gIAl1OCAqc3JjLCAqZHN0Owo+
ICAJYm9vbCBzcmNfaXNpb21lbSwgZHN0X2lzaW9tZW07Cj4gIAlpZiAoIWhhbmRsZSkgewo+IEBA
IC0xMjAxLDE1ICsxMjAwLDEzIEBAIHN0YXRpYyBpbnQgYXN0X2N1cnNvcl9zZXQoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAo+ICAJfQo+ICAJZ2JvID0gZHJtX2dlbV92cmFtX29mX2dlbShvYmopOwo+
ICAKPiAtCXJldCA9IGRybV9nZW1fdnJhbV9sb2NrKGdibywgZmFsc2UpOwo+ICsJcmV0ID0gZHJt
X2dlbV92cmFtX3BpbihnYm8sIERSTV9HRU1fVlJBTV9QTF9GTEFHX1NZU1RFTSk7CgpGb3IgYSB0
ZW1wb3JhcnkgcGluIGxpa2UgdGhpcyBvbmUgdXNpbmcgcGxfZmxhZyA9IDAgc2hvdWxkIGJlIGZp
bmUuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
