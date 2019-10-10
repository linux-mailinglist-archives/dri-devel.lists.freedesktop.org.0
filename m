Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0906D2C1E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073AB6E32B;
	Thu, 10 Oct 2019 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC666E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 14:09:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j11so8110248wrp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tO5W28a04FS+i+OwLxhAexOxe7uJSS3pIQOIBzkDCBo=;
 b=YB8h6UtEmyOJ5H8VTnvSRkLE4pLYo3W5aXRA0uxGSfKlQEDkzP7r2z9zPhvYDZSdEq
 Xg5x4s1Qnzw/rYHLwGqDcd5RSF2Q2zsrS7LgjJmRMMhEbrQWUfZVhw+g4iGfys7qqOvi
 Inau8zFtK+k+3+X8lBIpvhApYe9aGYDsvfkC2fGvaS0Xdtbl+ZXjzLYO8TjndQ810XV5
 DFPrG2KM7AP7gC/te9wJBKbQFrFlYPqboOS0oeBA6UhFLuB103hmyoc6NE2K/vElxBTA
 LNT/ebMiw7PH+mtE8vckH6HEZraYjbiNs3eb1HS6vXM4TvppAI9uwTpk0W4DtqYK97z8
 Oaiw==
X-Gm-Message-State: APjAAAWGgPOpnByxuxVs8oqJnsOrlDXVUJPXljgco+feQaEE3xM7s1kF
 H70BNp+P4NxdxvSOOFLKiTn7saoPJD5IcnA70b8=
X-Google-Smtp-Source: APXvYqzRwqF/g9Pq2VxpVRkcy6egfXsdJQqqLodWcJRxLOfjedVI3T/d51inutRBKV8D2NRh45n0feT3ag8U7NtA8Jg=
X-Received: by 2002:adf:ba07:: with SMTP id o7mr9132698wrg.50.1570716555986;
 Thu, 10 Oct 2019 07:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190402033037.21877-1-kai.heng.feng@canonical.com>
 <54557F79-6DE1-4AA4-895A-C0F014926590@canonical.com>
 <E40AB4FE-7F61-48C9-A1C9-C24454FE0586@canonical.com>
In-Reply-To: <E40AB4FE-7F61-48C9-A1C9-C24454FE0586@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Oct 2019 10:09:02 -0400
Message-ID: <CADnq5_OVeqLGigRJP3XSNtoqZEEeKK=s1bO75jeG6jaBm+14nQ@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Add 6 bpc quirk for SDC panel in Lenovo G50
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tO5W28a04FS+i+OwLxhAexOxe7uJSS3pIQOIBzkDCBo=;
 b=AI2t++eI7d3w5Pijtth2inC+llf8jcbpsdxYC3Mtq8jZ3WbHAQV6jS8WAiePSMPLxT
 Q1EwES9oUszKi20jSQsB64R/KfaIhsT7qixwLz1x5gXh5q+CU1oVtWZ509P//7lYLe+g
 ZOFh4STCURSfwS+c6P1A4TsuLLMAJZ9+jC2jzzDAz2PQFnd5c0Zt5qS2vV0OGZl78cw2
 +4fu6SQIl6FJnKxlJN+TM/zZL6YXfwzo/ZCMsvuO8iRqUpb4PjYLFAb4C6taY2dBJpNC
 7c1MBx2IRtyNnW/5yT789x0SQyzsUrBE1t5ngdys3aDQA5/li54uBmgvGS78PDlq+x30
 KNDg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 LKML <linux-kernel@vger.kernel.org>, "for 3.8" <stable@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAzOjEyIEFNIEthaS1IZW5nIEZlbmcKPGthaS5oZW5nLmZl
bmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gPiBPbiBKdW4gNiwgMjAxOSwgYXQgMTY6
MDQsIEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGksCj4gPgo+ID4gYXQgMTE6MzAsIEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdA
Y2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPgo+ID4+IEFub3RoZXIgcGFuZWwgdGhhdCBuZWVkcyA2
QlBDIHF1aXJrLgo+ID4KPiA+IFBsZWFzZSBpbmNsdWRlIHRoaXMgcGF0Y2ggaWYgcG9zc2libGUu
Cj4KPiBBbm90aGVyIGdlbnRsZSBwaW5nLgoKUmV2aWV3ZWQgYW5kIHB1c2hlZCBvdXQgdG8gZHJt
LW1pc2MtZml4ZXMuCgpUaGFua3MsCgpBbGV4Cgo+Cj4gPgo+ID4gS2FpLUhlbmcKPiA+Cj4gPj4K
PiA+PiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4MTk5NjgKPiA+
PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjQuOCsKPiA+PiBTaWduZWQtb2ZmLWJ5
OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Cj4gPj4gLS0tCj4g
Pj4gZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAzICsrKwo+ID4+IDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPj4gaW5kZXggOTkwYjE5
MDlmOWQ3Li4xY2I0ZDAwNTJlZmUgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4+IEBAIC0x
NjYsNiArMTY2LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBlZGlkX3F1aXJrIHsKPiA+PiAgICAg
IC8qIE1lZGlvbiBNRCAzMDIxNyBQRyAqLwo+ID4+ICAgICAgeyAiTUVEIiwgMHg3YjgsIEVESURf
UVVJUktfUFJFRkVSX0xBUkdFXzc1IH0sCj4gPj4KPiA+PiArICAgIC8qIExlbm92byBHNTAgKi8K
PiA+PiArICAgIHsgIlNEQyIsIDE4NTE0LCBFRElEX1FVSVJLX0ZPUkNFXzZCUEMgfSwKPiA+PiAr
Cj4gPj4gICAgICAvKiBQYW5lbCBpbiBTYW1zdW5nIE5QNzAwRzdBLVMwMVBMIG5vdGVib29rIHJl
cG9ydHMgNmJwYyAqLwo+ID4+ICAgICAgeyAiU0VDIiwgMHhkMDMzLCBFRElEX1FVSVJLX0ZPUkNF
XzhCUEMgfSwKPiA+Pgo+ID4+IC0tCj4gPj4gMi4xNy4xCj4gPgo+ID4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
