Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1FB34FC6E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41A46EA21;
	Wed, 31 Mar 2021 09:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A96EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:17:32 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r12so28993932ejr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pG2O16a1zKUtHvIvTUKCn+aYP2A80pBF6JWW9OgRMeQ=;
 b=FLtf6kVN2K3aNJ+ZIusXbRoiGx8V6w96KtyLzWQR4YrlVHjSKePh2R//0mZUxn2ioQ
 0XZN9bBZ6sxid9EcB+VKQtBdfzI5/rRaVHsMIAIQ2gbyiS2ITPjwkO3UWqXzyu1CSG3p
 Ks9OUX8BzgbVJHo7f2kVEa+8Vyyyg0OAiFR896Uo7D6LtUPoKL+q6mUXyGDPdny70VEM
 ekcye2+PK1fu4lS1Gal9TDS8+MWamgJgcm+WZRT2zn5Si2vGpK9rr2v2MBBt+JCoPE7K
 pChDht9zEVOQdAyGNkoTu6qDd1UKaKKdc8hb0bMi0UxauYL/H8Jhtih8TFOgKQ/Cyeo9
 hFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pG2O16a1zKUtHvIvTUKCn+aYP2A80pBF6JWW9OgRMeQ=;
 b=mYvPxHCB8qPTwye4f8DJwCwHRVw5Rk/cs0KLftDW0i1iFo4cxL+Qb1StIjml/QUokK
 6BQ4VdBVg7TqWR7MkweyaptuBcaNBwJkznccKbXkZIQTfcRy4SGSOcOPMPcGRvCTAWFE
 ctFpS/u10e2ZduniX7du3pG8rPW9P6CU9b5UzwuALtvVyYxfow10muNpuzzpId00Exn+
 4smF5vxWAHJf1Met0ThGqDgm09lqBOyAXqQUu/zZWWnvcuVbFexW422F2Z/ePLGSTeSV
 l06Q05ksbJRPgvV9yZBKuyYExsisawMcBngw3jcX/1fdxgkd0BR1ngXAsp5REIibPRp/
 Y7TA==
X-Gm-Message-State: AOAM5325x5gISx5YCQ5s9f/iVDiiv2BsZlJ7So7KPvNDqBT5tNj3POfF
 bSlLdcLe7D7V5zdXCdPVJXFYlgNh954leU9yRWLbchp1hiE=
X-Google-Smtp-Source: ABdhPJykmo29H8rsyWsh36PYE7WNXhWNWyJ0QN2C542p/5yo3o+Y+t1jWWqg6lwN0PUKbdcryraytye8RxPoNXhmdIo=
X-Received: by 2002:a17:906:7842:: with SMTP id
 p2mr2588728ejm.87.1617182251241; 
 Wed, 31 Mar 2021 02:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <YGQu9uZ/d5ph+eS9@mwanda> <20210331081438.GF2088@kadam>
In-Reply-To: <20210331081438.GF2088@kadam>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Wed, 31 Mar 2021 11:17:20 +0200
Message-ID: <CABkfQAGZVsRV_hjjGXvK-7yY5vgg+1Bfr9xCvxdLeJwA7OwJyg@mail.gmail.com>
Subject: Re: [bug report] drm/bridge: Introduce LT8912B DSI to HDMI bridge
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKSSB3aWxsIHB1Ymxpc2ggYSBwYXRjaCBz
b29uLgoKV2hhdCB0YWcgc2hvdWxkIEkgYWRkIHRvIG15IGNvbW1pdCB0byBtZW50aW9uIHRoYXQg
eW91IGZpbmQgYnVncwooU3VnZ2VzdGVkLWJ5IGZvciBleGFtcGxlKT8KClRoYW5rczsKCkxlIG1l
ci4gMzEgbWFycyAyMDIxIMOgIDEwOjE0LCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFdlZCwgTWFyIDMxLCAyMDIxIGF0IDExOjEyOjM4
QU0gKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gPiAgICA2NDQgICAgICAgICAgb2Zfbm9k
ZV9wdXQoZW5kcG9pbnQpOwo+ID4gICAgNjQ1Cj4gPiAgICA2NDYgICAgICAgICAgbHQtPmhvc3Rf
bm9kZSA9IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZShkZXYtPm9mX25vZGUsIDAsIC0xKTsKPiA+
ICAgIDY0NyAgICAgICAgICBpZiAoIWx0LT5ob3N0X25vZGUpIHsKPiA+ICAgIDY0OCAgICAgICAg
ICAgICAgICAgIGRldl9lcnIobHQtPmRldiwgIiVzOiBGYWlsZWQgdG8gZ2V0IHJlbW90ZSBwb3J0
XG4iLCBfX2Z1bmNfXyk7Cj4gPiAgICA2NDkgICAgICAgICAgICAgICAgICByZXQgPSAtRU5PREVW
Owo+ID4gICAgNjUwICAgICAgICAgICAgICAgICAgZ290byBlbmQ7Cj4gPiAgICA2NTEgICAgICAg
ICAgfQo+ID4gICAgNjUyCj4gPiAgICA2NTMgICAgICAgICAgcG9ydF9ub2RlID0gb2ZfZ3JhcGhf
Z2V0X3JlbW90ZV9ub2RlKGRldi0+b2Zfbm9kZSwgMSwgLTEpOwo+ID4gICAgNjU0ICAgICAgICAg
IGlmICghcG9ydF9ub2RlKSB7Cj4gPiAgICA2NTUgICAgICAgICAgICAgICAgICBkZXZfZXJyKGx0
LT5kZXYsICIlczogRmFpbGVkIHRvIGdldCBjb25uZWN0b3IgcG9ydFxuIiwgX19mdW5jX18pOwo+
ID4gICAgNjU2ICAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsKPiA+ICAgIDY1NyAgICAg
ICAgICAgICAgICAgIGdvdG8gZXJyX2ZyZWVfaG9zdF9ub2RlOwo+ID4gICAgNjU4ICAgICAgICAg
IH0KPiA+ICAgIDY1OQo+ID4gICAgNjYwICAgICAgICAgIGx0LT5oZG1pX3BvcnQgPSBvZl9kcm1f
ZmluZF9icmlkZ2UocG9ydF9ub2RlKTsKPiA+ICAgIDY2MSAgICAgICAgICBpZiAoSVNfRVJSKGx0
LT5oZG1pX3BvcnQpKSB7Cj4KPiBUaGlzIGlzbid0IGFuIGVycm9yIHBvaW50ZXIgZWl0aGVyLiAg
b2ZfZHJtX2ZpbmRfYnJpZGdlKCkgcmV0dXJucyBOVUxMLgo+Cj4gcmVnYXJkcywKPiBkYW4gY2Fy
cGVudGVyCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
