Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05C4371D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2B28930E;
	Thu, 13 Jun 2019 14:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9226F8930E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:12:18 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53238
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hbQSe-0001wF-G0; Thu, 13 Jun 2019 16:12:16 +0200
Subject: Re: [PATCH v3 3/6] drm/modes: Allow to specify rotation and
 reflection on the commandline
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <cover.87b91639451f23d4ab68a7c9812f2dd158869025.1555591281.git-series.maxime.ripard@bootlin.com>
 <ba320b3a13c4444102b77c4d00f7c1dc810adc3c.1555591281.git-series.maxime.ripard@bootlin.com>
 <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
 <e2edb1dc-f719-93f0-5205-ecb7b44b057e@tronnes.org>
 <20190611132049.njlrgbtobzgyzyzh@flea>
 <c73e9c29-e20b-65e0-553c-67b9c2cd349a@tronnes.org>
 <20190613125024.46yiiy6zrrqojajy@flea>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <4169c6d9-5a64-8d05-9496-263cd9eda485@tronnes.org>
Date: Thu, 13 Jun 2019 16:12:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613125024.46yiiy6zrrqojajy@flea>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=TllURJwF0yzlmAetrv5/H6la9RuLk/j0Ng57n60foVQ=; 
 b=iPYgktOJ1PCyCbXU9+9+xlRiTRb8R2JauEJkkrkAZgxOooLx7lmx8hsTXNq1CWN1MAboH+DumIXIp6ZoHP/y1QG05Db2iwM1BhUG4I6zt0IiyYMMkL93UQN7XoF3CL78/Ak3O9oih/h52Inf4ZYWP4bxRxLUkdk5vWEQrN3LTilvrPrWvh9CNH6bZkS5BZ3+wyf9JoxSvcisQfrUqwsdxz0EZEZiNI0mpTEsy2b8VIo1WkDavatFFyfALWNaOLtvgOgU4jufFduiAfFuUOn4HLf+yJShjhORoBleYuwkVYijfTSUfyocobUq5QLPVpInC2qUFRngd5UcXh2w6QjmUA==;
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTMuMDYuMjAxOSAxNC41MCwgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBIaSwKPiAKPiBP
biBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMzoyMToxOVBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+Pj4gVGhlIG9ubHkgd2F5IEkgc2VlIGZvciB0aGF0IHRvIGhhcHBlbiwgaXMgdG8g
c2V0Cj4+Pj4gLT5wYW5lbF9vcmllbnRhdGlvbi4gQW5kIHRvIHJlcGVhdCBteXNlbGYsIGltbyB0
aGF0IG1ha2VzCj4+Pj4gJ29yaWVudGF0aW9uJyBhIGJldHRlciBuYW1lIGZvciB0aGlzIHZpZGVv
PSBvcHRpb24uCj4+Pgo+Pj4gb3JpZW50YXRpb24gYW5kIHJvdGF0aW9uIGFyZSB0d28gZGlmZmVy
ZW50IHRoaW5ncyB0byBtZS4gVGhlCj4+PiBvcmllbnRhdGlvbiBvZiBhIHBhbmVsIGZvciBleGFt
cGxlIGlzIGFic29sdXRlLCB3aGlsZSB0aGUgcm90YXRpb24gaXMKPj4+IGEgdHJhbnNmb3JtYXRp
b24uIEluIHRoaXMgcGFydGljdWxhciBjYXNlLCBJIHRoaW5rIHRoYXQgYm90aCB0aGUKPj4+IG9y
aWVudGF0aW9uIGFuZCB0aGUgcm90YXRpb24gc2hvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudCwg
d2l0aCB0aGUKPj4+IG9yaWVudGF0aW9uIGJlaW5nIHRoZSBkZWZhdWx0IHN0YXRlLCBhbmQgdGhl
IGhhcmR3YXJlIC8gcGFuZWwgd2lsbAo+Pj4gdGVsbCB1cyB0aGF0LCB3aGlsZSB0aGUgcm90YXRp
b24gd291bGQgYmUgYSB0cmFuc2Zvcm1hdGlvbiBmcm9tIHRoYXQKPj4+IGRlZmF1bHQgdG8gd2hh
dGV2ZXIgdGhlIHVzZXIgd2FudHMuCj4+Pgo+Pj4gTW9yZSBpbXBvcnRhbnRseSwgdGhlIG9yaWVu
dGF0aW9uIGlzIGEgcHJvcGVydHkgb2YgdGhlIGhhcmR3YXJlIChpZSwKPj4+IGhvdyB0aGUgZGlz
cGxheSBoYXMgYmVlbiBhc3NlbWJsZWQpLCB3aGlsZSB0aGUgcm90YXRpb24gaXMgYSBzb2Z0d2Fy
ZQo+Pj4gY29uc3RydWN0Lgo+Pj4KPj4+IEFuZCBpZiB0aGUgcHJvcGVydHkgYmVpbmcgdXNlZCB0
byBleHBvc2UgdGhhdCBpcyB0aGUgcm90YXRpb24sIEkgZ3Vlc3MKPj4+IGl0IHdvdWxkIG1ha2Ug
c2Vuc2UgdG8ganVzdCB1c2UgdGhlIHNhbWUgbmFtZSBhbmQgcmVtYWluIGNvbnNpc3RlbnQuCj4+
Cj4+IE9rLCBJIHNlZS4gQmFzZWQgb24gdGhpcywgSSB3b3VsZCBhc3N1bWUgdGhhdCByb3RhdGlv
biB3b3VsZCBiZSByZWxhdGl2ZQo+PiB0byB0aGUgb3JpZW50YXRpb24sIGJ1dCBJIHNlZSB0aGF0
IGluIHRoaXMgcGF0Y2ggcm90YXRpb24gZG9lc24ndCB0YWtlCj4+IG9yaW50YXRpb24gaW50byBh
Y2NvdW50LCBpdCBqdXN0IG92ZXJ3cml0ZXMgaXQuCj4gCj4gWWVhaCwgdGhhdCdzIGEgZ29vZCBw
b2ludC4gSSd2ZSB1cGRhdGVkIHRoZSBuZXh0IHZlcnNpb24gdG8gYWRkIHRoZQo+IHJvdGF0aW9u
IG9uIHRoZSBjb21tYW5kIGxpbmUgdG8gdGhlIG9yaWVudGF0aW9uLgo+IAo+PiBJIGRvbid0IGhv
dyB1c2Vyc3BhY2UgZGVhbHMgd2l0aCByb3RhdGlvbiBvbiB0b3Agb2Ygb3JpZW50YXRpb24uCj4g
Cj4gVGhlIG9yaWVudGF0aW9uIGlzIGV4cG9zZWQgdGhyb3VnaCB0aGUgcHJvcGVydHksIGFuZCB0
aGUgcmVzdWx0IGlzCj4gYXZhaWxhYmxlIHRocm91Z2ggdGhlIHBsYW5lJ3Mgcm90YXRpb24sIHNv
IEkgZ3Vlc3MgdGhhdCBpdCdzIGVub3VnaD8KPiAKCkkgd2FzIGp1c3Qgd29uZGVyaW5nIGlmIFhz
ZXJ2ZXIvd2F5bGFuZCBhcHBsaWVkIHJvdGF0aW9uIG9uIHRvcCBvZgpvcmllbnRhdGlvbiBvciBu
b3QuIE1heWJlIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdHJlYXQgaW50ZXJuYWwgZHJtCmNsaWVu
dHMgdGhlIHNhbWUuIEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBEUk0gcm90YXRpb24gcHJvcGVydHkg
ZG9lc24ndAphcHBseSBvbiB0b3Agb3JpZW50YXRpb24sIGp1c3Qgd29uZGVyaW5nIGhvdyBtdXR0
ZXIvd2F5bGFuZCAod2hvZXZlciBpcwppbiBjaGFyZ2UpIGRvZXMgdGhpcy4gTm90IGltcG9ydGFu
dCB0byBtZSwgc28gZmVlbCBmcmVlIHRvIGRpc3JlZ2FyZCwKSSdtIGp1c3Qgd29uZGVyaW5nLgoK
Tm9yYWxmLgoKPiBNYXhpbWUKPiAKPiAtLQo+IE1heGltZSBSaXBhcmQsIEJvb3RsaW4KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
