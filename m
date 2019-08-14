Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6198DD2B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC8C6E7C8;
	Wed, 14 Aug 2019 18:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E00E6E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:42:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CF9CF8051D;
 Wed, 14 Aug 2019 20:42:28 +0200 (CEST)
Date: Wed, 14 Aug 2019 20:42:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>, lwn@lwn.net
Subject: Re: [PATCH] drm/vboxvideo: Make structure vbox_fb_helper_funcs
 constant
Message-ID: <20190814184227.GA23241@ravnborg.org>
References: <20190813062548.24770-1-nishkadg.linux@gmail.com>
 <687f24b1-c3c5-c9d6-9abb-3c84ae009715@redhat.com>
 <20190814172634.GP7444@phenom.ffwll.local>
 <3d20c06e-ff9a-ff05-350b-9d54ab5161cb@redhat.com>
 <20190814175137.GU7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814175137.GU7444@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=20KFwNOVAAAA:8 a=25-AhOLfAAAA:8 a=e5mUnYsNAAAA:8 a=OiYNS5LMqAZTB_DsSJsA:9
 a=CjuIK1q_8ugA:10 a=dnuY3_Gu-P7Vi9ynLKQe:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, Hans de Goede <hdegoede@redhat.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6NTE6MzdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwNzozNjo1NVBNICswMjAwLCBIYW5zIGRl
IEdvZWRlIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIDE0LTA4LTE5IDE5OjI2LCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAwOTo1NzoxOUFNICsw
MjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+ID4gPiA+IEhpLAo+ID4gPiA+IAo+ID4gPiA+IE9u
IDEzLTA4LTE5IDA4OjI1LCBOaXNoa2EgRGFzZ3VwdGEgd3JvdGU6Cj4gPiA+ID4gPiBUaGUgc3Rh
dGljIHN0cnVjdHVyZSB2Ym94X2ZiX2hlbHBlcl9mdW5jcywgb2YgdHlwZSBkcm1fZmJfaGVscGVy
X2Z1bmNzLAo+ID4gPiA+ID4gaXMgdXNlZCBvbmx5IHdoZW4gaXQgaXMgcGFzc2VkIGFzIHRoZSB0
aGlyZCBhcmd1bWVudCB0bwo+ID4gPiA+ID4gZHJtX2ZiX2hlbHBlcl9mYmRldl9zZXR1cCgpLCB3
aGljaCBkb2VzIG5vdCBtb2RpZnkgaXQuIEhlbmNlIG1ha2UgaXQKPiA+ID4gPiA+IGNvbnN0YW50
IHRvIHByb3RlY3QgaXQgZnJvbSB1bmludGVuZGVkIG1vZGlmaWNhdGlvbnMuCj4gPiA+ID4gPiBJ
c3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IE5pc2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGludXhAZ21haWwuY29tPgo+ID4gPiA+
IAo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWU6
Cj4gPiA+ID4gCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+Cj4gPiA+IAo+ID4gPiBJJ20gYXNzdW1pbmcgeW91J2xsIGFwcGx5IHRoaXMgdG8g
ZHJtLW1pc2MtbmV4dCB0b28/IEdvb2QgdG8gc3RhdGUgdGhhdCwKPiA+ID4gdG8gYXZvaWQgY29u
ZnVzaW9uIGFuZCBjb29yZGluYXRpb24gaXNzdWVzLgo+ID4gCj4gPiBBY3R1YWxseSBJJ20gc28g
dXNlZCB0byB0aGUgd29ya2Zsb3cgaW4gb3RoZXIgc3Vic3lzdGVtcyBJIHdhcwo+ID4gZXhwZWN0
aW5nIHRoZSBzdWJzeXMgbWFpbnRhaW5lciB0byBwaWNrIGl0IHVwLiBCdXQgSSBrbm93IHRoYXQK
PiA+IGlzIG5vdCBob3cgaXQgd29ya3MgZm9yIHRoZSBkcm0gc3Vic3lzIGFuZCBzaW5jZSBJJ20g
dGhlIHZib3h2aWRlbwo+ID4gbWFpbnRhaW5lciBJIGd1ZXNzIGl0IG1ha2VzIHNlbnNlIGZvciBt
ZSB0byBwaWNrIHRoaXMgdXAgYW5kIHB1c2ggaXQuCj4gCj4gWWVhaCwgZHJtIHN1YnN5c3RlbSBt
YWludGFpbmVycyBhcmUgZXhjZWVkaW5nbHkgbGF6eSBiYXN0YXJkcy4gU2FtZQo+IGFwcGxpZXMg
dG8gc3VidHJlZSBtYWludGFpbmVycyAoYXQgbGVhc3QgaW4gbW9zdCBjYXNlcykuCgpCZSBjYXJl
ZnVsLCB0aGlzIGNvdWxkIGVuZCB1cCBpbiBzb21lIHBvcHVsYXIgbmV3cyBzaXRlLgoKCVNhbQo+
ICAKPiA+IFNvIHllcyBJIHdpbGwgcGljayB0aGlzIHVwIGFuZCBwdXNoIGl0IHRvIGRybS1taXNj
LW5leHQsIHNvcnJ5Cj4gPiBmb3IgdGhlIGNvbmZ1c2lvbi4KPiAKPiBUaGFua3MsIERhbmllbAo+
IAo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gCj4gPiBIYW5zCj4gPiAKPiA+IAo+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgfCAyICst
Cj4gPiA+ID4gPiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Ym94
dmlkZW8vdmJveF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYwo+
ID4gPiA+ID4gaW5kZXggMDI1MzdhYjljYzA4Li4yYjU3ZWEzMTk1ZjIgMTAwNjQ0Cj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMKPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYwo+ID4gPiA+ID4gQEAgLTMy
LDcgKzMyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtd
ID0gewo+ID4gPiA+ID4gICAgfTsKPiA+ID4gPiA+ICAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNp
LCBwY2lpZGxpc3QpOwo+ID4gPiA+ID4gLXN0YXRpYyBzdHJ1Y3QgZHJtX2ZiX2hlbHBlcl9mdW5j
cyB2Ym94X2ZiX2hlbHBlcl9mdW5jcyA9IHsKPiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9mYl9oZWxwZXJfZnVuY3MgdmJveF9mYl9oZWxwZXJfZnVuY3MgPSB7Cj4gPiA+ID4gPiAg
ICAJLmZiX3Byb2JlID0gdmJveGZiX2NyZWF0ZSwKPiA+ID4gPiA+ICAgIH07Cj4gPiA+ID4gPiAK
PiA+ID4gCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
