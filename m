Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF3223D734
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FB36E167;
	Thu,  6 Aug 2020 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BE06E167
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 07:13:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l2so32391634wrc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0C5k/rk1ptAYski25Aj2t3qK6aGZ7aA2GJ3xgy8iiRk=;
 b=iyanfXhtmu08Shq/BqbUGPckTYPW4cGsEI0ZBO5IQZj6UtLUvd8tJ0goX/YUDE8E1C
 amdrzLNoIDud7K+5g5lLKK3dMkZV5SXTRGIZYAd+CZ8H1wBcQXOyjd2RX8tvcST5AGAZ
 K5/Z244UyMBtnnDW7JuxQiBFJtC1jgBeX/6tV0Dx81BKXwek15WMwG27A+gwoXW+XlwV
 euCgMiWsB9TeH0+Yvq8rXniHaz5CjW+UFCnsJEsqkZIDKPogETQ4Z3wClU3qWPZnmaZj
 n1JyzatOk2L2mPjWZhkXqyJHH/HSRMVWk9NzfZCKvLUrwopcYtPpzauz7FO/0Dhnyz1f
 +o1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=0C5k/rk1ptAYski25Aj2t3qK6aGZ7aA2GJ3xgy8iiRk=;
 b=FrtsJpZnUUrKwAw5BDuG2xBH/ftq01/PvybLbY77miWluoZK3Qpuk6lwsmQZNYgXJG
 PR7FHgZuOj74iPSjeO0d7auu5uJZbeomiIqP5zcZETl23yCGMiDERLehYIu75dYx00Ty
 +zwhnMb7OexfyAK06qGr2N9dn5NKmWXjg7aDJzKk742Oz2YVveLArvqYF1SV1ts0CZrM
 X3kIkVe6WbS17A1E7zoN/WBMXFC7vJtXZn4oAiYwyAD9UAUrMGkf0dACtfpwz02kLVt0
 GQUq46L4FKjl1R0az/g7HliZbEX7uWBRXcrX60cHe7NYD/Sl7nLgKv7+qvrCht79lnSK
 Bj6g==
X-Gm-Message-State: AOAM533tBY+6tK2DkqRN7kbXe9g1+hwq8bXrazDdbQqFo8BvtbyWqoiV
 A17XcCvpsmEVIFjcmcjUO+558O0a
X-Google-Smtp-Source: ABdhPJxfY2nsYOenQ7d7XA0gk/adP9aqcSda6l2X558camS8nSOll12OrDwLmUGDe740VspM0PndzA==
X-Received: by 2002:adf:bb52:: with SMTP id x18mr5876417wrg.325.1596698034944; 
 Thu, 06 Aug 2020 00:13:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g188sm6181138wma.5.2020.08.06.00.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 00:13:54 -0700 (PDT)
Subject: Re: [2/2] drm/ttm: make TT creation purely optional v3
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20200629151925.2096-2-christian.koenig@amd.com>
 <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03df2698-293b-2dff-923a-f8c731f55dec@gmail.com>
Date: Thu, 6 Aug 2020 09:13:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDguMjAgdW0gMTg6MTYgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTA2
LTI5IDU6MTkgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gV2Ugb25seSBuZWVkIHRo
ZSBwYWdlIGFycmF5IHdoZW4gdGhlIEJPIGlzIGFib3V0IHRvIGJlIGFjY2Vzc2VkLgo+Pgo+PiBT
byBub3Qgb25seSBwb3B1bGF0ZSwgYnV0IGFsc28gY3JlYXRlIGl0IG9uIGRlbWFuZC4KPj4KPj4g
djI6IG1vdmUgTlVMTCBjaGVjayBpbnRvIHR0bV90dF9jcmVhdGUoKQo+PiB2MzogZml4IHRoZSBv
Y2N1cnJlbmNlIGluIHR0bV9ib19rbWFwX3R0bSBhcyB3ZWxsCj4gVGhpcyBicm9rZSBhbWRncHUg
dXNlcnB0ciBmdW5jdGlvbmFsaXR5IGZvciBtZSwgaW4gcGFydGljdWxhciBhbGwKPiBHTF9BTURf
cGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMsIGUuZy4KPgo+IC4uLi9waWdsaXQvYmluL2FtZF9w
aW5uZWRfbWVtb3J5IGRlY3JlbWVudC1vZmZzZXQgLWF1dG8gLWZibwo+IE9mZnNldCBpcyBkZWNy
ZW1lbnRlZCwgbm8gd2FpdC4KPiBNZXNhOiBVc2VyIGVycm9yOiBHTF9JTlZBTElEX09QRVJBVElP
TiBpbiBnbEJ1ZmZlckRhdGEKPiBbLi4uXQo+IFVuZXhwZWN0ZWQgR0wgZXJyb3I6IEdMX0lOVkFM
SURfT1BFUkFUSU9OIDB4NTAyCj4gKEVycm9yIGF0IHRlc3RzL3NwZWMvYW1kX3Bpbm5lZF9tZW1v
cnkvdGVzdC5jOjIxNCkKPiBQSUdMSVQ6IHsicmVzdWx0IjogImZhaWwiIH0KCkJ1dCBubyBjcmFz
aGVzPyBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgYSBOVUxMIHBvaW50ZXIgZGVyZWYgaWYgd2UgaGF2
ZSAKbWlzc2VkIGNhbGwgcGF0aC4KClRoYW5rcywgZ29pbmcgdG8gdGFrZSBhIGxvb2suCkNocmlz
dGlhbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
