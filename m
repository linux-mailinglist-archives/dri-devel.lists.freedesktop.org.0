Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4435739F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 23:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F616E513;
	Wed, 26 Jun 2019 21:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA676E512;
 Wed, 26 Jun 2019 21:28:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so4393682wrt.6;
 Wed, 26 Jun 2019 14:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKPa1AsM7rfnwQnb1Ufx9QUB+dzAQ4Qp3sCYKeKlFpw=;
 b=GTxAY1RGR/Ltm7Iq4LJygGGOJa7a0df22aQlysiQwxB0eGm4H+SvUPyZvhrnARy2Ga
 5uvwamhH3s6CbolPxSA7jTkgA0kmDBnaQTKgp0/zyRFYz+P3QVV4uwrh1C73BFkX0ZH/
 BIY/YLQlk6F+CWDBK0c9YVHT5CUYg4bkVy9FL0m9PBh7+zgmVoEpxpi0uMkjIQvHTKm6
 sJZzCKCA5IBMMbvodKdA5hhuXFOZyx79QPKqlM9n9r8WSWhIla0J6A6tMnHfzV/HNbCk
 D7hDClTpwjcBB5NSnuP/V9xpsEfFKI0+xAh0WJXJFxc5f/6EzG9jcbtohigo0XvnFGAw
 i0cg==
X-Gm-Message-State: APjAAAWdfGyfjyGc2fGyCrKznig9VBZlhYBiz/Bjq8ye34n8r0a6yHEn
 /79PyovAe1PyLgBgdQZZa05hyAkE/t//VmrXYYQ=
X-Google-Smtp-Source: APXvYqxUU3CG54iiQpahlIP3u7Svs62bElm/WYd6V3cDt0emTydXjWKulrSmoZCnJh2WYSszOGvx5EQlq964yw9/mb8=
X-Received: by 2002:adf:e442:: with SMTP id t2mr5288781wrm.286.1561584479326; 
 Wed, 26 Jun 2019 14:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-5-Kenny.Ho@amd.com>
 <20190626160553.GR12905@phenom.ffwll.local>
In-Reply-To: <20190626160553.GR12905@phenom.ffwll.local>
From: Kenny Ho <y2kenny@gmail.com>
Date: Wed, 26 Jun 2019 17:27:48 -0400
Message-ID: <CAOWid-eurCMx1F7ciUwx0e+p=s=NP8=UxQUhhF-hdK-iAna+fA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 04/11] drm,
 cgroup: Add total GEM buffer allocation limit
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CKPa1AsM7rfnwQnb1Ufx9QUB+dzAQ4Qp3sCYKeKlFpw=;
 b=ftA5X6EP5X9FO3Z/g4O6tC81NKR4qxvgjO0iEqlJkrant6fG49e8aXNYfAKxXWvC5s
 YEzjlIueeADKHfQ3cfkZiIxuwHylNsB5yHaBidw6MjkHRdFoYB4zlCDcZhmrPiz2J/c5
 b63Ns32h/HY4JYlnhmcy8oSICZkHUrxVnNG+fO8X0CFRHQGLXlD2JsMf0x2ewuVezVo9
 KyO9Z711WenXYbZFdEZbFqrBqtIM3cGBD+94uC1NL55UdaNoSo27SH46UhLmQQ9e4VPf
 HC+nYypRMZJ9cUcj/lIaQ5C4i4TpsYLqZ8khOE61RIgNyhLvpk1heX6QA46t6lzfPZIY
 76uA==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx@lists.freedesktop.org, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 joseph.greathouse@amd.com, Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTI6MDUgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+ID4gZHJtLmJ1ZmZlci5kZWZhdWx0Cj4gPiAgICAgICAgIEEgcmVh
ZC1vbmx5IGZsYXQta2V5ZWQgZmlsZSB3aGljaCBleGlzdHMgb24gdGhlIHJvb3QgY2dyb3VwLgo+
ID4gICAgICAgICBFYWNoIGVudHJ5IGlzIGtleWVkIGJ5IHRoZSBkcm0gZGV2aWNlJ3MgbWFqb3I6
bWlub3IuCj4gPgo+ID4gICAgICAgICBEZWZhdWx0IGxpbWl0cyBvbiB0aGUgdG90YWwgR0VNIGJ1
ZmZlciBhbGxvY2F0aW9uIGluIGJ5dGVzLgo+Cj4gRG9uJ3Qgd2UgbmVlZCBhICIwIG1lYW5zIG5v
IGxpbWl0IiBzZW1hbnRpY3MgaGVyZT8KCkkgYmVsaWV2ZSB0aGUgY29udmVudGlvbiBpcyB0byB1
c2UgdGhlICdtYXgnIGtleXdvcmQuCgo+Cj4gSSB0aGluayB3ZSBuZWVkIGEgbmV3IGRybS1jZ3Jv
dXAucnN0IHdoaWNoIGNvbnRhaW5zIGFsbCB0aGlzCj4gZG9jdW1lbnRhdGlvbi4KClllcyBJIHBs
YW5uZWQgdG8gZG8gdGhhdCB3aGVuIHRoaW5ncyBhcmUgbW9yZSBmaW5hbGl6ZWQuICBJIGFtCmFj
dHVhbGx5IHdyaXRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlIGZvbGxvd2luZyB0aGUgY3VycmVudCBk
b2MgZm9ybWF0CnNvIEkgY2FuIHJldXNlIGl0IGluIHRoZSByc3QuCgo+Cj4gV2l0aCBtdWx0aXBs
ZSBHUFVzLCBkbyB3ZSBuZWVkIGFuIG92ZXJhbGwgR0VNIGJvIGxpbWl0LCBhY3Jvc3MgYWxsIGdw
dXM/Cj4gRm9yIG90aGVyIHN0dWZmIGxhdGVyIG9uIGxpa2UgdnJhbS90dC8uLi4gYW5kIGFsbCB0
aGF0IGl0IG5lZWRzIHRvIGJlCj4gcGVyLWRldmljZSwgYnV0IEkgdGhpbmsgb25lIG92ZXJhbGwg
bGltaXQgY291bGQgYmUgdXNlZnVsLgoKVGhpcyBvbmUgSSBhbSBub3Qgc3VyZSBidXQgc2hvdWxk
IGJlIGZhaXJseSBzdHJhaWdodGZvcndhcmQgdG8gYWRkLgpJJ2QgbG92ZSB0byBoZWFyIG1vcmUg
ZmVlZGJhY2tzIG9uIHRoaXMgYXMgd2VsbC4KCj4gPiAgICAgICBpZiAoIWFtZGdwdV9ib192YWxp
ZGF0ZV9zaXplKGFkZXYsIHNpemUsIGJwLT5kb21haW4pKQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsKPiA+Cj4gPiArICAgICBpZiAoIWRybWNncnBfYm9fY2FuX2FsbG9jYXRlKGN1
cnJlbnQsIGFkZXYtPmRkZXYsIHNpemUpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01F
TTsKPgo+IFNvIHdoYXQgaGFwcGVucyB3aGVuIHlvdSBzdGFydCBhIGxvdCBvZiB0aHJlYWRzIGFs
bCBhdCB0aGUgc2FtZSB0aW1lLAo+IGFsbG9jYXRpbmcgZ2VtIGJvPyBBbHNvIHdvdWxkIGJlIG5p
Y2UgaWYgd2UgY291bGQgcm9sbCBvdXQgYXQgbGVhc3QgdGhlCj4gYWNjb3VudGluZyBwYXJ0IG9m
IHRoaXMgY2dyb3VwIHRvIGFsbCBHRU0gZHJpdmVycy4KCldoZW4gdGhlcmUgaXMgYSBsYXJnZSBu
dW1iZXIgb2YgYWxsb2NhdGlvbiwgdGhlIGFsbG9jYXRpb24gd2lsbCBiZQpjaGVja2VkIGluIHNl
cXVlbmNlIHdpdGhpbiBhIGRldmljZSAoc2luY2UgSSB1c2VkIGEgcGVyIGRldmljZSBtdXRleApp
biB0aGUgY2hlY2suKSAgQXJlIHlvdSBzdWdnZXN0aW5nIHRoZSBvdmVyaGVhZCBoZXJlIGlzIHNp
Z25pZmljYW50CmVub3VnaCB0byBiZSBhIGJvdHRsZW5lY2s/ICBUaGUgYWNjb3VudGluZyBwYXJ0
IHNob3VsZCBiZSBhdmFpbGFibGUgdG8KYWxsIEdFTSBkcml2ZXJzICh1bmxlc3MgSSBtaXNzZWQg
c29tZXRoaW5nKSBzaW5jZSB0aGUgY2hnIGFuZCB1bmNoZwpmdW5jdGlvbiBpcyBjYWxsZWQgdmlh
IHRoZSBnZW5lcmljIGRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdCBhbmQKZHJtX2dlbV9vYmpl
Y3RfcmVsZWFzZS4KCj4gPiArICAgICAvKiBvbmx5IGFsbG93IGJvIGZyb20gdGhlIHNhbWUgY2dy
b3VwIG9yIGl0cyBhbmNlc3RvciB0byBiZSBpbXBvcnRlZCAqLwo+ID4gKyAgICAgaWYgKGRybWNn
cnAgIT0gTlVMTCAmJgo+Cj4gUXVpdGUgYSBzZXJpb3VzIGxpbWl0YXRpb24gaGVyZSAuLi4KPgo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICFkcm1jZ3JwX2lzX3NlbGZfb3JfYW5jZXN0b3IoZHJt
Y2dycCwgb2JqLT5kcm1jZ3JwKSkgewo+Cj4gQWxzbyB3aGF0IGhhcHBlbnMgaWYgeW91IGFjdHVh
bGx5IHNoYXJlIGFjcm9zcyBkZXZpY2VzPyBUaGVuIGltcG9ydGluZyBpbgo+IHRoZSAybmQgZ3Jv
dXAgaXMgc3VkZGVubHkgcG9zc2libGUsIGFuZCBJIHRoaW5rIHdpbGwgYmUgZG91YmxlLWNvdW50
ZWQuCj4KPiBXaGF0J3MgdGhlIHVuZGVybHlpbmcgdGVjaG5pY2FsIHJlYXNvbiBmb3Igbm90IGFs
bG93aW5nIHNoYXJpbmcgYWNyb3NzCj4gY2dyb3Vwcz8KCldpdGggdGhlIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24sIHRoZXJlIHNob3VsZG4ndCBiZSBkb3VibGUgY291bnRpbmcgYXMKdGhlIGNvdW50
aW5nIGlzIGRvbmUgZHVyaW5nIHRoZSBidWZmZXIgaW5pdC4KClRvIGJlIGNsZWFyLCBzaGFyaW5n
IGFjcm9zcyBjZ3JvdXAgaXMgYWxsb3dlZCwgdGhlIGJ1ZmZlciBqdXN0IG5lZWRzCnRvIGJlIGFs
bG9jYXRlZCBieSBhIHByb2Nlc3MgdGhhdCBpcyBwYXJlbnQgdG8gdGhlIGNncm91cC4gIFNvIGlu
IHRoZQpjYXNlIG9mIHhvcmcgYWxsb2NhdGluZyBidWZmZXIgZm9yIGNsaWVudCwgdGhlIHhvcmcg
d291bGQgYmUgaW4gdGhlCnJvb3QgY2dyb3VwIGFuZCB0aGUgYnVmZmVyIGNhbiBiZSBwYXNzZWQg
YXJvdW5kIGJ5IGRpZmZlcmVudCBjbGllbnRzCihpbiByb290IG9yIG90aGVyIGNncm91cC4pICBU
aGUgaWRlYSBoZXJlIGlzIHRvIGVzdGFibGlzaCBzb21lIGZvcm0gb2YKb3duZXJzaGlwLCBvdGhl
cndpc2UgdGhlcmUgd291bGRuJ3QgYmUgYSB3YXkgdG8gYWNjb3VudCBmb3Igb3IgbGltaXQKdGhl
IHVzYWdlLgoKUmVnYXJkcywKS2VubnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
