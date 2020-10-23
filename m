Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00F297763
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 20:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA8E6E448;
	Fri, 23 Oct 2020 18:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACC56E448;
 Fri, 23 Oct 2020 18:58:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y12so3273595wrp.6;
 Fri, 23 Oct 2020 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HVVGoFH+W6TXbwZk/lJDswsi31Devdn0bKrhChGZkSw=;
 b=oifvqLuPq3+kt6YtYbANPBM9dRUg1EIA7QF5vNUYPPyrBU78UHFhGUF1lQX0Xst+jG
 X6tO/bqSp6e16Za1yek76z98m5+wzRq5h91bKIQfk8QYOy1JXaOh6HKiBN0XVQJEwCu9
 +EnxXKRbZxJT7jGcJStMkFIu4lyQZr+EhL85UvUWW5qnj/k5VBzaedJvudGI2Pzt8mYd
 yVO+CNJN6/IxTaDNL6Eff1uNe3MB1EosEM3e1BkZQugCyc938gn1tcgipCDXF1ndNY7L
 wcqiTH2CjC5ieg7jYWpf1cY1pjK+ZGG4WZVSGlU1IiKhHP3j7/9hSVzMgjBD67tP8/W+
 1aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HVVGoFH+W6TXbwZk/lJDswsi31Devdn0bKrhChGZkSw=;
 b=gzGnz7InJuo5H3WEy28/zdj574XO/FusVyb7/ooGbXZQ/588Lp4T1yBWGDzk2MtIR9
 m+eRPEWA70OohFWgqEmrCwdj78o7LNPtDqvW2j8ik3uLkI998TScDHHweotbgiatF6RY
 9jNcJInN7xf3NLf+MaqyuLWnG9dU+ViWGVQawlMywezJNZjl8vvt2I4zutNCTU6JQm3w
 lpQgFKDmnSBucM/vGIZt4yVKG5usSgSqw3I/F0LE4x2lCEtPALvxQwe8IFFPHf+YcoTy
 Rn1qNZHOjD3GDyyXljEbncxfEQEr54Rf0EykEGLymy+Q7CwOfoXcTFRV/1YySFVRfEmJ
 uW6g==
X-Gm-Message-State: AOAM5308/4f6Bk7x4KNwUUR+bqERMdfuO++YLtnjAS5pzNIkeVPEvfLL
 m06IZf+koHnP2aF/foEnSxC1CsUdH/r4JYCKdZo=
X-Google-Smtp-Source: ABdhPJxhOalGy8AVCk6uFL0CL8XNNtHj2n59zH+OlgCHHeE/mvzoX8Mkq8zjdC575NT151N0gWOsX5KiiZu/oQ7WESg=
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr4374706wrl.124.1603479516631; 
 Fri, 23 Oct 2020 11:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <632b3b11118969ff6fccb8a2f606c87fde41c138.1603469755.git.mchehab+huawei@kernel.org>
 <ecb99629-f593-b389-60b3-dc6f1b306c8b@amd.com>
In-Reply-To: <ecb99629-f593-b389-60b3-dc6f1b306c8b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Oct 2020 14:58:24 -0400
Message-ID: <CADnq5_OF2+QpPeBOXkR+JWkCog1ZAckejK2y2o4yf44U9Jrxgw@mail.gmail.com>
Subject: Re: [PATCH v3 03/56] amdgpu: fix a few kernel-doc markup issues
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIEZyaSwgT2N0IDIzLCAyMDIwIGF0IDEyOjM4IFBN
IENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBB
bSAyMy4xMC4yMCB1bSAxODozMiBzY2hyaWViIE1hdXJvIENhcnZhbGhvIENoZWhhYjoKPiA+IEEg
a2VybmVsLWRvYyBtYXJrdXAgY2FuJ3QgYmUgbWl4ZWQgd2l0aCBhIHJhbmRvbSBjb21tZW50LAo+
ID4gYXMgaXQgY2F1c2VzIHBhcnNpbmcgcHJvYmxlbXMuCj4gPgo+ID4gV2hpbGUgaGVyZSwgY2hh
bmdlIGFuIGludmFsaWQga2VybmVsLWRvYyBtYXJrdXAgaW50bwo+ID4gYSBjb21tb24gY29tbWVu
dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIr
aHVhd2VpQGtlcm5lbC5vcmc+Cj4KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIHwgOCArKysrKy0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiA+IGluZGV4IGY4Nzg1YmRlYzc5Yy4uMWQ0YjU0
OTUwNTI4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKPiA+IEBAIC0yMzksOSArMjM5LDExIEBAIGJvb2wgYW1kZ3B1X2RldmljZV9zdXBwb3J0
c19iYWNvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPiAgICAgICByZXR1cm4gYW1kZ3B1X2Fz
aWNfc3VwcG9ydHNfYmFjbyhhZGV2KTsKPiA+ICAgfQo+ID4KPiA+ICsvKgo+ID4gKyAqIFZSQU0g
YWNjZXNzIGhlbHBlciBmdW5jdGlvbnMKPiA+ICsgKi8KPiA+ICsKPiA+ICAgLyoqCj4gPiAtICog
VlJBTSBhY2Nlc3MgaGVscGVyIGZ1bmN0aW9ucy4KPiA+IC0gKgo+ID4gICAgKiBhbWRncHVfZGV2
aWNlX3ZyYW1fYWNjZXNzIC0gcmVhZC93cml0ZSBhIGJ1ZmZlciBpbiB2cmFtCj4gPiAgICAqCj4g
PiAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiA+IEBAIC00NDk3LDcgKzQ0OTks
NyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKPiA+ICAgICAgIGJvb2wgbmVlZF9lbWVyZ2VuY3lfcmVzdGFydCA9IGZhbHNlOwo+ID4g
ICAgICAgYm9vbCBhdWRpb19zdXNwZW5kZWQgPSBmYWxzZTsKPiA+Cj4gPiAtICAgICAvKioKPiA+
ICsgICAgIC8qCj4gPiAgICAgICAgKiBTcGVjaWFsIGNhc2U6IFJBUyB0cmlnZ2VyZWQgYW5kIGZ1
bGwgcmVzZXQgaXNuJ3Qgc3VwcG9ydGVkCj4gPiAgICAgICAgKi8KPiA+ICAgICAgIG5lZWRfZW1l
cmdlbmN5X3Jlc3RhcnQgPSBhbWRncHVfcmFzX25lZWRfZW1lcmdlbmN5X3Jlc3RhcnQoYWRldik7
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
