Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4F5BEF3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 17:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D572789C69;
	Mon,  1 Jul 2019 15:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6F389C69
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:02:06 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e3so23948365edr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 08:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IlfnK8o1jaS+ZoERAM9/UyjCxXSgBh6RdKcILRfd9ew=;
 b=sZunj/NhRJvTYjaKDnAmuTsEbJAZgOGp6GRmfI97/ycJIApKZt2F1/kG42gszX8+pc
 E4lokF4wKgfY8kuDSO5MXSniEslkJprhgiu4tmtPuvWt26A5XKGU8Eg3BqfNUqyI4qsi
 KO0upoTH8ZFi4OWi5RkTBGIm8mYmwta+TzEWK7+zQEvgOZpYPEqupjrUaqno5+J0c0TE
 VorO9PtXrSYmLM9WLIOjkr/XeogAqgyOkyqEu7vodNyds1KZ3e/7cfwh4+d+9h1RA5Qn
 ikEYvbd+iqUhKkO3wIsgGShbQI6X0ZlYkPPnO0AOhZ7RohQrsYh3EkYqTSBo/tzAwsjs
 u8eA==
X-Gm-Message-State: APjAAAUHco22n1LwKy9ZG5zylBTnbgRWKG4l2PtnIwFcbCfglD1nm/TO
 bXQlF3Dr0nTfAAK5HLU7PeggnQW1cUE=
X-Google-Smtp-Source: APXvYqyPwKO/N0d9HlNEkPeEHZeEXGcuwiJdQvxvkri0fwND0/CxQ5FZMcyaIKIzpoH+XjbqWMoe6A==
X-Received: by 2002:a50:91d4:: with SMTP id h20mr28884761eda.200.1561993325200; 
 Mon, 01 Jul 2019 08:02:05 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id v3sm2245906ejq.35.2019.07.01.08.02.03
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 08:02:03 -0700 (PDT)
Subject: Re: [PATCH 0/1] drm: panel-orientation-quirks: Add extra quirk table
 entry GPD MicroPC
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190624154014.8557-1-hdegoede@redhat.com>
 <5215f91a-377a-78f1-dc73-7f9ae7531d56@redhat.com>
 <20190628115145.g7hqqit2zad3z2wf@flea>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5f998db8-3a9f-2483-9b13-7dde986e0e66@redhat.com>
Date: Mon, 1 Jul 2019 17:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628115145.g7hqqit2zad3z2wf@flea>
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyOC0wNi0xOSAxMzo1MSwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBGcmksIEp1
biAyOCwgMjAxOSBhdCAxMjowNDozMFBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBI
aSBhbGwsCj4+Cj4+IE9uIDI0LTA2LTE5IDE3OjQwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+Pj4g
SGkgQWxsLAo+Pj4KPj4+IEdvb2QgbmV3cyBJIGhhdmUgYSBjb250YWN0IGluc2lkZSBHUEQgbm93
IGFuZCBmcm9tIG5vdyBvbiB0aGVpciBCSU9TLWVzCj4+PiB3aWxsIGhhdmUgcHJvcGVyIHN5c192
ZW5kb3IgYW5kIHByb2R1Y3RfbmFtZSBETUkgc3RyaW5ncy4gVGhpcyBtZWFucyB0aGF0Cj4+PiB3
ZSBubyBsb25nZXIgbmVlZCB0byBkbyBCSU9TIGRhdGUgbWF0Y2hlcyBhbmQgYWRkIGEgbmV3IEJJ
T1MgZGF0ZSB0bwo+Pj4gZHJtX3BhbmVsX29yaWVudGF0aW9uX3F1aXJrcy5jIGZvciBlYWNoIEJJ
T1MgdXBkYXRlLgo+Pj4KPj4+IFRoZSBzZWNvbmQgYmF0Y2ggb2YgR1BEIE1pY3JvUEMtcyBiZWlu
ZyBkZWxpdmVyZWQgdG8gdXNlcnMgYWxyZWFkeSB1c2VzCj4+PiB0aGVzZSBuZXcgc3RyaW5ncywg
dGhpcyBwYXRjaCBhZGRzIGEgcXVpcmsgZm9yIHRoZSA5MCBkZWdyZWUgbW91bnRlZAo+Pj4gTENE
IHBhbmVsIHVzaW5nIHRoZSBuZXcgRE1JIHN0cmluZ3MuCj4+Pgo+Pj4gSXQgd291bGQgYmUgbmlj
ZSB0byBnZXQgdGhpcyBpbnRvIDUuMiwgYnV0IGl0IGlzIG5vdCB0aGF0IHVyZ2VudCwgc28KPj4+
IEkgYmVsaWV2ZSB0aGF0IGl0IGlzIGJlc3QgdG8gcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQt
Zml4ZXMgYW5kIHRoZW4KPj4+IGl0IGNhbiBnZXQgYWRkZWQgdG8gNS4yLnkgb25jZSBpdCBoaXRz
IFRvcnZhbGQncyB0cmVlLgo+Pj4KPj4+IElmIHNvbWVvbmUgY2FuIGdpdmUgdGhpcyBhIHJldmll
dyAoaXQgaXMgYSB0cml2aWFsIHBhdGNoIHJlYWxseSkgYW5kCj4+PiBnaXZlIG1lIGFuIEFja2Vk
LWJ5IHRoZW4gSSdsbCBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4KPj4KPj4gTWFh
cnRlbiwgTWF4aW1lLCBwaW5nPyBDYW4gSSBnZXQgYW4gQWNrZWQtYnkgKG9yIFJldmlld2VkLWJ5
KSBmb3IgdGhpcwo+PiBwbGVhc2Ugc28gdGhhdCBJIGNhbiBwdXNoIGl0IHRvIGRybS1taXNjLW5l
eHQtZml4ZXMgPwo+IAo+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJv
b3RsaW4uY29tPgoKVGhhbmtzLCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC1maXhlcy4KClJlZ2Fy
ZHMsCgpIYW5zCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
