Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7EC2958BE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9EB6E1B5;
	Thu, 22 Oct 2020 07:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6A46E1B5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 07:01:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16A7EAD4A;
 Thu, 22 Oct 2020 07:01:53 +0000 (UTC)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201021121241.17623-1-tzimmermann@suse.de>
 <20201021230654.GS3942@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drivers/video: Fix -Wstringop-truncation in hdmi.c
Message-ID: <a07dff58-a6fa-8b3d-453a-a75bf47b5405@suse.de>
Date: Thu, 22 Oct 2020 09:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201021230654.GS3942@pendragon.ideasonboard.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, bernard@vivo.com,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 daniel.vetter@ffwll.ch, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIyLjEwLjIwIDAxOjA2LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IEhpIFRob21h
cywKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBXZWQsIE9jdCAyMSwgMjAy
MCBhdCAwMjoxMjo0MVBNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4gVHJ5aW5n
IHRvIGNvcHkgaW50byB0aGUgc3RyaW5nIGZpZWxkcyB3aXRoIHN0cm5jcHkoKSBnaXZlcyBhIHdh
cm5pbmcgZnJvbQo+PiBnY2MuIEJvdGggZmllbGRzIGFyZSBwYXJ0IG9mIGEgcGFja2VkIEhETUkg
aGVhZGVyIGFuZCBkbyBub3QgcmVxdWlyZSBhCj4+IHRlcm1pbmF0aW5nIFwwIGNoYXJhY3Rlci4K
Pj4KPj4gLi4vZHJpdmVycy92aWRlby9oZG1pLmM6IEluIGZ1bmN0aW9uICdoZG1pX3NwZF9pbmZv
ZnJhbWVfaW5pdCc6Cj4+IC4uL2RyaXZlcnMvdmlkZW8vaGRtaS5jOjIzMDoyOiB3YXJuaW5nOiAn
c3RybmNweScgc3BlY2lmaWVkIGJvdW5kIDggZXF1YWxzIGRlc3RpbmF0aW9uIHNpemUgWy1Xc3Ry
aW5nb3AtdHJ1bmNhdGlvbl0KPj4gICAyMzAgfCAgc3RybmNweShmcmFtZS0+dmVuZG9yLCB2ZW5k
b3IsIHNpemVvZihmcmFtZS0+dmVuZG9yKSk7Cj4+ICAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+IC4uL2RyaXZlcnMvdmlkZW8v
aGRtaS5jOjIzMToyOiB3YXJuaW5nOiAnc3RybmNweScgc3BlY2lmaWVkIGJvdW5kIDE2IGVxdWFs
cyBkZXN0aW5hdGlvbiBzaXplIFstV3N0cmluZ29wLXRydW5jYXRpb25dCj4+ICAgMjMxIHwgIHN0
cm5jcHkoZnJhbWUtPnByb2R1Y3QsIHByb2R1Y3QsIHNpemVvZihmcmFtZS0+cHJvZHVjdCkpOwo+
PiAgICAgICB8ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+Pgo+PiBKdXN0IHVzZSBtZW1jcHkoKSBpbnN0ZWFkLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4gLS0tCj4+
ICBkcml2ZXJzL3ZpZGVvL2hkbWkuYyB8IDggKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2hkbWkuYyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jCj4+IGluZGV4IGI3YTFkNmZhZTkw
ZC4uMWU0Y2I2M2QwZDExIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2hkbWkuYwo+PiAr
KysgYi9kcml2ZXJzL3ZpZGVvL2hkbWkuYwo+PiBAQCAtMjIxLDE0ICsyMjEsMTggQEAgRVhQT1JU
X1NZTUJPTChoZG1pX2F2aV9pbmZvZnJhbWVfcGFjayk7Cj4+ICBpbnQgaGRtaV9zcGRfaW5mb2Zy
YW1lX2luaXQoc3RydWN0IGhkbWlfc3BkX2luZm9mcmFtZSAqZnJhbWUsCj4+ICAJCQkgICAgY29u
c3QgY2hhciAqdmVuZG9yLCBjb25zdCBjaGFyICpwcm9kdWN0KQo+PiAgewo+PiArCXNpemVfdCBs
ZW47Cj4+ICsKPj4gIAltZW1zZXQoZnJhbWUsIDAsIHNpemVvZigqZnJhbWUpKTsKPj4gIAo+PiAg
CWZyYW1lLT50eXBlID0gSERNSV9JTkZPRlJBTUVfVFlQRV9TUEQ7Cj4+ICAJZnJhbWUtPnZlcnNp
b24gPSAxOwo+PiAgCWZyYW1lLT5sZW5ndGggPSBIRE1JX1NQRF9JTkZPRlJBTUVfU0laRTsKPj4g
IAo+PiAtCXN0cm5jcHkoZnJhbWUtPnZlbmRvciwgdmVuZG9yLCBzaXplb2YoZnJhbWUtPnZlbmRv
cikpOwo+PiAtCXN0cm5jcHkoZnJhbWUtPnByb2R1Y3QsIHByb2R1Y3QsIHNpemVvZihmcmFtZS0+
cHJvZHVjdCkpOwo+PiArCWxlbiA9IHN0cmxlbih2ZW5kb3IpOwo+PiArCW1lbWNweShmcmFtZS0+
dmVuZG9yLCB2ZW5kb3IsIG1pbihsZW4sIHNpemVvZihmcmFtZS0+dmVuZG9yKSkpOwo+PiArCWxl
biA9IHN0cmxlbihwcm9kdWN0KTsKPj4gKwltZW1jcHkoZnJhbWUtPnByb2R1Y3QsIHByb2R1Y3Qs
IG1pbihsZW4sIHNpemVvZihmcmFtZS0+cHJvZHVjdCkpKTsKPiAKPiBBcyB0aGlzIHNlZW1zIHRv
IGJlIGEgbGVnaXRpbWF0ZSB1c2Ugb2Ygc3RybmNweSgpLCBpc24ndCB0aGVyZSBhIHdheSB0bwo+
IHNpbGVuY2UgdGhlIHdhcm5pbmcgd2l0aG91dCByZXF1aXJpbmcgdGhpcyBhZGRpdGlvbmFsIHJ1
bnRpbWUgY29tcGxleGl0eQo+ID8KClllcywgdGhlIG9yaWdpbmFsIGNvZGUgdGhpcyBjb3JyZWN0
LiBJIGxvb2tlZCB0aHJvdWdoIGluY2x1ZGUvc3RyaW5nLmgKaWYgdGhlcmUncyBiZXR0ZXIgc3Ry
aW5nIGZ1bmN0aW9uLCBidXQgbm9uZSBmaXRzLiBNb3N0IG9mIHRoZW0KMC10ZXJtaW5hdGUgdGhl
IG91dHB1dCBzdHJpbmcuCgpUaGUgb25seSBzaW1wbGUgZml4IHNlZW1zIHRvIGJlIHRvIHNldCBn
Y2MncyAtV25vLXN0cmluZ29wLXRydW5jYXRpb24KaGVyZS4gSSdkIGV4cGVjdCB0aGF0IHdvdWxk
IGJlIGFuIGV2ZW4gbGVzcyBwcmVmZXJhYmxlIGNoYW5nZS4KCkJlc3QgcmVnYXJkcwpUaG9tYXMK
Cj4gCj4+ICAKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSApNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
