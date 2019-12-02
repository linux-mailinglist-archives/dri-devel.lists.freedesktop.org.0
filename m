Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065E10E97D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 12:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6346E148;
	Mon,  2 Dec 2019 11:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364D6E148
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 11:21:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y5so14934295lfy.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 03:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzQY8ysi3fT6Co4/MqtHPbj4fPY/+U/ENbweS9dY9nE=;
 b=AhMwBbNtcLnztcsA11lgdbfJ1yY7tXLdaCCRb2AKfRd7qJNom8MXHsS9JTSJ7hMQ5V
 v93+r910rcnkL38Hq/Wvx2hocVtR//Seak2i3cHSAYZpJuNU8HShj4W7njVrdoFA/uiN
 rxEOmSuv5VQGPSZpMdbllUkAHHQIGrRsHW/pSV1NsPlScOQPuu/tIMEBTfjCeJ3ayTnr
 1r9gPOZr7uH0+GNAF+4de7chUwCUYq+7l7SWeIzUcHUu7ny0CLncvHNxYe/KHZWMb/Bw
 J71t0Ywn1z5blb0q1HTtVo4oAFrnGZHjfhYhfg5eibPRF5rlvj5SDN99ODDtuY5uL7d4
 M1EQ==
X-Gm-Message-State: APjAAAVEeE7+huUYVPvjRbboKri9F68pd15zOFstUPeupJ3cw9JB6Qf+
 UcpGrKtf4E0ykYv3oVcqqT/JZ/2JCMgxBtJ5TBY0UA==
X-Google-Smtp-Source: APXvYqxizDsV6syxLFSpMOqZGIeczavEByhmdDXOVDNV4RRu+SUnOftHbEdPa0gGND2j61UuSk/iw7O6dhtfU4+t6Zk=
X-Received: by 2002:a19:f701:: with SMTP id z1mr37022370lfe.133.1575285684598; 
 Mon, 02 Dec 2019 03:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20191129185836.2789-1-hdegoede@redhat.com>
 <20191129185836.2789-3-hdegoede@redhat.com>
In-Reply-To: <20191129185836.2789-3-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Dec 2019 12:21:13 +0100
Message-ID: <CACRpkdbRb-LF2tNN-ueo=tKuJc+u4B7Y20+BCyqnN7wYbm8y7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/i915/vlv_dsi: Control panel and backlight enable
 GPIOs on BYT
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yzQY8ysi3fT6Co4/MqtHPbj4fPY/+U/ENbweS9dY9nE=;
 b=pQkNeClTp2cf5DYqzAKqS48zGZdNUDqc9VZ7tpoKCvLUMnWKlkari52Nb79LdNPm8E
 WTOtoAFWCysbP4teqhLKD5GSMyi4zP1zomk2lES0NPpsDpSq6qk5X4Y9PA9/7IiCkthS
 EPGhZxblrCf4u9372E1KKSmCVy/x+2XnKll7AfnCQyoPi/xcuM62orWhXrqdwqDxpAIk
 xTahI+RAIZI7t8z889baVqjk6B+tztSHvaTWDDGP9ow8cc3HRHbHdhJkdACksUPCxfc8
 z27dcPZ6YJfUJ20E0eF0C0Z4pYhqRhMAyyn4RnNjSECWwEimYpST9CdhWXEVNjntMyBx
 0egw==
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
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucywKCnRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgTm92IDI5LCAyMDE5
IGF0IDc6NTggUE0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+
IC0gICAgICAgLyogR1BJTyBEZXNjIGZvciBDUkMgYmFzZWQgUGFuZWwgY29udHJvbCAqLwo+ICsg
ICAgICAgLyogR1BJTyBEZXNjIGZvciBwYW5lbCBhbmQgYmFja2xpZ2h0IGNvbnRyb2wgKi8KPiAg
ICAgICAgIHN0cnVjdCBncGlvX2Rlc2MgKmdwaW9fcGFuZWw7Cj4gKyAgICAgICBzdHJ1Y3QgZ3Bp
b19kZXNjICpncGlvX2JhY2tsaWdodDsKCkkgdGhpbmsgd2hhdCBoYXBwZW5zIGhlcmUgaXMgdGhh
dCB5b3UgcmVpbXBsZW1lbnQKZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQu
YwoKVGhlIGV4aXN0aW5nIHBvd2VyIGNvbnRyb2wgR1BJTyBhbHNvIHJlaW1wbGVtZW50cwpkcml2
ZXJzL3JlZ3VsYXRvci9maXhlZC5jIGluIGEgc2Vuc2UgYnV0IEkgYW0gdW5kZXIgdGhlCmltcHJl
c3Npb24gdGhhdCB4ODYgaW4gZ2VuZXJhbCBhbmQgQUNQSSBpbiBwYXJ0aWN1bGFyCmhhcyBhIHBy
b2JsZW0gd2l0aCB0aGUgcmVndWxhdG9yIHN1YnN5c3RlbSBzbyBJIGFtCnVuY2VydGFpbiBhYm91
dCB0aGF0IG9uZS4KCldoZW4gSSBsb29rIGF0IHRoZSBjb2RlIEkgZ2V0IG1vcmUgY29uZnVzZWQg
YmVjYXVzZQpub21pbmFsbHkgcGFuZWxzIHNob3VsZCBoYXZlIHRoZWlyIG93biBkcml2ZXJzIGlu
CmRyaXZlcnMvZ3B1L2RybS9wYW5lbC8qIGVzcGVjaWFsbHkgRFNJIHBhbmVscywgYW5kIHRoZQpw
YW5lbHMgY29udHJvbCB0aGVpciBvd24gR1BJT3Mgb3IgcmVndWxhdG9ycyBmb3IgcG93ZXIKYW5k
IGJhY2tsaWdodC4KCkkgd2FzIHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgSGVpa2tpJ3MgYW5k
IERtaXRyeSdzCnJlY2VudCBhZGRpdGlvbnMgdG8gc29mdHdhcmUgbm9kZXMgd291bGQgbWFrZSBp
dApwb3NzaWJsZSB0byBhY3R1YWxseSBzcGF3biBkZXZpY2VzIGxpa2UgdGhlIEdQSU8gYmFja2xp
Z2h0CmFuZC9vciBmaXhlZCByZWd1bGF0b3IgYW5kIHB1dCByZWZlcmVuY2VzIHRvIHRoZW0gc28K
dGhhdCB0aGUgZHJpdmVycyBjYW4gcGljayB0aGVtIHVwIGZyb20gdGhlIHJlc3BlY3RpdmUKZnJh
bWV3b3JrcyBhbmQgbWFuYWdlIHRoZW0/CgpNYXliZSBJIG1pc3VuZGVyc3Rvb2QgdGhpbmdzIGhl
cmUgdGhvdWdoLCBJIGFtIGEgYml0CnVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgZWxkZXIgRFJN
IGRyaXZlcnMgYXJlCmNvbnNpZGVyZWQgImVsZGVyIGdvZHMiIGFuZCBkbyBub3QgbmVlZCB0byB1
c2Ugc2VwYXJhdGUKcGFuZWwgZHJpdmVycywgYmFja2xpZ2h0IGFic3RyYWN0aW9uIGV0YywgYW5k
IGluIHRoYXQKY2FzZSBqdXN0IGdvIGFoZWFkLCBJIGd1ZXNzLgoKQnV0IEkgc3VzcGVjdCBzb21l
IHNlcGFyYXRpb24Kd291bGQgaGVscCB0aGUgZGF5IHRoZSBpOTE1IGRyaXZlciB3YW50cyB0byBy
ZXVzZSBzb21lCnJlYWxseSBjb21wbGV4IERTSSBwYW5lbCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC8qCnRob3VnaC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
