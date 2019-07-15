Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A969925
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFEB89A92;
	Mon, 15 Jul 2019 16:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6331289A92
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:35:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4BF5F8032E;
 Mon, 15 Jul 2019 18:35:22 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:35:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v1 33/33] drm/hisilicon: drop use of drmP.h
Message-ID: <20190715163521.GM27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-34-sam@ravnborg.org>
 <CACvgo51hO+i6LryjeQhEivq3ta0Vnd=ZxFrrW0Gn8vVQebSybw@mail.gmail.com>
 <20190715081941.GA29177@ravnborg.org>
 <20190715103451.GA20839@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715103451.GA20839@arch-x1c3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=QX4gbG5DAAAA:8 a=9vcYZ1h6t9G9PPY8Vn0A:9 a=CjuIK1q_8ugA:10
 a=sA7TO5nKz6cA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, Chen Feng <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Junwei Zhang <Jerry.Zhang@amd.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rongrong Zou <zourongrong@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Allison Randal <allison@lohutok.net>, Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MzQ6NTFBTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIDIwMTkvMDcvMTUsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IEhpIEVtaWwuCj4g
PiAKPiA+ID4gPiAtLS0KPiA+ID4gPiBUaGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBh
ZGQgYWxsIHJlY2lwaWVudHMgdG8gdGhlIGNvdmVyIGxldHRlci4KPiA+ID4gPiBQbGVhc2UgZmlu
ZCBjb3ZlciBsZXR0ZXIgaGVyZToKPiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVhZC5odG1sCj4gPiA+ID4gU2VhcmNo
IGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJtLW1pc2MiCj4gPiA+ID4KPiA+ID4g
U3BlYWtpbmcgb2YgbG9uZyBDQyBsaXN0LCBtb3N0IHBhdGNoZXMgYXJlIG9rIHlldCB0aGlzIGhh
cyBnb25lIGEgYml0IGNyYXp5Lgo+ID4gPiBIb3cgZGlkIHlvdSBtYW5hZ2UgdG8gcHVsbCBzdWNo
IGEgbG9uZyBsaXN0PyBUaGUgZ2V0X21haW50YWluZXIucGwKPiA+ID4gc2NyaXB0IHNob3dzIGEg
dG90YWwgb2YgMTcgZm9yIGFsbCBvZiBoaWJtYyBhbmQga2lyaW4uCj4gPiAKPiA+IFNvbWV0aW1l
cyBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIG91dHB1dHMgYSBsb3Qgb2YgcGVvcGxlLgo+ID4g
U29tZXRpbWVzIG9ubHkgYSBmZXcuCj4gPiBJIGhhdmUgbm90IGxvb2tlZCBpbnRvIGRldGFpbHMg
d2h5LCBhbmQgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzCj4gPiBJIHVzZWQgImRpbSBhZGQtbWlzc2lu
Zy1jYyIgdG8gbW9zdCBwYXRjaGVzLgo+ID4gCj4gVGhpcyBwYXRjaCBzZWVtcyBsaWtlIGEgZ29v
ZCBjYW5kaWRhdGUgdG8gZml4dXAgZGltLiBDYW4gd2Ugdm9sdW50ZWVyCj4geW91IGZvciB0aGUg
dGFzayA7LSkKTmFhaCwgaXQgaXMgc29tZXdoZXJlIGluIGdldF9tYWludGFpbmVycy5wbCBhbmQg
dGhpcyBpcyB0b28gbXVjaApwZXJsIGZvciBteSBsaWtpbmcuCgogCj4gPiA+IEVpdGhlciB3YXks
IHNpbmNlIHlvdSd2ZSBidWlsdC10ZXN0ZWQgdGhlc2UgKGFuZCBjb25mbGljdHMgYXJlIGEKPiA+
ID4gbWF0dGVyIG9mICNpbmNsdWRlKSBmb3IgdGhlIGxvdDoKPiA+ID4gQWNrZWQtYnk6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiBKdXN0IHRvIGJlIHN1cmUu
IFdhcyB0aGlzIGFuIEFjayBmb3IgdGhlIGZ1bGwgc2VyaWVzIG9yIG9ubHkgdGhpcyBwYXRjaD8K
PiA+IEkgc3RhcnRlZCBwcm9jZXNzaW5nIHRoZSBwYXRjaGVzLCBhbmQgdGhlIG9uZXMgd2hlcmUg
SSBoYXZlIGdvdCBhbgo+ID4gZXhwbGljaXQgYWNrIG9yIHItYiBpcyBxdWV1ZWQgYWxyZWFkeSAo
d2l0aG91dCB5b3VyIGFjaykuCj4gPiAKPiBGb3IgdGhlIGxvdCAtPiBGb3IgdGhlIHNlcmllcy4K
VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpGb3Igbm93IEkgaGF2ZSBhZGRlZCB5b3VyIGFjayBv
biBhbGwsIGFuZCBwdXNoZWQgdGhlIG9uZXMgd2hlcmUgSSBoYWQKZmVlZGJhY2sgZnJvbSBvdGhl
cnMgdG9vLgoKV2lsbCByZXNlbmQgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoZXMsIGJlY2F1c2UgbXkg
Z2l0IHNlbmQtZW1haWwgc29tZWhvdwpsb3N0IHNldmVyYWwgcmVjaXBpZW50cyBpbiBmaXJzdCB0
cnkuCgoJU2FtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
