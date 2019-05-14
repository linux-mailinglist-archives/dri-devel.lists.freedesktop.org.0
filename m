Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86701C75E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 13:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21A88CBF;
	Tue, 14 May 2019 10:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252F188CBF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 10:59:57 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id j184so467585vsd.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 03:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChkAh3gTitDc6X6CJ4bEfdEhxdy0TIlSmvivPrAVIzY=;
 b=QTw8W0GGyGz4au+LLJmip4VRDxEkIWsTNVnQD65fDyLVq8uOD1BQaTWAPKPQNvjYPB
 bwewWZFpY3wQEFjEHkDRHxdw894OxPNBoCa5zgbjUMNbkDWY9zyUfVSoGnpAKuaHB5JS
 TrGq8wd8B7NGN65qD1xQVK9ly762dPDL58vdbHBSgPVmhOpudaGbtLk18WqQG6VTpmCG
 LykHC9ryQwEN36N7BeOQ7o3dLUoCQHRYseKswSHf6VWTQc+TApbIaH9YdfZEKEiG8sW1
 s1yG3gNVjv8LyP30f4HMxS2w0EEPKDSjPGO1xcPDFgTInw6LqWgkQbeNq2cLnMPGyGWh
 r95Q==
X-Gm-Message-State: APjAAAUSoG5vwAjTMmOeMWQi43emjKuBk5F+/uW6Ggr8No52XPmuCxpg
 TsIyQ8/jikXaGMvqJOBzojPrVQFRZasI6h+C1QJxsGcS
X-Google-Smtp-Source: APXvYqyD51lArO24Av3/BumYFyIkUqk7MP/S79CaG4J7RBMgKUo32z9NzckaWBL3b+v0OPKqPWOfDJ125X12M8FqhYM=
X-Received: by 2002:a67:f4cc:: with SMTP id s12mr4024532vsn.37.1557831596302; 
 Tue, 14 May 2019 03:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190514104801.20448-1-boris.brezillon@collabora.com>
 <20190514104801.20448-3-boris.brezillon@collabora.com>
In-Reply-To: <20190514104801.20448-3-boris.brezillon@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 14 May 2019 11:58:45 +0100
Message-ID: <CACvgo51BUb_pb+a92k=Xzkm7YC8urADoWS6am3b1=VJvaqJH3Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/2] drm/panfrost: Expose perf counters through
 debugfs
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ChkAh3gTitDc6X6CJ4bEfdEhxdy0TIlSmvivPrAVIzY=;
 b=DRneOqg3J5vx6HzOTcSQOfpjyOsb+pxm6oVHZQ+9z/3kZw3p34A69ycSg6DJIeWQlH
 DKZhs8c+e61IfArzMqo4dCpNtaE+lADApo+EtGee4ekVfkDZQb1GNGcLmE0IRZUuwTh8
 SnfWDBv8ySDm78G8y5SwZ2z0qT7590Z5p0UpNf1jgAkAA93y5Pfjwc9zLoWbB8RNU2Jf
 ggmwfTGVVPRmw3ln+rLJA2Vr581YRF+YAehFASNljo0cWTYH/umVgbTpsekUyebMQ9lP
 RjMZ/3RO5h/Cz3Qy+Awu33iGw8XWFSDAccuVkCn9XcV67Rr6FHt7iQ7r6HdjukivafJi
 Cz1Q==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNCBNYXkgMjAxOSBhdCAxMTo0OCwgQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSB3YXkgdG8gZHVtcCBwZXJmIGNv
dW50ZXJzIHRocm91Z2ggZGVidWdmcy4gVGhlIGltcGxlbWVudGF0aW9uIGlzCj4ga2VwdCBzaW1w
bGUgYW5kIGhhcyBhIG51bWJlciBvZiBsaW1pdGF0aW9uczoKPgo+ICogaXQncyBub3QgZGVzaWdu
ZWQgZm9yIG11bHRpLXVzZXIgdXNhZ2UgYXMgdGhlIGNvdW50ZXIgdmFsdWVzIGFyZQo+ICAgcmVz
ZXQgYWZ0ZXIgZWFjaCBkdW1wIGFuZCB0aGVyZSdzIG5vIHBlci11c2VyIGNvbnRleHQKPiAqIG9u
bHkgYWNjZXNzaWJsZSB0byByb290IHVzZXJzCj4gKiBubyBjb3VudGVycyBuYW1pbmcvcG9zaXRp
b24gYWJzdHJhY3Rpb24uIFRoaW5ncyBhcmUgZHVtcGVkIGluIGEgcmF3Cj4gICBmb3JtYXQgdGhh
dCBoYXMgdG8gYmUgcGFyc2VkIGJ5IHRoZSB1c2VyIHdobyBoYXMgdG8ga25vdyB3aGVyZSB0aGUK
PiAgIHJlbGV2YW50IHZhbHVlcyBhcmUgYW5kIHdoYXQgdGhleSBtZWFuCj4KPiBUaGlzIGltcGxl
bWVudGF0aW9uIGlzIGludGVuZGVkIHRvIGJlIHVzZWQgYnkgbWVzYSBkZXZlbG9wZXJzIHRvIGhl
bHAKPiBkZWJ1ZyBwZXJmLXJlbGF0ZWQgaXNzdWVzIHdoaWxlIHdlIHdvcmsgb24gYSBtb3JlIGdl
bmVyaWMgYXBwcm9hY2ggdGhhdAo+IHdvdWxkIGFsbG93IGFsbCBHUFUgZHJpdmVycyB0byBleHBv
c2UgdGhlaXIgY291bnRlcnMgaW4gYSBjb25zaXN0ZW50Cj4gd2F5LiBBcyBhIHJlc3VsdCwgdGhp
cyBkZWJ1Z2ZzIGludGVyZmFjZSBpcyBjb25zaWRlcmVkIHVuc3RhYmxlIGFuZAo+IG1pZ2h0IGJl
IGRlcHJlY2F0ZWQgaW4gdGhlIGZ1dHVyZS4KPgpBbiBpZGVhOgoKQWRkIG1vZHVsZV9wYXJhbV91
bnNhZmUoKSBtb2R1bGUgcGFyYW1ldGVyIGFuZCBleHBvc2UgdGhlIGRlYnVnZnMKZmlsZXMgb25s
eSB3aGVuIHNldC4KU2VlbWluZ2x5IHRoZSBpOTE1IHRlYW0gaGF2ZSBiZWVuIHVzaW5nIGl0IHRv
IGEgc2ltaWxhciBleHRlbmQgdG8KaGlnaGxpZ2h0IHRoZSBmZWF0dXJlIGlzIHVuc3RhYmxlLgoK
Tm90ZTogc2V0dGluZyB0aGUgX3Vuc2FmZSBwYXJhbSB0YWludHMgdGhlIGtlcm5lbCwgd2hpY2gg
QUZBSUNUIGlzIHRoZQpwYXJ0IHdoaWNoIG1ha2VzIGlzIGV4dHJhIHVzZWZ1bC4KCkkgY291bGQg
YmUgd3Jvbmcgb2YgY291cnNlIDotKQoKSFRICi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
