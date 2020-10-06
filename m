Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AE284441
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 05:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DBA8825E;
	Tue,  6 Oct 2020 03:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726866E288;
 Tue,  6 Oct 2020 03:24:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so11743357wrt.3;
 Mon, 05 Oct 2020 20:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gm5Rf54gYnkxJnrNPTvtfxE73fL5jd+U+PmQSMJsRvc=;
 b=VZyb7PmpfJgybAomaVGcyJCByMa//i6iSgwkSgK+x1NvOl016eP/UXi506QBBORKTi
 tCGJ/E76dAYPiXqNrZrcErB7Q0xU10hnaOt03I7zxUaU9GF3j2X2NsQ6wYncvNlW2SWl
 HIEGE1PDKdy+6AbcACmRbTJTquq8RUUuZg7EQjXnUKSEnyO1qqiQKH2PIxexqvEWF8p4
 5t7mKf1AWrQpG7txzTW454PA3VnGCs5h2D4yiORRiHTNTImQ9ZBXVSNk0Y7bjBPEUSf9
 ZGPV+OscToCX1ucGwRfs6q9vRP9iFwGykbHytukPTA7zVhlBcSGVNMcBKkEFJxzNWUBN
 +prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gm5Rf54gYnkxJnrNPTvtfxE73fL5jd+U+PmQSMJsRvc=;
 b=AwV4v+0cXQfOewPrxZwMGzTXCoIPlUYBE1C2wmYIcu9suR+9mLSf1raUQWlG5zZ9IW
 axtuLUapZdjq35RHCdKDNWzwTCEizqnkzTv/0TPKY3uBTWgOdxZz9o8/Vdn+yIHAcSx7
 brBPmi1dFdfl0gnl7dYf0wt6QyWT9+jOYncdshp7J2u1E5UjaeH90R/79sRh7P/A2Mah
 BgIFsjxTJrsKpFMfJ8+bC6aN1f8J143rwy3rSKJ8TpUbZGUdH+jlf2SGIMmVezx9yPYT
 aHvukDpB9VS7rGTWrt1U8geTR4dDHnjFvVoGoWn4rgS2BXX4Nse7ErF/Kc8e0SE7/wLy
 WbGA==
X-Gm-Message-State: AOAM533Vc8MFYlnEpux3WQ/VrQSdHDa9wK6jsCozmmIiVBIdetlNBhKG
 ZZUSwKnD9CbeqCnQX+AndgYzm3fWlfMEr0zba2U=
X-Google-Smtp-Source: ABdhPJxMU6rAehG8uhyB/PTRpKBwU9ZZkYETuLsP9OyIut+i8rZ6MfrGcCOTvVIDW1IHzfNQuBUG9yIDHp1ndNOzhHM=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr2345446wru.28.1601954652929; 
 Mon, 05 Oct 2020 20:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
 <CAKMK7uHeZptOKWKTanBB_c2ek2emNjs9fFCbTwgafS19rL1sww@mail.gmail.com>
In-Reply-To: <CAKMK7uHeZptOKWKTanBB_c2ek2emNjs9fFCbTwgafS19rL1sww@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 5 Oct 2020 20:25:21 -0700
Message-ID: <CAF6AEGu9riswKODKuftqtxkaM=qz9CmFoVgLn1j=yCJ-TuDXLA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 00/14] drm/msm: de-struct_mutex-ification
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNSwgMjAyMCBhdCAxMToyMCBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgNSwgMjAyMCBhdCA2OjI0IFBNIEtyaXN0aWFu
IEjDuGdzYmVyZyA8aG9lZ3NiZXJnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBP
Y3QgNCwgMjAyMCBhdCA5OjIxIFBNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4K
PiA+ID4KPiA+ID4gVGhpcyBkb2Vzbid0IHJlbW92ZSAqYWxsKiB0aGUgc3RydWN0X211dGV4LCBi
dXQgaXQgY292ZXJzIHRoZSB3b3JzdAo+ID4gPiBvZiBpdCwgaWUuIHNocmlua2VyL21hZHZpc2Uv
ZnJlZS9yZXRpcmUuICBUaGUgc3VibWl0IHBhdGggc3RpbGwgdXNlcwo+ID4gPiBzdHJ1Y3RfbXV0
ZXgsIGJ1dCBpdCBzdGlsbCBuZWVkcyAqc29tZXRoaW5nKiBzZXJpYWxpemUgYSBwb3J0aW9uIG9m
Cj4gPiA+IHRoZSBzdWJtaXQgcGF0aCwgYW5kIGxvY2tfc3RhdCBtb3N0bHkganVzdCBzaG93cyB0
aGUgbG9jayBjb250ZW50aW9uCj4gPiA+IHRoZXJlIGJlaW5nIHdpdGggb3RoZXIgc3VibWl0cy4g
IEFuZCB0aGVyZSBhcmUgYSBmZXcgb3RoZXIgYml0cyBvZgo+ID4gPiBzdHJ1Y3RfbXV0ZXggdXNh
Z2UgaW4gbGVzcyBjcml0aWNhbCBwYXRocyAoZGVidWdmcywgZXRjKS4gIEJ1dCB0aGlzCj4gPiA+
IHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIHN0ZXAgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbi4KPiA+
Cj4gPiBXaGF0IGEgZ3JlYXQgcGF0Y2ggc2V0LiBEYW5pZWwgaGFzIHNvbWUgZ29vZCBwb2ludHMg
YW5kIG5vdGhpbmcgdGhhdAo+ID4gcmVxdWlyZXMgYmlnIGNoYW5nZXMsIGJ1dCBvbiB0aGUgb3Ro
ZXIgaGFuZCwgSSdtIG5vdCBzdXJlIGl0J3MKPiA+IHNvbWV0aGluZyB0aGF0IG5lZWRzIHRvIGJs
b2NrIHRoaXMgc2V0IGVpdGhlci4KPgo+IFBlcnNvbmFsbHkgSSdkIHRocm93IHRoZSBsb2NrZGVw
IHByaW1pbmcgb24gdG9wIHRvIG1ha2Ugc3VyZSB0aGlzCj4gc3RheXMgY29ycmVjdCAoaXQncyAz
IGxpbmVzKSwgYnV0IHllcyBpbW8gdGhpcyBpcyBhbGwgZ29vZCB0byBnby4gSnVzdAo+IGZpZ3Vy
ZWQgSSdsbCBzcHJpbmtsZSB0aGUgbGF0ZXN0IGluIHRlcm1zIG9mIGdlbSBsb2NraW5nIG92ZXIg
dGhlCj4gc2VyaWVzIHdoaWxlIGl0J3MgaGVyZSA6LSkKClllYWgsIEknbGwgZGVmbiB0aHJvdyB0
aGUgbG9ja2RlcCBwcmltaW5nIGludG8gdjIuLiBhbmQgSSd2ZSBnb3QgdXNpbmcKb2JqLT5yZXN2
IGZvciBsb2NraW5nIG9uIHRoZSB0b2RvIGxpc3QgYnV0IGxvb2tzIGxpa2UgZW5vdWdoIGNodXJu
CnRoYXQgaXQgd2lsbCBwcm9iYWJseSBiZSBpdCdzIG93biBzZXJpZXMgKGJ1dCBzZWVtcyBsaWtl
IHRoZXJlIGlzIHJvb20KdG8gaW50cm9kdWNlIHNvbWUgbG9jay91bmxvY2sgaGVscGVycyB0aGF0
IGRvbid0IHJlYWxseSBjaGFuZ2UKYW55dGhpbmcgYnV0IG1ha2UgYW4gb2JqLT5sb2NrIHRyYW5z
aXRpb24gZWFzaWVyKQoKQlIsCi1SCgo+IC1EYW5pZWwKPgo+ID4gRWl0aGVyIHdheSwgZm9yIHRo
ZSBzZXJpZXMKPiA+Cj4gPiBSZXZpZXdlZC1ieTogS3Jpc3RpYW4gSC4gS3Jpc3RlbnNlbiA8aG9l
Z3NiZXJnQGdvb2dsZS5jb20+Cj4gPgo+ID4gPiBSb2IgQ2xhcmsgKDE0KToKPiA+ID4gICBkcm0v
bXNtOiBVc2UgY29ycmVjdCBkcm1fZ2VtX29iamVjdF9wdXQoKSBpbiBmYWlsIGNhc2UKPiA+ID4g
ICBkcm0vbXNtOiBEcm9wIGNoYXR0eSB0cmFjZQo+ID4gPiAgIGRybS9tc206IE1vdmUgdXBkYXRl
X2ZlbmNlcygpCj4gPiA+ICAgZHJtL21zbTogQWRkIHByaXYtPm1tX2xvY2sgdG8gcHJvdGVjdCBh
Y3RpdmUvaW5hY3RpdmUgbGlzdHMKPiA+ID4gICBkcm0vbXNtOiBEb2N1bWVudCBhbmQgcmVuYW1l
IHByZWVtcHRfbG9jawo+ID4gPiAgIGRybS9tc206IFByb3RlY3QgcmluZy0+c3VibWl0cyB3aXRo
IGl0J3Mgb3duIGxvY2sKPiA+ID4gICBkcm0vbXNtOiBSZWZjb3VudCBzdWJtaXRzCj4gPiA+ICAg
ZHJtL21zbTogUmVtb3ZlIG9iai0+Z3B1Cj4gPiA+ICAgZHJtL21zbTogRHJvcCBzdHJ1Y3RfbXV0
ZXggZnJvbSB0aGUgcmV0aXJlIHBhdGgKPiA+ID4gICBkcm0vbXNtOiBEcm9wIHN0cnVjdF9tdXRl
eCBpbiBmcmVlX29iamVjdCgpIHBhdGgKPiA+ID4gICBkcm0vbXNtOiByZW1vdmUgbXNtX2dlbV9m
cmVlX3dvcmsKPiA+ID4gICBkcm0vbXNtOiBkcm9wIHN0cnVjdF9tdXRleCBpbiBtYWR2aXNlIHBh
dGgKPiA+ID4gICBkcm0vbXNtOiBEcm9wIHN0cnVjdF9tdXRleCBpbiBzaHJpbmtlciBwYXRoCj4g
PiA+ICAgZHJtL21zbTogRG9uJ3QgaW1wbGljaXQtc3luYyBpZiBvbmx5IGEgc2luZ2xlIHJpbmcK
PiA+ID4KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgICAgIHwg
IDQgKy0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfcHJlZW1wdC5jIHwg
MTIgKy0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jICAgICB8
ICA0ICstCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kZWJ1Z2ZzLmMgICAgICAgICB8
ICA3ICsrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyAgICAgICAgICAgICB8
IDE1ICstLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oICAgICAgICAgICAg
IHwgMTkgKysrLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jICAgICAgICAg
ICAgIHwgNzYgKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9nZW0uaCAgICAgICAgICAgICB8IDUzICsrKysrKysrKy0tLS0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2dlbV9zaHJpbmtlci5jICAgIHwgNTggKystLS0tLS0tLS0tLS0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYyAgICAgIHwgMTcgKystLQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMgICAgICAgICAgICAgfCA5NiArKysrKysr
KysrKysrKy0tLS0tLS0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmggICAg
ICAgICAgICAgfCAgNSArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fcmluZ2J1ZmZl
ci5jICAgICAgfCAgMyArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fcmluZ2J1ZmZl
ci5oICAgICAgfCAxMyArKy0KPiA+ID4gIDE0IGZpbGVzIGNoYW5nZWQsIDE4OCBpbnNlcnRpb25z
KCspLCAxOTQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuMjYuMgo+ID4gPgo+
ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
PiBGcmVlZHJlbm8gbWFpbGluZyBsaXN0Cj4gPiA+IEZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+Cj4KPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
