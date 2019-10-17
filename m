Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05864DB188
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 17:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8016E077;
	Thu, 17 Oct 2019 15:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF7C6E077;
 Thu, 17 Oct 2019 15:51:32 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id f13so2497530ils.11;
 Thu, 17 Oct 2019 08:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GhE1E+6Tua0TLGiM/iY1EQ9p1YpHucMydGQJJHqVUAU=;
 b=T7/lSWStKGCNtraOMtugYXs4D5xMzW4jXWWVjL9UhS/sQdWj8yfgh19xNN7OUl9Pay
 skUOwv+VQksGV0r1HQBV0dkUsCt2uHInN4w6ni7ZnDMby0/1TRESj7+xEKUrVnDaWP/3
 C+oysAi+30snjQCnhDviTI9m7RPgS998nsdNVYk/VyjZT/eOa7i9DnVZQ9+Znh9fNyAw
 JBfy/C/xuhi0hKpeWl5Lp1NtbPpsg+jF10BDAArWPjhnQmxVqqLzsnBPwEEuSgrrQpqM
 v/pCYSiFKj+XSYTa0rgI6MZJ7Vaoy1Mb2RXfGBJQEny4A/JbM464cjM4bvIF6iNXXv1G
 Md3A==
X-Gm-Message-State: APjAAAUFSrTMtA451Ug6ZN5XXMCKnpwrJU6aT+XBuyP6GQ77tt/TM61t
 tZJvZ5dcJeTcnbuHWg475T4LPT5kmbOkwERyM/eWRA==
X-Google-Smtp-Source: APXvYqwNEI3iU2z9cWol0xJJv7DwA/+jKcyRpwCR+30rYR9IsuWSnxIFiZb83HoU0ihBS63347XBUADOQt5os5AjdgY=
X-Received: by 2002:a92:3651:: with SMTP id d17mr4630374ilf.268.1571327491383; 
 Thu, 17 Oct 2019 08:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191010140152.17747-1-yuq825@gmail.com>
 <CA+E=qVdxZ83k_3G=ynxmN5Wkw2wirCWWH5H2SDw=OkGFruv_9w@mail.gmail.com>
In-Reply-To: <CA+E=qVdxZ83k_3G=ynxmN5Wkw2wirCWWH5H2SDw=OkGFruv_9w@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 17 Oct 2019 23:51:20 +0800
Message-ID: <CAKGbVbvUEZQJ2Hd=ozyGVaJJwf5qwdz-+tNmLE-MVeivW9U0AA@mail.gmail.com>
Subject: Re: [Lima] [PATCH v4 0/3] drm/lima: simplify driver by using more drm
 helpers
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GhE1E+6Tua0TLGiM/iY1EQ9p1YpHucMydGQJJHqVUAU=;
 b=bmmazpIOaSHsprT0YDzc2lquja03WjFcsp7vJOxcXW8gNaqdFvVOhkZ6fBC7yhzU9P
 +JdZso4BoYz7TLw9/Ibz3osY+9hLJq3DixxJJTGM6kzAwDeIqGDGSV0uUJvM/tWKIWKq
 uUkkPpmHxujWMpVR5CNWjkcJplpwwZ4DEhcUzuBHrD1e7s6nr9t2zKzO4a7avl2J18rB
 xxpclzEvcactw3CKrNXa/Mdm6vTVHK4f9ggPcimmaiWcwslbHRg0ojromRr4MFDE3fyu
 OH2XuvxxKoPMLf4pBpEKwG+0EbXmDLADTOQO18R1phBG3Kz911GQoNUCY5McHIx2IbfZ
 Z4Bg==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzLCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQuCgpSZWdhcmRzLApRaWFuZwoKT24gTW9u
LCBPY3QgMTQsIDIwMTkgYXQgMTI6MjEgUE0gVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxMCwgMjAxOSBhdCA3OjAyIEFNIFFpYW5n
IFl1IDx5dXE4MjVAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBCeSB1c2luZyBzaGFyZWQgZHJt
IGhlbHBlcnM6Cj4gPiAxLiBkcm1fZ2VtXyh1bilsb2NrX3Jlc2VydmF0aW9ucwo+ID4gMi4gZHJt
X2dlbV9zaG1lbV9oZWxwZXJzCj4gPiB3ZSBjYW4gc2ltcGxpZnkgbGltYSBkcml2ZXIgYSBsb3Qg
YW5kIGJlbmlmaXQgZnJvbSB1cGRhdGVzIHRvCj4gPiB0aGVzZSBmdW5jdGlvbnMuCj4gPgo+ID4g
UGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIGRybS1taXNjLW5leHQgYnJhbmNoCj4gPgo+ID4gdjI6
Cj4gPiBBZGQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cF91c2VyIGFuZCB1c2UgaXQgZm9yIGRyaXZl
ciB3aGljaAo+ID4gcGFzcyB1c2VyIEdFTSBoYW5kbGVzIGluIGNvbnRpb3VzIGFycmF5Lgo+ID4K
PiA+IHYzOgo+ID4gaW1wcm92ZSBjb21taXQgY29tbWVudC4KPiA+Cj4gPiB2NDoKPiA+IERyb3Ag
ZHJtX2dlbV9vYmplY3RzX2xvb2t1cCByZWZpbmUgcGF0Y2hlcy4KPiA+Cj4gPiBRaWFuZyBZdSAo
Myk6Cj4gPiAgIGRybS9saW1hOiB1c2UgZHJtX2dlbV9zaG1lbV9oZWxwZXJzCj4gPiAgIGRybS9s
aW1hOiB1c2UgZHJtX2dlbV8odW4pbG9ja19yZXNlcnZhdGlvbnMKPiA+ICAgZHJtL2xpbWE6IGFk
ZCBfX0dGUF9OT1dBUk4gZmxhZyB0byBhbGwgZG1hX2FsbG9jX3djCj4KPiBMR1RNLCB3aG9sZSBz
ZXJpZXM6Cj4KPiBSZXZpZXdlZC1ieTogVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWls
LmNvbT4KPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL0tjb25maWcgICAgICAgICAgfCAgIDEg
Kwo+ID4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL01ha2VmaWxlICAgICAgICAgfCAgIDQgKy0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jICAgIHwgICAyICstCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuYyAgICAgICB8ICAyMiArLS0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbGltYS9saW1hX2dlbS5jICAgICAgIHwgMTk1ICsrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uaCAgICAgICB8ICAzMiAr
KysrLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtX3ByaW1lLmMgfCAgNDYgLS0t
LS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW1fcHJpbWUuaCB8ICAxMyAtLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfbW11LmMgICAgICAgfCAgIDEgLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmMgICAgfCAxMTkgLS0tLS0tLS0tLS0tLS0t
LQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmggICAgfCAgMzUgLS0tLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMgICAgIHwgICA2ICstCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5jICAgICAgICB8ICA4NyArKysrKystLS0tLS0K
PiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKSwgNDE1IGRlbGV0aW9ucygt
KQo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbV9w
cmltZS5jCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFf
Z2VtX3ByaW1lLmgKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2xpbWEv
bGltYV9vYmplY3QuYwo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbGlt
YS9saW1hX29iamVjdC5oCj4gPgo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW1hIG1haWxpbmcgbGlz
dAo+ID4gbGltYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbGltYQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
