Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E63D028
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 17:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795B2891F2;
	Tue, 11 Jun 2019 15:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B711E891EF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:04:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c66so3344303wmf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R5/uIi3bQ/ds3NIEa9OHmauK02hAqsI3koc3RXyB0Jg=;
 b=O3DhiHkPeFZtg1aUxtU02ZvTDFuF4jq4pAsmbc6egXFD2sSnkSPxtxBmGQpmz9+TKG
 lNlIqxOyno3GT9hI3D1M/tmY1kDVZeMZ5Cwi1L472YmHzFUAJJCxDYpHEJ//imKGJrCX
 dgwsyf4kTspic9CSJdUhtbwBOdXQODuz8cnq/wV0GFKXiFwaOflxciyF+dM/RpKTXIV6
 ERr78hfbpZ3xm3R8XMDQbFXBUJ0dGqYYaT/k+bIjlx3r9ukCxvSHNmL5UMLb8TYY9aKu
 piMuh3/XbCsxvTv9hmKnCNISRU25qKQx/H06bvc9X7zjF6dbDeUxLC1RqYzcVPn7ZUQG
 CfFg==
X-Gm-Message-State: APjAAAWg9DmJXNz1oK6fc3Zx5mepCurWrWPYV/rigypHl6lHjGB9qj/8
 GIzHT4buTcN0e6kh1gcXeCcmiSxV6K4=
X-Google-Smtp-Source: APXvYqzBscAg7jbeh5Xn9XEqpbYpAKy0hRsWKDmmp3zatLjV8e1MN27GAN407VYF0b8jdNxbywxSpQ==
X-Received: by 2002:a1c:a807:: with SMTP id r7mr17768542wme.137.1560265468401; 
 Tue, 11 Jun 2019 08:04:28 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id f2sm2901250wmc.34.2019.06.11.08.04.27
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 08:04:27 -0700 (PDT)
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation
 bits
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190529154635.2659-1-hdegoede@redhat.com>
 <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
 <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
 <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
 <CAKv+Gu8_+6MNtM3_muP8YqHYYij58LzRFgV_UPaWp4vbjPkm5w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a05daac4-7d54-ec32-618d-fd0f2d0d6641@redhat.com>
Date: Tue, 11 Jun 2019 17:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8_+6MNtM3_muP8YqHYYij58LzRFgV_UPaWp4vbjPkm5w@mail.gmail.com>
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

SGksCgpPbiAxMS0wNi0xOSAxNjozNywgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gT24gVHVlLCAx
MSBKdW4gMjAxOSBhdCAxNjoyNCwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBPbiAxMS0wNi0xOSAxNjowNCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4+PiBPbiBNb24sIDEwIEp1biAyMDE5IGF0IDE3OjEyLCBBcmQgQmllc2hldXZlbCA8
YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBXZWQsIDI5IE1h
eSAyMDE5IGF0IDE3OjQ2LCBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPiB3cm90
ZToKPj4+Pj4KPj4+Pj4gU3RhcnRpbmcgd2l0aCBBQ1BJIDYuMiBiaXRzIDEgYW5kIDIgb2YgdGhl
IEJHUlQgc3RhdHVzIGZpZWxkIGFyZSBubyBsb25nZXIKPj4+Pj4gcmVzZXJ2ZWQuIFRoZXNlIGJp
dHMgYXJlIG5vdyB1c2VkIHRvIGluZGljYXRlIGlmIHRoZSBpbWFnZSBuZWVkcyB0byBiZQo+Pj4+
PiByb3RhdGVkIGJlZm9yZSBiZWluZyBkaXNwbGF5ZWQuCj4+Pj4+Cj4+Pj4+IFRoZSBlZmlmYiBj
b2RlIGRvZXMgbm90IHN1cHBvcnQgcm90YXRpbmcgdGhlIGltYWdlIGJlZm9yZSBjb3B5aW5nIGl0
IHRvCj4+Pj4+IHRoZSBzY3JlZW4uCj4+Pj4+Cj4+Pj4+IFRoaXMgY29tbWl0IGFkZHMgYSBjaGVj
ayBmb3IgdGhlc2UgbmV3IGJpdHMgYW5kIGlmIHRoZXkgYXJlIHNldCBsZWF2ZXMgdGhlCj4+Pj4+
IGZiIGNvbnRlbnRzIGFzIGlzIGluc3RlYWQgb2YgdHJ5aW5nIHRvIHVzZSB0aGUgdW4tcm90YXRl
ZCBCR1JUIGltYWdlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxo
ZGVnb2VkZUByZWRoYXQuY29tPgo+Pj4+Cj4+Pj4gQWNrZWQtYnk6IEFyZCBCaWVzaGV1dmVsIDxh
cmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgo+Pj4+Cj4+Pgo+Pj4gQlRXIHNob3VsZCB3ZSBtYWtl
IHN1cmUgdGhhdCB0aGlzIHBhdGNoIGFuZCB0aGUgZWZpLWJncnQgcGF0Y2ggZ2V0Cj4+PiBtZXJn
ZWQgYXQgdGhlIHNhbWUgdGltZT8KPj4KPj4gVGhlIDIgcGF0Y2hlcyBhcmUgcmVsYXRlZCBidXQg
bWVyZ2luZyB0aGVtIGF0IHRoZSBzYW1lIHRpbWUgaXMgbm90Cj4+IG5lY2Vzc2FyeS4KPj4KPj4+
IEkgZ3Vlc3MgdGhlIG5ldCByZXN1bHQgaXMganVzdCB0aGF0IHdlIGdldAo+Pj4gcmlkIG9mIHNv
bWUgZXJyb3IgaW4gdGhlIGxvZywgYnV0IGEgcm90YXRlZCBCTVAgd2lsbCBiZSBpZ25vcmVkCj4+
PiBvdGhlcndpc2UuCj4+Cj4+IFJpZ2h0LCB3b3JzZSBjYXNlIChpZiB0aGUgYm1wIGZpdHMgcHJl
LXJvdGF0aW9uKSBpdCB3aWxsIGJlIGRpc3BsYXllZAo+PiByb3RhdGVkLiBOb3RlIG9uIHRoZSBv
bmUgbWFjaGluZSBJJ20gYXdhcmUgb2Ygd2hpY2ggdXNlcyB0aGVzZSBiaXRzCj4+IHRoZSBibXAg
ZG9lcyBub3QgZml0IHByZS1yb3RhdGlvbiwgc28gd2UgZW5kIHVwIHRyaWdnZXJpbmc6Cj4+Cj4+
IGVycm9yOgo+PiAgICAgICAgICAgbWVtdW5tYXAoYmdydF9pbWFnZSk7Cj4+ICAgICAgICAgICBw
cl93YXJuKCJlZmlmYjogSWdub3JpbmcgQkdSVDogdW5leHBlY3RlZCBvciBpbnZhbGlkIEJNUCBk
YXRhXG4iKTsKPj4gfQo+Pgo+IAo+IERvZXNuJ3QgdGhhdCBtZWFuIHdlIG1heSBub3cgZW5kIHVw
IGJyZWFraW5nICdxdWlldCcsIGJ5IGV4Y2hhbmdpbmcgYQo+IHByX25vdGljZSgpIGluIHRoZSBl
ZmktYmdydCBkcml2ZXIgZm9yIGEgcHJfd2FybigpIGluIHRoaXMgb25lPwoKcXVpZXQgaGFzIG9u
bHkgbG9nZ2VkIHByX2VyciBhbmQgbW9yZSBzZXZlcmUgZm9yIGFzIGxvbmcgYXMgSSBjYW4KcmVt
ZW1iZXIsIHNvIG5vdGljZSAvIHdhcm4gZG9lcyBub3QgbWF0dGVyIGZvciBxdWlldC4KCkFsc28g
Zm9yIGZsaWNrZXJmcmVlIGJvb3QgSSd2ZSBtYWRlIHRoZSBxdWlldCBjdXQtb2ZmIGNvbmZpZ3Vy
YWJsZQooQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxfUVVJRVQpIGFuZCBpbiBGZWRvcmEgYXQgbGVh
c3Qgd2Ugc2V0IGl0IHRvIG9ubHkKc2hvdyBtZXNzYWdlcyBhdCBLRVJOX0NSSVQgYW5kIG1vcmUg
c2V2ZXJlIGxldmVscywgc2luY2UgdGhlcmUgYXJlCnNpbXBseSB0b28gbWFueSBmYWxzZS1wb3Np
dGl2ZSBwcl9lcnIgbWVzc2FnZXMgaW4gdGhlIGtlcm5lbCBhbmQKSSBxdWlja2x5IGdvdCB0aXJl
ZCBvZiB0aGUgd2hhY2stYS1tb2xlIGdhbWUuCgpSZWdhcmRzLAoKSGFucwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
