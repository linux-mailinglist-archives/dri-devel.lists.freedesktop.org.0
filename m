Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7721E9025
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0B6E9C5;
	Sat, 30 May 2020 09:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E616E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 12:45:16 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c8so2141240iob.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 05:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r7UrsGfrrB/vHkjSY/mF0dPH3VfmRDjaMhCcaEN7Oro=;
 b=C0r/f0dYZuUL3gtrgb341aeH+a3RRbFgDN8WABIDMQ4CWOg0oUOEWV44SFWs91MrD3
 l+v1XHlA3qT+zSg8N3ZMtNe8AynwbfZ2sz34jS/oYopc528jqn7GMQ0QItbrGnl+ZnXx
 rMAeHhGlmNCulmea83iFMYAN13+NxAhfCbzcKWcdivAoKqFjhVurnRuEd97Uhrq989pH
 QRlCPlybXXfx1Z2IqoluFEB/slBKEjdXKJP5ZvyWlkM2RUVpahjp1LWZKhmZUYTWS11i
 i7WZ/oEv2JQFoAJy30va82fvaIsC4GH69VjoyDknDfXwa/zR6UpAguyCcjXn8s6t6kAD
 KOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r7UrsGfrrB/vHkjSY/mF0dPH3VfmRDjaMhCcaEN7Oro=;
 b=gn7LMy/9XJK8R9gwKLTL4570kM49Wk/3JfkwJxl6zg3y51xmKGZ4hqq3RL99JZbgSd
 D4wd+EegJtLaNnQ8CwmpcvcnF02t4Zz5Y2eGCah9i7jsS+vTIumUALFl5Yn4aEwwDTVg
 3RkwhqvZkY3vK/ewo/1mr5usuc3FwOnu4i+NwaTkAHZez/eGqpq/Vosk6B+mXK8X9WVv
 wxB7OgTGDL5aWrgnIrijjzSPnULuPSlU7ZV2i/g+M/zoj5YOxztCyeXfPRmNSyJ5UZV2
 HhFmSmaLOLurr6K5Gk+NHiWemQPvhwt4HDI5E9XKGG/FskB3M9uvWzexEvbxRv9el04b
 8DvA==
X-Gm-Message-State: AOAM531t+fQc+0JSUmQmIzJd6ymDDyZgxy3D6rvUpaMvoqoeUJfsV1Zy
 bWE7bvsINxoTZy6CgWTlWAvteUjpPRhNh9Z2RQo=
X-Google-Smtp-Source: ABdhPJwQN7PrsvBPgSXBXTv22bRouiS21NBduFpKqOYI96L9PLyEwcQxFBcRZlVWcv10lm9jwrJXrH+ncv06l+AZAwg=
X-Received: by 2002:a6b:1543:: with SMTP id 64mr6528705iov.123.1590756315926; 
 Fri, 29 May 2020 05:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-8-peron.clem@gmail.com>
 <2f7a41d6-325d-3731-0a6a-fa2e41d4e33a@arm.com>
In-Reply-To: <2f7a41d6-325d-3731-0a6a-fa2e41d4e33a@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 29 May 2020 14:45:05 +0200
Message-ID: <CAJiuCcfJnBxh6McsNLKJ=HegS6dCVNVOChCOrcPGWobU3G8KKg@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/panfrost: use device_property_present to check
 for OPP
To: Steven Price <steven.price@arm.com>
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmVuLAoKT24gVGh1LCAyOCBNYXkgMjAyMCBhdCAxNToyMiwgU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMC8wNS8yMDIwIDE3OjU1LCBDbMOp
bWVudCBQw6lyb24gd3JvdGU6Cj4gPiBJbnN0ZWFkIG9mIGV4cGVjdGluZyBhbiBlcnJvciBmcm9t
IGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkKPiA+IGRvIGEgc2ltcGxlIGRldmljZV9wcm9wZXJ0
eV9wcmVzZW50KCkgY2hlY2suCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9u
IDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPgo+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2h5
IHRoaXMgaXMgYmV0dGVyLiBXZSBzZWVtIHRvIGhhdmUgbW9yZSBjb2RlCj4gdG8gZG8gcm91Z2hs
eSB0aGUgc2FtZSB0aGluZyBqdXN0IHdpdGggdGhlIGhhcmQtY29kZWQKPiAib3BlcmF0aW5nLXBv
aW50cy12MiIgbmFtZSAoaWYgdGhlcmUncyBldmVyIGEgJ3YzJyB3ZSdsbCB0aGVuIGhhdmUgdG8K
PiB1cGRhdGUgdGhpcykuCj4KPiBJcyB0aGUgZGVzaXJlIGp1c3QgdG8gZ2V0IGFuIGVycm9yIG9u
IHByb2JlIGlmIHRoZSB0YWJsZSBpcyBtYWxmb3JtZWQ/Cj4gSGF2ZSB5b3UgaGl0IHRoaXMgc2l0
dWF0aW9uPyBJZiBzbyB0aGlzIHNvdW5kcyBsaWtlIHNvbWV0aGluZyB3aGljaAo+IHdvdWxkIGJl
IGJldHRlciBmaXhlZCBpbiB0aGUgZ2VuZXJpYyBPUFAgY29kZSByYXRoZXIgdGhhbiBQYW5mcm9z
dCBpdHNlbGYuCgpUaGUgaWRlYSB3YXMgdG8gYXZvaWQgY2FsbGluZyBkZXZmcmVxIGlmIHRoZXJl
IGlzIG5vIG9wcCB0YWJsZS4KQnV0IEkgdGhpbmsgeW91J3JlIHJpZ2h0IHdlIGRvbid0IGhhdmUg
dG8gY2hlY2sgZm9yIG1hbGZvcm1lZApkZXZpY2UtdHJlZSBpbiB0aGUgZHJpdmVyLgoKSSB3aWxs
IGRyb3AgdGhpcyBwYXRjaCwKClJlZ2FyZHMsCkNsZW1lbnQKCgo+Cj4gU3RldmUKPgo+ID4gLS0t
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxNCAr
KysrKysrKystLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmZyZXEuYwo+ID4gaW5kZXggZDkwMDdmNDRiNzcyLi5mY2UyMWM2ODI0MTQgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gPiBAQCAtOTYs
MTUgKzk2LDE5IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2Rl
dmljZSAqcGZkZXYpCj4gPiAgICAgICBzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqY29v
bGluZzsKPiA+ICAgICAgIHN0cnVjdCBwYW5mcm9zdF9kZXZmcmVxICpwZmRldmZyZXEgPSAmcGZk
ZXYtPnBmZGV2ZnJlcTsKPiA+Cj4gPiAtICAgICByZXQgPSBkZXZfcG1fb3BwX29mX2FkZF90YWJs
ZShkZXYpOwo+ID4gLSAgICAgaWYgKHJldCA9PSAtRU5PREVWKSAvKiBPcHRpb25hbCwgY29udGlu
dWUgd2l0aG91dCBkZXZmcmVxICovCj4gPiArICAgICBpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVz
ZW50KGRldiwgIm9wZXJhdGluZy1wb2ludHMtdjIiKSkKPiA+ICsgICAgICAgICAgICAgLyogT3B0
aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2ZnJlcSAqLwo+ID4gICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+IC0gICAgIGVsc2UgaWYgKHJldCkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiA+IC0gICAgIHBmZGV2ZnJlcS0+b3BwX29mX3RhYmxlX2FkZGVkID0gdHJ1ZTsKPiA+Cj4g
PiAgICAgICBzcGluX2xvY2tfaW5pdCgmcGZkZXZmcmVxLT5sb2NrKTsKPiA+Cj4gPiArICAgICBy
ZXQgPSBkZXZfcG1fb3BwX29mX2FkZF90YWJsZShkZXYpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+
ID4gKyAgICAgICAgICAgICBEUk1fREVWX0VSUk9SKGRldiwgIkNvdWxkbid0IGFkZCBPUFAgdGFi
bGVcbiIpOwo+ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9maW5pOwo+ID4gKyAgICAgfQo+ID4g
KyAgICAgcGZkZXZmcmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQgPSB0cnVlOwo+ID4gKwo+ID4gICAg
ICAgcGFuZnJvc3RfZGV2ZnJlcV9yZXNldChwZmRldmZyZXEpOwo+ID4KPiA+ICAgICAgIGN1cl9m
cmVxID0gY2xrX2dldF9yYXRlKHBmZGV2LT5jbG9jayk7Cj4gPgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
