Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314C43D3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 17:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6619897BB;
	Thu, 13 Jun 2019 15:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D92897BB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:40:50 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d15so13056052qkl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SA4POR46o0xCX4BTzWpKKsi1lH/ME0jZ1KAe49QXoFc=;
 b=eFCgPD9UunT/X49VEhCzjmCe8BaHv6AcI+LLsiVIZFcRUY3ADbQnJbDHmKpdTGCdQM
 DE9tuS6jsTy6N5Qc6zaET1GbtuBlkmcqef5xSsqKI2lvGBKvER/hwlXt/XRAsiN0XQ6r
 PX0hWV4T6VWyP9HWHzyjCMtxLCJoQkgXOb+LdHNFwYgNd0BgijtuQS83SfPkokChIeTx
 ktEAs1bP4K6UVRRAP577TbLScK7uWCYCpD42YyaO+XjKtTx2/HoAyRzxN/2reo4cGg2A
 M6hsOFO4zozqiDdsYwUWePgoI4Fzk57vQuJ3f9vI7OBReEyuyFuAK2CEjsfhocLIp4kE
 jeWQ==
X-Gm-Message-State: APjAAAVKTcze+0gUMb9Eo4dH1MIH03IZiUtCseQTSu6ZNGhDtcyce6x/
 yGdjTcP0BGCALyp9hK2Njec8OLKBaSNgmveZ1xb9+Q==
X-Google-Smtp-Source: APXvYqyigekNYqm9tn7SbdLFExuyBFaJP6SxsxJohH6rMgZL27nmsW9uNiitMtaIH+jY2f8Wsx2DE2qe9+T8awDKd9w=
X-Received: by 2002:ae9:c017:: with SMTP id u23mr72724137qkk.245.1560440449374; 
 Thu, 13 Jun 2019 08:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190613114618.GD13119@kroah.com>
In-Reply-To: <20190613114618.GD13119@kroah.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 13 Jun 2019 17:40:38 +0200
Message-ID: <CA+M3ks7sm2muefY4czZLjxyfZXC5BmYd5CZgePxgGe1cGbUgkA@mail.gmail.com>
Subject: Re: [PATCH] sti: no need to check return value of debugfs_create
 functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SA4POR46o0xCX4BTzWpKKsi1lH/ME0jZ1KAe49QXoFc=;
 b=VmyiLP3GNpM9JBhCZU/eXEXSdE8ZsT0JDZK6GqpyoKQBlWp9GDGf4oLXaNDf8Mppk6
 cyY3S0TWImVSBKdVmQ6c8Bojt/S2rBBInpQKf5zGhh2CYJ9dwnsm2VLr1HJbNNH7fKVG
 iTIcQVLZfpcGTyrRKMVAyVwFzLeu5SWB8RfFO/cgEAfuhahKQAkHhbrInWV5AYOcUKsP
 D4iibBIKOzQ8cTLq9zbtJPj3L/VhEazbqE4LzyKPgzoNsN8AKGatHd/Rwap1CZ7B/tp3
 T7HTWgt/BuQ8oqDsB6HjZMvd4ZtvxZJVHGL3pzN5LWGpkBNk1uPK2/KFxQLpb0+QiLpY
 XBnQ==
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
Cc: David Airlie <airlied@linux.ie>, Vincent Abriou <vincent.abriou@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAxMyBqdWluIDIwMTkgw6AgMTM6NDYsIEdyZWcgS3JvYWgtSGFydG1hbgo8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+IGEgw6ljcml0IDoKPgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2Zz
IGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2
YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBz
aG91bGQKPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4KPiBD
YzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6
IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCkFwcGxpZWQg
b24gZHJtLW1pc2MtbmV4dC4KVGhhbmtzLApCZW5qYW1pbgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfZHJ2LmMgfCAxMCArKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYwo+IGluZGV4
IGE1MjVmZDg5OWY2OC4uNDc5N2U0NmJmMzg0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdGkvc3RpX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMKPiBA
QCAtOTUsNyArOTUsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9pbmZvX2xpc3Qgc3RpX2RybV9kYmdf
bGlzdFtdID0gewo+Cj4gIHN0YXRpYyBpbnQgc3RpX2RybV9kYmdfaW5pdChzdHJ1Y3QgZHJtX21p
bm9yICptaW5vcikKPiAgewo+IC0gICAgICAgc3RydWN0IGRlbnRyeSAqZGVudHJ5Owo+ICAgICAg
ICAgaW50IHJldDsKPgo+ICAgICAgICAgcmV0ID0gZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKHN0
aV9kcm1fZGJnX2xpc3QsCj4gQEAgLTEwNCwxMyArMTAzLDggQEAgc3RhdGljIGludCBzdGlfZHJt
X2RiZ19pbml0KHN0cnVjdCBkcm1fbWlub3IgKm1pbm9yKQo+ICAgICAgICAgaWYgKHJldCkKPiAg
ICAgICAgICAgICAgICAgZ290byBlcnI7Cj4KPiAtICAgICAgIGRlbnRyeSA9IGRlYnVnZnNfY3Jl
YXRlX2ZpbGUoImZwc19zaG93IiwgU19JUlVHTyB8IFNfSVdVU1IsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsIG1pbm9yLT5kZXYsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdGlfZHJtX2Zwc19mb3BzKTsK
PiAtICAgICAgIGlmICghZGVudHJ5KSB7Cj4gLSAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07
Cj4gLSAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+IC0gICAgICAgfQo+ICsgICAgICAgZGVidWdm
c19jcmVhdGVfZmlsZSgiZnBzX3Nob3ciLCBTX0lSVUdPIHwgU19JV1VTUiwgbWlub3ItPmRlYnVn
ZnNfcm9vdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgbWlub3ItPmRldiwgJnN0aV9k
cm1fZnBzX2ZvcHMpOwo+Cj4gICAgICAgICBEUk1fSU5GTygiJXM6IGRlYnVnZnMgaW5zdGFsbGVk
XG4iLCBEUklWRVJfTkFNRSk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIuMjIuMAo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
