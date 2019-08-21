Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CBB97D59
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0312A6E448;
	Wed, 21 Aug 2019 14:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AB66E438
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:43:01 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id o101so2266022ota.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 07:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6iuRVThww7VxLaYpCNvMXhDIkgtKok16DJgordDbr0Q=;
 b=ac7rYJQEN9xQVxdXKCvYsnkM+o1sZlyx7qkVVp/lgZt0HwIxqSjSAwrIwb575kBDU/
 LoBOPKWQ8iPsHymqXyPLEvszeJXpj3igTHlt4oCzC7JklvhkrltYc9iADTwP+AxS0+Gr
 Tj9uR/zTpP4JqKDzCcZFOKjjdDO9GhHfudKSekCEOJdqRO9IIvF5vjkx/xW2ieFE+gNi
 uZpGmTyDUpASGeppfQsdmBXM2haEY/Q7gWoxTjbW3Z7GrJerTHqP4uzvUMYcMJkIUWoF
 DhcgDEy7UL5mXkZAAFZKhF629u9lrVqK/rth27MiZdav1JVN+CSIdm0u9Wn8ffOJ6b6N
 LEIw==
X-Gm-Message-State: APjAAAUbqWt6Ie7vnWOBdLmjh0bwj+ICtzciuAh9nlmIEDX02piDP/vg
 s6sLMlZ6+rVTxq+43XtL+igVCUGDuPaUAsN9wRlH+g==
X-Google-Smtp-Source: APXvYqyf3UH0OqIqB9kQUaC6eBNOGxEFRNeGoiwIZ78pHk7lfFm7nVBwiBh5Cl9sS57q8d5L0VfU99engPiXcYyMn/M=
X-Received: by 2002:a9d:590d:: with SMTP id t13mr16672822oth.281.1566398580990; 
 Wed, 21 Aug 2019 07:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
 <dbe0e8a6-573f-6628-0b9e-1c978611efce@shipmail.org>
 <CAKMK7uH93XWbz7X6VJsvRB+pbgFEjH=iYAAgQc42gcAON8YXVw@mail.gmail.com>
 <d1574611-e51d-e08c-5305-175e0375813e@shipmail.org>
In-Reply-To: <d1574611-e51d-e08c-5305-175e0375813e@shipmail.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Aug 2019 16:42:48 +0200
Message-ID: <CAKMK7uFr0X-wj24j7tGc-AOZHx4Rvqwjax=rZ82ydgWNhFdZ9w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6iuRVThww7VxLaYpCNvMXhDIkgtKok16DJgordDbr0Q=;
 b=k+ibYyAfezLlmyA8jqfq9Rj3sX0w50z511I9VP2/fLgL0cjMEI6jfdRP9Wfmj1RXGM
 R7r4mp+lO0h2q5+g/RV37Uy6yffeio3kTOhsji7pxD2EJGpIAHqbw/oxTWoE3VUwWjSB
 lkkhkSgjEeMHck2SHOkkA2PG6AZnqiftY7yFU=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgNDozMCBQTSBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KQo8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4KPiBPbiA4LzIxLzE5IDQ6MTAgUE0s
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAzOjE2IFBN
IFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpCj4gPiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4g
d3JvdGU6Cj4gPj4gT24gOC8yMC8xOSA0OjUzIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+
PiBXaXRoIG5vdXZlYXUgZml4ZWQgYWxsIHR0bS11c2luZyBkcml2ZXMgaGF2ZSB0aGUgY29ycmVj
dCBuZXN0aW5nIG9mCj4gPj4+IG1tYXBfc2VtIHZzIGRtYV9yZXN2LCBhbmQgd2UgY2FuIGp1c3Qg
bG9jayB0aGUgYnVmZmVyLgo+ID4+Pgo+ID4+PiBBc3N1bWluZyBJIGRpZG4ndCBzY3JldyB1cCBh
bnl0aGluZyB3aXRoIG15IGF1ZGl0IG9mIGNvdXJzZS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPj4+IENjOiBDaHJp
c3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPj4+IENjOiBIdWFuZyBS
dWkgPHJheS5odWFuZ0BhbWQuY29tPgo+ID4+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+Cj4gPj4+IENjOiAiVk13YXJlIEdyYXBoaWNzIiA8bGludXgtZ3JhcGhpY3MtbWFp
bnRhaW5lckB2bXdhcmUuY29tPgo+ID4+PiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJv
bUB2bXdhcmUuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYyAgICB8IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+PiAgICBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4+PiAgICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgIHwgIDEgLQo+ID4+
PiAgICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2MCBkZWxldGlvbnMoLSkKPiA+
Pj4KPiA+Pj4KPiA+Pj4gKyAgICAgZG1hX3Jlc3ZfbG9jayhiby0+YmFzZS5yZXN2LCBOVUxMKTsK
PiA+PiBpbnRlcnJ1cHRpYmxlLCBvciBhdCBsZWFzdCBraWxsYWJsZS4gKElJUkMgdGhpbmsga2ls
bGFibGUgaXMgdGhlIHJpZ2h0Cj4gPj4gY2hvaWNlIGluIGZhdWx0IGNvZGUsIGV2ZW4gaWYgVFRN
IGluaXRpYWxseSBpbXBsZW1lbnRlZCBpbnRlcnJ1cHRpYmxlIHRvCj4gPj4gZ2V0IHJlYXNvbmFi
bGUgWG9yZyAic2lsa2VuIG1vdXNlIiBsYXRlbmN5KS4KPiA+IEkgdGhpbmsgaW50ZXJydXB0aWJs
ZSBpcyBmaW5lLiBJIGNoaWNrZW5kIG91dCBvZiB0aGF0IGZvciB2MSBiZWNhdXNlIEkKPiA+IGFs
d2F5cyBtaXggdXAgdGhlIHJldHVybiBjb2RlIGZvciBfbG9ja19pbnRlcnJ1cHRpYmwoKSA6LSkK
Pgo+IDopLiBJSVJDIEkgdGhpbmsgdGhlIGluLWtlcm5lbCB1c2VycyBvZiBmYXVsdCgpIHdlcmUg
dW5oYXBweSB3aXRoCj4gaW50ZXJydXB0aWJsZS4gIChHVVA/KSwgYnV0IEkgZ3Vlc3MgaXQncyBi
ZXR0ZXIgdG8gdXNlIGEgYnVsayBjaGFuZ2UgYXQKPiBzb21lIHBvaW50IGlmIG5lY2Vzc2FyeS4K
CldlJ3ZlIGJlZW4gdXNpbmcgaW50ZXJydXB0aWJsZSBzaW5jZSBmb3JldmVyLCByZXR1cm5pbmcK
Vk1fRkFVTFRfTk9QQUdFIHRvIGdldCB0aGUgc2lnbmFsIGhhbmRsZWQgYW5kIHJlLXJ1bi4gU2Vl
bXMgdG8gbm90CmhhdmUgcGlzc2VkIG9mZiBhbnlvbmUgdGh1cyBmYXIuIEkgdGhpbmsgaWYgd2Ug
ZG8gdGhpcyBJJ2xsIGRvIGl0IGFzIGEKZm9sbG93LXVwLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0
dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1
NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
