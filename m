Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7596EC5D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 00:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C213F6E86E;
	Fri, 19 Jul 2019 22:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568836E86E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 22:02:35 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n5so34318788otk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 15:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jx4yhUvPBKHsl++YmIn4y1fcGXT76Rdy1djlt2TCCQY=;
 b=s1Jf2DX9KfCxUvADpN4XPqMJA25aTeVtMWlSKoewlHTwG1z+txu+mJVor63gkYpj3W
 zshIXPoZDeux8QJYEl/+GK5xI9w8nrDK1ZSdgOM1mJdYxlM4GGzInvj9/5gMp+H/UmA1
 YDLwPpvz88JahCbr+Zb4gJTQIiDbz1mp/dmJ4c9NtzOldpW8vTQStbUB7jqVREokM+ho
 FV/UiZAJE1RSY4g8qIEkrsfB6zQDSJ0lW9+pwAaujFY7BPBSD/79dCP/03wB4khBoxhw
 jJ65NOG91y7Rzu4AxJwt8yVy57MynPwc5UtubCeX3sWUh6niagvLTEzN+ewC3o/j+sRZ
 c00A==
X-Gm-Message-State: APjAAAX20053DIOaDVuNpG+C5QM2qCTtCIQg7yo3VNEgyVflWG66+eTI
 /tPoNprXufzhbdni4ctGh+v4UfKBCdXW5EDo/QJMZw==
X-Google-Smtp-Source: APXvYqxDy1QQ0T9FGaRvQj38gbynWb2tzNmx4Xaahh1Kabkr0QTkkfMgmCRA+1gPiNWyA+sVVAqkJsLXTH0IQyXpu10=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr22274334oto.188.1563573754597; 
 Fri, 19 Jul 2019 15:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190719154207.GA9708@phenom.ffwll.local>
 <CAHk-=wjEE4KGcyL0AJ6YxYvjPHUm9bn_7pZBCmqb-i3+j8p49Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjEE4KGcyL0AJ6YxYvjPHUm9bn_7pZBCmqb-i3+j8p49Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 20 Jul 2019 00:02:22 +0200
Message-ID: <CAKMK7uHjw8_7u=zyF8KavjhYaMYwvqknScZiQwL592cTi6twZg@mail.gmail.com>
Subject: Re: [PULL] drm-next fixes for -rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Jx4yhUvPBKHsl++YmIn4y1fcGXT76Rdy1djlt2TCCQY=;
 b=RjE4L66sYc+NMzCQFFVfPUhmUWN85j6ovEu8c9MJf0fFIzI6GyBuWOwKXnU3AtWSlm
 J168tNpvDkVwGE3jPaRSA4jqHvx+rGD2JMuOAX3ZBBfXaIrpnPFz+i1m2BtoZQNYgDcV
 LZ9iNumPX644pyo8Vp1/meQ0qhOAxaF33jD+c=
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgOTo0MCBQTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQg
ODo0MyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKPiA+
Cj4gPiBkcm0gZml4ZXMgZm9yIC1yYzE6Cj4gPgo+ID4gbm91dmVhdToKPiA+IC0gYnVnZml4ZXMg
KyBUVTExNiBlbmFibGluZyAobWlub3IgaXRlcmF0aW9uKTp3Cj4KPiBBc2tpbmcgdGhlIGltcG9y
dGFudCBxdWVzdGlvbjoKPgo+ICAtIFdUSCBpcyB0aGF0ICI6dyIgdGhpbmc/Cj4KPiBJIGhhdmUg
YSB0aGVvcnkgdGhhdCBpdCdzIGp1c3QgYSAiSSdtIGNvbmZ1c2VkIGJ5ICd2aSciIG1hcmtlci4g
IFZlcnkKPiB1bmRlcnN0YW5kYWJsZS4KPgo+IEJ1dCBJJ20gYWxzbyBlbnRlcnRhaW5pbmcgdGhl
IHBvc3NpYmlsaXR5IHRoYXQgaXQncyBhIG5ldyAid2hpc3RsaW5nCj4gZ3V5IiBlbW90aWNvbi4g
T3IgbWF5YmUgYSAiaHVuZ3J5IGJhYnkgYmlyZCBmYWNlIiBlbW90aWNvbi4KPgo+IEFkbWl0dGVk
bHkgbm90IGEgX2dyZWF0XyBuZXcgYWRkaXRpb24gdG8gdGhlIGVtb3RpY29ucyBJJ3ZlIHNlZW4s
IGJ1dAo+IGhleSwgSSdtIG5vdCBqdWRnaW5nLiBNdWNoLgo+Cj4gSSBsZWZ0IGl0IGluIHRoZSBt
ZXJnZSBtZXNzYWdlIGZvciBwb3N0ZXJpdHksIHJlZ2FyZGxlc3MuCgoqZ3JhYnMgYnJvd24gcGFw
ZXIgYmFnKgoKSSBzdGlsbCBjYW4ndCB2aW0sIGRlc3BpdGUgeWVhcnMuIEFuZCBvbmx5IG5vdGlj
ZWQgYWZ0ZXIgdGhlIHRhZyB3YXMKc2lnbmVkIGFscmVhZHksIHNvIGZpZ3VyZWQgSSBkb24ndCBy
ZWRvIGl0IGFuZCBsZWF2ZSB0aGUgYW11c2VtZW50IGluLgpJIGZpeGVkIGl0IGZvciB0aGUgbWFp
bCAodGhlIHNjcmlwdCB3ZSBoYXZlIGNvcGllcyB0aGUgdGFnIGludG8gdGhlCm1haWwgdGVtcGxh
dGUpLgoKSSBndWVzcyAiY2FuJ3QgdmkiIG1pZ2h0IGNhbGwgZm9yIHNvbWUgZnVua3kgbmV3IGVt
b2ppIG9yIHdoYXRldmVyIC4uLgoKQ2hlZXJzLCBEYW5pZWwKLS0KRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
