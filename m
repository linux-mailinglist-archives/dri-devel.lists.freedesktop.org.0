Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E625AD16
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 16:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD75D6E91C;
	Wed,  2 Sep 2020 14:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA9A6E91C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 14:29:56 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id t7so4443223otp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NVVASDf36U7PqiB4Y2Q8w0U+uet8qgjC1yDHLD7Nymk=;
 b=WB4CyfGtI1ds2AqEDe7hmi5eu/pjphJmVnxrJTFzGSzsWHnu17xiWX2V0ZWX35SUyv
 tkisiqRvJgD9hld5KCEEtImMo1j5d8gxNaexznjKUqvYGv3WzJ2mVh6ngSqLKrsU35zn
 RXgZeuao1qIzdonHQzo5uGOCGW2/bKLitR710=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NVVASDf36U7PqiB4Y2Q8w0U+uet8qgjC1yDHLD7Nymk=;
 b=EakDTHR697AuPXCWh78o6zH1dX2n7ZR9yjR6cjEPJEIMYwIqEb9cM9n/f0wuV7azFm
 nqHic4haW3vPjocC5hrHpVOJUVg7GKiAotfofIB3Q1BOYH8nM6E692Lp7Oipc5JpmKO1
 V+zI/tisMlJ9JMrYCXlW8qkba9PAzN7IR6Dc7q0ckv1ZSbmzuekQ+2Rj0OFdrZRelde/
 xNXQQofReaRr+TUtPTOc0AeXdEnv3lFK5Nj6hO+qklxG44KKYKbB/r5HpjsU4Yf/k2/V
 xAZTHzv9UsZwbMzRV8vIyC9I08TiVQipry/RkV4QWpnp57cvhgFKkB0DZfO0UkAOF1iT
 bY3Q==
X-Gm-Message-State: AOAM533fRmWVu8340C5mr72ZWIBpAxbJeNWNsZK8Oddz98JNZKscoZUv
 DcC/LuxBWMk26AU9+CphSTjrrQFGSw3rhPIEWlsvlQ==
X-Google-Smtp-Source: ABdhPJxLFujdyaiSE87nTAobMiyRM0PW4hc1aXu95vql/N9V2IjccGax33FDZ6tcT9kcPFg9U+dv0W4g6o4BXaRjdSs=
X-Received: by 2002:a9d:eaa:: with SMTP id 39mr5682763otj.188.1599056996198;
 Wed, 02 Sep 2020 07:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
In-Reply-To: <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 2 Sep 2020 16:29:45 +0200
Message-ID: <CAKMK7uGs2vQNf1+=4spQV4aCncOPE4+E7g95xqZ7kcD8pp5bTg@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMiwgMjAyMCBhdCAyOjQ5IFBNIFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4gd3JvdGU6Cj4KPiBPbiBXZWRuZXNkYXksIFNlcHRlbWJlciAyLCAyMDIwIDI6NDQgUE0s
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiA+IEkg
c3VwcG9zZSBzb21ldGhpbmcgc2ltaWxhciBoYXBwZW5zIGluIHVzZXItc3BhY2U6IGdibV9ib19j
cmVhdGUKPiA+ID4gd2l0aG91dCBtb2RpZmllcnMgbmVlZHMgdG8gcHJvcGVybHkgc2V0IHRoZSBp
bXBsaWNpdCBtb2RpZmllciwgaWUuCj4gPiA+IGdibV9ib19nZXRfbW9kaWZpZXIgbmVlZHMgdG8g
cmV0dXJuIHRoZSBlZmZlY3RpdmUgbW9kaWZpZXIuIElzIHRoaXMKPiA+ID4gc29tZXRoaW5nIGFs
cmVhZHkgZG9jdW1lbnRlZD8KPiA+Cj4gPiBJIGRvbid0IHRoaW5rIHRoYXQgaGFwcGVucywgYnV0
IGl0IGhhcyBjb21lIHVwIGluIGRpc2N1c3Npb25zLiBJdCdzCj4gPiBraW5kYSBkaWZmZXJlbnQg
c2NlbmFyaW8gdGhvdWdoOiBnZXRmYjIgaXMgZm9yIGNyb3NzLWNvbXBvc2l0b3Igc3R1ZmYsCj4g
PiBlbmFibGluZyBzbW9vdGggdHJhbnNpdGlvbnMgYXQgYm9vdC11cCBhbmQgd2hlbiBzd2l0Y2hp
bmcuIFNvIHlvdSBoYXZlCj4gPiBhIGxlZ2l0IHJlYXNvbiBmb3IgbWl4aW5nIG1vZGlmaWVyLWF3
YXJlIHVzZXJzcGFjZSB3aXRoCj4gPiBub24tbW9kaWZpZXItYXdhcmUgdXNlcnNwYWNlLiBBbmQg
dGhlIG1vZGlmaWVyLWF3YXJlIHVzZXJzcGFjZSB3b3VsZAo+ID4gbGlrZSB0aGF0IGV2ZXJ5dGhp
bmcgd29ya3Mgd2l0aCBtb2RpZmllcnMgY29uc2lzdGVudGx5LCBpbmNsdWRpbmcKPiA+IGdldGZi
Mi4gQnV0IGdibSBpcyBqdXN0IHdpdGhpbiBhIHNpbmdsZSBwcm9jZXNzLCBhbmQgdGhhdCBzaG91
bGQKPiA+IGVpdGhlciBydW4gYWxsIHdpdGggbW9kaWZpZXJzLCBvciBub3QgYXQgYWxsLCBzaW5j
ZSB0aGVzZSB3b3JsZHMganVzdAo+ID4gZG9udCBtaXggd2VsbC4gSGVuY2UgSSdtIG5vdCBzZWVp
bmcgbXVjaCB1c2UgZm9yIHRoYXQsIC1tb2Rlc2V0dGluZwo+ID4gYmVpbmcgYSBjb25mdXNlZCBt
ZXNzIG5vbndpdGhzdGFuZGluZyA6LSkKPgo+IFdlbGzigKYgVGhlcmUncyBhbHNvIHRoZSBjYXNl
IHdoZXJlIHNvbWUgbGVnYWN5IFdheWxhbmQgY2xpZW50IHRhbGtzIHRvIGEKPiBtb2RpZmllci1h
d2FyZSBjb21wb3NpdG9yLiBnYm1fYm9faW1wb3J0IHdvdWxkIGJlIGNhbGxlZCB3aXRob3V0IGEK
PiBtb2RpZmllciwgYnV0IHRoZSBjb21wb3NpdG9yIGV4cGVjdHMgZ2JtX2JvX2dldF9tb2RpZmll
ciB0byB3b3JrLgo+Cj4gQWxzbywgd2xyb290cyB3aWxsIGNhbGwgZ2JtX2JvX2NyZWF0ZSB3aXRo
b3V0IGEgbW9kaWZpZXIgdG8gb25seSBsZXQKPiB0aGUgZHJpdmVyIHBpY2sgInNhZmUiIG1vZGlm
aWVycyBpbiBjYXNlIHBhc3NpbmcgdGhlIGZ1bGwgbGlzdCBvZgo+IG1vZGlmaWVycyByZXN1bHRz
IGluIGEgYmxhY2sgc2NyZWVuLiBMYXRlciBvbiB3bHJvb3RzIHdpbGwgY2FsbAo+IGdibV9ib19n
ZXRfbW9kaWZpZXIgdG8gZmlndXJlIG91dCB3aGF0IG1vZGlmaWVyIHRoZSBkcml2ZXIgcGlja2Vk
LgoKZ2JtX2JvX2ltcG9ydCBpcyBhIGRpZmZlcmVudCB0aGluZyBmcm9tIGdibV9ib19jcmVhdGUu
IEZvcm1lciBJIGFncmVlCnNob3VsZCBmaWd1cmUgb3V0IHRoZSByaWdodCBtb2RpZmllcnMgKGFu
ZCBJIHRoaW5rIGl0IGRvZXMgdGhhdCwgYXQKbGVhc3Qgb24gaW50ZWwgbWVzYSkuIEZvciBnYm1f
Ym9fY3JlYXRlIEknbSBub3Qgc3VyZSB3ZSBzaG91bGQvbmVlZCB0bwpyZXF1aXJlIHRoYXQuCi1E
YW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
