Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382339FEC
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 15:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413448920E;
	Sat,  8 Jun 2019 13:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAFA8920E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 13:32:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f10so4568370wmb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2019 06:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7CCk6o7FmJz6RJGNxmYhVc2ErsAM1iFy6deDzxUkt4A=;
 b=iauhcUlHbWOp8XjD/1MNnqauAj2mzAqfvVPZCQ7rg16ASo1yhWIa5rkyogDUmEgy1l
 53wsRpZ7zjjhXk3vWswd22p8SXy3Ax3znxEJbdGRGErEATGUwTK3glikn+c6E4PVWZyT
 mHkmpjx7KWrvPvcpyhb23Jj8mx7REb6P0rnygHA++0U+FLVG84mVtU7OGmq73V3GL5P1
 Ie8cvffL8G23ttsBUp88a8KuUD9fERPVMLNi5bh3NxuZWKa76OT1ENaKFheK8GSJ3dkf
 adBzBxsJFbVFMzIQRQ72+bH7UAfzPBvZvdMTQSWV4nofTlSQxy8LxO7DIDQXgTwsop8T
 4+Qw==
X-Gm-Message-State: APjAAAXH5b99CW3grthDIZiA1/nJZmk6pBJLgUXZvQmgJnR1OHBoEhuP
 2gQfGX0OVX9+uL8q+ILTeWNOPnjpQcE=
X-Google-Smtp-Source: APXvYqxSkEI9EbYhZxvdPqC1t3vpubCLpsDF3x7D7sx5bavYYRp5nBr2DG+sf6wi9lF0F/Fim7yGog==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr7171009wmg.5.1560000719277;
 Sat, 08 Jun 2019 06:31:59 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id f204sm2753024wme.18.2019.06.08.06.31.58
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 06:31:58 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm: panel-orientation-quirks: Add quirk for GPD
 MicroPC
To: Maxime Ripard <maxime.ripard@bootlin.com>
References: <20190524125759.14131-1-hdegoede@redhat.com>
 <20190524125759.14131-2-hdegoede@redhat.com>
 <20190606091440.qomxukz72puwq7vy@flea>
 <e2077be3-c637-daf2-27dc-b1461c77f796@redhat.com>
 <20190606133849.2edsrkkryq6mks6x@flea>
 <fc5e247f-a6d1-b512-1187-ea2c7d48d461@redhat.com>
 <20190607145448.uj5rluis73rhyqdh@flea>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <bea6f0c4-29a6-2f5f-6880-9b6cf542abda@redhat.com>
Date: Sat, 8 Jun 2019 15:31:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607145448.uj5rluis73rhyqdh@flea>
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

SGksCgpPbiAwNy0wNi0xOSAxNjo1NCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBUaHUsIEp1
biAwNiwgMjAxOSBhdCAwNDowMzo1N1BNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBI
aSwKPj4KPj4gT24gMDYtMDYtMTkgMTU6MzgsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+PiBPbiBU
aHUsIEp1biAwNiwgMjAxOSBhdCAwMToxMzo0MFBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3Rl
Ogo+Pj4+IE9uIDA2LTA2LTE5IDExOjE0LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4+PiBPbiBG
cmksIE1heSAyNCwgMjAxOSBhdCAwMjo1Nzo1OVBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3Rl
Ogo+Pj4+Pj4gR1BEIGhhcyBkb25lIGl0IGFnYWluLCBtYWtlIGEgbmljZSBkZXZpY2UgKGdvb2Qp
LCB1c2Ugd2F5IHRvbyBnZW5lcmljCj4+Pj4+PiBETUkgc3RyaW5ncyAoYmFkKSBhbmQgdXNlIGEg
cG9ydHJhaXQgc2NyZWVuIHJvdGF0ZWQgOTAgZGVncmVlcyAodWdseSkuCj4+Pj4+Pgo+Pj4+Pj4g
QmVjYXVzZSBvZiB0aGUgdG9vIGdlbmVyaWMgRE1JIHN0cmluZ3MgdGhpcyBlbnRyeSBpcyBhbHNv
IGRvaW5nIGJpb3MtZGF0ZQo+Pj4+Pj4gbWF0Y2hpbmcsIHNvIHRoZSBncGRfbWljcm9wYyBkYXRh
IHN0cnVjdCBtYXkgdmVyeSB3ZWxsIG5lZWQgdG8gYmUgdXBkYXRlZAo+Pj4+Pj4gd2l0aCBzb21l
IGV4dHJhIGJpb3MtZGF0ZXMgaW4gdGhlIGZ1dHVyZS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+Pj4+Pgo+Pj4+PiBGb3Ig
Ym90aCBwYXRjaGVzLAo+Pj4+PiBBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4KPj4+Pgo+Pj4+IFRoYW5rIHlvdSwgSSd2ZSBwdXNoZWQgYm90aCB0byBk
cm0tbWlzYy1uZXh0IG5vdy4KPj4+Pgo+Pj4+IENhbiB5b3UgYWRkIHRoZW0gdG8gZHJtLW1pc2Mt
Zml4ZXMgcGxlYXNlID8KPj4+Pgo+Pj4+IChBRkFJSyBJJ20gbm90IHN1cHBvc2VkIHRvIGRvIHRo
YXQgbXlzZWxmKQo+Pj4KPj4+IFlvdSBkZWZpbml0ZWx5IGNhbiA6KQo+Pj4KPj4+IE5vdyB0aGF0
IGl0J3MgaW4gbmV4dCB0aG91Z2gsIGl0J3MgcHJldHR5IGhhcmQgdG8gY29tZSBiYWNrIGluIHRp
bWUuIEkKPj4+IGd1ZXNzIHdlIGNvdWxkIGp1c3QgYXBwbHkgaXQgaW4gZml4ZXMgYW5kIGxldCBn
aXQgZmlndXJlIGl0IG91dCwgb3IKPj4+IHJldmVydCB0aGUgb25lIGluIG5leHQuIEknbSBub3Qg
c3VyZSB3aGljaCBvbmUgaXMgcHJlZmVycmVkCj4+PiB0aG91Z2guCj4+Cj4+IEkgdGhvdWdodCB0
aGF0IHRoZSBwcm9jZWR1cmUgd2FzIHRvIGdldCBpdCBpbiAtbmV4dCBhbmQgdGhlbiBjaGVycnkt
cGljawo+PiBpbnRvIC1maXhlcz8KPiAKPiBJZiB5b3UgZmVlbCBsaWtlIHNvbWV0aGluZyBzaG91
bGQgYmUgaW4gZml4ZXMsIHlvdSBjYW4gZGVmaW5pdGVseQo+IGFwcGx5IGl0IHRoZXJlIG9ubHku
Cj4gCj4+IEdpdCBzaG91bGQgc29ydCB0aGlzIG91dCB3aXRob3V0IGlzc3VlcyB3aGVuIExpbnVz
IG1lcmdlcyAtbmV4dDsgb3IKPj4gd2hlbiB3ZSBiYWNrLW1lcmdlIExpbnVzJyB0cmVlLgo+IAo+
IFllYWgsIGxvb2tpbmcgYXQgdGhlIGRvYywgY2hlcnJ5LXBpY2tpbmcgaXMgdGhlIG9uZSBlbmNv
dXJhZ2VkLCBzbwo+IGZlZWwgZnJlZSB0byBjaGVycnktcGljayB0aGVtIGluIGRybS1taXNjLWZp
eGVzLgoKT2ssIGNoZXJyeS1waWNrZWQgYW5kIHB1c2hlZCwgdGhhbmtzLgoKUmVnYXJkcywKCkhh
bnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
