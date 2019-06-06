Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4CF375F7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 16:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BF893D0;
	Thu,  6 Jun 2019 14:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AAA893D0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:04:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b17so1471106wrq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 07:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eNFdPYUV9hG6BhwNbMx3dNCCxD2mQrIGWxwD7CN6Wxk=;
 b=i8oxifD0PmEW8ZFkg516ovZ1T5Wg4yobK4FKYvPjvnCJZuIIAArwzJscyhGZDtmKvv
 kEBNfRp6+IuqwCV70fW+vSBqd1ABiTBtt89BhlNa1lFaRJlMFkJMnaHicd1rWEkqh1do
 zHD/AxIhliFBYNDqUE+wJYyui+U+YmBC/3e00o9Ik6GBX5eOLftz9jYwaj1ACAG68bN+
 7pxJKhOidB/JdGezSAoG12C/eQqY/afjQvTlwni7Xu8xgP+Dl0YDdwa9DgujNK5ksGIT
 Sg+djjSmOb1cuEivRMvaawUtxSKULs6wKWDz9aRNEGlWFslQUSj8AAitwQ8Yr+SXit6W
 jOyQ==
X-Gm-Message-State: APjAAAWgsP5YSW2XTc8l3gPAyJIcxfDXQHWDmYkRhYD15OAiIEjLkktF
 h30bB5YvmGVm3hIobB6vnpJmdUhP/cM=
X-Google-Smtp-Source: APXvYqyYy9KTyasrMxzgFf7YOD29rIAINTaGNRC+52YI1xvRgqnEqwVLpohG/vi8bUJ0EOB52fIfhg==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr30954551wro.178.1559829839712; 
 Thu, 06 Jun 2019 07:03:59 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id s7sm2056224wmc.2.2019.06.06.07.03.58
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 07:03:58 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190524125759.14131-1-hdegoede@redhat.com>
 <20190524125759.14131-2-hdegoede@redhat.com>
 <20190606091440.qomxukz72puwq7vy@flea>
 <e2077be3-c637-daf2-27dc-b1461c77f796@redhat.com>
 <20190606133849.2edsrkkryq6mks6x@flea>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fc5e247f-a6d1-b512-1187-ea2c7d48d461@redhat.com>
Date: Thu, 6 Jun 2019 16:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606133849.2edsrkkryq6mks6x@flea>
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

SGksCgpPbiAwNi0wNi0xOSAxNTozOCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBUaHUsIEp1
biAwNiwgMjAxOSBhdCAwMToxMzo0MFBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBP
biAwNi0wNi0xOSAxMToxNCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4+IE9uIEZyaSwgTWF5IDI0
LCAyMDE5IGF0IDAyOjU3OjU5UE0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+Pj4gR1BE
IGhhcyBkb25lIGl0IGFnYWluLCBtYWtlIGEgbmljZSBkZXZpY2UgKGdvb2QpLCB1c2Ugd2F5IHRv
byBnZW5lcmljCj4+Pj4gRE1JIHN0cmluZ3MgKGJhZCkgYW5kIHVzZSBhIHBvcnRyYWl0IHNjcmVl
biByb3RhdGVkIDkwIGRlZ3JlZXMgKHVnbHkpLgo+Pj4+Cj4+Pj4gQmVjYXVzZSBvZiB0aGUgdG9v
IGdlbmVyaWMgRE1JIHN0cmluZ3MgdGhpcyBlbnRyeSBpcyBhbHNvIGRvaW5nIGJpb3MtZGF0ZQo+
Pj4+IG1hdGNoaW5nLCBzbyB0aGUgZ3BkX21pY3JvcGMgZGF0YSBzdHJ1Y3QgbWF5IHZlcnkgd2Vs
bCBuZWVkIHRvIGJlIHVwZGF0ZWQKPj4+PiB3aXRoIHNvbWUgZXh0cmEgYmlvcy1kYXRlcyBpbiB0
aGUgZnV0dXJlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4KPj4+Cj4+PiBGb3IgYm90aCBwYXRjaGVzLAo+Pj4gQWNrZWQtYnk6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4+Cj4+IFRoYW5rIHlvdSwg
SSd2ZSBwdXNoZWQgYm90aCB0byBkcm0tbWlzYy1uZXh0IG5vdy4KPj4KPj4gQ2FuIHlvdSBhZGQg
dGhlbSB0byBkcm0tbWlzYy1maXhlcyBwbGVhc2UgPwo+Pgo+PiAoQUZBSUsgSSdtIG5vdCBzdXBw
b3NlZCB0byBkbyB0aGF0IG15c2VsZikKPiAKPiBZb3UgZGVmaW5pdGVseSBjYW4gOikKPiAKPiBO
b3cgdGhhdCBpdCdzIGluIG5leHQgdGhvdWdoLCBpdCdzIHByZXR0eSBoYXJkIHRvIGNvbWUgYmFj
ayBpbiB0aW1lLiBJCj4gZ3Vlc3Mgd2UgY291bGQganVzdCBhcHBseSBpdCBpbiBmaXhlcyBhbmQg
bGV0IGdpdCBmaWd1cmUgaXQgb3V0LCBvcgo+IHJldmVydCB0aGUgb25lIGluIG5leHQuIEknbSBu
b3Qgc3VyZSB3aGljaCBvbmUgaXMgcHJlZmVycmVkCj4gdGhvdWdoLgoKSSB0aG91Z2h0IHRoYXQg
dGhlIHByb2NlZHVyZSB3YXMgdG8gZ2V0IGl0IGluIC1uZXh0IGFuZCB0aGVuIGNoZXJyeS1waWNr
CmludG8gLWZpeGVzPyBHaXQgc2hvdWxkIHNvcnQgdGhpcyBvdXQgd2l0aG91dCBpc3N1ZXMgd2hl
biBMaW51cyBtZXJnZXMKLW5leHQ7IG9yIHdoZW4gd2UgYmFjay1tZXJnZSBMaW51cycgdHJlZS4K
ClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
