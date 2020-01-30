Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52BD14D7E7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259C6F91D;
	Thu, 30 Jan 2020 08:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00588EB4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 08:45:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q15so2224355qki.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Dv9Iey8XDP+W4Jvx0tu6D9dtoFliuQckA02jxVrkiI=;
 b=FfU4r18rqt3nIyU8oCyHh2DrVi4sSHVRw0uZnAvTGCnOYwID6LfoXkBH1ovdCemtE4
 5j+5VpNsz2l0m2k1tvgzSMu05bivwILwiI0dl+Kt6nHIuVU/FplE2CFCcRgb7vZ50K/2
 pNwqP/TT7aU1e1ed42pWXnEArEsipG+p1XwdOJI/iL64EavlOkK3DlDNYotizw2DARPx
 wLKv0AtTCjYiiU1tAY53ofxazQqJzEfLlh+XrwxL12voGqyU6lOMBpq6ip81x81JRZrB
 XqWKpM+DhQOG1m4M7P0XGGDwDoKI35Otr0gWlXJf2yS/yNNarbLwToZfqr/QFsW0sIjP
 3gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Dv9Iey8XDP+W4Jvx0tu6D9dtoFliuQckA02jxVrkiI=;
 b=F9Mw9Aqd9PVTjcWmg5RWX+SE9oxOdbH8FebQ7Gw5V/oNlpvZmFoV/8QZwR6u6XYJtK
 iUtn978Dv5Ng3OWOSoivhQzFY3Z1/FHC8YJacz8aM1VT6lCgJnRy39fdsPmlSJo7r7eV
 jJq0Lmt9zoDm5s7yniywF3DIvvKQ4CoHIf8STQOacyOfzeVJN/F/px9HWmv9R+kmTYjA
 G6Gfan9G+taR859vaaT+3X6+oc6n2qZV1MXtLm4Ggt65HKaaBmHQPJJgRlez1YlJXYPU
 KsjU7Zvzwl62MfWcNKd2MY8M73Cj36pufa9oD1shdBWLWdjwkN+5cFlI7mjD3WKZNN2v
 sRrA==
X-Gm-Message-State: APjAAAWQgzKEACtvhrNe3W00FcnkLtRCoKd2d0Wg3RYMQWS1ct3GB6F8
 OUzXL1FTsXCvq1Ii87S5FR+KamZGYm7es8P70OiVdA==
X-Google-Smtp-Source: APXvYqxA2ryubrn9SVP4bGswHzifIIvTYoaMvdHt0F734B4foisqyFh6kSbmzK7DBUf2KnwKeuVbecmn8CEvgq3f5uQ=
X-Received: by 2002:a37:c244:: with SMTP id j4mr3986838qkm.433.1580373934153; 
 Thu, 30 Jan 2020 00:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org>
 <20200102101712.5085-3-sam@ravnborg.org>
 <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
 <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
 <CA+M3ks4sD971mCUQRJO+9gXaAWcwgzy2iNtMNVBRov5JSJk=HQ@mail.gmail.com>
 <CA+M3ks7GkVSi2WcwpK+tkoBx=EpJLfFVAp=qs2ygZyW114hWfw@mail.gmail.com>
 <20200129194711.GA29646@ravnborg.org>
In-Reply-To: <20200129194711.GA29646@ravnborg.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 30 Jan 2020 09:45:22 +0100
Message-ID: <CA+M3ks4i9gso1jJT-+18R+ggSFTMHQy9_GC+LkOxZ41eSH3Dmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAyOSBqYW52LiAyMDIwIMOgIDIwOjQ3LCBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IGEgw6ljcml0IDoKPgo+IEhpIEJlbmphbWluLgo+ID4gPiA+Cj4gPiA+ID4gSGVyZSdz
IHRoZSBwcm9ibGVtLiBJZiBpdCBpcyBub3QgcmVxdWlyZWQsIHRoZW4gcGFuZWxzIHdpdGggbXVs
dGlwbGUKPiA+ID4gPiBzdXBwbGllcyB3aWxsIGdldCBhZGRlZCBoZXJlIGJlY2F1c2UgdGhleSBk
aWRuJ3QgY2FyZSB0byBiZWdpbiB3aXRoLgo+ID4gPiA+IFRoZW4gd2hlbiBzb21lb25lIGRlY2lk
ZXMgdG8gdGhpbmsgYWJvdXQgdGhlIHN1cHBsaWVzIGl0IHdpbGwgaGF2ZSB0bwo+ID4gPiA+IGJl
IG1vdmVkLiBCaW5kaW5ncyBuZWVkIHRvIGJlIGNvbXBsZXRlIGZyb20gdGhlIHN0YXJ0Lgo+ID4g
Pgo+ID4gPiBGYWlyIGVub3VnaCwgSSB3aWxsIGFkZCBmaXhlZCBzdXBwbHkgaW4gZHRzIGZpbGVz
Lgo+ID4gPiBJZiByZXNldC1ncGlvcyBjb3VsZCBiZSBhZGRlZCBpbiB0aGlzIHNjaGVtYSB0aGVu
IHdlIGNvdWxkIGluY2x1ZGUKPiA+ID4gb3Jpc3RlY2ggcGFuZWwgaGVyZS4KPiA+Cj4gPiBEb2Vz
IHRoaXMgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkID8KPgo+IEkgd2FzIHNpZGV0cmFja2VkIGJ5IG90
aGVyIHRoaW5ncy4KPiBNYXliZSB5b3UgY2FuIG1vdmUgaXQgZm9yd2FyZD8KClllcyBJIHdpbGwg
c2VuZCBhIHYzLgpCZW5qYW1pbgoKPgo+ICAgICAgICAgU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
