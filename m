Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E748525
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0062489209;
	Mon, 17 Jun 2019 14:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866E89209
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:19:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e3so16359714edr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=I2FAQEzZkKauSjigMjXjGJy4rF+aL2eOLp4CaTj5zAk=;
 b=WLcybLifcggunRHEUeAhMs9h3DCPmx3JQ6gcG2epuc8gDhVcEFwAVXMQnjGcNmYAJx
 mS4b1A/lbX+r4AJpmpBic7Pl8Jx06BmQfV12pcbMJ38+AQD5FljAujjSx6ACsAzJ175r
 6K9ZwWwgUnK98OhjeVyUd4F2wGojmc7u2AOUy2GV97VIpb3QJyrWvxe4/RjLjTVcg8+t
 i3UxnC6mw3cA+9PtHSlsNJ4X+QNPo1/7+NHnBAmAPku18CkvK4YG7dcp1uK2c39eMp4s
 kc8XAKMNPhNqRdlqycJhxKXRk4xzVosvP+N7Fk8/YRYa9n5aEkF2CMwa+VlSpdVRlN+n
 V/Bw==
X-Gm-Message-State: APjAAAUIDJLb0Amjr5jYTcBonsMOxFYVgZLGfleAKEPopgllT32/kvw4
 0nF4NJtaqvNbXsJe3H+LBkufyg==
X-Google-Smtp-Source: APXvYqxabjs+kRADUJMy7KJqCBNyEMxUlkXsT+jgmVf0KE9jW2NSHQ7iq9jtDfMhh5joQHn+0bopJQ==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr37336583edr.54.1560781185356; 
 Mon, 17 Jun 2019 07:19:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id k27sm2189075ejb.7.2019.06.17.07.19.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:19:44 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:19:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/4] drm/virtio: try remove ttm
Message-ID: <20190617141942.GI12905@phenom.ffwll.local>
References: <20190617111406.14765-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I2FAQEzZkKauSjigMjXjGJy4rF+aL2eOLp4CaTj5zAk=;
 b=ikVQSrz6arpf3FJkQ39DS1yX1rWkmKXoQ/RTON0q+BWZOypdCMWgML/fmdObiwNee8
 knAK1+6S7QplfB8e8cuEyQIQ3Cu6cT4IB8EOqx5BA3oBbvD+4qZxKqnVyA/nGPkIIiKL
 HDlKvdC8CuqxTTLty4emwnMarcK5EWoa6EpWk=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MTQ6MDJQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiB0dG0gaW5jcmVhc2luZ2x5IGdldHMgaW50byB0aGUgd2F5IHdoaWxlIGhhY2tpbmcg
b24gdmlydGlvLWdwdSBtZW1vcnkKPiBtYW5hZ2VtZW50LiAgU28gbWF5YmUgd2UgYXJlIGJldHRl
ciBvZmYgd2l0aG91dCwgdXNpbmcgZ2VtIGhlbHBlcnMKPiBpbnN0ZWFkPwo+IAo+IFRyeWluZyBy
ZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gdHRtIHJlc2VydmF0aW9ucyBsb29rcyBsaWtlIGEgZ29v
ZCBmaXJzdAo+IGZpcnN0IHN0ZXAgdG8gbWUuICBUaGlzIHBhdGNoIHNlcmllcyBpcyBhIChzbWFs
bCkgc3RhcnQgb24gdGhhdC4KPiAKPiBBdCB0aGUgcG9pbnQgSSdtIGxvb2tpbmcgZm9yIGNvbW1l
bnRzIHdoZXZlbmVyIHRoZSBwbGFuIGFuZCB0aGUgaW5pdGlhbAo+IHBhdGNoZXMgbG9vayBzYW5l
IGFuZCBmb3IgdGhpbmdzIEkgc2hvdWxkIHBvc3NpYmx5IHdhdGNoIG91dCBmb3Igb24gdGhlCj4g
d2F5LgoKVGhpcyBtYXRjaGVzIG15IG93biBwbGFuIGZvciBhbGlnbmluZyBnZW0gYW5kIHR0bSBt
b3JlLCBzbyArMSBmcm9tIG1lLgoKTG9uZy10ZXJtIEknbSBub3Qgc3VyZSB3aGV0aGVyIHdlIHNo
b3VsZCBlbWJlZCBhIGRybV9nZW1fb2JqZWN0IGludG8gdGhlCnR0bV9idWZmZXJfb2JqZWN0LCBv
ciB3aGV0aGVyIHdlIHNob3VsZCBleHRyYWN0IG1vcmUgaGVscGVycyBmcm9tIHR0bSBpbnRvCmdl
bSBoZWxwZXJzLCBvciBzb21ldGhpbmcgaW4tYmV0d2Vlbi4gQnV0IHRoZXJlJ3MgYSBidW5jaCBv
ZiBsb3dlci1oYW5naW5nCmZydWl0IHRvIHRha2UgY2FyZSBvZiBmaXJzdC4KCkNoZWVycywgRGFu
aWVsCgo+IAoKPiB0aGFua3MsCj4gICBHZXJkCj4gCj4gR2VyZCBIb2ZmbWFubiAoNCk6Cj4gICBk
cm0vdmlydGlvOiBwYXNzIGdlbSByZXNlcnZhdGlvbiBvYmplY3QgdG8gdHRtIGluaXQKPiAgIGRy
bS92aXJ0aW86IHN3aXRjaCB2aXJ0aW9fZ3B1X3dhaXRfaW9jdGwoKSB0byBnZW0gaGVscGVyLgo+
ICAgZHJtL3ZpcnRpbzogc2ltcGxpZnkgY3Vyc29yIHVwZGF0ZXMKPiAgIGRybS92aXJ0aW86IHJl
bW92ZSB2aXJ0aW9fZ3B1X29iamVjdF93YWl0Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuaCAgICB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2lvY3RsLmMgIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9vYmplY3QuYyB8IDE2ICsrLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X3BsYW5lLmMgIHwgMTMgKysrLS0tLS0tLS0tLQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4x
OC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRp
b24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
