Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7432034A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1E28922F;
	Thu, 16 May 2019 10:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A948922F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:18:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11F4B320;
 Thu, 16 May 2019 12:18:16 +0200 (CEST)
Date: Thu, 16 May 2019 13:18:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Add hooks for suspend/resume
Message-ID: <20190516101800.GE4995@pendragon.ideasonboard.com>
References: <20190502223808.185180-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502223808.185180-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558001896;
 bh=kzLY4Yw2M9JQvyUjiZQ70U/NxQtmDWpBcjhnf9P1Tyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liOxQDvXOnnTBSiSw2xxDatXOTMuu8pX37BIJKL1PfVVk2x/0PWXU4b9oAVqte0y6
 l48Kevcm2NYFt2uNwQviKin+IhnczEkkVGqQ3AZPJ2avZwof0/QGI22M4qRTPZThlL
 aHWKaw5JNxLhhk1gBiI9qSRBCfCOlDqqpk9iH7as=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Z2xhcywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBNYXkgMDIsIDIw
MTkgYXQgMDM6Mzg6MDdQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiBPbiBSb2Nr
Y2hpcCByazMyODgtYmFzZWQgQ2hyb21lYm9va3Mgd2hlbiB5b3UgZG8gYSBzdXNwZW5kL3Jlc3Vt
ZQo+IGN5Y2xlOgo+IAo+IDEuIFlvdSBsb3NlIHRoZSBhYmlsaXR5IHRvIGRldGVjdCBhbiBIRE1J
IGRldmljZSBiZWluZyBwbHVnZ2VkIGluLgo+IAo+IDIuIElmIHlvdSdyZSB1c2luZyB0aGUgaTJj
IGJ1cyBidWlsdCBpbiB0byBkd19oZG1pIHRoZW4gaXQgc3RvcHMKPiB3b3JraW5nLgo+IAo+IExl
dCdzIGFkZCBhIGhvb2sgdG8gdGhlIGNvcmUgZHctaGRtaSBkcml2ZXIgc28gdGhhdCB3ZSBjYW4g
Y2FsbCBpdCBpbgo+IGR3X2hkbWktcm9ja2NoaXAgaW4gdGhlIG5leHQgY29tbWl0Lgo+IAo+IE5P
VEU6IHRoZSBleGFjdCBzZXQgb2Ygc3RlcHMgSSd2ZSBkb25lIGhlcmUgaW4gcmVzdW1lIGNvbWUg
ZnJvbQo+IGxvb2tpbmcgYXQgdGhlIG5vcm1hbCBkd19oZG1pIGluaXQgc2VxdWVuY2UgaW4gdXBz
dHJlYW0gTGludXggcGx1cyB0aGUKPiBzZXF1ZW5jZSB0aGF0IHdlIGRpZCBpbiBkb3duc3RyZWFt
IENocm9tZSBPUyAzLjE0LiAgVGVzdGluZyBzaG93IHRoYXQKPiBpdCBzZWVtcyB0byB3b3JrLCBi
dXQgaWYgYW4gZXh0cmEgc3RlcCBpcyBuZWVkZWQgb3Igc29tZXRoaW5nIGhlcmUgaXMKPiBub3Qg
bmVlZGVkIHdlIGNvdWxkIGltcHJvdmUgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBB
bmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IC0tLQo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+
ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8ICAzICsrKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IGRiNzYxMzI5YTFlMy4uNGIzOGJmZDQzZTU5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBAQCAt
Mjc4MCw2ICsyNzgwLDI3IEBAIHZvaWQgZHdfaGRtaV91bmJpbmQoc3RydWN0IGR3X2hkbWkgKmhk
bWkpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV91bmJpbmQpOwo+ICAKPiAraW50
IGR3X2hkbWlfc3VzcGVuZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiArewo+ICsJcmV0dXJuIDA7
Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9zdXNwZW5kKTsKPiArCgpBcyB0aGlz
IGlzIGVtcHR5LCBzaG91bGQgd2UgbGVhdmUgaXQgb3V0ID8gSXQgYWRkcyBhIGJpdCBvZiBibG9h
dCB0byB0aGUKa2VybmVsIGZvciBubyByZWFsIHJlYXNvbiwgYW5kIHdlIGNhbiBhZGQgaXQgbGF0
ZXIgaWYgcmVxdWlyZWQuCgo+ICtpbnQgZHdfaGRtaV9yZXN1bWUoc3RydWN0IGR3X2hkbWkgKmhk
bWkpCj4gK3sKPiArCWluaXRpYWxpemVfaGRtaV9paF9tdXRlcyhoZG1pKTsKPiArCj4gKwlkd19o
ZG1pX3NldHVwX2kyYyhoZG1pKTsKPiArCWlmIChoZG1pLT5pMmMpCj4gKwkJZHdfaGRtaV9pMmNf
aW5pdChoZG1pKTsKPiArCj4gKwlpZiAoaGRtaS0+cGh5Lm9wcy0+c2V0dXBfaHBkKQo+ICsJCWhk
bWktPnBoeS5vcHMtPnNldHVwX2hwZChoZG1pLCBoZG1pLT5waHkuZGF0YSk7Cj4gKwo+ICsJcmV0
dXJuIDA7CgpIb3cgYWJvdXQgcmVmYWN0b3JpbmcgdGhlIHByb2JlIGZ1bmN0aW9uIHRvIGV4dHJh
Y3QgaGFyZHdhcmUKaW5pdGlhbGlzYXRpb24gdG8gYSBzZXBhcmF0ZSBmdW5jdGlvbiwgYW5kIGNh
bGxpbmcgaXQgZnJvbSBoZXJlID8KCj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9y
ZXN1bWUpOwo+ICsKPiAgTU9EVUxFX0FVVEhPUigiU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPiIpOwo+ICBNT0RVTEVfQVVUSE9SKCJBbmR5IFlhbiA8YW5keS55YW5Acm9jay1j
aGlwcy5jb20+Iik7Cj4gIE1PRFVMRV9BVVRIT1IoIllha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBz
LmNvbT4iKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCBiL2lu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmgKPiBpbmRleCA2NmU3MDc3MGNjZTUuLmM0MTMyZTlh
NWFlMyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCj4gKysrIGIv
aW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAo+IEBAIC0xNTQsNiArMTU0LDkgQEAgc3RydWN0
IGR3X2hkbWkgKmR3X2hkbWlfYmluZChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJ
CQkgICAgIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgCQkJICAgICBjb25zdCBzdHJ1
Y3QgZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YSk7Cj4gIAo+ICtpbnQgZHdfaGRtaV9zdXNw
ZW5kKHN0cnVjdCBkd19oZG1pICpoZG1pKTsKPiAraW50IGR3X2hkbWlfcmVzdW1lKHN0cnVjdCBk
d19oZG1pICpoZG1pKTsKPiArCj4gIHZvaWQgZHdfaGRtaV9zZXR1cF9yeF9zZW5zZShzdHJ1Y3Qg
ZHdfaGRtaSAqaGRtaSwgYm9vbCBocGQsIGJvb2wgcnhfc2Vuc2UpOwo+ICAKPiAgdm9pZCBkd19o
ZG1pX3NldF9zYW1wbGVfcmF0ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdW5zaWduZWQgaW50IHJh
dGUpOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
