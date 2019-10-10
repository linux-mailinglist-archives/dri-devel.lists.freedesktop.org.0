Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA856D217D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 09:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28A6EAA9;
	Thu, 10 Oct 2019 07:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Thu, 10 Oct 2019 07:15:15 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DCE6EAA9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:15:15 +0000 (UTC)
Received: from [192.168.178.81] ([109.104.52.46]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MS43X-1igLEY0XON-00TU2J; Thu, 10 Oct 2019 09:09:53 +0200
Subject: Re: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM
 driver instead of firmware."
To: Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren
 <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
References: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
 <26e101ad-8b5b-edef-4437-778bc57ae81f@gmail.com>
 <077547f9-e0ec-29a6-6264-0281dac6b8c8@gmx.net>
 <877621f0-2fbc-55d1-391e-b2ffbce186ac@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <c04a47e7-595c-84e3-fd6f-643d7ba1d0ea@i2se.com>
Date: Thu, 10 Oct 2019 09:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <877621f0-2fbc-55d1-391e-b2ffbce186ac@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:dFSrV1FQvE8GWsU/a/9mLHzLdpVgmO4UByoReHz1faXVC53OIqX
 1FWCfjxvLu65Gnodjy0OINHZdbE2EDJZJlPUT52eiMQbL53KZ1LbHdPh3RT1IBNHffYqd81
 SnnjPsbZHRbz+aDBEBWoECjzflrKrm6J3Gzz99sqIP4jLMKWeQbOk5I63iOiwgd7A4QvGdc
 2+zJvg40xtzJsbjFfw30A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0YP0n4B3wBo=:QLNkNykz4CexeXYVJk4PVb
 8QJ+mFfDKFjjIQEbHeEO9C/y6a3XXV/5xu8Gi3MOrZ3IaDhQqnXaPRiuA2Ay6GokCbj2xMgQV
 4U2wlw3W9MAfau30plA6H8fsrgy02RYr6RyJhoMEFK/fPtk+wXBToqilDmc0732mWjb0s75uB
 y+CnC05WAdc27KZGc5AXV6rjfludcs/1BmBsHdObFLQYH7l6LrpWShkka/+bxko+gZMLPBchk
 Cdds8Eh0ojm24XTnBxIDmdN4UJQ24W3MRRLjOPzjMK8OSOPFXh0VQavxPaXtexkMoG++QYRJE
 bVbWw4xh0ax2g8vMbnkNyoEE8DNczA4WLX8K+0IAYH3lr3x7F2tPm3XgqTWi4KCuwlVYh4i4D
 WqQH65m0O7pPW+w76hXFcx1Xotfu/bsQZ2Rfu3H8BWSb6RlZbmMGvDJi820Ghh0DZBlvVdajB
 AVAb4sXLCOcrtrse1W+nF21P4ntmwJoHNepJ1KIQPRb3aeo/YI4pUFecQnTrq2qg/gRWcTifj
 mmL8kYbeif0lmeVoMj8KD+zvjS+2jkbH2leGB1aornvMe5gJ1SPkQnwpDmEeXh8Led0J/kGD+
 YN4OnmiaiNJvalpShND1Y2A6r3nF2vwH79395efamsQKQDyAS93Z5OJiU19ypVzjuCOpvwTNY
 41oq3H6le4a9md8ScuWtjInJ1Di9T2MKd0BtYbqZ5XsHQJ3n34AZQQuZRpfLTWNuIjDrLshFw
 nMqoneWZb1oINVmjer0N8sEr7XKQitcSEa3BWVFoGKXQxTCXeKT5kiMG8v65D+7H2cAKlVGje
 YfmELk+qq4fHBUizprXrO9tHoTPfMhALN8q+f2MLRbtM6F35GAOQ553utw8kbnFBPYAX33vH7
 a+0m7Z3ty0CS7u7AujDpLUlFQXeaROaCYpupD27+8=
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkuMTAuMTkgMjM6NDIsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4gT24gMTAvOS8xOSAy
OjMzIFBNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+PiBIaSBGbG9yaWFuLAo+Pgo+PiBBbSAyMy4w
OS4xOSB1bSAyMDo1NiBzY2hyaWViIEZsb3JpYW4gRmFpbmVsbGk6Cj4+PiBPbiA5LzgvMjAxOSA4
OjQ0IEFNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+Pj4+IFNpbmNlIHJlbGVhc2Ugb2YgdGhlIG5l
dyBCQ00yODM1IFBNIGRyaXZlciB0aGVyZSBoYXMgYmVlbiBzZXZlcmFsIHJlcG9ydHMKPj4+PiBv
ZiBWM0QgcHJvYmluZyBpc3N1ZXMuIFRoaXMgaXMgY2F1c2VkIGJ5IHRpbWVvdXRzIGR1cmluZyBw
b3dlcmluZy11cCB0aGUKPj4+PiBHUkFGWCBQTSBkb21haW46Cj4+Pj4KPj4+PiAgIGJjbTI4MzUt
cG93ZXI6IFRpbWVvdXQgd2FpdGluZyBmb3IgZ3JhZnggcG93ZXIgT0sKPj4+Pgo+Pj4+IEkgd2Fz
IGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgcmVsaWFibGUgb24gbXkgUmFzcGJlcnJ5IFBpIDNCKyBh
ZnRlciBzZXR0aW5nCj4+Pj4gZm9yY2VfdHVyYm89MSBpbiB0aGUgZmlybXdhcmUgY29uZmlndXJh
dGlvbi4gU2luY2UgdGhlcmUgYXJlIG5vIGlzc3Vlcwo+Pj4+IHVzaW5nIHRoZSBmaXJtd2FyZSBQ
TSBkcml2ZXIgd2l0aCB0aGUgc2FtZSBzZXR1cCwgdGhlcmUgbXVzdCBiZSBhbiBpc3N1ZQo+Pj4+
IGluIHRoZSBCQ00yODM1IFBNIGRyaXZlci4KPj4+Pgo+Pj4+IFVuZm9ydHVuYXRlbHkgdGhlcmUg
aGFzbid0IGJlZW4gbXVjaCBwcm9ncmVzcyBpbiBpZGVudGlmeWluZyB0aGUgcm9vdCBjYXVzZQo+
Pj4+IHNpbmNlIEp1bmUgKG1vc3RseSBpbiB0aGUgbGFjayBvZiBkb2N1bWVudGF0aW9uKSwgc28g
aSBkZWNpZGVkIHRvIHN3aXRjaAo+Pj4+IGJhY2sgdW50aWwgdGhlIGlzc3VlIGluIHRoZSBCQ00y
ODM1IFBNIGRyaXZlciBpcyBmaXhlZC4KPj4+Pgo+Pj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNv
bS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzA0Ngo+Pj4+IEZpeGVzOiBlMWRjMmIyZTFiZWYg
KCIgQVJNOiBiY20yODN4OiBTd2l0Y2ggVjNEIG92ZXIgdG8gdXNpbmcgdGhlIFBNIGRyaXZlciBp
bnN0ZWFkIG9mIGZpcm13YXJlLiIpCj4+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gV2FocmVuIDx3YWhyZW5zdEBnbXgubmV0Pgo+Pj4gQXBw
bGllZCB0byBkZXZpY2V0cmVlL2ZpeGVzLCB0aGFua3MhCj4+IGkgbm90aWNlZCB0aGF0IFggaGFu
Z3Mgd2l0aCByZWNlbnQgUmFzcGJpYW4gYW5kIExpbnV4IDUuNC1yYzIgYWZ0ZXIgdGhpcwo+PiBy
ZXZlcnQgaGFzIGJlZW4gYXBwbGllZC4KPj4KPj4gSXMgdGhlcmUgYSBjaGFuY2UgdG8gZHJvcCB0
aGUgcmV2ZXJ0Pwo+IEkgaGF2ZSBub3Qgc2VudCBhbnl0aGluZyB5ZXQgYXMgSSB3YW50ZWQgdG8g
Z2V0IHNvbWUgdGVzdGluZyBkb25lIG9uCj4gb3RoZXIgcGxhdGZvcm1zLCBzbyB5ZXMsIEkgY2Fu
IGRlZmluaXRpdmVseSBkcm9wIHRoYXQgcGFydGljdWxhciBjaGFuZ2VzCj4gZnJvbSBkZXZpY2V0
cmVlL2ZpeGVzIGFuZCBub3Qgc2VuZCBpdCBmb3IgYSA1LjQtcmMzIHB1bGwgcmVxdWVzdC4gRG9l
cwo+IHRoYXQgd29yayBmb3IgeW91PwoKWWVzLCBkZWZpbml0ZWx5CgpUaGFua3MgU3RlZmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
