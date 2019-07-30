Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B47AC30
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 17:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB46E58F;
	Tue, 30 Jul 2019 15:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA206E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 15:22:56 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id z23so38342941ote.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 08:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kjaboNlnts15i/pioUhHCP1wY8NPSmb3QO1TUzE3rok=;
 b=oiZFnml6BH/arnsdcr4UHUzLpa4mHy+OdY1O5jGFfmTGaKzIH2wbVDVIN2LNz/Hy0Z
 pqHCtQQPHTqwlF2WKksv1WvwvhzFoYoBkxpjglpPLxL5iz7guhYCe86HueJHu2PJeu34
 gd2i95CQoAUXyyFlGLhnmgDLjNJWj6Bxa3VndK+aNJS/tIsHbrTfWUN7+7SCzq/2+C8a
 XdMgMJ1x7uC0aLU6FvDWGaPxUJqZGW8r2x2+voKnGlEyI/hDmFY/FwR/pxL89HZjyt1N
 ZjrF2vQBN3gkvZ50NnXs8O+FbHorEMNa1nBHyKTe5hasGKv743jVXDl1A/LzMzjyJHQD
 UIgg==
X-Gm-Message-State: APjAAAWph9vK5pbmTQkD1i5k+rGQL627pAIdqaDOmN8e0S+9G6TnUQwA
 qCdK0cHzf3dGhqMWUVFA0NfBVxcqZYWe2GFnHWs=
X-Google-Smtp-Source: APXvYqyVWBz5611Y+ywiIQ1MKbgfVEyzl2sMgZTmzVJ315/att1mloURlrjCJmInPYugitFvQO/tuHbYVi8Zk6GO1MM=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr81682080otk.204.1564500176094; 
 Tue, 30 Jul 2019 08:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190729195526.13337-1-noralf@tronnes.org>
 <20190729195526.13337-5-noralf@tronnes.org>
 <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
In-Reply-To: <ae0a000f-df7e-6c08-9a50-a5ed22a2845e@tronnes.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 30 Jul 2019 17:22:44 +0200
Message-ID: <CAKMK7uH8S9xZNFNJkmrEjSasb0v6tnL5OMZRC-KyXiNiJj2U9A@mail.gmail.com>
Subject: Re: [RFC 4/4] drm/panel/ili9341: Support mi0283qt
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kjaboNlnts15i/pioUhHCP1wY8NPSmb3QO1TUzE3rok=;
 b=Nw6a0kV/i3DSc3I8wcl+ecdEX2JqikE9els2RLEuwB+YVBw6QyXWgQx7IWXHsA89ln
 2saqyZ6YdN2sDvBvz2HbWedYwTbhMQaGU7pRUn4LLbMXt7kNCLb/PXTg40vGetWsck4U
 MV9062ru+jjn7csbVLtg7FUHZ3MK5dB6/w0Po=
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
Cc: Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgNDozMCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gRGVuIDI5LjA3LjIwMTkgMjEuNTUsIHNrcmV2IE5v
cmFsZiBUcsO4bm5lczoKPiA+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxm
QHRyb25uZXMub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWls
aXRlay1pbGk5MzQxLmMgfCAxNzkgKysrKysrKysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNzAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+Cj4KPiBJIGhhdmUgcmVh
bGlzZWQgdGhhdCB0aGlzIHdpbGwgY2hhbmdlIHRoZSBEUk0gZHJpdmVyIG5hbWUgZnJvbSBtaTAy
ODNxdAo+IHRvIGRybV9taXBpX2RiaS4gVGhpcyBtZWFucyB0aGF0IHRoaXMgcGFuZWwgd2lsbCBs
b29zZSBpdHMgTUVTQSBrbXNyb1sxXQo+IHN1cHBvcnQuIEkgaGF2ZW4ndCB0cmllZCBpdCwgYnV0
IHRoaXMgaXMgdGhlIGZpcnN0IHRoaW5nIHRoYXQgZ2l2ZXMgdGhpcwo+IGRyaXZlciBhbnkgcmVh
bCBhZHZhbnRhZ2Ugb3ZlciBpdHMgZmJkZXYgY291bnRlcnBhcnQgaW4KPiBkcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQsIHNvIEkgZG9uJ3Qgd2FudCB0byBsb29zZSB0aGF0Lgo+IFNvIGV2ZW4gaWYgTUlQ
SSBEQkkgcGFuZWwgc3VwcG9ydCBpcyBpbXBsZW1lbnRlZCBpbiBzb21lIGZvcm0sIEkgd2lsbAo+
IHdhaXQgd2l0aCBjb252ZXJ0aW5nIG1pMDI4M3F0IHVudGlsIHNvbWVvbmUgaGFzIHVwZGF0ZWQg
dGhlIGttc3JvIGRyaXZlci4KCldoeSBkb2VzIGl0IGNoYW5nZT8gWW91IHNob3VsZCBiZSBhYmxl
IHRvIHN0dWZmIHdoYXRldmVyIHlvdSBmZWVsIGxpa2UKaW50byB0aGUgZHJtIGRyaXZlciBuYW1l
LCB0aGlzIGRvZXNuJ3QgaGF2ZSB0byBtYXRjaCBlaXRoZXIgeW91cgpwbGF0Zm9ybS9zcGkvd2hh
dGV2ZXIgZHJpdmVyIG5hbWUgbm9yIHRoZSBtb2R1bGUgb3B0aW9uLgotRGFuaWVsCgoKPiBOb3Jh
bGYuCj4KPiBbMV0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL3Ry
ZWUvbWFzdGVyL3NyYy9nYWxsaXVtL3dpbnN5cy9rbXNyby9kcm0KPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL2Jsb2IvbWFzdGVyL3NyYy9nYWxsaXVtL3RhcmdldHMv
ZHJpL3RhcmdldC5jCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
