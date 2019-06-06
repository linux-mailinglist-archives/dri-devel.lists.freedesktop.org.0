Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C536A0E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 04:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E885E89718;
	Thu,  6 Jun 2019 02:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BADD89718;
 Thu,  6 Jun 2019 02:34:32 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id u12so1009218qth.3;
 Wed, 05 Jun 2019 19:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uSwokGMA+vNfAxqwUsbUQgOIarvFkQWi346sUHKlie4=;
 b=iMheqMmoebmyUmU2vtMkVVHscqmuN/pfqGMjck8t8E4NXd6KYqE7GFNJuAIADISQyn
 8VOrDaSjCIcLLfTOvbrtPpYQB745y7sHpQ2ZWDuFxmocC+2zMINN4uIFqCzWFpFbjKl/
 ELZ+m98wKaLmS+dhe3z/xqtwraXFDIkQI8u5ZgmymE8iO8CLmy5JZVXv6tEU1kS8HlyC
 Rn1NPfJHFEePHclKVk2amOSKmVIwe/ui08Gp+FUqhPxydW9hoYTIHucGlTwZJYPjG9jL
 jbv8XKGVPso8lvmNmK0ULrm2bmaSftweoL+mzYA99ek+sgwmR0QPa+DXN3F26WkjkiRU
 zhuA==
X-Gm-Message-State: APjAAAUOaBXuO5Aq9yahjU1aN9sZIlu5Z75O0INND7JSw/4euFkVtmKo
 00UpANnvWjeKNpanZ+r1YgR6TeAKAX1sKSRINwA=
X-Google-Smtp-Source: APXvYqxuBCdb/4sYj4ysPtj+mXhSiqc2AlgSEp7dlqbGQWkS+1ut6d5N1YsCn8lc7SBDMO4DGtzLrf3zx1/ojpL5ta4=
X-Received: by 2002:a0c:adef:: with SMTP id x44mr15899595qvc.153.1559788471391; 
 Wed, 05 Jun 2019 19:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190605191157.3134-1-alexander.deucher@amd.com>
In-Reply-To: <20190605191157.3134-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Jun 2019 12:34:20 +1000
Message-ID: <CAPM=9twLRm41uHjsYn8KG-fsCrG=cdpQ8Jh1VJ1kBcFs2FFWYA@mail.gmail.com>
Subject: Re: [pull] amdgpu, ttm drm-next-5.3
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uSwokGMA+vNfAxqwUsbUQgOIarvFkQWi346sUHKlie4=;
 b=K0D8Cc4eHtaXJYg6k8lBYMfak5u9Rv1umoZtbNKaixRk1W0BskHtbfqL5TW4dYJuvZ
 l5HUkQgkvMQjpZi/7fDhQQRSeNkzVaLge3jHo6wz+kcGWG//gxJ/ZVHbOdpWLx/kVRle
 xFABCsgdq6bDvzc5N8Q6+/lKCe4G1kASZ3+tUCcf0NPhUP4rXIzXAVJRNzesBtTNYKXW
 5sJvWKjqxur8reAVIxwOFRVHrbHefAx6Of2oDCYoT5m/qXx4aa78Mur+PTmOY2D/fN9c
 aJC4m9hnmRE4DP6LePKPX/V3Gm3sXaAqKXuchQL3Ie8LrIMI1hLiJopNWx6YAkReogRV
 ZANg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA2IEp1biAyMDE5IGF0IDA1OjEyLCBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYXZlLCBEYW5pZWwsCj4KPiBNb3JlIG5ldyBzdHVmZiBm
b3IgNS4zOgo+Cj4gYW1kZ3B1Ogo+IC0gUmV2ZXJ0IHRpbWVsaW5lIHN1cHBvcnQgdW50aWwgS0hS
IGlzIHJlYWR5Cj4gLSBWYXJpb3VzIGRyaXZlciByZWxvYWQgZml4ZXMKPiAtIFJlZmFjdG9yIGNs
b2NrIGhhbmRsaW5nIGluIERDCj4gLSBBdXggZml4ZXMgZm9yIERDCj4gLSBCYW5kd2lkdGggY2Fs
Y3VsYXRpb24gdXBkYXRlcyBmb3IgREMKPiAtIEZpeCBkb2N1bWVudGF0aW9uIGR1ZSB0byBmaWxl
IHJlbmFtZQo+IC0gUkFTIGZpeAo+IC0gRml4IHJhY2UgaW4gbGF0ZV9pbml0Cj4KPiB0dG06Cj4g
LSBBbGxvdyBmb3IgYmV0dGVyIGZvcndhcmQgcHJvZ3Jlc3Mgd2hlbiB0aGVyZSBpcyBoZWF2eSBt
ZW1vcnkgY29udGVudGlvbgoKZGltOiAxMzdhN2RhOTI1NTcgKCJSZXZlcnQgImRybS9hbWRncHU6
IGFkZCBEUklWRVJfU1lOQ09CSl9USU1FTElORSB0bwphbWRncHUiIik6IG1hbmRhdG9yeSByZXZp
ZXcgbWlzc2luZy4KZGltOiBjZjI1YjY0NDQzNzYgKCJncHU6IGFtZGdwdTogZml4IGJyb2tlbiBh
bWRncHVfZG1hX2J1Zi5jCnJlZmVyZW5jZXMiKTogU0hBMSBpbiBmaXhlcyBsaW5lIG5vdCBmb3Vu
ZDoKZGltOiAgICAgOTg4MDc2Y2Q4YzVjICgiZHJtL2FtZGdwdTogcmVuYW1lIGFtZGdwdV9wcmlt
ZS5bY2hdIGludG8KYW1kZ3B1X2RtYV9idWYuW2NoXSIpCgpUaGUgZmlyc3QgSSdtIG5vdCB3b3Jy
aWVkIGFib3V0LCBidXQgdGhlIGZpeGVzIGxpbmUgc2hvdWxkIGJlIGZpeGVkCmJlZm9yZSBJIGNh
biBwdWxsIHRoaXMuCjJmYmQ2Zjk0YWNjZGJiMjIzYWNjY2FkYTY4OTQwYjUwYjBjNjY4ZDkgaXMg
dGhlIHVwc3RyZWFtIGNvbW1pdCBpbiBteSB0cmVlLgoKRGF2ZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
