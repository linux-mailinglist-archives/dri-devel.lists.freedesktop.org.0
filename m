Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE1287097
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 10:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C836EA4A;
	Thu,  8 Oct 2020 08:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DC36EA4A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 08:17:49 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x62so5425899oix.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KveJJoNXGVKZTvi0j1tQocj6iGe4c9H59uxgIgVcZY4=;
 b=iGvNGWfpSISAqgYPY8ofLtD0yklJOMZ1Ai3fCeXhUYJmdBmpSEWhg46hKNxMunVrcS
 7C4NESpFJq6xL9P4QBwYyzGMIXMu7AVykihF3x7zxXvhXE0STNv/yeBwUlRBdMJrbrRJ
 kBrI8Ykysu0zZyGFgyM/gcW+1rrajIL2s6Gqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KveJJoNXGVKZTvi0j1tQocj6iGe4c9H59uxgIgVcZY4=;
 b=RuRIRoz+Yw61s9jExSYCitBDSHIArwgMG3L1mM6wwNVjBhpSSlbqebbhME7dPxbSra
 etD8u52EhViI3GnbPNA9mqzOBX1RiEhLtOeE5UE3p3XeSH8WL/f1SP5Lue9XejJHRX6V
 OC42q55bpYVzmEKKEtAt949Equ3P4DlVFwWcn48v8O9N2Ci/V7GS8+MIZFZvYeyFyN6r
 KRCeMhiVLqD6Ag9m3eDvsmI1UEjzID90mNk9kQFDel17PoSSHo0NzXXCggKDivuH1AGj
 SbfVrJSNH9Tzv1gBxTQ+Br8oN1eUbmCYqce4FUTYcKGpMA/EYlWKHOBtM+9elYe7AK2L
 2mpQ==
X-Gm-Message-State: AOAM531FW4+1CddPw5qP11uMZRIZo16/VjuQr2qnkcA9E8XMyNW8DwGJ
 XGFAl/eyN6WmCN73qfqiEHpbmJjSQCQR48hpeZyAtlYv9Gc76Q==
X-Google-Smtp-Source: ABdhPJx8rx8Zy1nf/dJIOdE5v+nE+nbPzDCVtaQnLJN5DrGsGcjX3yckKmWG0nlAT+CEsCshF0fRB946437yeXm909I=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr4446396oie.128.1602145068396; 
 Thu, 08 Oct 2020 01:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201008081013.27384-1-christian.koenig@amd.com>
In-Reply-To: <20201008081013.27384-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 8 Oct 2020 10:17:37 +0200
Message-ID: <CAKMK7uHj4TEkXqiKmeU9x5m85ynPLoCaYR+GSWV6ZwZrSBbEog@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: use struct_size macro
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: gustavoars@kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgOCwgMjAyMCBhdCAxMDoxMCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIG1hbnVhbGx5
IGNhbGN1bGF0aW5nIHRoZSBzdHJ1Y3R1cmUgc2l6ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9kbWEt
YnVmL2RtYS1yZXN2LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5j
IGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiBpbmRleCAxYzhmMjU4MWNiMDkuLmJiNWE0
MmIxMGMyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+ICsrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4gQEAgLTYzLDcgKzYzLDcgQEAgc3RhdGljIHN0
cnVjdCBkbWFfcmVzdl9saXN0ICpkbWFfcmVzdl9saXN0X2FsbG9jKHVuc2lnbmVkIGludCBzaGFy
ZWRfbWF4KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZG1hX3Jlc3ZfbGlzdCAqbGlzdDsKPgo+IC0g
ICAgICAgbGlzdCA9IGttYWxsb2Mob2Zmc2V0b2YodHlwZW9mKCpsaXN0KSwgc2hhcmVkW3NoYXJl
ZF9tYXhdKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBsaXN0ID0ga21hbGxvYyhzdHJ1Y3Rfc2l6
ZShsaXN0LCBzaGFyZWQsIHNoYXJlZF9tYXgpLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgIGlmICgh
bGlzdCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4KPiAtLQo+IDIuMTcuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
