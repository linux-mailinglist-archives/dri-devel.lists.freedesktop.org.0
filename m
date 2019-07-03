Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8850C5EF91
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 01:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602A96E218;
	Wed,  3 Jul 2019 23:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D906F6E218;
 Wed,  3 Jul 2019 23:19:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so3641374edv.12;
 Wed, 03 Jul 2019 16:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c+EKRD290azGq0sTjcZOJOs+EY2cRznfnAB0UMHbemw=;
 b=BpPuWidziE8WNaaXR3qtfccSkXrOOsdrm5bapgRoCVkyxlq0uw5XIKFXP2YRSSoSQX
 mx9lBPtmg5vQNjao4wh3lx7uSOB0kID/kC8HazbrhpYKl8X3vxtGZj6hogRw6EIXd7lu
 RYMHWqeMM94Bs3tQ1ROJWCEsXBsNfUP72RKmH7y5n/zbJ3Ul/bqKnZRYEpgnqDVoMRVB
 c+WCtPV1Twz464onXmtSpLiJYfODm5bVKWvw2Canfj8qqvq9AX4HljuVYc6fBRw3gBBG
 TIpqFVz5oiIJbic6YiHa/qP16L5YeZZuw/BtlO231OB0cN0/DXdW4TDtu4m1qur1Snn/
 k/Wg==
X-Gm-Message-State: APjAAAWkyPak2Fdoz5oVUJa5LAgsUUUnfxKhnWEbfvwaZlY4/+OO2f//
 TqU8L+fIOO6gRQ2qHQl8tUXBb9j+/RdbjhaWdio=
X-Google-Smtp-Source: APXvYqzYfpS1MWQWJgWJU8zmsQsfT+6b6o+ZRt4b7uHG+OyKKhPTp2K5j69eTBi+a7GtjsIsRowmBVvVh2iPaAcVpbU=
X-Received: by 2002:aa7:d888:: with SMTP id u8mr45229494edq.264.1562195982462; 
 Wed, 03 Jul 2019 16:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190703231038.73097-1-john.stultz@linaro.org>
 <20190703231038.73097-2-john.stultz@linaro.org>
In-Reply-To: <20190703231038.73097-2-john.stultz@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jul 2019 16:19:26 -0700
Message-ID: <CAF6AEGucw1mEKoXrpXa9A5o6E_+=Qmq2HP7yRrPmpDD0LSxpxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mesa: Add ir3/ir3_nir_imul.c generation to Android.mk
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c+EKRD290azGq0sTjcZOJOs+EY2cRznfnAB0UMHbemw=;
 b=SX7Qqh1CYyI2MKYDwsMNyUF/NMkeYnrFFwyfvwFf+iBE3WznKXtLKDotoE5T63QTpm
 8l/7hZisxoywsVeE2K38afKWnnC/TInIwe9qjxWi1/1vs4qJFt+Yv12RzHTNzYqIOQP5
 KcmYzhOxvOxqnu6EOp91IOp/DE5nn1U0xIuSU7fvihaeYz0VaUI6QpALFRrNNiT3z7rb
 0W7OxM6XR97zlM/S7nXDbH0DeUVCG8KWOnnrgnRpzayrFuOKjFMTXAELlhNemzdqBfRE
 ap5i5iwaVdqTf2u3AmQLhRfHlk8fgEDit069syp3iqxU33JwiWDX90DHfj4YZUj5wmcg
 Fs8Q==
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCA0OjEwIFBNIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPiB3cm90ZToKPgo+IFdpdGggY3VycmVudCBtYXN0ZXIgd2UncmUgc2VlaW5nIGJ1
aWxkIGZhaWx1cmVzIHdpdGggQU9TUDoKPiAgIGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBpcjNf
bmlyX2xvd2VyX2ltdWwKPgo+IFRoaXMgaXMgZHVlIHRvIHRoZSBpcjNfbmlyX2ltdWwuYyBmaWxl
IG5vdCBiZWluZyBnZW5lcmF0ZWQKPiBpbiB0aGUgQW5kcm9pZC5tayBmaWxlcy4KPgo+IFRoaXMg
cGF0Y2ggc2ltcGx5IGFkZHMgaXQgdG8gdGhlIEFuZHJvaWQgYnVpbGQsIGFmdGVyIHdoaWNoCj4g
dGhpZ25zIGJ1aWxkIGFuZCBib290IG9rIG9uIGRiNDEwYy4KPgo+IENjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZA
Z21haWwuY29tPgo+IENjOiBBbWl0IFB1bmRpciA8YW1pdC5wdW5kaXJAbGluYXJvLm9yZz4KPiBD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogQWxpc3RhaXIg
U3RyYWNoYW4gPGFzdHJhY2hhbkBnb29nbGUuY29tPgo+IENjOiBHcmVnIEhhcnRtYW4gPGdoYXJ0
bWFuQGdvb2dsZS5jb20+Cj4gQ2M6IFRhcGFuaSBQw6RsbGkgPHRhcGFuaS5wYWxsaUBpbnRlbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+
CgoKUmV2aWV3ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KCj4gLS0tCj4g
IHNyYy9mcmVlZHJlbm8vTWFrZWZpbGUuc291cmNlcyAgICAgICAgICAgICAgIHwgMyArKy0KPiAg
c3JjL2dhbGxpdW0vZHJpdmVycy9mcmVlZHJlbm8vQW5kcm9pZC5nZW4ubWsgfCA3ICsrKysrKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9zcmMvZnJlZWRyZW5vL01ha2VmaWxlLnNvdXJjZXMgYi9zcmMvZnJlZWRyZW5v
L01ha2VmaWxlLnNvdXJjZXMKPiBpbmRleCBkOGFhZjJjYWVjYy4uNzVlYzM2MTY2M2IgMTAwNjQ0
Cj4gLS0tIGEvc3JjL2ZyZWVkcmVuby9NYWtlZmlsZS5zb3VyY2VzCj4gKysrIGIvc3JjL2ZyZWVk
cmVuby9NYWtlZmlsZS5zb3VyY2VzCj4gQEAgLTQ4LDcgKzQ4LDggQEAgaXIzX1NPVVJDRVMgOj0g
XAo+ICAgICAgICAgaXIzL2lyM19zdW4uYwo+Cj4gIGlyM19HRU5FUkFURURfRklMRVMgOj0gXAo+
IC0gICAgICAgaXIzL2lyM19uaXJfdHJpZy5jCj4gKyAgICAgICBpcjMvaXIzX25pcl90cmlnLmMg
XAo+ICsgICAgICAgaXIzL2lyM19uaXJfaW11bC5jCj4KPiAgcmVnaXN0ZXJzX0ZJTEVTIDo9IFwK
PiAgICAgICAgIHJlZ2lzdGVycy9hMnh4LnhtbC5oIFwKPiBkaWZmIC0tZ2l0IGEvc3JjL2dhbGxp
dW0vZHJpdmVycy9mcmVlZHJlbm8vQW5kcm9pZC5nZW4ubWsgYi9zcmMvZ2FsbGl1bS9kcml2ZXJz
L2ZyZWVkcmVuby9BbmRyb2lkLmdlbi5tawo+IGluZGV4IGQyOWJhMTU5ZDVjLi4xZDNlZTVmZjg1
NiAxMDA2NDQKPiAtLS0gYS9zcmMvZ2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lkLmdl
bi5tawo+ICsrKyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvZnJlZWRyZW5vL0FuZHJvaWQuZ2VuLm1r
Cj4gQEAgLTI4LDExICsyOCwxOCBAQCBpcjNfbmlyX3RyaWdfZGVwcyA6PSBcCj4gICAgICAgICAk
KE1FU0FfVE9QKS9zcmMvZnJlZWRyZW5vL2lyMy9pcjNfbmlyX3RyaWcucHkgXAo+ICAgICAgICAg
JChNRVNBX1RPUCkvc3JjL2NvbXBpbGVyL25pci9uaXJfYWxnZWJyYWljLnB5Cj4KPiAraXIzX25p
cl9pbXVsX2RlcHMgOj0gXAo+ICsgICAgICAgJChNRVNBX1RPUCkvc3JjL2ZyZWVkcmVuby9pcjMv
aXIzX25pcl9pbXVsLnB5Cj4gKwo+ICBpbnRlcm1lZGlhdGVzIDo9ICQoY2FsbCBsb2NhbC1nZW5l
cmF0ZWQtc291cmNlcy1kaXIpCj4KPiAgJChpbnRlcm1lZGlhdGVzKS9pcjMvaXIzX25pcl90cmln
LmM6ICQoaXIzX25pcl90cmlnX2RlcHMpCj4gICAgICAgICBAbWtkaXIgLXAgJChkaXIgJEApCj4g
ICAgICAgICAkKGhpZGUpICQoTUVTQV9QWVRIT04yKSAkPCAtcCAkKE1FU0FfVE9QKS9zcmMvY29t
cGlsZXIvbmlyID4gJEAKPgo+ICskKGludGVybWVkaWF0ZXMpL2lyMy9pcjNfbmlyX2ltdWwuYzog
JChpcjNfbmlyX2ltdWxfZGVwcykKPiArICAgICAgIEBta2RpciAtcCAkKGRpciAkQCkKPiArICAg
ICAgICQoaGlkZSkgJChNRVNBX1BZVEhPTjIpICQ8IC1wICQoTUVTQV9UT1ApL3NyYy9jb21waWxl
ci9uaXIgPiAkQAo+ICsKPiAgTE9DQUxfR0VORVJBVEVEX1NPVVJDRVMgKz0gJChhZGRwcmVmaXgg
JChpbnRlcm1lZGlhdGVzKS8sIFwKPiAgICAgICAgICQoaXIzX0dFTkVSQVRFRF9GSUxFUykpCj4g
LS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
