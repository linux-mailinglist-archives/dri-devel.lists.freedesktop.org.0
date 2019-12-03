Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC110FC3E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 12:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8989EB8;
	Tue,  3 Dec 2019 11:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D489EB8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 11:12:20 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id u6so919860vkn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 03:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjDS5AlfO06rTM9dU+Pzci/akNlnvcVKJS1HqlwpDwo=;
 b=ZbXl6JxPrB8zEYKglNWNZecEQVNsBF4YQQkI2b5JsI8gcSsyAOHHLqUX130NoG3tOF
 8sf0H92l9bvAC+lSF/v/H+LNfhCeGpS7eFQ2+ZuHhvgKo7JKWIe1dngAkzggUqjjdrwc
 M8LxReAfS8NllJVe7iHOOwokGOyrgmQVIjEH2deR9y7iAivFvF/P2llYto6VA6u+mygG
 VmvOeSoLz6PMefV17ll7xQt6il5o2A3w0Y58uo7lyr8gn3BBZ93n+bXcFamHnaMdVgx6
 WGwqyibEWvIdkFr/OaavViOk/NDu0CXilnib7WtB9rHbgaJEogV+qp9g6hXGNRutY26o
 +mDw==
X-Gm-Message-State: APjAAAXPzTgTRp6p+gv3rSq+BkzbVFRHlzGPk+J2ygnuZmllXgdvrOpQ
 ZHxDceT0cn77neUV4kXPPV9mOlrvVMp9UOLxvFg=
X-Google-Smtp-Source: APXvYqxLAk+Lp1RlOuKdvMWsrE/NAxJOTd3PBG47q6gToW8pASV2M4K+Dom+AnrrXxUrB3I2UPjufE0+Y5dmEJUcbns=
X-Received: by 2002:a1f:3fcd:: with SMTP id m196mr3135009vka.28.1575371539852; 
 Tue, 03 Dec 2019 03:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20191203100406.9674-1-tzimmermann@suse.de>
In-Reply-To: <20191203100406.9674-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Dec 2019 11:11:18 +0000
Message-ID: <CACvgo5366jdJPfp15NB6Edb-OVhr=6SjG5fy04894a0hnLAXWw@mail.gmail.com>
Subject: Re: [PATCH 00/12] Clean up drm_pci.{c,h}
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SjDS5AlfO06rTM9dU+Pzci/akNlnvcVKJS1HqlwpDwo=;
 b=uKcUBhfWTaKgu1VtsMWOnSU7BQt9efbop8ltjg54U/P9SCeB9tkym22pIbmPu87bdS
 0ydxNV0SVAZFObPw4VQMHlMBbGXR/NtBqJAVzw1CZufTxVG3GezGA0nGlsSNXRYZ9eqi
 8TUl2ICziF1I+ehiKMoIw3yAwd+2NT4SV0YSqM908vVmhh76hLavoLx+hJLb1Thx6xxR
 qw5PIz8kq9Vz1tHD6kAlFbM3LkPmnmXW3/KQR9ukqkQ/ulDhJ7iOAhIaBdNTBwcm+Uis
 F/2rce5EA4zZErDs68fA76JFSCI84zYYmjdC/x5e79nD3b83SCIBTj1GBcRhKFIR0r4g
 biAA==
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzIERlYyAyMDE5IGF0IDEwOjA0LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGNsZWFucyB1cCBkcm1fcGNpLntj
LGh9LiBQYXRjaCAxIHJlbW92ZXMgZHJtX3BjaS5jIGZyb20KPiBub24tUENJIGJ1aWxkcy4gRGVj
bGFyYXRpb25zIG9mIGxlZ2FjeSBmdW5jdGlvbnMgYXJlIGhpZGRlbiBpbiBkcm1fbGVnYWN5LmgK
PiBhbmQgdGhlaXIgaW1wbGVtZW50YXRpb24gaXMgcHJvdGVjdGVkIGJ5IENPTkZJR19QQ0kgaW4g
cGF0Y2ggMi4gVGhlIHJlc3QKPiBvZiB0aGUgcGF0Y2hlcyByZXBsYWNlIHVubmVjZXNzYXJ5IGlu
Y2x1ZGUgc3RhdGVtZW50cyBmb3IgZHJtX3BjaS5oLiBNb3N0Cj4gb2YgdGhlIHNvdXJjZSBmaWxl
cyBvbmx5IHJlcXVpcmUgPGxpbnV4L3BjaS5oPi4KPgo+IFRoZSBwYXRoc2V0IHdhcyBidWlsdCBv
biB4ODYtNjQgYW5kIGFhcmNoNjQgd2l0aCBQQ0kgc3VwcG9ydCBhbmQgYXJtCj4gd2l0aG91dCBQ
Q0kgc3VwcG9ydC4KPgo+IFRob21hcyBaaW1tZXJtYW5uICgxMik6Cj4gICBkcm0vcGNpOiBPbmx5
IGJ1aWxkIGRybV9wY2kuYyBpZiBDT05GSUdfUENJIGlzIHNldAo+ICAgZHJtL3BjaTogSGlkZSBs
ZWdhY3kgUENJIGZ1bmN0aW9ucyBmcm9tIG5vbi1sZWdhY3kgY29kZQo+ICAgZHJtL2FzdDogRG9u
J3QgaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KPiAgIGRybS9pODEwOiBEb24ndCBpbmNsdWRlIDxk
cm0vZHJtX3BjaS5oPgo+ICAgZHJtL21nYTogRG9uJ3QgaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4K
PiAgIGRybS9tZ2FnMjAwOiBEb24ndCBpbmNsdWRlIDxkcm0vZHJtX3BjaS5oPgo+ICAgZHJtL3Ix
Mjg6IERvbid0IGluY2x1ZGUgPGRybS9kcm1fcGNpLmg+Cj4gICBkcm0vcmFkZW9uOiBEb24ndCBp
bmNsdWRlIDxkcm0vZHJtX3BjaS5oPgo+ICAgZHJtL3NhdmFnZTogRG9uJ3QgaW5jbHVkZSA8ZHJt
L2RybV9wY2kuaD4KPiAgIGRybS9zaXM6IERvbid0IGluY2x1ZGUgPGRybS9kcm1fcGNpLmg+Cj4g
ICBkcm0vdGRmeDogRG9uJ3QgaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KPiAgIGRybS92aWE6IERv
bid0IGluY2x1ZGUgPGRybS9kcm1fcGNpLmg+Cj4KU2xpZ2h0bHkgbGVhbmluZyBhYm91dCBnZXR0
aW5nIDAxIDw+IDAyIHN3YXBwZWQsIGJ1dCByZWdhcmRsZXNzIHRoZSBzZXJpZXMgaXM6ClJldmll
d2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKLUVtaWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
