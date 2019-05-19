Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6742271A
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 17:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E2E891DA;
	Sun, 19 May 2019 15:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DE3891DA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 15:25:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 207192001F;
 Sun, 19 May 2019 17:25:14 +0200 (CEST)
Date: Sun, 19 May 2019 17:25:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/1] drm/bridge: drop drmP.h usage
Message-ID: <20190519152513.GA12957@ravnborg.org>
References: <20190519110049.GA19356@ravnborg.org>
 <20190519150754.GC5213@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519150754.GC5213@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8
 a=P1BnusSwAAAA:8 a=-Czj_tyNrngrLWLT2zcA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 David Airlie <airlied@linux.ie>, Peter Senna Tschudin <peter.senna@gmail.com>,
 dri-devel@lists.freedesktop.org, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgZmVlZGJhY2suCgo+ID4gQEAgLTE1LDE0
ICsxNSwxNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvcG1fcnVudGltZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgo+ID4g
LSNpbmNsdWRlIDxkcm0vZHJtUC5oPgo+ID4gKwo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21p
Y19oZWxwZXIuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9jcnRjLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KPiA+
ICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+
Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4gPiArCj4gPiAgI2luY2x1
ZGUgPGRybS9icmlkZ2UvZHdfbWlwaV9kc2kuaD4KPiAKPiBJZiB5b3Ugc2VwYXJhdGUgdGhpcyBm
aWxlIGZyb210IGhlIHJlc3Qgb2YgdGhlIGRybS8gaW5jbHVkZXMsIHlvdSBzaG91bGQKPiBkbyB0
aGUgc2FtZSBpbiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBmb3IK
PiBjb25zaXN0ZW5jeS4gSSdtIGZpbmUgZWl0aGVyIHdheS4KPiAKPiA+IGluZGV4IGEyMGU0NTRk
ZGQ2NC4uMTcwZjE2MmZmYTU1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2NC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0LmMK
PiA+IEBAIC03LDE4ICs3LDIyIEBACj4gPiAgICoJTWFjaWVqIFB1cnNraSA8bS5wdXJza2lAc2Ft
c3VuZy5jb20+Cj4gPiAgICovCj4gPiAgCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4g
PiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4gPiArI2luY2x1ZGUg
PGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlIDx2aWRlby9t
aXBpX2Rpc3BsYXkuaD4KPiA+ICsKPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVy
Lmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJt
X2ZiX2hlbHBlci5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGRybS9kcm1fb2YuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgo+ID4g
KyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVf
aGVscGVyLmg+Cj4gPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4
L2dwaW8vY29uc3VtZXIuaD4KPiA+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiA+IC0j
aW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4gPiAtI2luY2x1ZGUgPHZpZGVv
L21pcGlfZGlzcGxheS5oPgo+IAo+IFNpbWlsYXJseSwgaW4gZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHlvdSBoYXZlCj4gdmlkZW8vIGFmdGVyIGRybS8sIHdo
aWxlIGl0J3MgdGhlIG90aGVyIHdheSBhcm91bmQuIEkgdGhpbmsgd2Ugc2hvdWxkCj4gcGljayBv
bmUgb3JkZXIgYW5kIHN0aWNrIHdpdGggaXQuCgpXZWxsIGRvbmUgdG8gc3BvdCB0aGlzIGluY29u
c2lzdGVuY3kuCgpJIHdpbGwgZ28gdGhyb3VnaCB0aGUgZmlsZXMgYW5kIGNvbnNpc3RlbnRseSB1
c2UgZm9sbG93aW5nIG9yZGVyOgoKPGxpbnV4Lyo+Cgo8YXNtLyo+Cgo8dmlkZW8vKj4KCjxkcm0v
Kj4KCiIiCgpUaGlzIHNlZW1zIHRvIG1hdGNoIHRoZSBtYWpvcml0eSBidXQgYWxsIHZhcmlhbnRz
IGNhbiBiZSBmb3VuZC4KQW5kIHRoZW4gdGhlIHByaW5jaXBsZSBpczoKLSBtb3N0IGdlbmVyYWwg
aW5jbHVkZXMgZmlyc3QsIHdpdGggbGludXgvKiBmaXJzdAotIGRybSBpbmNsdWRlcyBzZWNvbmQt
bGFzdAotIGxvY2FsIGRybSBpbmNsdWRlcyBsYXN0Cgo+IAo+IFdpdGggdGhlc2Ugc21hbGwgaXNz
dWVzIGZpeGVkLAo+IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpUaGFua3MuIEkgd2lsbCBwb3N0IGEgdjIgLSB3aGVy
ZSBJIGNhbiBhbHNvIGZpeCBzbyB0aGUgbWFpbCBpcyBzZW50IHRvCnRoZSByZWxldmFudCBwZW9w
bGUgKG15IGNjOiB3YXMgbWlzc2luZyBzb21lIHRoaXMgdGltZSkuCgoJU2FtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
