Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6223C54F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92C46E4E3;
	Wed,  5 Aug 2020 05:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5C36E4E3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:54:22 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id c18so15780667ybr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0b3kD6wG2oQdbqzbhNvaSDTPmvunmpRw+PcO0mgf1u8=;
 b=Oa2xdc0Dvf7NmymmGKLFzcvnfzzW0y37GZcalWqIS2N812GFusIqmjd8hw8m98xF0q
 3i6QKdA4DsR9O/LnAUa4Wb2T7/qhrOhbP7OU78W+3vZkmeCcqn4dWnuF64cgysL+bmPl
 iUGkeQey63TXzeh6Js8DHkVirAIZCKGHZ2UHBUo8R3JrqwKf7A162+Pkv+B7VX+V8l/G
 GmMM8YY3mCnucSv0iiN8RTPGTC6r/OuC0cuwldo51tXxcSJ0GIDI6bSz43Z18LotXIYj
 Fe80jysKlsPQxrpUvIhNHEd6kS9P/qPZ9Y5amHSASjJs7GlEfggdDHkcyZfZFaP/6oc0
 Tlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0b3kD6wG2oQdbqzbhNvaSDTPmvunmpRw+PcO0mgf1u8=;
 b=mTt4luaO/ghbJwezGiuDnx+HMwUsRvuIQP0leY0ab+PyvsULZ4aK6mmzQOLgXy3Azn
 hF0LM2vWX2M7KXLoqqidRH/n771S6bB/ZX38pVTN+VpQiAGE0KMAS2y5IDyPlLnt1EFZ
 5O4LwgZ2kGquXUM1Ppk4FiB9Tmo+C0ZuZmbMRF03nDD8p1wGAxvDzqOIkyyo8JK52T0B
 Inqf2piDnVp4UKqvymmwQLTS0CdZz0peNfpJThfmUx4JAMb972IZ9zRn7/YUtc6r7qey
 klZztKmgxeZEUQaD7ndU3SBnl/8QuBCA3UjG7zH1MQ+cqKgzppdtJuc+AXB5TUXyF0cA
 J9oA==
X-Gm-Message-State: AOAM530WCtrhsvvBN17/XXlBB6OOJHUcvQ+ubIhMNjFwCh5e8yllQq0b
 4NDVyJEX9EKblPpEyvTJeMQivYYrAfhMlW0MxKY=
X-Google-Smtp-Source: ABdhPJwLkXXGBgO4H+jD46r8aceKEYmZwfjpFSZOFHhaxvBorXjQGIb9b7NmmjFsrsT9QKPhkOn/q/2oC8MlfNJNvO4=
X-Received: by 2002:a25:cf08:: with SMTP id f8mr2238462ybg.435.1596606862211; 
 Tue, 04 Aug 2020 22:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-52-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-52-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:54:11 +1000
Message-ID: <CACAvsv45wGyk=k0GxCfkJPtkENg_QQECLqT2GGt86nHJdZ_ooQ@mail.gmail.com>
Subject: Re: [PATCH 51/59] drm/ttm: drop priv pointer in memory manager
To: Dave Airlie <airlied@gmail.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDEyOjU4LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+
IFRoaXMgaXNuJ3QgbmVlZGVkIGFueW1vcmUgYnkgYW55IGRyaXZlcnMuCj4KPiBSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBCZW4g
U2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBpbmNsdWRlL2RybS90dG0vdHRt
X2JvX2RyaXZlci5oIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IGluZGV4IDc4OWMxZWIyNjg1OS4uYjQ3N2MxYWQ1YzNl
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9p
bmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gQEAgLTEyMyw3ICsxMjMsNiBAQCBzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyB7Cj4gICAqIEBkZWZhdWx0X2NhY2hpbmc6IFRo
ZSBkZWZhdWx0IGNhY2hpbmcgcG9saWN5IHVzZWQgZm9yIGEgYnVmZmVyIG9iamVjdAo+ICAgKiBw
bGFjZWQgaW4gdGhpcyBtZW1vcnkgdHlwZSBpZiB0aGUgdXNlciBkb2Vzbid0IHByb3ZpZGUgb25l
Lgo+ICAgKiBAZnVuYzogc3RydWN0dXJlIHBvaW50ZXIgaW1wbGVtZW50aW5nIHRoZSByYW5nZSBt
YW5hZ2VyLiBTZWUgYWJvdmUKPiAtICogQHByaXY6IERyaXZlciBwcml2YXRlIGNsb3N1cmUgZm9y
IEBmdW5jLgo+ICAgKiBAaW9fcmVzZXJ2ZV9tdXRleDogTXV0ZXggb3B0aW9uYWxseSBwcm90ZWN0
aW5nIHNoYXJlZCBpb19yZXNlcnZlIHN0cnVjdHVyZXMKPiAgICogQHVzZV9pb19yZXNlcnZlX2xy
dTogVXNlIGFuIGxydSBsaXN0IHRvIHRyeSB0byB1bnJlc2VydmUgaW9fbWVtX3JlZ2lvbnMKPiAg
ICogcmVzZXJ2ZWQgYnkgdGhlIFRUTSB2bSBzeXN0ZW0uCj4gQEAgLTE1Miw3ICsxNTEsNiBAQCBz
dHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgewo+ICAgICAgICAgdWludDMyX3QgYXZhaWxhYmxl
X2NhY2hpbmc7Cj4gICAgICAgICB1aW50MzJfdCBkZWZhdWx0X2NhY2hpbmc7Cj4gICAgICAgICBj
b25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJfZnVuYyAqZnVuYzsKPiAtICAgICAgIHZv
aWQgKnByaXY7Cj4gICAgICAgICBzdHJ1Y3QgbXV0ZXggaW9fcmVzZXJ2ZV9tdXRleDsKPiAgICAg
ICAgIGJvb2wgdXNlX2lvX3Jlc2VydmVfbHJ1Owo+ICAgICAgICAgc3BpbmxvY2tfdCBtb3ZlX2xv
Y2s7Cj4gLS0KPiAyLjI2LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
