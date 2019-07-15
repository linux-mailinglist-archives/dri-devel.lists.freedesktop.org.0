Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815EB69917
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B56589745;
	Mon, 15 Jul 2019 16:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB389745
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:32:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 587F880314;
 Mon, 15 Jul 2019 18:32:00 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:31:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 30/33] drm: add missing include to drm_vram_mm_helper.h
Message-ID: <20190715163158.GJ27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-31-sam@ravnborg.org>
 <20190702133552.GD15868@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702133552.GD15868@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8 a=Qbm2pBJrxNHCMvt6PmQA:9
 a=CjuIK1q_8ugA:10 a=sA7TO5nKz6cA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDM6MzU6NTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAwODoxOToxOUFNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBUaGUgbWFjcm8gRFJNX1ZSQU1fTU1fRklMRV9PUEVSQVRJT05TIHJl
ZmVyZW5jcwo+ID4gZnVuY3Rpb25zIGRlY2xhcmVkIGluIG90aGVyIGhlYWRlciBmaWxlcy4KPiA+
IEluY2x1ZGUgdGhlc2UgaGVhZGVyIGZpbGVzIHNvIHRoaXMgaGVhZGVyIGZpbGVzCj4gPiBwdWxs
cyBpbiB3aGF0IGl0IHJlZmVyZW5jZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+
Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IC0tLQo+ID4gVGhlIGxpc3Qgb2YgY2M6IHdhcyB0
b28gbGFyZ2UgdG8gYWRkIGFsbCByZWNpcGllbnRzIHRvIHRoZSBjb3ZlciBsZXR0ZXIuCj4gPiBQ
bGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvdGhyZWFkLmh0bWwKPiA+IFNlYXJj
aCBmb3IgImRybTogZHJvcCB1c2Ugb2YgZHJtcC5oIGluIGRybS1taXNjIgo+ID4gCj4gPiAgICAg
ICAgIFNhbQo+ID4gCj4gPiAgaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggfCAyICsr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fdnJh
bV9tbV9oZWxwZXIuaAo+ID4gaW5kZXggYThmZmQ4NTk5YjA4Li4yYWFjZmIxY2NmYWUgMTAwNjQ0
Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuaAo+ID4gKysrIGIvaW5j
bHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKPiA+IEBAIC0zLDYgKzMsOCBAQAo+ID4gICNp
Zm5kZWYgRFJNX1ZSQU1fTU1fSEVMUEVSX0gKPiA+ICAjZGVmaW5lIERSTV9WUkFNX01NX0hFTFBF
Ul9ICj4gPiAgCj4gPiArI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgo+ID4gKyNpbmNsdWRlIDxk
cm0vZHJtX2lvY3RsLmg+Cj4gCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+CgpUaGFua3MsIGFwcGxpZWQuCgo+IAo+IGJ0dyBmb3IgdGhlc2UgaGVs
cGVycyBnb29kIGlmIHlvdSBtYW51YWxseSBhZGQgcmVsZXZhbnQgcGVvcGxlIC0gc2luY2UKPiB0
aGVyZSBhcmUgbWFpbnRhaW5lcnMgZm9yIHRoZSBlbnRpcmUgc3Vic3lzdGVtIGdldF9tYWludGFp
bmVycy5wbCBkb2Vzbid0Cj4gbG9vayBhdCBnaXQgaGlzdG9yeS4gT3Igd2UnZCBuZWVkIHRvIGFk
ZCBNQUlOVEFJTkVSUyBlbnRyaWVzIG1hbnVhbGx5IGZvcgo+IGFsbCBvZiB0aGVtIC4uLgpOb3Rl
ZCwgd2lsbCBkbyBzbyBuZXh0IHRpbWUgSSB0b3VjaCB0aGUgbW9yZSBnZW5lcmFsIGZpbGVzLgoK
Z2V0X21haW50YWluZXJzIHNvbWV0aW1lcyBsaXN0IGEgX2xvdF8gb2YgcGVvcGxlLgpJIGhhdmUg
eWV0IHRvIGZpbmQgb3V0IHdoeSwgYnV0IHRoZW4gSSBoYXZlIG5vdCBkaWdnZWQgaW5vdCBpdC4K
QW5kIGZvciBub3cgSSBqdXN0IGlnbm9yZSBpdCBhbmQgYWRkIGFsbC4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
