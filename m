Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C9127585B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 15:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0B86E9AA;
	Wed, 23 Sep 2020 13:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B36E9AA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 13:03:33 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id q13so27605858ejo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 06:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Xjw7dd085yn9QOIbUTj6PB0RHOh794P8cJK4rnOnhY4=;
 b=mFgDM8BqY0YlZ/B6lb27XbU5VWYCAt1uXq0Y6XTkd4EAm63SimU6zkDQPeJ6JuQHUu
 rfbVSlXu/fsvQoRGdtwXAgcZmGRGkGDDvAlwA8a/I9O0rm5yCYo4rL6mgY6il5TAV4QR
 tltmi224H4/l9g4y7c99yyS0NpChAutz0+zOaz3DG1GIuUF+gJ49d67ZR1WGTD1m/Dv0
 shr0QzSZxLNA3W2b9VY6HdpSAnCfMowgUmGhVYSh5+wHKzQDznI1V8Nig34IW7f5KMGx
 qbEljXZRN+/DLa2ZuPw3W0RMjIXNQNZA+9CHN34zYcsq9f+XeVa7s1MQj1oAXyJ6eyPN
 yRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Xjw7dd085yn9QOIbUTj6PB0RHOh794P8cJK4rnOnhY4=;
 b=a0r3vbPMHdtswlIfdqUD9qIbR8sE7Cnb4gIc4NNSjr2YVMlbWHYubbEUR0Dg76s4TA
 Pg9wffAuTgSy00YbnX9u5W85pjniW/x/zmON06BxDXE9ax/mRkUcK35Gk5Q/CZ/Hk7RT
 gwWp+kvA3kOeALoi5Vm8ytSbDNOrHK8K8UlagPu730HM6B/0emlY06atZ+Ji8EsCwrNv
 Je29q0t6YX8LvGYdZqbWS1AEuIMM4tg048VF4nuaIrVJAn/9QEYC4SM9f+0EZEvuKPo4
 ji6WmUYCHyR+M9epd5qajQllt+y7ZZ2/3xc9CkZEEPJwKuaybAv5VDoUf6OJ3bCVkMIc
 +nJQ==
X-Gm-Message-State: AOAM531Sr/d0E1hVFUQUzxjKWVTpB12g0LW3BgAz7H6dzlMVksqKwGIM
 n8Y0R+d2JmyvQZMH5tpDx/lBpBEMtUM=
X-Google-Smtp-Source: ABdhPJxrZmhkTv4DtIqAhvH7ofVqeM4tJKCxOLTlIeNKdKFLX5/yY87Jpy8Gmif4vcOqySNuMBHEvA==
X-Received: by 2002:a17:906:bcfc:: with SMTP id
 op28mr10520919ejb.248.1600866211726; 
 Wed, 23 Sep 2020 06:03:31 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r10sm9519229edm.94.2020.09.23.06.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 06:03:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/nouveau: stop using persistent_swap_storage
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: skeggsb@gmail.com, airlied@redhat.com, dri-devel@lists.freedesktop.org
References: <20200917142917.3178-1-christian.koenig@amd.com>
Message-ID: <4b32960a-2322-bdd7-cba5-b8f41e896e97@gmail.com>
Date: Wed, 23 Sep 2020 15:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917142917.3178-1-christian.koenig@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8gQmVuLCBEYXZlIGFueSBjb21tZW50IG9uIHRoaXM/CgpBbSAxNy4wOS4yMCB1bSAxNjoy
OSBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gQWNjb3JkaW5nIHRvIEJlbiB0aGlzIGlzIG1v
c3QgbGlrZWx5IGp1c3QgYSBsZWZ0b3Zlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmMKPiBpbmRleCA4OWFk
YWRmNDcwNmIuLjU5NDVjNjYzMzgxZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9nZW0uYwo+IEBAIC0yMDksNyArMjA5LDYgQEAgbm91dmVhdV9nZW1fbmV3KHN0cnVjdCBub3V2
ZWF1X2NsaSAqY2xpLCB1NjQgc2l6ZSwgaW50IGFsaWduLCB1aW50MzJfdCBkb21haW4sCj4gICAJ
aWYgKGRybS0+Y2xpZW50LmRldmljZS5pbmZvLmZhbWlseSA+PSBOVl9ERVZJQ0VfSU5GT19WMF9U
RVNMQSkKPiAgIAkJbnZiby0+dmFsaWRfZG9tYWlucyAmPSBkb21haW47Cj4gICAKPiAtCW52Ym8t
PmJvLnBlcnNpc3RlbnRfc3dhcF9zdG9yYWdlID0gbnZiby0+Ym8uYmFzZS5maWxwOwo+ICAgCSpw
bnZibyA9IG52Ym87Cj4gICAJcmV0dXJuIDA7Cj4gICB9CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
