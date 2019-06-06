Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7613728A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B928914B;
	Thu,  6 Jun 2019 11:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EA28914B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:13:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n9so2009952wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 04:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KMP+S8Zzzlppj/DSEIIpNT6P5UImkKrF1xLw7rIljcI=;
 b=L4OF9pL0YIyipmXenE/67h837lMvka1Fsk3s4Eeg6ByCkKC94xuCGT58MJDW280B/R
 Ud7NfK7W0cl3WIGYfOXX6TwfTwVB2+l0708112Q1+5JEO4+Ui1Xz10gMj9BFXqUviQWx
 Y/GOUEsp6I98mXRw8/wMWTcQezSeIZeGLZa55w9FhFWvQym11N92iKY9CCkzgEGrZ1/j
 zceif0pFYKwozrOGHuSxvqITnF6jQPdhEVbGKLdouhPVpi8QcLuI1oGre///O0W02FsN
 CM7n8awLmTfryyVBqI0bOdvj05ws5Y4Gg/RxOkXb10Lz9LZ529P+9nx1TY3o5KTWkIpL
 l3DQ==
X-Gm-Message-State: APjAAAVbksOtK5LI0y7LOOXhQ48b9l9+uYC40eXohJ8gzfcy0QyL+5b+
 bTF2k5EizQ4VfWhm3r3kN7MX6Z7gToc=
X-Google-Smtp-Source: APXvYqxJJpExF9pXqiMfGU9OvG8X+2qaA6Jab/6kuWoU6Zf4oLekuEYL2X/liBQpilo4y2PdFLWYjA==
X-Received: by 2002:adf:c5c1:: with SMTP id v1mr11805441wrg.129.1559819622988; 
 Thu, 06 Jun 2019 04:13:42 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id l15sm2391244wrb.42.2019.06.06.04.13.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 04:13:41 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190524125759.14131-1-hdegoede@redhat.com>
 <20190524125759.14131-2-hdegoede@redhat.com>
 <20190606091440.qomxukz72puwq7vy@flea>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e2077be3-c637-daf2-27dc-b1461c77f796@redhat.com>
Date: Thu, 6 Jun 2019 13:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606091440.qomxukz72puwq7vy@flea>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwNi0wNi0xOSAxMToxNCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBGcmksIE1h
eSAyNCwgMjAxOSBhdCAwMjo1Nzo1OVBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBH
UEQgaGFzIGRvbmUgaXQgYWdhaW4sIG1ha2UgYSBuaWNlIGRldmljZSAoZ29vZCksIHVzZSB3YXkg
dG9vIGdlbmVyaWMKPj4gRE1JIHN0cmluZ3MgKGJhZCkgYW5kIHVzZSBhIHBvcnRyYWl0IHNjcmVl
biByb3RhdGVkIDkwIGRlZ3JlZXMgKHVnbHkpLgo+Pgo+PiBCZWNhdXNlIG9mIHRoZSB0b28gZ2Vu
ZXJpYyBETUkgc3RyaW5ncyB0aGlzIGVudHJ5IGlzIGFsc28gZG9pbmcgYmlvcy1kYXRlCj4+IG1h
dGNoaW5nLCBzbyB0aGUgZ3BkX21pY3JvcGMgZGF0YSBzdHJ1Y3QgbWF5IHZlcnkgd2VsbCBuZWVk
IHRvIGJlIHVwZGF0ZWQKPj4gd2l0aCBzb21lIGV4dHJhIGJpb3MtZGF0ZXMgaW4gdGhlIGZ1dHVy
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4KPiAKPiBGb3IgYm90aCBwYXRjaGVzLAo+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGJvb3RsaW4uY29tPgoKVGhhbmsgeW91LCBJJ3ZlIHB1c2hlZCBib3RoIHRvIGRy
bS1taXNjLW5leHQgbm93LgoKQ2FuIHlvdSBhZGQgdGhlbSB0byBkcm0tbWlzYy1maXhlcyBwbGVh
c2UgPwoKKEFGQUlLIEknbSBub3Qgc3VwcG9zZWQgdG8gZG8gdGhhdCBteXNlbGYpCgpSZWdhcmRz
LAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
