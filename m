Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB515D0C2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5C89C88;
	Tue,  2 Jul 2019 13:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0082898FD;
 Tue,  2 Jul 2019 13:37:50 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id f20so333106ual.0;
 Tue, 02 Jul 2019 06:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9b+8ZBleetIVU/09L+s0q/6AcuRkS5NEr9VJrWRykg=;
 b=VeDARSN0e0GCPCmyE9l7iTBkTLpTDKg5iPlKUzGdjLTOOR1PBRCoLH211F6I9xMWR1
 vhX+UqWJeEp/yMuyR/MdgKs8Aj4xpSlzXJ6KjkY2rpiCJACD4HIG357gg3mHORgvx613
 9HmHOAMfT8TnaywIbN2dIcboWHgMUrdf//8EdU10RQ4pxSWuM39wVCTqV63ok77CVpua
 /s22xmk+3OtDcG1UVqNuPs1f1X7reRUx21n0WXfMUWUrG8mIAiuqn5QpZJO7MIHpyZIF
 Bg1ehICelRmYx0LYkV1o+uMToEz4uHnPjahqyYDyuStx+DhVrz9MIIry93XrCGnY/k2C
 ++UA==
X-Gm-Message-State: APjAAAXpjyBXmkftQDU/eO0VgyzCKKYi8+ErmcgPWwhuJxIaHmfeWR6o
 +fxhzr5PRKhJANc7uyhbUstcyIClAO/NxyXef2c=
X-Google-Smtp-Source: APXvYqwXATTPFLPkhxHYujTcoMwizttWJN9gX1zMzSfeEexL+mHTmoVYQD1Xjo9CR2hk2dDAhxvShKMLR5y/Jb3NjZM=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr17542952uap.69.1562074669969; 
 Tue, 02 Jul 2019 06:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190701080022.9415-1-oleg.vasilev@intel.com>
In-Reply-To: <20190701080022.9415-1-oleg.vasilev@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jul 2019 14:38:01 +0100
Message-ID: <CACvgo51-cXsojkE1Y_D0+3+Ax-GZ7gjuq-4xQ6eig9u4XCRsRw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: report dp downstream port type as a
 subconnector property
To: Oleg Vasilev <oleg.vasilev@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=M9b+8ZBleetIVU/09L+s0q/6AcuRkS5NEr9VJrWRykg=;
 b=Q3T2Du8jed/DPIzE4zRbPvH3xcpiZguLEG6TB1te6Ow+ryHZZ1T34clsTdXzC8S8L3
 gvov3CFVCif9PrVwj9WOz/kr9izQbzB9YLiF9Q3ayztpfyJTXe3vtVgJY6OhMLRReu9M
 LQ9cMJkaBSbsKb47wlZCHHlN8Zwat0FhuMfVY2CHg/y4S35oJ/nIFRxN7nt5spkx8khQ
 v4t8x0JzNZXnvC7YQ+Xs3oB5oFwc1Ocr18ccMqQj2KBa/QJ0ui9Vkj26CX5GgtV79aBq
 Qm1bvDDIgqyIPyraccBz7MlU7HDGD4Mp6SYDXVUjHssFHnss9JKR2uSn2mt+/CqyxQfJ
 RqiA==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2xlZywKCk9uIE1vbiwgMSBKdWwgMjAxOSBhdCAwOTowMCwgT2xlZyBWYXNpbGV2IDxvbGVn
LnZhc2lsZXZAaW50ZWwuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgZG93bnN0cmVhbSBwb3J0
IHR5cGUgaXMgb25seSByZXBvcnRlZCBpbiBkZWJ1Z2ZzLiBUaGlzCj4gaW5mb3JtYXRpb24gc2hv
dWxkIGJlIGNvbnNpZGVyZWQgaW1wb3J0YW50IHNpbmNlIGl0IHJlZmxlY3RzIHRoZSBhY3R1YWwK
PiBwaHlzaWNhbCBjb25uZWN0b3IgdHlwZS4gU29tZSB1c2Vyc3BhY2UgKGUuZy4gd2luZG93IGNv
bXBvc2l0b3JzKQo+IG1heSB3YW50IHRvIHNob3cgdGhpcyBpbmZvIHRvIGEgdXNlci4KPgo+IFRo
ZSAnc3ViY29ubmVjdG9yJyBwcm9wZXJ0eSBpcyBhbHJlYWR5IHV0aWxpemVkIGZvciBEVkktSSBh
bmQgVFYtb3V0IGZvcgo+IHJlcG9ydGluZyBjb25uZWN0b3Igc3VidHlwZS4KPgo+IFRoZSBpbml0
aWFsIG1vdGl2YXRpb24gZm9yIHRoaXMgZmVhdHVyZSBjYW1lIGZyb20gaTJjIHRlc3QgWzFdLgo+
IEl0IGlzIHN1cHBvc2VkIHRvIGJlIHNraXBwZWQgb24gVkdBIGNvbm5lY3RvcnMsIGJ1dCBpdCBj
YW5ub3QKPiBkZXRlY3QgVkdBIG92ZXIgRFAgYW5kIGZhaWxzIGluc3RlYWQuCj4KPiBbMV06IGh0
dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNDA5Nwo+IFNpZ25l
ZC1vZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMzYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9y
LmggICAgIHwgIDIgKysKPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICB8ICAzICsr
Kwo+ICBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCAgIHwgIDYgKysrKysrCj4gIGluY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCAgICAgfCAyMiArKysrKysrKysrKystLS0tLS0tCj4gIDYg
ZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KQ2FuIHlv
dSBwbGVhc2UgdXBkYXRlIG90aGVyIGRyaXZlcnMgdG8gbWFrZSB1c2Ugb2YgdGhpcyAtIHF1aWNr
IGdyZXAKc2hvd3MgNS0xMCBpbiB0b3RhbC4KaWYgb25seSBpOTE1IGRvZXMgdGhpcywgdGhlbiB0
aGUgcG9pbnQgb2YgbWFraW5nIHRoaXMgdUFQSSBpcyB2ZXJ5IG1laC4KClRoaW5rIHVzZXItc3Bh
Y2UgaGF2aW5nIHBlci12ZW5kb3IgcXVpcmtzIGZvciBLTVMuIFdoaWxlIEtNUyBzaG91bGQgYmUK
dmVuZG9yIGFnbm9zdGljLgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
