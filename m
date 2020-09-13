Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80226856D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351146E1F7;
	Mon, 14 Sep 2020 07:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7989F2D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 18:37:06 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b22so7474854lfs.13
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6JrXgrGcuM/lh+9ydycjop/vKpXIRF8pxi41i/Mqj7w=;
 b=MNKBG4qd8al4yLawWk9ma3/zvVcEMdhlM1BlJzg220J/cBrV+EIgrUHb065fBXSQMp
 ZE6pX5R+Nxm9bLVMYSpU0hM0ZdYl0qXvn3SGMaL8i9/O1x3xqaREWiI/oBgBSYRTaDZZ
 Oe38mbEVcNU0/13hIeERDjW6lBJVyHeBLiRrTmPNGA9jSbk0hdyBbsG+TmmTUkt6NnMM
 2P+Cy7Q5rhvIF75IUs32prVImc7YzefKZTG3oO96rkxO9vRrgCLK+GnlbcsI1B8Xc87P
 V1Ho08Y/RYeqaxkUQ7kwdWLqX0EeikremwLfg3AqAcDsM8hQnKArh72mhtJYY4w4OxaH
 SM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6JrXgrGcuM/lh+9ydycjop/vKpXIRF8pxi41i/Mqj7w=;
 b=HggJxNXqbRU5O9QLvOz8vXnlTehJNZgEbIiHhuPmAZXc9wg//n7xF2d6OrxiJ1ZAyD
 Q+i9N+evdyqZiHahdfyYNQG29fWOdxuveg0xw1VJr7OS+tK2X0cTw3ifVRa+yfeJky8B
 oVsLV1uOxQKpfUZZ0HU4Dd9QqS/WtMv+fz9GuAzg++DBnWVLjm/C8SD3kPrCxHBfWgkg
 Mpbe+zV3RwfkW7ns5TdWGhDfUN17rdndNJsCZJxq8+63xqW5U8eeTJHDClmrEudJTtQo
 lF1K7ZPyBOSFjjJG/gY1Iz3bIP352Y3DvCcsxlgUWzSTl97lndNdlIDCAuhRECdmpCAi
 JRNw==
X-Gm-Message-State: AOAM5327rIMRONCG0+jF09SwqRAOrYU9HDg+LjIDYrxrXZSdjFFrmGhm
 9a02BFZe9j8txI/IziXr/fM=
X-Google-Smtp-Source: ABdhPJxs164zhRlgTtqXXKJS7zgNaFJvvgayhPykK1yIaRI6ZEZNIDIxoK3B7+n43mCQz/US8XyBTQ==
X-Received: by 2002:a19:a406:: with SMTP id q6mr3452621lfc.556.1600022224641; 
 Sun, 13 Sep 2020 11:37:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id y4sm3322747ljk.61.2020.09.13.11.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 11:37:03 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
 <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
 <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
 <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
 <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fe626343-6f10-96bd-171c-7876917d570b@gmail.com>
Date: Sun, 13 Sep 2020 21:37:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMDkuMjAyMCAxMjo1MSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBBbGwg
d2FpdHMgdGhhdCBhcmUgaW50ZXJuYWwgdG8gYSBqb2Igc2hvdWxkIG9ubHkgd2FpdCBmb3IgcmVs
YXRpdmUgc3luYwo+PiBwb2ludCBpbmNyZW1lbnRzLiA+Cj4+IEluIHRoZSBncmF0ZS1rZXJuZWwg
ZXZlcnkgam9iIHVzZXMgdW5pcXVlLWFuZC1jbGVhbiBzeW5jIHBvaW50ICh3aGljaCBpcwo+PiBh
bHNvIGludGVybmFsIHRvIHRoZSBrZXJuZWwgZHJpdmVyKSBhbmQgYSByZWxhdGl2ZSB3YWl0IFsx
XSBpcyB1c2VkIGZvcgo+PiB0aGUgam9iJ3MgaW50ZXJuYWwgc3luYyBwb2ludCBpbmNyZW1lbnRz
IFsyXVszXVs0XSwgYW5kIHRodXMsIGtlcm5lbAo+PiBkcml2ZXIgc2ltcGx5IGp1bXBzIG92ZXIg
YSBodW5nIGpvYiBieSB1cGRhdGluZyBETUFHRVQgdG8gcG9pbnQgYXQgdGhlCj4+IHN0YXJ0IG9m
IGEgbmV4dCBqb2IuCj4gCj4gSXNzdWVzIEkgaGF2ZSB3aXRoIHRoaXMgYXBwcm9hY2g6Cj4gCj4g
KiBCb3RoIHRoaXMgYW5kIG15IGFwcHJvYWNoIGhhdmUgdGhlIHJlcXVpcmVtZW50IGZvciB1c2Vy
c3BhY2UsIHRoYXQgaWYKPiBhIGpvYiBoYW5ncywgdGhlIHVzZXJzcGFjZSBtdXN0IGVuc3VyZSBh
bGwgZXh0ZXJuYWwgd2FpdGVycyBoYXZlIHRpbWVkCj4gb3V0IC8gYmVlbiBzdG9wcGVkIGJlZm9y
ZSB0aGUgc3luY3BvaW50IGNhbiBiZSBmcmVlZCwgYXMgaWYgdGhlCj4gc3luY3BvaW50IGdldHMg
cmV1c2VkIGJlZm9yZSB0aGVuLCBmYWxzZSB3YWl0ZXIgY29tcGxldGlvbnMgY2FuIGhhcHBlbi4K
PiAKPiBTbyBmcmVlaW5nIHRoZSBzeW5jcG9pbnQgbXVzdCBiZSBleHBvc2VkIHRvIHVzZXJzcGFj
ZS4gVGhlIGtlcm5lbCBjYW5ub3QKPiBkbyB0aGlzIHNpbmNlIHRoZXJlIG1heSBiZSB3YWl0ZXJz
IHRoYXQgdGhlIGtlcm5lbCBpcyBub3QgYXdhcmUgb2YuIE15Cj4gcHJvcG9zYWwgb25seSBoYXMg
b25lIHN5bmNwb2ludCwgd2hpY2ggSSBmZWVsIG1ha2VzIHRoaXMgcGFydCBzaW1wbGVyLCB0b28u
Cj4gCj4gKiBJIGJlbGlldmUgdGhpcyBwcm9wb3NhbCByZXF1aXJlcyBhbGxvY2F0aW5nIGEgc3lu
Y3BvaW50IGZvciBlYWNoCj4gZXh0ZXJuYWxseSB2aXNpYmxlIHN5bmNwb2ludCBpbmNyZW1lbnQg
dGhhdCB0aGUgam9iIGRvZXMuIFRoaXMgY2FuIHVzZQo+IHVwIHF1aXRlIGEgZmV3IHN5bmNwb2lu
dHMsIGFuZCBpdCBtYWtlcyBzeW5jcG9pbnRzIGEgZHluYW1pY2FsbHkKPiBhbGxvY2F0ZWQgcmVz
b3VyY2Ugd2l0aCB1bmJvdW5kZWQgYWxsb2NhdGlvbiBsYXRlbmN5LiBUaGlzIGlzIGEgcHJvYmxl
bQo+IGZvciBzYWZldHktcmVsYXRlZCBzeXN0ZW1zLgoKTWF5YmUgd2UgY291bGQgaGF2ZSBhIHNw
ZWNpYWwgdHlwZSBvZiBhICJzaGFyZWQiIHN5bmMgcG9pbnQgdGhhdCBpcwphbGxvY2F0ZWQgcGVy
LWhhcmR3YXJlIGVuZ2luZT8gVGhlbiBzaGFyZWQgU1Agd29uJ3QgYmUgYSBzY2FyY2UgcmVzb3Vy
Y2UKYW5kIGpvYiB3b24ndCBkZXBlbmQgb24gaXQuIFRoZSBrZXJuZWwgb3IgdXNlcnNwYWNlIGRy
aXZlciBtYXkgdGFrZSBjYXJlCm9mIHJlY292ZXJpbmcgdGhlIGNvdW50ZXIgdmFsdWUgb2YgYSBz
aGFyZWQgU1Agd2hlbiBqb2IgaGFuZ3Mgb3IgZG8Kd2hhdGV2ZXIgZWxzZSBpcyBuZWVkZWQgd2l0
aG91dCBhZmZlY3RpbmcgdGhlIGpvYidzIHN5bmMgcG9pbnQuCgpQcmltYXJpbHkgSSdtIG5vdCBm
ZWVsaW5nIHZlcnkgaGFwcHkgYWJvdXQgcmV0YWluaW5nIHRoZSBqb2IncyBzeW5jCnBvaW50IHJl
Y292ZXJ5IGNvZGUgYmVjYXVzZSBpdCB3YXMgYnJva2VuIHRoZSBsYXN0IHRpbWUgSSB0b3VjaGVk
IGl0IGFuZApncmF0ZS1rZXJuZWwgd29ya3MgZmluZSB3aXRob3V0IGl0LgoKPiAqIElmIGEgam9i
IGZhaWxzIG9uIGEgInZpcnR1YWwgY2hhbm5lbCIgKHVzZXJjdHgpLCBJIHRoaW5rIGl0J3MgYQo+
IHJlYXNvbmFibGUgZXhwZWN0YXRpb24gdGhhdCBmdXJ0aGVyIGpvYnMgb24gdGhhdCAidmlydHVh
bCBjaGFubmVsIiB3aWxsCj4gbm90IGV4ZWN1dGUsIGFuZCBJIHRoaW5rIGltcGxlbWVudGluZyB0
aGF0IG1vZGVsIGlzIHNpbXBsZXIgdGhhbiBkb2luZwo+IHJlY292ZXJ5LgoKQ291bGRuJ3Qgam9i
cyBqdXN0IHVzZSBleHBsaWNpdCBmZW5jaW5nPyBUaGVuIGEgc2Vjb25kIGpvYiB3b24ndCBiZQpl
eGVjdXRlZCBpZiBmaXJzdCBqb2IgaGFuZ3MgYW5kIGV4cGxpY2l0IGRlcGVuZGVuY3kgaXMgZXhw
cmVzc2VkLiBJJ20Kbm90IHN1cmUgdGhhdCBjb25jZXB0IG9mIGEgInZpcnR1YWwgY2hhbm5lbCIg
aXMgYXBwbGljYWJsZSB0byBkcm0tc2NoZWR1bGVyLgoKSSdsbCBuZWVkIHRvIHNlZSBhIGZ1bGwt
ZmVhdHVyZWQgZHJpdmVyIGltcGxlbWVudGF0aW9uIGFuZCB0aGUgdGVzdApjYXNlcyB0aGF0IGNv
dmVyIGFsbCB0aGUgcHJvYmxlbXMgdGhhdCB5b3UncmUgd29ycmllZCBhYm91dCBiZWNhdXNlIEkn
bQpub3QgYXdhcmUgYWJvdXQgYWxsIHRoZSBUMTI0KyBuZWVkcyBhbmQgc2VlaW5nIGNvZGUgc2hv
dWxkIGhlbHAuIE1heWJlCmluIHRoZSBlbmQgeW91cnMgYXBwcm9hY2ggd2lsbCBiZSB0aGUgYmVz
dCwgYnV0IGZvciBub3cgaXQncyBub3QgY2xlYXIgOikKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
