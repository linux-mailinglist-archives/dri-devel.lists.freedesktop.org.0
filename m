Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0BB5B203
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 23:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F7F89A20;
	Sun, 30 Jun 2019 21:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D76898C2;
 Sun, 30 Jun 2019 21:15:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA314255;
 Sun, 30 Jun 2019 23:15:39 +0200 (CEST)
Date: Mon, 1 Jul 2019 00:15:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/4] drm+dt+efi: support devices with multiple possible
 panels
Message-ID: <20190630211520.GI7043@pendragon.ideasonboard.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630204723.GH7043@pendragon.ideasonboard.com>
 <CAF6AEGvA-wVyC4jJC-nZU-pdVH=KYtye9twDgup-Nq0C_+wtvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGvA-wVyC4jJC-nZU-pdVH=KYtye9twDgup-Nq0C_+wtvQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561929339;
 bh=ovOJRUKGuB0B+RSWGOmJMUYTVzj7mL2ayN8AUFBIu2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldGx5vNtc4yCQQ3gLtoRrO/n97/UY5ZnZY0gcotp7JbPSLEKnMpadMMqg4DOCCtFl
 ewsfEDLY2skIB00hNAYBILOQA1protB2QAXohQvEfNBr1sLNZA2J1B6FWeGmcFBEjM
 sFLPtc7yAgk3wIcQfJKSdood9wFvscQcwYcx8eCk=
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 "open list:EXTENSIBLE FIRMWARE INTERFACE \(EFI\)"
 <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Julien Thierry <julien.thierry@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>,
 Steve Capper <steve.capper@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDI6MDU6MjFQTSAtMDcwMCwgUm9iIENs
YXJrIHdyb3RlOgo+IE9uIFN1biwgSnVuIDMwLCAyMDE5IGF0IDE6NDcgUE0gTGF1cmVudCBQaW5j
aGFydCB3cm90ZToKPiA+IE9uIFN1biwgSnVuIDMwLCAyMDE5IGF0IDAxOjM2OjA0UE0gLTA3MDAs
IFJvYiBDbGFyayB3cm90ZToKPiA+ID4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+ID4gPgo+ID4gPiBOb3cgdGhhdCB3ZSBjYW4gZGVhbCBncmFjZWZ1bGx5IHdpdGgg
Ym9vdGxvYWRlciAoZmlybXdhcmUpIGluaXRpYWxpemVkCj4gPiA+IGRpc3BsYXkgb24gYWFyY2g2
NCBsYXB0b3BzWzFdLCB0aGUgbmV4dCBzdGVwIGlzIHRvIGRlYWwgd2l0aCB0aGUgZmFjdAo+ID4g
PiB0aGF0IHRoZSBzYW1lIG1vZGVsIG9mIGxhcHRvcCBjYW4gaGF2ZSBvbmUgb2YgbXVsdGlwbGUg
ZGlmZmVyZW50IHBhbmVscy4KPiA+ID4gKEZvciB0aGUgeW9nYSBjNjMwIHRoYXQgSSBoYXZlLCBJ
IGtub3cgb2YgYXQgbGVhc3QgdHdvIHBvc3NpYmxlIHBhbmVscywKPiA+ID4gdGhlcmUgbWlnaHQg
YmUgYSB0aGlyZC4pCj4gPgo+ID4gSSBoYXZlIHRvIGFzayB0aGUgb2J2aW91cyBxdWVzdGlvbjog
d2h5IGRvZXNuJ3QgdGhlIGJvb3QgbG9hZGVyIGp1c3QKPiA+IHBhc3MgYSBjb3JyZWN0IERUIHRv
IExpbnV4ID8gVGhlcmUncyBubyBwb2ludCBpbiBwYXNzaW5nIGEgbGlzdCBvZgo+ID4gcGFuZWxz
IHRoYXQgYXJlIG5vdCB0aGVyZSwgdGhpcyBzZWVtcyBxdWl0ZSBhIGJpZyBoYWNrIHRvIG1lLiBB
IHByb3Blcgo+ID4gYm9vdCBsb2FkZXIgc2hvdWxkIGNvbnN0cnVjdCB0aGUgRFQgYmFzZWQgb24g
aGFyZHdhcmUgZGV0ZWN0aW9uLgo+IAo+IEhpIExhdXJlbnQsCj4gCj4gQWN0dWFsbHkgdGhlIGJv
b3Rsb2FkZXIgb24gdGhlc2UgZGV2aWNlcyBpcyBwYXNzaW5nICpubyogZHQgKHRoZXkgYm9vdAo+
IEFDUEksIHdlIGFyZSBsb2FkaW5nIGR0YiBmcm9tIGdydWIgY3VycmVudGx5KQoKQWgsIHRoZSBi
cm9rZW4gcHJvbWlzZXMgb2YgQUNQSSBvbiBBUk02NC4gSSB3b25kZXIgaG93IGxvbmcgaXQgd2ls
bCB0YWtlCmJlZm9yZSBhIHB1YmxpYyBhY2tub3dsZWRnZW1lbnQgdGhhdCBpdCB3YXMgYSBiYWQg
aWRlYS4gQmFkIGlkZWFzIGhhcHBlbgphbmQgY2FuIGJlIGZvcmdpdmVuLCBidXQgc3R1YmJvcm5l
c3MgaW4gY2xhaW1pbmcgaXQgd2FzIHRoZSByaWdodApkZWNpc2lvbiBpcyBhbm90aGVyIHN0b3J5
LgoKKE5vdCB0aGF0IHlvdSBjYW4gYmUgYmxhbWVkIGZvciB0aGlzIG9mIGNvdXJzZSA6LSkpCgo+
IEkgdGhpbmsgbm9ybWFsbHkgYSBkZXZpY2UgYnVpbHQgdy8gZHQgaW4gbWluZCB3b3VsZCBwb3B1
bGF0ZQo+IC9jaG9zZW4vcGFuZWwtaWQgZGlyZWN0bHkgKHJhdGhlciB0aGFuIHRoZSB3YXkgaXQg
aXMgY3VycmVudGx5Cj4gcG9wdWxhdGVkIGJhc2VkIG9uIHJlYWRpbmcgYW4gZWZpIHZhcmlhYmxl
IHByaW9yIHRvIEV4aXRCb290U2VydmljZXMpLgo+IEJ1dCB0aGF0IGlzIGNvbnNpZGVyYWJseSBl
YXNpZXIgYXNrIHRoYW4gaGF2aW5nIGl0IHJlLXdyaXRlIG9mX2dyYXBoCj4gYmluZGluZ3MuIEVp
dGhlciB3YXksIHdlIGFyZW4ndCBpbiBjb250cm9sIG9mIHRoZSBib290bG9hZGVyIG9uIHRoZXNl
Cj4gZGV2aWNlcywKCklmIHlvdSBjYW4ndCBjb250cm9sIHRoZSBpbml0aWFsIGJvb3QgbG9hZGVy
LCB0aGVuIEkgc2VlIHR3byBvcHRpb25zLApub25lIG9mIHdoaWNoIHlvdSB3aWxsIGxpa2UgSSdt
IGFmcmFpZC4KCi0gQXMgeW91IHBhc3MgdGhlIERUIHRvIExpbnV4IGZyb20gZ3J1YiwgdGhlcmUn
cyB5b3VyIGludGVybWVkaWF0ZSBib290CiAgbG9hZGVyIHdoZXJlIHlvdSBjYW4gY29uc3RydWN0
IGEgdmFsaWQgRFQuCgotIElmIHRoZSBBQ1BJIGN1bHQgbmVlZHMgdG8gYmUgdmVuZXJhdGVkLCB0
aGVuIGRyaXZlcnMgc2hvdWxkIGJlCiAgY29udmVydGVkIHRvIHN1cHBvcnQgQUNQSSB3aXRob3V0
IHRoZSBuZWVkIGZvciBEVC4KCkEgcG9zc2libGUgYSBtaWRkbGVncm91bmQgY291bGQgYmUgYSBw
bGF0Zm9ybSBkcml2ZXIgKGluCmRyaXZlcnMvZmlybXdhcmUvZWZpLyA/IGluIGRyaXZlcnMvcGxh
dGZvcm0vID8pIHRoYXQgd2lsbCBwYXRjaCB0aGUgRFQKdG8gaW5zdGFudGlhdGUgdGhlIHJpZ2h0
IHBhbmVsIGJhc2VkIG9uIHRoZSBpbmZvcm1hdGlvbiByZXRyaWV2ZWQgZnJvbQp0aGUgYm9vdCBs
b2FkZXIuIFdlIHdpbGwgbmVlZCBzb21ldGhpbmcgc2ltaWxhciBmb3IgdGhlIEludGVsIElQVTMK
Y2FtZXJhIGRyaXZlciwgYXMgSW50ZWwgZGVjaWRlZCB0byBjb21lIHVwIHdpdGggdHdvIGRpZmZl
cmVudCBBQ1BJCiJiaW5kaW5ncyIsIG9uZSBmb3IgV2luZG93cyBhbmQgb25lIGZvciBDaHJvbWUg
T1MsIGxlYXZpbmcgV2luZG93cwptYWNoaW5lIGltcG9zc2libGUgdG8gaGFuZGxlIGZyb20gYSBr
ZXJuZWwgZHJpdmVyIGR1ZSB0byByZXF1aXJlZAppbmZvcm1hdGlvbiBiZWluZyBoYXJkY29kZWQg
aW4gV2luZG93cyBkcml2ZXJzIHNoaXBwZWQgYnkgSW50ZWwuIFRoaXMgaXMKdGh1cyBhbiBvcHRp
b24gdGhhdCBtYXkgKHVuZm9ydHVuYXRlbHkpIG5lZWQgdG8gYmVjb21lIG1vcmUgd2lkZXNwcmVh
ZApmb3IgQUNQSS1iYXNlZCBzeXN0ZW1zLgoKPiBzbyBpdCBpcyBhIG1hdHRlciBvZiBjb21pbmcg
dXAgd2l0aCBzb21ldGhpbmcgdGhhdCB3b3JrcyBvbiBhY3R1YWwgaHcKPiB0aGF0IHdlIGRvbid0
IGxpa2UgcmF0aGVyIHRoYW4gaWRlYWxpemVkIGh3IHRoYXQgd2UgZG9uJ3QgaGF2ZSA7LSkKClRo
YXQgZG9lc24ndCBob3dldmVyIGp1c3RpZnkgbm90IGdvaW5nIGZvciB0aGUgYmVzdCBzb2x1dGlv
biB3ZSBjYW4KYWNoaWV2ZS4gV2hhdCBkbyB5b3UgbGlrZSBiZXN0IGluIHRoZSBhYm92ZSA/IDot
KQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
