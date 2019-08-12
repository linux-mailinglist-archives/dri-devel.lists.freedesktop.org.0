Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE7F8A722
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 21:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677066E5CA;
	Mon, 12 Aug 2019 19:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A10A6E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 19:33:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v15so644430wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1rqCiZ71c7Wckqxp+UWBnbiO/OKEKll47JQzs2VbQSE=;
 b=mxk/zDXKAwHdiIOOL6Qgo5PI/a6CaG8JnH9Nhcg+SmgdwMmXAlRrVXTver95ptdg8x
 1NdKDWgH4zcloEp+JLFZwSPupy8InmNtGSMYqGxgG6RbBN6K4kSm2jpOtYdo4Tpegy05
 gSkX0Qrq0hiB8cuOhEAHmon5cz8JyS1qBhjD61GcqCI9eXMvZAU68AElFWmzc5kv8FeX
 xMy0GYK/2Q/dKKjjKGHuPOy4BS9jlg5hbVZmfrHOtLCIFckzYaZ1Vg6SNZ3nQ2YCbnfc
 eZhQKkKODIzOdehX13R8jJsPHv4WOrtj1FPR/NZ26YTLP6ZkWenvOGGYwOzopUBChadG
 oPLg==
X-Gm-Message-State: APjAAAX6jEKxbtJj7XW3trJlhML4T9R46LV0HwDhKoWlMOVGNcPDFF2d
 iSFW0snImdLOzlgF+tGaMQnfEbQVoLU=
X-Google-Smtp-Source: APXvYqwGWAtC7Q2RAbO+3jxh1x/q94fMI48+O7H2OzvgfVXrX0v8vu17jNJF81XlQau0l9hTOAYJSQ==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr898970wmj.116.1565638424396;
 Mon, 12 Aug 2019 12:33:44 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id o16sm22786395wrp.23.2019.08.12.12.33.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 12:33:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm: gm12u320: Some minor cleanups
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190730133857.30778-1-hdegoede@redhat.com>
 <20190801145922.GA30758@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c4ed3408-5477-9393-c787-e381cb7db8b7@redhat.com>
Date: Mon, 12 Aug 2019 21:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801145922.GA30758@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwMS0wOC0xOSAxNjo1OSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIEhhbnMuCj4g
Cj4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDM6Mzg6NTZQTSArMDIwMCwgSGFucyBkZSBHb2Vk
ZSB3cm90ZToKPj4gMyBzbWFsbCBjbGVhbnVwczoKPj4KPj4gMSkgRHJvcCB1bnVzZWQgRFJJVkVS
X1BBVENITEVWRUwKPj4gMikgV2UgZG8gbm90IHNldCBtb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVw
dGgsIHNvIGluc3RlYWQgb2YgcGFzc2luZyB0aGUKPj4gICAgIHVuc2V0IG1vZGVfY29uZmlnLnBy
ZWZlcnJlZF9kZXB0aCB0byBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cAo+PiAgICAgc2ltcGx5IHBh
c3MgMAo+PiAzKSBVc2UgX19tYXliZV91bnVzZWQgaW5zdGVhZCBvZiAjaWZkZWYgQ09ORklHX1BN
IGFyb3VuZCB0aGUgc3VzcGVuZCAvCj4+ICAgICByZXN1bWUgZnVuY3Rpb25zCj4+Cj4+IENjOiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4+IFN1Z2dlc3RlZC1ieTogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IElmIHlvdSBhZGQ6Cj4gU3VnZ2VzdGVkLWJ5OiBOb3Jh
bGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBBbmQgYWRqdXN0IHRvIHRoZSBuZXcg
bG9jYXRpb24uCj4gCj4gVGhlbiB0aGlzIGlzOgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+CgpJJ3ZlIGp1c3QgcHVzaGVkIHRoZXNlIHRvIGRybS1taXNjLW5l
eHQsIHRoYW5rIHlvdSBmb3IgeW91ciBpbnB1dAphbmQgcmV2aWV3cy4KClJlZ2FyZHMsCgpIYW5z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
