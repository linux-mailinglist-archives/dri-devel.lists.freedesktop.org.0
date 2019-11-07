Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D525F2572
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 03:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533C46EE73;
	Thu,  7 Nov 2019 02:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4706EE73
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 02:31:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48B3329;
 Thu,  7 Nov 2019 03:31:16 +0100 (CET)
Date: Thu, 7 Nov 2019 04:31:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/3] drm: rcar-du: Recognize "renesas,vsps" in addition
 to "vsps"
Message-ID: <20191107023107.GL4878@pendragon.ideasonboard.com>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573093876;
 bh=FaOsKKRqnjdtla6VGKZJ8ZS4dIrIKm/aqwfxO6NMUPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zma5HXTvfEZD2d3ccsp1M/Ut7eHpZ4XYsLZCzr+LB7p0O0QSW3O48TmeQcbxOFNPg
 hYBd5kErlXe7Uvoe0W7d3ISyyYhmULWrZ4oa94h0Cvg7TaaKj6zEMAvmDOcaYUjmuZ
 YLksRHT4WkT34bpf/VR/UefkGzu2XbTvDieRHKcc=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgTm92IDA1LCAyMDE5
IGF0IDA3OjM1OjAzUE0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBUaGUgUmVu
ZXNhcy1zcGVjaWZpYyAidnNwcyIgcHJvcGVydHkgbGFja3MgYSB2ZW5kb3IgcHJlZml4Lgo+IEFk
ZCBhICJyZW5lc2FzLCIgcHJlZml4IHRvIGNvbXBseSB3aXRoIERUIGJlc3QgcHJhY3Rpc2VzLgo+
IFJldGFpbiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkIERUQnMgYnkgZmFsbGluZyBi
YWNrIHRvICJ2c3BzIgo+IHdoZW4gbmVlZGVkLgo+IAo+IEZpeGVzOiA2ZDYyZWYzYWMzMGJlNzU2
ICgiZHJtOiByY2FyLWR1OiBFeHBvc2UgdGhlIFZTUDEgY29tcG9zaXRvciB0aHJvdWdoIEtNUyBw
bGFuZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+CgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPgoKYW5kIHRha2VuIGluIG15IHRyZWUgKHdpdGggYSBzbWFs
bCBjaGFuZ2UgYmVsb3cpLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9rbXMuYyB8IDE3ICsrKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9rbXMuYwo+IGluZGV4IDE4NjQyMmFjNTUyYjI4NzAuLmIxNDY3NmY3YTlmMTc1MDEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiBAQCAtNTQ0LDYgKzU0NCw3IEBA
IHN0YXRpYyBpbnQgcmNhcl9kdV9wcm9wZXJ0aWVzX2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNl
ICpyY2R1KQo+ICBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0KHN0cnVjdCByY2FyX2R1X2Rl
dmljZSAqcmNkdSkKPiAgewo+ICAJY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCA9IHJjZHUt
PmRldi0+b2Zfbm9kZTsKPiArCWNvbnN0IGNoYXIgKnZzcHNfcHJvcF9uYW1lID0gInJlbmVzYXMs
dnNwcyI7Cj4gIAlzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIGFyZ3M7Cj4gIAlzdHJ1Y3Qgewo+ICAJ
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4gQEAgLTU1OSwxNSArNTYwLDIxIEBAIHN0YXRpYyBp
bnQgcmNhcl9kdV92c3BzX2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNlICpyY2R1KQo+ICAJICog
ZW50cnkgY29udGFpbnMgYSBwb2ludGVyIHRvIHRoZSBWU1AgRFQgbm9kZSBhbmQgYSBiaXRtYXNr
IG9mIHRoZQo+ICAJICogY29ubmVjdGVkIERVIENSVENzLgo+ICAJICovCj4gLQljZWxscyA9IG9m
X3Byb3BlcnR5X2NvdW50X3UzMl9lbGVtcyhucCwgInZzcHMiKSAvIHJjZHUtPm51bV9jcnRjcyAt
IDE7Cj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobnAsIHZzcHNfcHJvcF9u
YW1lKTsKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJLyogQmFja3dhcmQgY29tcGF0aWJpbGl0eSB3
aXRoIG9sZCBEVEJzICovCgpzL0RUQnMvRFRCcy4vCgo+ICsJCXZzcHNfcHJvcF9uYW1lID0gInZz
cHMiOwo+ICsJCXJldCA9IG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVtcyhucCwgdnNwc19wcm9w
X25hbWUpOwo+ICsJfQo+ICsJY2VsbHMgPSByZXQgLyByY2R1LT5udW1fY3J0Y3MgLSAxOwo+ICAJ
aWYgKGNlbGxzID4gMSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gIAlmb3IgKGkgPSAwOyBp
IDwgcmNkdS0+bnVtX2NydGNzOyArK2kpIHsKPiAgCQl1bnNpZ25lZCBpbnQgajsKPiAgCj4gLQkJ
cmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2ZpeGVkX2FyZ3MobnAsICJ2c3BzIiwgY2VsbHMs
IGksCj4gLQkJCQkJCSAgICAgICAmYXJncyk7Cj4gKwkJcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93
aXRoX2ZpeGVkX2FyZ3MobnAsIHZzcHNfcHJvcF9uYW1lLAo+ICsJCQkJCQkgICAgICAgY2VsbHMs
IGksICZhcmdzKTsKPiAgCQlpZiAocmV0IDwgMCkKPiAgCQkJZ290byBlcnJvcjsKPiAgCj4gQEAg
LTU4OSw4ICs1OTYsOCBAQCBzdGF0aWMgaW50IHJjYXJfZHVfdnNwc19pbml0KHN0cnVjdCByY2Fy
X2R1X2RldmljZSAqcmNkdSkKPiAgCj4gIAkJLyoKPiAgCQkgKiBTdG9yZSB0aGUgVlNQIHBvaW50
ZXIgYW5kIHBpcGUgaW5kZXggaW4gdGhlIENSVEMuIElmIHRoZQo+IC0JCSAqIHNlY29uZCBjZWxs
IG9mIHRoZSAndnNwcycgc3BlY2lmaWVyIGlzbid0IHByZXNlbnQsIGRlZmF1bHQKPiAtCQkgKiB0
byAwIHRvIHJlbWFpbiBjb21wYXRpYmxlIHdpdGggb2xkZXIgRFQgYmluZGluZ3MuCj4gKwkJICog
c2Vjb25kIGNlbGwgb2YgdGhlICdyZW5lc2FzLHZzcHMnIHNwZWNpZmllciBpc24ndCBwcmVzZW50
LAo+ICsJCSAqIGRlZmF1bHQgdG8gMCB0byByZW1haW4gY29tcGF0aWJsZSB3aXRoIG9sZGVyIERU
IGJpbmRpbmdzLgo+ICAJCSAqLwo+ICAJCXJjZHUtPmNydGNzW2ldLnZzcCA9ICZyY2R1LT52c3Bz
W2pdOwo+ICAJCXJjZHUtPmNydGNzW2ldLnZzcF9waXBlID0gY2VsbHMgPj0gMSA/IGFyZ3MuYXJn
c1swXSA6IDA7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
