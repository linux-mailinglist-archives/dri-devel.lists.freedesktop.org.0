Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555D3CE9A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 16:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A628890DB;
	Tue, 11 Jun 2019 14:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32550890DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:59 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g13so20377897edu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lq54XoUUkvm7cR+T3gDZyIvL7X/r+IA4m/7jXjFDr+E=;
 b=TtGXYepo63MK4AxVv0E9o8Sr1e5IiaB56l7rcuUeBVfxNJYk4i5sS3L2HHU9915c/x
 vx+/CQapOUlk4FyhjhsDDyLb2IWCblX5WgHUSKm7WDUAwbHVVcBcuDydG2CfiiRZWjPM
 Ud99kmTJ3nwkzZQHvYZdp6zyexnMsj61YUeeWV1suRtf6TrvR6a0qvhQLg8eG1dY6fqu
 jmgwwpcRsNUJS/T+9GYkH/l6aysbxIox5m7saxn5qz025JG/I0M4Pmv9/BIqCP06liXu
 wm9eKouTImEPTOmtyMsWUzmaAXDK4OmIhIQknVuqMLMn6jMmLWmB+jwn1BwXIxPU4GsG
 1BOQ==
X-Gm-Message-State: APjAAAVmyRpv6hG1GxtUlafaLG6qem9uuA4wcJQiLrpQYKXYC8oaom5c
 UPAPCeoCg4a2FDBwrCEBkLh/ApAO4po=
X-Google-Smtp-Source: APXvYqxswKorgdJq3Y5rc5HxvlH/pRvn6x4sun7qDAL3IBVycAvGGx4R2j5EkZZju718VEMVIxJm4w==
X-Received: by 2002:a17:906:398:: with SMTP id
 b24mr36489091eja.78.1560263097845; 
 Tue, 11 Jun 2019 07:24:57 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id w18sm2303546eji.44.2019.06.11.07.24.56
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 07:24:56 -0700 (PDT)
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation
 bits
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190529154635.2659-1-hdegoede@redhat.com>
 <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
 <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
Date: Tue, 11 Jun 2019 16:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
Content-Language: en-US
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Peter Jones <pjones@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMS0wNi0xOSAxNjowNCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gT24gTW9uLCAx
MCBKdW4gMjAxOSBhdCAxNzoxMiwgQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFy
by5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIDI5IE1heSAyMDE5IGF0IDE3OjQ2LCBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPiB3cm90ZToKPj4+Cj4+PiBTdGFydGluZyB3aXRo
IEFDUEkgNi4yIGJpdHMgMSBhbmQgMiBvZiB0aGUgQkdSVCBzdGF0dXMgZmllbGQgYXJlIG5vIGxv
bmdlcgo+Pj4gcmVzZXJ2ZWQuIFRoZXNlIGJpdHMgYXJlIG5vdyB1c2VkIHRvIGluZGljYXRlIGlm
IHRoZSBpbWFnZSBuZWVkcyB0byBiZQo+Pj4gcm90YXRlZCBiZWZvcmUgYmVpbmcgZGlzcGxheWVk
Lgo+Pj4KPj4+IFRoZSBlZmlmYiBjb2RlIGRvZXMgbm90IHN1cHBvcnQgcm90YXRpbmcgdGhlIGlt
YWdlIGJlZm9yZSBjb3B5aW5nIGl0IHRvCj4+PiB0aGUgc2NyZWVuLgo+Pj4KPj4+IFRoaXMgY29t
bWl0IGFkZHMgYSBjaGVjayBmb3IgdGhlc2UgbmV3IGJpdHMgYW5kIGlmIHRoZXkgYXJlIHNldCBs
ZWF2ZXMgdGhlCj4+PiBmYiBjb250ZW50cyBhcyBpcyBpbnN0ZWFkIG9mIHRyeWluZyB0byB1c2Ug
dGhlIHVuLXJvdGF0ZWQgQkdSVCBpbWFnZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+Pgo+PiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2
ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+Cj4+Cj4gCj4gQlRXIHNob3VsZCB3ZSBtYWtl
IHN1cmUgdGhhdCB0aGlzIHBhdGNoIGFuZCB0aGUgZWZpLWJncnQgcGF0Y2ggZ2V0Cj4gbWVyZ2Vk
IGF0IHRoZSBzYW1lIHRpbWU/CgpUaGUgMiBwYXRjaGVzIGFyZSByZWxhdGVkIGJ1dCBtZXJnaW5n
IHRoZW0gYXQgdGhlIHNhbWUgdGltZSBpcyBub3QKbmVjZXNzYXJ5LgoKPiBJIGd1ZXNzIHRoZSBu
ZXQgcmVzdWx0IGlzIGp1c3QgdGhhdCB3ZSBnZXQKPiByaWQgb2Ygc29tZSBlcnJvciBpbiB0aGUg
bG9nLCBidXQgYSByb3RhdGVkIEJNUCB3aWxsIGJlIGlnbm9yZWQKPiBvdGhlcndpc2UuCgpSaWdo
dCwgd29yc2UgY2FzZSAoaWYgdGhlIGJtcCBmaXRzIHByZS1yb3RhdGlvbikgaXQgd2lsbCBiZSBk
aXNwbGF5ZWQKcm90YXRlZC4gTm90ZSBvbiB0aGUgb25lIG1hY2hpbmUgSSdtIGF3YXJlIG9mIHdo
aWNoIHVzZXMgdGhlc2UgYml0cwp0aGUgYm1wIGRvZXMgbm90IGZpdCBwcmUtcm90YXRpb24sIHNv
IHdlIGVuZCB1cCB0cmlnZ2VyaW5nOgoKZXJyb3I6CiAgICAgICAgIG1lbXVubWFwKGJncnRfaW1h
Z2UpOwogICAgICAgICBwcl93YXJuKCJlZmlmYjogSWdub3JpbmcgQkdSVDogdW5leHBlY3RlZCBv
ciBpbnZhbGlkIEJNUCBkYXRhXG4iKTsKfQoKV2hpY2ggdGhpcyBwYXRjaCByZXBsYWNlcyB3aXRo
IGhpdHRpbmc6CgogICAgICAgICBpZiAoYmdydF90YWIuc3RhdHVzICYgMHgwNikgewogICAgICAg
ICAgICAgICAgIHByX2luZm8oImVmaWZiOiBCR1JUIHJvdGF0aW9uIGJpdHMgc2V0LCBub3Qgc2hv
d2luZyBib290IGdyYXBoaWNzXG4iKTsKICAgICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAg
IH0KCkluc3RlYWQuIFNvIGF0IGxlYXN0IG9uIHRoZSBvbmUgbWFjaGluZSBJIGtub3cgb2YgdGhp
cyBpcyA5OSUgY29zbWV0aWMuCgo+IE9yIGlzIGl0IHJlbGV2YW50IGZvciB1c2VybGFuZCBpbiBz
b21lIG90aGVyIHdheT8KCk5vLgoKUmVnYXJkcywKCkhhbnMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
