Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780D16A22
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF486E822;
	Tue,  7 May 2019 18:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0DB6E822
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 18:27:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 31EC0803C6;
 Tue,  7 May 2019 20:27:14 +0200 (CEST)
Date: Tue, 7 May 2019 20:27:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Claudiu.Beznea@microchip.com, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Message-ID: <20190507182713.GA16862@ravnborg.org>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=KFo_gGakGootahdhYqwA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 bbrezillon@kernel.org, airlied@linux.ie, Nicolas.Ferre@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, thierry.reding@gmail.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeS4KCj4gICBwd206IGF0bWVsLWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FN
OVg2MCBITENEQydzIFBXTQpPSyB0byBhZGQgdGhlICJwd206IGF0bWVsLWhsY2RjOiBhZGQgY29t
cGF0aWJsZSBmb3IgU0FNOVg2MCBITENEQydzIFBXTSIKcGF0Y2ggdmlhIGRybS1taXNjPwpUaGVu
IHdlIGNhbiBhZGQgYWxsIDYgcGF0Y2hlcyBpbiBvbmUgZ28uCgoJU2FtCgooS2VwdCByZW1haW5p
bmcgb2YgbWFpbCBmb3IgcmVmZXJlbmNlKQo+IAo+IEhpLAo+IAo+IFRoZXNlIHBhdGNoZXMgYWRk
cyBzdXBwb3J0IGZvciBTQU05WDYwJ3MgTENEIGNvbnRyb2xsZXIuCj4gCj4gRmlyc3QgcGF0Y2hl
cyBhZGQgb3B0aW9uIHRvIHNwZWNpZnkgaWYgY29udHJvbGxlciBjbG9jayBzb3VyY2UgaXMgZml4
ZWQuCj4gU2Vjb25kIHBhdGNoIGF2b2lkIGEgdmFyaWFibGUgaW5pdGlhbGl6YXRpb24gaW4gYXRt
ZWxfaGxjZGNfY3J0Y19tb2RlX3NldF9ub2ZiKCkuCj4gVGhlIDNyZCBhZGQgY29tcGF0aWJsZXMg
aW4gcHdtLWF0bWVsLWhsY2RjIGRyaXZlci4KPiBUaGUgNHRoIHBhdGNoIGVuYWJsZXMgc3lzX2Ns
ayBpbiBwcm9iZSBzaW5jZSBTQU05WDYwIG5lZWRzIHRoaXMuCj4gU3BlY2lmaWMgc3VwcG9ydCB3
YXMgYWRkZWQgYWxzbyBpbiBzdXNwZW5kL3Jlc3VtZSBob29rcy4KPiBUaGUgNXRoIHBhdGNoIGFk
ZHMgU0FNOVg2MCdzIExDRCBjb25maWd1cmF0aW9uIGFuZCBlbmFibGVkIGl0Lgo+IAo+IEkgdG9v
ayB0aGUgY2hhbmdlcyBvZiB0aGlzIHNlcmllcyBhbmQgaW50cm9kdWNlZCBhbHNvIGEgZml4Cj4g
KHRoaXMgaXMgdGhlIDZ0aCBwYXRjaCBpbiB0aGlzIHNlcmllcykgLSBpZiB5b3Ugd2FudCB0byBz
ZW5kIGl0IHNlcGFyYXRlbHkKPiBJIHdvdWxkIGdsYWRseSBkbyBpdC4KPiAKPiBJIHJlc2VuZCB0
aGlzIHRvIGFsc28gaW5jbHVkZSBMZWUgSm9uZXMgZm9yIHB3bS1hdG1lbC1obGNkYyBjaGFuZ2Vz
Lgo+IAo+IFRoYW5rIHlvdSwKPiBDbGF1ZGl1IEJlem5lYQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4g
LSBrZWVwIGNvbXBhdGlibGUgc3RyaW5nIG9uIHBhdGNoIDMvNiBvbiBhIHNpbmdsZSBsaW5lIChJ
IGtlZXAgaGVyZSBhIHRhYgo+ICAgaW4gZnJvbnQgb2YgIi5jb21wYXRpYmxlIiB0byBiZSBhbGln
bmVkIHdpdGggdGhlIHJlc3Qgb2YgdGhlIGNvZGUgaW4KPiAgIGF0bWVsX2hsY2RjX2R0X2lkc1td
KQo+IC0gcGF0Y2hlcyA0LzcgYW5kIDMvNyBmcm9tIHYyIHdlcmUgYXBwbGllZCBzbyByZW1vdmUg
dGhlbSBmcm9tIHRoaXMgdmVyc2lvbgo+IC0gYWRkIGEgZml4IGZvciBhdG1lbF9obGNkYyAocGF0
Y2ggNi82KQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSB1c2UgInwiIG9wZXJhdG9yIGluIHBhdGNo
IDEvNyB0byBzZXQgQVRNRUxfSExDRENfQ0xLU0VMIG9uIGNmZwo+IC0gY29sbGVjdCBBY2tlZC1i
eSwgUmV2aWV3ZWQtYnkgdGFncwo+IAo+IENsYXVkaXUgQmV6bmVhICg0KToKPiAgIGRybTogYXRt
ZWwtaGxjZGM6IGFkZCBjb25maWcgb3B0aW9uIGZvciBjbG9jayBzZWxlY3Rpb24KPiAgIGRybTog
YXRtZWwtaGxjZGM6IGF2b2lkIGluaXRpYWxpemluZyBjZmcgd2l0aCB6ZXJvCj4gICBwd206IGF0
bWVsLWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FNOVg2MCBITENEQydzIFBXTQo+ICAgZHJt
L2F0bWVsLWhjbGNkYzogcmV2ZXJ0IHNoaWZ0IGJ5IDgKPiAKPiBTYW5kZWVwIFNoZXJpa2VyIE1h
bGxpa2FyanVuICgyKToKPiAgIGRybTogYXRtZWwtaGxjZGM6IGVuYWJsZSBzeXNfY2xrIGR1cmlu
ZyBpbml0YWxpemF0aW9uLgo+ICAgZHJtOiBhdG1lbC1obGNkYzogYWRkIHNhbTl4NjAgTENEIGNv
bnRyb2xsZXIKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2Ny
dGMuYyAgfCAgMTggKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfZGMuYyAgICB8IDEyMCArKysrKysrKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVycy9ncHUv
ZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmggICAgfCAgIDIgKwo+ICBkcml2ZXJzL2dw
dS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyB8ICAgMiArLQo+ICBkcml2ZXJz
L3B3bS9wd20tYXRtZWwtaGxjZGMuYyAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIDUgZmls
ZXMgY2hhbmdlZCwgMTMyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+
IDIuNy40Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
