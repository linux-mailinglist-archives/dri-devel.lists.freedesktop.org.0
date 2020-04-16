Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB01AD141
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F7E6EB66;
	Thu, 16 Apr 2020 20:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156F96EB66
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:37:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B65CA2002B;
 Thu, 16 Apr 2020 22:37:55 +0200 (CEST)
Date: Thu, 16 Apr 2020 22:37:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder bridge
Message-ID: <20200416203749.GA7104@ravnborg.org>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=nEArpEn2Zqm_PZ96XV0A:9 a=QEXdDO2ut3YA:10
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGltaXRyeS4KCk9uIFRodSwgQXByIDE2LCAyMDIwIGF0IDExOjIxOjQwUE0gKzAzMDAsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiAxNi4wNC4yMDIwIDIxOjUyLCBEbWl0cnkgT3NpcGVua28g
0L/QuNGI0LXRgjoKPiAuLi4KPiA+PiBNYXkgSSBhbHNvIHJlY29tbWVuZCBzd2l0Y2hpbmcgdG8g
dGhlIERSTSBwYW5lbCBicmlkZ2UgaGVscGVyID8gSXQgd2lsbAo+ID4+IHNpbXBsaWZ5IHRoZSBj
b2RlLgo+ID4gCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgd2hhdCBpcyB0aGUgIkRSTSBw
YW5lbCBicmlkZ2UgaGVscGVyIj8KPiA+IAo+ID4gSSB0aGluayB3ZSB3b24ndCBuZWVkIGFueSBh
ZGRpdGlvbmFsIGhlbHBlcnMgYWZ0ZXIgc3dpdGNoaW5nIHRvIHRoZQo+ID4gYnJpZGdlIGNvbm5l
Y3RvciBoZWxwZXIsIG5vPwo+IAo+IEFjdHVhbGx5LCBJIG5vdyBzZWUgdGhhdCB0aGUgcGFuZWwg
bmVlZHMgdG8gYmUgbWFudWFsbHkgYXR0YWNoZWQgdG8gdGhlCj4gY29ubmVjdG9yLgo+IAo+IFN0
aWxsIGl0J3Mgbm90IGFwcGFyZW50IHRvIG1lIGhvdyB0byBnZXQgcGFuZWwgb3V0IG9mIHRoZSBi
cmlkZ2UuIEl0Cj4gbG9va3MgbGlrZSB0aGVyZSBpcyBubyBzdWNoICJwYW5lbCBoZWxwZXIiIGZv
ciB0aGUgYnJpZGdlIEFQSSBvciBJIGp1c3QKPiBjYW4ndCBmaW5kIGl0LgoKVGFrZSBhIGxvb2sg
aW4gYnJpZGdlL3BhbmVsLmMKSSB0aGluayBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkKCkgaXMg
d2hhdCB5b3UgYXJlIGFmdGVyLgoKCVNhbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
