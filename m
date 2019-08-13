Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCD8E6EB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8C6E8EE;
	Thu, 15 Aug 2019 08:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8DA6E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:43:46 +0000 (UTC)
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531]
 ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
 by smtp-cloud8.xs4all.net with ESMTPA
 id xVDJhL1FBqTdhxVDMh9SIg; Tue, 13 Aug 2019 13:43:45 +0200
Subject: Re: [PATCH] drm/bridge: dw-hdmi: move cec PA invalidation to
 dw_hdmi_setup_rx_sense()
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Message-ID: <c05b6989-a2a2-e728-7fef-3342b14fa655@xs4all.nl>
Date: Tue, 13 Aug 2019 13:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <6099ff8a-e708-e466-5877-07c9102513f8@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCfBj3n1jiC7g/yEvfloDkQZ47sgqu4BIQ1dE8mdh/f1LEtJ/cKK1eRFwim1wIi1ATBGrF9wZJgXxLmtTq+yKHPPLdzUbflWH0MXLnQKnQSWjyLFlabu
 NTNn360cBVtujfi2XKidkCY6n8EjdRP4sa0/frbl9IiWv8O5NR9H1ouOkhfkv9+OVRtjpmaWDJ60DbTaVgoOjQ70g/n6jvI5d5Hwu+pDXOgd72CoUmuE/6zn
 8copieRApT+aCUdtTTdu9nWPko84jCKc2K5ovbNARCPFJ4cjazjk/xaSHubgDur+4Op5z1DtVg5r4/T0KNDmSdRfv0DjwKG0zA4+ra6B7nbRCffwpVmEbbwd
 C4R0t7wzcb2t28eGCNLm6mmynOw4EqwN7cLDdPXR2IpyueKlGz1VevIZBTHoXs4HP50rcBR98gHWhzp+S/MY2ipyQIv53bD7GbEqZ2z/kgL1VWel/3X4n7js
 QaSlxhSJprssmVstsVQVe1r/+6b0icC/pXG8Nz1RXoHtADxSaEyeQLm4b9c=
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xMy8xOSAxMTozMiBBTSwgSGFucyBWZXJrdWlsIHdyb3RlOgo+IFdoZW4gdGVzdGluZyBD
RUMgb24gdGhlIEFNTC1TOTA1WC1DQyBib2FyZCBJIG5vdGljZWQgdGhhdCB0aGUgQ0VDIHBoeXNp
Y2FsCj4gYWRkcmVzcyB3YXMgbm90IGludmFsaWRhdGVkIHdoZW4gdGhlIEhETUkgY2FibGUgd2Fz
IHVucGx1Z2dlZC4gU29tZSBtb3JlCj4gZGlnZ2luZyBzaG93ZWQgdGhhdCBtZXNvbiB1c2VzIG1l
c29uX2R3X2hkbWkuYyB0byBoYW5kbGUgdGhlIEhQRC4KPiAKPiBCb3RoIGR3X2hkbWlfaXJxKCkg
YW5kIGR3X2hkbWlfdG9wX3RocmVhZF9pcnEoKSAoaW4gbWVzb25fZHdfaGRtaS5jKSBjYWxsCj4g
dGhlIGR3X2hkbWlfc2V0dXBfcnhfc2Vuc2UoKSBmdW5jdGlvbi4gU28gbW92ZSB0aGUgY29kZSB0
byBpbnZhbGlkYXRlIHRoZQo+IENFQyBwaHlzaWNhbCBhZGRyZXNzIHRvIHRoYXQgZnVuY3Rpb24s
IHNvIHRoYXQgaXQgaXMgaW5kZXBlbmRlbnQgb2Ygd2hlcmUKPiB0aGUgSFBEIGludGVycnVwdCBo
YXBwZW5zLgo+IAo+IFRlc3RlZCB3aXRoIGJvdGggYSBBTUwtUzkwNVgtQ0MgYW5kIGEgS2hhZGFz
IFZJTTIgYm9hcmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+CgpQbGVhc2UgZGlzcmVnYXJkIHRoaXMgcGF0Y2gsIEpvbmFzIEthcmxt
YW4gd2lsbCBwb3N0IGEgZGlmZmVyZW50IHNlcmllcwp3aGljaCB3aWxsIGZpeCB0aGlzIGluIGEg
ZGlmZmVyZW50IHdheS4KClJlZ2FyZHMsCgoJSGFucwoKPiAtLS0KPiBOb3RlOiBhbiBhbHRlcm5h
dGl2ZSB3b3VsZCBiZSB0byBtYWtlIGEgbmV3IGR3LWhkbWkgZnVuY3Rpb24gc3VjaCBhcwo+IGR3
X2hkbWlfY2VjX3BoeXNfYWRkcl9pbnZhbGlkYXRlKCkgdGhhdCBpcyBjYWxsZWQgZnJvbSBtZXNv
bl9kd19oZG1pLmMuCj4gSSBkZWNpZGVkIG5vdCB0byBkbyB0aGF0IHNpbmNlIHRoaXMgcGF0Y2gg
aXMgbWluaW1hbGx5IGludmFzaXZlLCBidXQKPiB0aGF0IGNhbiBvYnZpb3VzbHkgYmUgY2hhbmdl
ZCBpZiB0aGF0IGFwcHJvYWNoIGlzIHByZWZlcnJlZC4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IGM1YTg1NGFmNTRmOC4uZTg5OWIzMWUx
NDMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBA
QCAtMjMyOSw2ICsyMzI5LDEzIEBAIHZvaWQgZHdfaGRtaV9zZXR1cF9yeF9zZW5zZShzdHJ1Y3Qg
ZHdfaGRtaSAqaGRtaSwgYm9vbCBocGQsIGJvb2wgcnhfc2Vuc2UpCj4gIAkJZHdfaGRtaV91cGRh
dGVfcG93ZXIoaGRtaSk7Cj4gIAkJZHdfaGRtaV91cGRhdGVfcGh5X21hc2soaGRtaSk7Cj4gIAl9
Cj4gKwlpZiAoIWhwZCAmJiAhcnhfc2Vuc2UpIHsKPiArCQlzdHJ1Y3QgY2VjX25vdGlmaWVyICpu
b3RpZmllciA9IFJFQURfT05DRShoZG1pLT5jZWNfbm90aWZpZXIpOwo+ICsKPiArCQlpZiAobm90
aWZpZXIpCj4gKwkJCWNlY19ub3RpZmllcl9waHlzX2FkZHJfaW52YWxpZGF0ZShub3RpZmllcik7
Cj4gKwl9Cj4gKwo+ICAJbXV0ZXhfdW5sb2NrKCZoZG1pLT5tdXRleCk7Cj4gIH0KPiAgRVhQT1JU
X1NZTUJPTF9HUEwoZHdfaGRtaV9zZXR1cF9yeF9zZW5zZSk7Cj4gQEAgLTIzNjksMTQgKzIzNzYs
NiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdfaGRtaV9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lk
KQo+ICAJCWR3X2hkbWlfc2V0dXBfcnhfc2Vuc2UoaGRtaSwKPiAgCQkJCSAgICAgICBwaHlfc3Rh
dCAmIEhETUlfUEhZX0hQRCwKPiAgCQkJCSAgICAgICBwaHlfc3RhdCAmIEhETUlfUEhZX1JYX1NF
TlNFKTsKPiAtCj4gLQkJaWYgKChwaHlfc3RhdCAmIChIRE1JX1BIWV9SWF9TRU5TRSB8IEhETUlf
UEhZX0hQRCkpID09IDApIHsKPiAtCQkJc3RydWN0IGNlY19ub3RpZmllciAqbm90aWZpZXI7Cj4g
LQo+IC0JCQlub3RpZmllciA9IFJFQURfT05DRShoZG1pLT5jZWNfbm90aWZpZXIpOwo+IC0JCQlp
ZiAobm90aWZpZXIpCj4gLQkJCQljZWNfbm90aWZpZXJfcGh5c19hZGRyX2ludmFsaWRhdGUobm90
aWZpZXIpOwo+IC0JCX0KPiAgCX0KPiAKPiAgCWlmIChpbnRyX3N0YXQgJiBIRE1JX0lIX1BIWV9T
VEFUMF9IUEQpIHsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
