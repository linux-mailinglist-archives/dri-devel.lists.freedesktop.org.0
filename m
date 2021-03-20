Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6EF342B60
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 10:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA326EB49;
	Sat, 20 Mar 2021 09:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913326EB48;
 Sat, 20 Mar 2021 09:04:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u9so13365074ejj.7;
 Sat, 20 Mar 2021 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OaPLwvg+IZGwTK/k3Li+rCt2focV1aT4GNBzja7jGWo=;
 b=a7452k+Foe9tR9D45J0GslolVjpgj3P0TmaNuhP6Sjox1dTDcPjsfm0gL2WtGh/hvb
 ea8ypjEEFqafa2Hw6GsZfZdIpFEkgr/nxrFts2pjYeI0BV6gFJhLPuolTZlWVCIkZjY6
 FQST8+jC70DkgJzmmeQhtsWQKeY/tZY28VKkgdEehUgZtgMzBzjDKzQGSRoAh9f4yAdY
 o8Z/r6PFUqmD9oWKr10z6Iqe+eSW56K3P7YHqqJoXOk7/6Sp0TXcJ7UfbGb3ZWQHHTRk
 M01+NH2k88zv+CJ5wx7FFezTNivIKxySLqu5SbSqUYefiWChzw8OClwTypQ4ZKKiGf1T
 Ssrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OaPLwvg+IZGwTK/k3Li+rCt2focV1aT4GNBzja7jGWo=;
 b=WWaPUrKncHLf3l1O2rmFC+MI4N+GfsnP0r2ZqhOEWlDBqSsXlhZDQ+SSMyJLzNc2te
 FBD4mqMQM5G2eYqcyBl6yYWwvcNohSoJuLwoniPt1nDI4d4bv7aI9aXhq5xw0Z7u8QhW
 /FaBA+izftR/1BL518ck6kkcx+gZa95HWX1tdvtZmvYXMGoAFgGFJJ9guVzqifWpL9TZ
 BuvhUWfKma9GdmcFc4w4jlDh8wm4lc7XnnfUrpLAqxdW5Av1BUhLQoEtomrXkk5lNoT2
 OzqRsEmb0Q9/5dpGzlW7H/2MA6wMy3F4ggtfFwE6x8d6pX0XhwZzY4wmd92IGgoeG3nh
 7oMg==
X-Gm-Message-State: AOAM5308h69c8uT6eaOtsymFeba7ZUC3lgsXQiBUKpfwVvK3mP1JG7Xy
 2zCu2u6TnJH7Al/0Rb/fHg9xOBEhs1A=
X-Google-Smtp-Source: ABdhPJxLnvJuEASuTN4vLVFMZfeOnkt2uK98+FgkZ4Q8OryoAkOjtv73GJx3JnGHRFopBOKEowBYCA==
X-Received: by 2002:a17:906:5689:: with SMTP id
 am9mr8486256ejc.298.1616231073216; 
 Sat, 20 Mar 2021 02:04:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bf8:4d2c:9d22:7a29?
 ([2a02:908:1252:fb60:9bf8:4d2c:9d22:7a29])
 by smtp.gmail.com with ESMTPSA id b22sm5469381edv.96.2021.03.20.02.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 02:04:32 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210319140857.2262-1-christian.koenig@amd.com>
 <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
 <2831bfcc-140e-dade-1f50-a6431e495e9d@gmail.com>
 <YFT2LSR97rkkPyEP@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
Date: Sat, 20 Mar 2021 10:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFT2LSR97rkkPyEP@phenom.ffwll.local>
Content-Language: en-US
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
Cc: Leo.Liu@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDMuMjEgdW0gMjA6MDYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgTWFy
IDE5LCAyMDIxIGF0IDA3OjUzOjQ4UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDE5LjAzLjIxIHVtIDE4OjUyIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIEZyaSwg
TWFyIDE5LCAyMDIxIGF0IDAzOjA4OjU3UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gRG9uJ3QgcHJpbnQgYSB3YXJuaW5nIHdoZW4gd2UgZmFpbCB0byBhbGxvY2F0ZSBhIHBh
Z2UgZm9yIHN3YXBwaW5nIHRoaW5ncyBvdXQuCj4+Pj4KPj4+PiBBbHNvIHJlbHkgb24gbWVtYWxs
b2Nfbm9mc19zYXZlL21lbWFsbG9jX25vZnNfcmVzdG9yZSBpbnN0ZWFkIG9mIEdGUF9OT0ZTLgo+
Pj4gVWggdGhpcyBwYXJ0IGRvZXNuJ3QgbWFrZSBzZW5zZS4gRXNwZWNpYWxseSBzaW5jZSB5b3Ug
b25seSBkbyBpdCBmb3IgdGhlCj4+PiBkZWJ1Z2ZzIGZpbGUsIG5vdCBpbiBnZW5lcmFsLiBXaGlj
aCBtZWFucyB5b3UndmUganVzdCBjb21wbGV0ZWx5IGJyb2tlbgo+Pj4gdGhlIHNocmlua2VyLgo+
PiBBcmUgeW91IHN1cmU/IE15IGltcHJlc3Npb24gaXMgdGhhdCBHRlBfTk9GUyBzaG91bGQgbm93
IHdvcmsgbXVjaCBtb3JlIG91dAo+PiBvZiB0aGUgYm94IHdpdGggdGhlIG1lbWFsbG9jX25vZnNf
c2F2ZSgpL21lbWFsbG9jX25vZnNfcmVzdG9yZSgpLgo+IFllYWgsIGlmIHlvdSdkIHB1dCBpdCBp
biB0aGUgcmlnaHQgcGxhY2UgOi0pCj4KPiBCdXQgYWxzbyAtbW0gZm9sa3MgYXJlIHZlcnkgY2xl
YXIgdGhhdCBtZW1hbGxvY19ubyooKSBmYW1pbHkgaXMgZm9yIGRpcmUKPiBzaXR1YXRpb24gd2hl
cmUgdGhlcmUncyByZWFsbHkgbm8gb3RoZXIgd2F5IG91dC4gRm9yIGFueXRoaW5nIHdoZXJlIHlv
dQo+IGtub3cgd2hhdCB5b3UncmUgZG9pbmcsIHlvdSByZWFsbHkgc2hvdWxkIHVzZSBleHBsaWNp
dCBnZnAgZmxhZ3MuCgpNeSBpbXByZXNzaW9uIGlzIGp1c3QgdGhlIG90aGVyIHdheSBhcm91bmQu
IFlvdSBzaG91bGQgdHJ5IHRvIGF2b2lkIHRoZSAKTk9GUy9OT0lPIGZsYWdzIGFuZCB1c2UgdGhl
IG1lbWFsbG9jX25vKiBhcHByb2FjaCBpbnN0ZWFkLgoKPj4+IElmIHRoaXMgaXMganVzdCB0byBw
YXBlciBvdmVyIHRoZSBzZXFfcHJpbnRmIGRvaW5nIHRoZSB3cm9uZyBhbGxvY2F0aW9ucywKPj4+
IHRoZW4ganVzdCBtb3ZlIHRoYXQgb3V0IGZyb20gdW5kZXIgdGhlIGZzX3JlY2xhaW1fYWNxdWly
ZS9yZWxlYXNlIHBhcnQuCj4+IE5vLCB0aGF0IHdhc24ndCB0aGUgcHJvYmxlbS4KPj4KPj4gV2Ug
aGF2ZSBqdXN0IHNlZW4gdG8gbWFueSBmYWlsdXJlcyB0byBhbGxvY2F0ZSBwYWdlcyBmb3Igc3dh
cG91dCBhbmQgSSB0aGluawo+PiB0aGF0IHdvdWxkIGltcHJvdmUgdGhpcyBiZWNhdXNlIGluIGEg
bG90IG9mIGNhc2VzIHdlIGNhbiB0aGVuIGltbWVkaWF0ZWx5Cj4+IHN3YXAgdGhpbmdzIG91dCBp
bnN0ZWFkIG9mIGhhdmluZyB0byByZWx5IG9uIHVwcGVyIGxheWVycy4KPiBZZWFoLCB5b3UgYnJv
a2UgaXQuIE5vdyB0aGUgcmVhbCBzaHJpbmtlciBpcyBydW5uaW5nIHdpdGggR0ZQX0tFUk5FTCwK
PiBiZWNhdXNlIHlvdXIgbWVtYWxsb2Nfbm8gaXMgb25seSBhcm91bmQgdGhlIGRlYnVnZnMgZnVu
Y3Rpb24uIEFuZCBvZmMgaXQncwo+IG11Y2ggZWFzaWVyIHRvIGFsbG9jYXRlIHdpdGggR0ZQX0tF
Uk5FTCwgcmlnaHQgdW50aWwgeW91IGRlYWRsb2NrIDotKQoKVGhlIHByb2JsZW0gaGVyZSBpcyB0
aGF0IGZvciBleGFtcGxlIGtzd2FwZCBjYWxscyB0aGUgc2hyaW5rZXIgd2l0aG91dCAKaG9sZGlu
ZyBhIEZTIGxvY2sgYXMgZmFyIGFzIEkgY2FuIHNlZS4KCkFuZCBpdCBpcyByYXRoZXIgc2FkIHRo
YXQgd2UgY2FuJ3Qgb3B0aW1pemUgdGhpcyBjYXNlIGRpcmVjdGx5LgoKQW55d2F5IHlvdSBhcmUg
cmlnaHQgaWYgc29tZSBjYWxsZXIgZG9lc24ndCB1c2UgdGhlIG1lbWFsbG9jX25vKigpIAphcHBy
b2FjaCB3ZSBhcmUgYnVzdGVkLgoKR29pbmcgdG8gY2hhbmdlIHRoZSBwYXRjaCB0byBvbmx5IG5v
dCB3YXJuIGZvciB0aGUgbW9tZW50LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFNocmlua2lu
ZyBpcyBoYXJkLCB0aGVyZSdzIG5vIGVhc3kgd2F5IG91dCBoZXJlLgo+Cj4gQ2hlZXJzLCBEYW5p
ZWwKPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+Cj4+PiBfX0dGUF9OT1dBUk4gc2hv
dWxkIGJlIHRoZXJlIGluZGVlZCBJIHRoaW5rLgo+Pj4gLURhbmllbAo+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4g
LS0tCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDUgKysrKy0KPj4+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3R0LmMKPj4+PiBpbmRleCAyZjA4MzNjOThkMmMuLjg2ZmEzZTgyZGFjYyAx
MDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+IEBAIC0zNjksNyArMzY5LDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGxvbmcgdHRtX3R0X3Nocmlua2VyX3NjYW4oc3RydWN0IHNocmlua2VyICpz
aHJpbmssCj4+Pj4gICAgCX07Cj4+Pj4gICAgCWludCByZXQ7Cj4+Pj4gLQlyZXQgPSB0dG1fYm9f
c3dhcG91dCgmY3R4LCBHRlBfTk9GUyk7Cj4+Pj4gKwlyZXQgPSB0dG1fYm9fc3dhcG91dCgmY3R4
LCBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOKTsKPj4+PiAgICAJcmV0dXJuIHJldCA8IDAgPyBT
SFJJTktfRU1QVFkgOiByZXQ7Cj4+Pj4gICAgfQo+Pj4+IEBAIC0zODksMTAgKzM4OSwxMyBAQCBz
dGF0aWMgdW5zaWduZWQgbG9uZyB0dG1fdHRfc2hyaW5rZXJfY291bnQoc3RydWN0IHNocmlua2Vy
ICpzaHJpbmssCj4+Pj4gICAgc3RhdGljIGludCB0dG1fdHRfZGVidWdmc19zaHJpbmtfc2hvdyhz
dHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCj4+Pj4gICAgewo+Pj4+ICAgIAlzdHJ1Y3Qg
c2hyaW5rX2NvbnRyb2wgc2MgPSB7IC5nZnBfbWFzayA9IEdGUF9LRVJORUwgfTsKPj4+PiArCXVu
c2lnbmVkIGludCBmbGFnczsKPj4+PiAgICAJZnNfcmVjbGFpbV9hY3F1aXJlKEdGUF9LRVJORUwp
Owo+Pj4+ICsJZmxhZ3MgPSBtZW1hbGxvY19ub2ZzX3NhdmUoKTsKPj4+PiAgICAJc2VxX3ByaW50
ZihtLCAiJWx1LyVsdVxuIiwgdHRtX3R0X3Nocmlua2VyX2NvdW50KCZtbV9zaHJpbmtlciwgJnNj
KSwKPj4+PiAgICAJCSAgIHR0bV90dF9zaHJpbmtlcl9zY2FuKCZtbV9zaHJpbmtlciwgJnNjKSk7
Cj4+Pj4gKwltZW1hbGxvY19ub2ZzX3Jlc3RvcmUoZmxhZ3MpOwo+Pj4+ICAgIAlmc19yZWNsYWlt
X3JlbGVhc2UoR0ZQX0tFUk5FTCk7Cj4+Pj4gICAgCXJldHVybiAwOwo+Pj4+IC0tIAo+Pj4+IDIu
MjUuMQo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
