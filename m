Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7C569DF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A42C6E41B;
	Wed, 26 Jun 2019 12:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1A6E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:57:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 568DE2003C;
 Wed, 26 Jun 2019 14:57:56 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:57:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Josef Lusticky <josef@lusticky.cz>
Subject: Re: [PATCH 0/2] Add DRM panel driver for Ilitek ILI9341 based panels
 in parallel RGB mode
Message-ID: <20190626125754.GD23428@ravnborg.org>
References: <20190219132101.27196-1-josef@lusticky.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219132101.27196-1-josef@lusticky.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=JLD_8mcgrgCszsDR8XsA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9zZWYuCgpPbiBUdWUsIEZlYiAxOSwgMjAxOSBhdCAwMjoyMDo1OVBNICswMTAwLCBKb3Nl
ZiBMdXN0aWNreSB3cm90ZToKPiBUaGVzZSBwYXRjaGVzIGFkZCBwYW5lbCBkcml2ZXIgZm9yIGls
aTkzNDEtYmFzZWQgcGFuZWxzIGluIHBhcmFsbGVsIFJHQiBtb2RlLgo+IFRoZSBkcml2ZXIgd2Fz
IGRldmVsb3BlZCBmb3IgRGlzcGxleVRlY2ggRFQwMjRDVEZUIExDRCBwYW5lbCBbMV0gd2hpY2gg
ZmVhdHVyZXMgSUxJOTM0MSBjaGlwIFsyXS4KPiBUaGUgZHJpdmVyIHdhcyB0ZXN0ZWQgb24gdGhl
IEFsbHdpbm5lciBBMTMgKHN1bjVpKSBwbGF0Zm9ybS4KPiAKPiBUaGUgZHJpdmVyIHN1cHBvcnRz
IDI0MHgzMjAgcGl4ZWwgcmVzb2x1dGlvbiB3aXRoIDE4LWJpdCBSR0IgKDYgd2lyZXMgcGVyIGNv
bG9yKQo+IGFuZCBTUEkgY29udHJvbCBidXMgd2l0aCBEYXRhL0NvbW1hbmQgR1BJTyBwaW4uCj4g
Cj4gVGhlIERhdGEvQ29tbWFuZCBHUElPIGlzIG9wdGlvbmFsLCBob3dldmVyIGF0IHRoZSBtb21l
bnQgdGhlIGRyaXZlciByZXF1aXJlcyBpdDoKPiBUaGUgZGlzcGxheSBpdHNlbGYgaXMgY2FwYWJs
ZSBvZiA5LWJpdCBTUEkgd2l0aG91dCB0aGUgRGF0YS9Db21tYW5kIEdQSU8uCj4gU3VwcG9ydCBm
b3Igc3VjaCBjb25maWd1cmF0aW9uIGNhbiBiZSBhZGRlZCBsYXRlciB0byB0aGUgZHJpdmVyLgo+
IAo+IE9wdGlvbmFsIEhXIHJlc2V0IGdwaW8gY2FuIGJlIHNwZWNpZmllZCwgb3RoZXJ3aXNlIFNX
IHJlc2V0IGNvbW1hbmQgaXMgdXNlZAo+IGR1cmluZyB0aGUgaW5pdGlhbGl6YXRpb24uCj4gCj4g
VGhlIElMSTkzNDEgZGlzcGxheXMgaGF2ZSB0d28gY29tbWFuZCBzZXRzOgo+IExldmVsIDEgY29u
Zm9ybXMgdG8gTUlQSSBzcGVjcwo+IExldmVsIDIgaXMgb3V0c2lkZSB0aGUgTUlQSSBzcGVjcyAt
IGN1c3RvbSBkZWZpbmVzIGFyZSB1c2VkIGluIHRoZSBkcml2ZXIKPiAKPiBUaGUgSUxJOTM0MSBz
dXBwb3J0cyB2YXJpb3VzIFJHQiBtb2RlcyAoZS5nLiBOVlNZTkMsIERFX0xPVywgY2xvY2sgZnJl
cSwgZXRjLiksCj4gaG93ZXZlciB2YWx1ZXMgdGhhdCBhcmUgcHJlc2VudGVkIGluIHRoZSBJTEk5
MzQxIGRhdGFzaGVldCBbMl0gYXJlIHVzZWQKPiBieSB0aGUgZHJpdmVyIGluIHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlLgo+IAo+IAo+IEdlbmVyYWwgbm90ZSBvbiBJTEk5MzQxLWJhc2VkIGRpc3Bs
YXlzOgo+IFRoZSBJTEk5MzQxIGNoaXAgY2FuIGJlIHVzZWQgaW4gcGFyYWxsZWwgUkdCIHdpdGgg
U1BJIGNvbnRyb2wKPiBvciBpbiBTUEkgb25seSBtb2RlIHdoZXJlIHRoZSBpbWFnZSBkYXRhIGl0
c2VsZiBpcyBhbHNvIHRyYW5zZmVycmVkIHZpYSBTUEkuCj4gVGhpcyBkcml2ZXIgc3VwcG9ydHMg
cGFyYWxsZWwgUkdCIGRpc3BsYXlzIC0gaXQgd29ya3Mgd2l0aCBkaXNwbGF5cyB3aXJlZCB3aXRo
IDE4LWJpdCBSR0IgaW5wdXQsCj4gaXQgZG9lcyBub3Qgc3VwcG9ydCBTUEkgZGF0YSBtb2RlIChp
LmUuIE11bHRpLWlubm8gbWkwMjgzcXQgb3IgQWRhZnJ1aXQgeXgyNDBxdjI5IGFyZSBub3Qgc3Vw
cG9ydGVkIGJ5IHRoaXMgZHJpdmVyKS4KPiBUaGUgU1BJIGRhdGEgbW9kZSBpcyBuYXR1cmFsbHkg
bXVjaCBzbG93ZXIgdGhhbiB0aGUgcGFyYWxsZWwgUkdCIG1vZGUuCj4gCj4gR2VuZXJhbCBub3Rl
IG9uIERpc3BsYXlUZWNoIERUMDI0Q1RGVCBwYW5lbDoKPiBUaGUgcGFuZWwgc3VwcG9ydHMgZGlm
ZmVyZW50IGNvbmZpZ3VhdGlvbiBvcHRpb25zICgxOC8xNi82LWJpdCBSR0Igb3IgOS84LWJpdCBT
UEkpIGRlcGVuZGluZyBvbiB0aGUgSU1bMDozXSB3aXJpbmcuCj4gVG8ga2VlcCB0aGlzIHBhdGNo
IHNtYWxsIGZvciByZXZlaXcsIGF0IHRoZSBtb21lbnQgb25seSAxOC1iaXQgUkdCIG1vZGUgYW5k
IDgtYml0IFNQSSB3aXRoIERhdGEvQ29tbWFuZCBHUElPCj4gaXMgc3VwcG9ydGVkIGJ5IHRoaXMg
ZHJpdmVyLgo+IAo+IAo+IEkga2luZGx5IGFzayB5b3UgZm9yIGEgcGF0Y2ggcmV2aWV3LgpEaWQg
eW91IGdldCBhcm91bmQgdG8gc2VuZCBhIHYyIG9mIHRoaXMgcGF0Y2hzZXQ/CgoJU2FtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
