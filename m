Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D459EB7442
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8696FA00;
	Thu, 19 Sep 2019 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B1D6F3CD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 15:23:11 +0000 (UTC)
Date: Wed, 18 Sep 2019 17:23:09 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm: sun8i-ui/vi: Fix layer zpos change/atomic modesetting
Message-ID: <20190918152309.j2dbu63jaru6jn2t@core.my.home>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190914220337.646719-1-megous@megous.com>
 <20190918141734.kerdbbaynwutrxf6@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918141734.kerdbbaynwutrxf6@gilmour>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1568820189; bh=kRc8vp8BAB11xc+/TQcnK+fReDy51rfmeTkpuKM5zHM=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=mg/ptGc6dXUGFsO2H5hLJjbsOQ/VgVQSZiexphZP1C1FRS1rwh7D7VzHbTc1W3NSr
 ZYM44/sJcvtiR+3pt+Zcn/oMif/DRC2uHY4PIssBohbuPYA/yCwbeSLTNZ7phlMH7m
 3IsVRn3Rd/LOktCj5i5Z4/V1/9Qniz007k7EQ3dk=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIFNlcCAxOCwgMjAxOSBhdCAwNDoxNzozNFBNICswMjAwLCBNYXhpbWUgUmlw
YXJkIHdyb3RlOgo+IEhpLAo+IAo+IE9uIFN1biwgU2VwIDE1LCAyMDE5IGF0IDEyOjAzOjM3QU0g
KzAyMDAsIG1lZ291c0BtZWdvdXMuY29tIHdyb3RlOgo+ID4gRnJvbTogT25kcmVqIEppcm1hbiA8
bWVnb3VzQG1lZ291cy5jb20+Cj4gPgo+ID4gVGhlcmUgYXJlIHZhcmlvdXMgaXNzdWVzIHRoYXQg
dGhpcyByZS13b3JrIG9mIHN1bjhpX1t1dl1pX2xheWVyX2VuYWJsZQo+ID4gZnVuY3Rpb24gZml4
ZXM6Cj4gPgo+ID4gLSBNYWtlIHN1cmUgdGhhdCB3ZSByZS1pbml0aWFsaXplIHpwb3Mgb24gcmVz
ZXQKPiA+IC0gTWluaW1pemUgcmVnaXN0ZXIgdXBkYXRlcyBieSBkb2luZyB0aGVtIG9ubHkgd2hl
biBzdGF0ZSBjaGFuZ2VzCj4gPiAtIEZpeCBpc3N1ZSB3aGVyZSBERSBwaXBlIG1pZ2h0IGdldCBk
aXNhYmxlZCBldmVuIGlmIGl0IGlzIG5vIGxvbmdlcgo+ID4gICB1c2VkIGJ5IHRoZSBsYXllciB0
aGF0J3MgY3VycmVudGx5IGNhbGxpbmcgc3VuOGlfdWlfbGF5ZXJfZW5hYmxlCj4gPiAtIC5hdG9t
aWNfZGlzYWJsZSBjYWxsYmFjayBpcyBub3QgcmVhbGx5IG5lZWRlZCBiZWNhdXNlIC5hdG9taWNf
dXBkYXRlCj4gPiAgIGNhbiBkbyB0aGUgZGlzYWJsZSB0b28sIHNvIGRyb3AgdGhlIGR1cGxpY2F0
ZSBjb2RlCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291
cy5jb20+Cj4gCj4gSXQgbG9va3MgbGlrZSB0aGVzZSBmaXhlcyBzaG91bGQgYmUgaW4gc2VwYXJh
dGUgcGF0Y2hlcy4gSXMgdGhlcmUgYW55Cj4gcmVhc29uIGl0J3Mgbm90IHRoZSBjYXNlPwoKQnVs
bGV0IHBvaW50cyBqdXN0IGRlc2NyaWJlIHRoZSByZXN1bHRpbmcgZWZmZWN0L2JlbmVmaXRzIG9m
IHRoZSBjaGFuZ2UgdG8gZml4CnRoZSBwaXBlIGNvbnRyb2wgcmVnaXN0ZXIgdXBkYXRlIGlzc3Vl
IChzZWUgdGhlIHJlZmVyZW5jZWQgZS1tYWlsKS4KCkkgY2FuIG1heWJlIHNwbGl0IG9mZiB0aGUg
Zmlyc3QgYnVsbGV0IHBvaW50IGludG8gYSBzZXBhcmF0ZSBwYXRjaC4gQnV0CkkgY2FuJ3QgZ3Vh
cmFudGVlIGl0IHdpbGwgbm90IG1ha2UgdGhlIG9yaWdpbmFsIGlzc3VlIHdvcnNlLCBiZWNhdXNl
IGl0IG1pZ2h0CmhhdmUgYmVlbiBoaWRpbmcgdGhlIG90aGVyIGlzc3VlIHdpdGggcmVnaXN0ZXIg
dXBkYXRlcy4KClRoZSByZXN0IGlzIGp1c3QgYSByZXN1bHQgb2YgdGhlIHNpbmdsZSBsb2dpY2Fs
IGNoYW5nZS4gSXQgZG9lc24ndCB3b3JrCmluZGl2aWR1YWxseSwgaXQgYWxsIGhhcyB0aGUgZ29h
bCBvZiBmaXhpbmcgdGhlIGlzc3VlIGFzIGEgd2hvbGUuCgpJZiBJIHdlcmUgdG8gc3BsaXQgaXQg
SSB3b3VsZCBoYXZlIHRvIGFjdHVhbGx5IHJlLWltcGxlbWVudCAuYXRvbWljX2Rpc2FibGUKY2Fs
bGJhY2sgb25seSB0byByZW1vdmUgaXQgaW4gdGhlIG5leHQgcGF0Y2guIEkgZG9uJ3Qgc2VlIHRo
ZSBiZW5lZml0LgoKcmVnYXJkcywKCW8uCgo+IE1heGltZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
