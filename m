Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ABD36751A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 00:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C7D6E040;
	Wed, 21 Apr 2021 22:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0776E040
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 22:22:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso38446981otb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dRE4RKWuCIvkF5J/VxYiM6UNN7dj00dIFeHH6pkXxWY=;
 b=PHxKp07T1lM2l2XLvd3sxmK5q5eRQCDsinjTW2/3O5BemfP8CJPWyRTo0z0B37/5PJ
 r4dVmI292T5011drwQzo3YMw1scG3DE1sHSFKaX95ggO8YxPpKAoPWpfPEfO2bpqiBNw
 k9pPM9iCC2WYnJ/ntMyHt9N8gZcmpjO0qtXWw80gFF9jzpNgXmy2klRhOfLrPu8apNyW
 /TxO3V31rXqg9lr0CcxsJBD+UNT6B7dcrgcwn8NBth0qUTdn30/CU+to4mbld0AbrrgW
 SHC61WRPgXp9P8bC1L1lvRNHHn+tzIWkbNZdvs/g/J3mZn+P/a7sEID0VJC7rC05tGRO
 ZFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dRE4RKWuCIvkF5J/VxYiM6UNN7dj00dIFeHH6pkXxWY=;
 b=HyuAkuqeJaYpyNs/87hsdmGCotR5G7ydXsrRr1AJmcNrGNMqI85OFQaC26Qu4bwh1L
 z7JrqxOPWE/0XaNQUCm70st9DODZKcp8ryXgDPdkF7bCS5kdHbHxivH+Wz1S6aaWdT03
 fdDz9Su9Cd7F9Do0GZ5ifubi+U24FjiAFK3MTedXHu9RU+EniufY/tFnZeYFwjvU1cSn
 A8d2MQyBzHLFl9KGhWyaPztufBIL6yQrR7zoVqBCBbDuJHXYszCGvMVhol6P1pNJ2bec
 zERgsmqCVNYdrUsEYnJK99wdERMhV4XYIxow9vG2CDb/dByDWsbIdovg3jBiHqXI//bf
 ivkw==
X-Gm-Message-State: AOAM533DRW+V+TcMtoAI5uhcLb/TkEigeYRc2yig99SgCy85bTGF6k7+
 GoA4W4dKFZGxKzoxNii39hdO43dVPilYYdDu8eea52gVWfbbxxEu
X-Google-Smtp-Source: ABdhPJxFFw7gYYeJQ1g7+XgHXU+NkVhdlx8iwDjKKVqOyID+hdj++tvT2VzG921jJGFcySgxj7jMHHNQwIkOXi6768g=
X-Received: by 2002:a9d:75c4:: with SMTP id c4mr284828otl.311.1619043732506;
 Wed, 21 Apr 2021 15:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyXf8aJnBPfd8E6aT-61PCayKy7M4MM4Sq+OLk+MwvohA@mail.gmail.com>
In-Reply-To: <CAPM=9tyXf8aJnBPfd8E6aT-61PCayKy7M4MM4Sq+OLk+MwvohA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Apr 2021 18:22:01 -0400
Message-ID: <CADnq5_PdZsk7iUK2WL8D8qATPZBVH2fjJxWWDM8D7jOnw66DXQ@mail.gmail.com>
Subject: Re: umn experiment patches fallout in drm
To: Dave Airlie <airlied@gmail.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <skeggsb@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjEsIDIwMjEgYXQgMjo1OCBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gTG9va2luZyBhdCB0aGUgdW1uLmVkdSBwYXRjaGVzIGZvciBkcm0g
aW4gdGhlIGxhc3Qgd2hpbGUsIGFsbCB0aGUKPiByZWZjb3VudCBvbmVzIGxvb2sgYm9ndXMsCj4K
PiAyMDIwLTA2LTEzIDIwOjQ4IC0wNTAwIEFkaXR5YSBQYWtraSBvIGRybS9ub3V2ZWF1OiBmaXgg
cmVmZXJlbmNlIGNvdW50Cj4gbGVhayBpbiBub3V2ZWF1X2RlYnVnZnNfc3RyYXBfcGVlawo+IDIw
MjAtMDYtMTMgMjA6MjIgLTA1MDAgQWRpdHlhIFBha2tpIG8gZHJtL25vdXZlYXU6IEZpeCByZWZl
cmVuY2UgY291bnQKPiBsZWFrIGluIG5vdXZlYXVfY29ubmVjdG9yX2RldGVjdAo+IDIwMjAtMDYt
MTMgMjA6MjkgLTA1MDAgQWRpdHlhIFBha2tpIG8gZHJtL25vdXZlYXU6IGZpeCByZWZlcmVuY2Ug
Y291bnQKPiBsZWFrIGluIG52NTBfZGlzcF9hdG9taWNfY29tbWl0Cj4gMjAyMC0wNi0xMyAyMDo0
MSAtMDUwMCBBZGl0eWEgUGFra2kgbyBkcm0vbm91dmVhdTogZml4IG11bHRpcGxlCj4gaW5zdGFu
Y2VzIG9mIHJlZmVyZW5jZSBjb3VudCBsZWFrcwo+IDIwMjAtMDYtMTMgMjA6MzMgLTA1MDAgQWRp
dHlhIFBha2tpIG8gZHJtL25vdXZlYXUvZHJtL25vdmVhdTogZml4Cj4gcmVmZXJlbmNlIGNvdW50
IGxlYWsgaW4gbm91dmVhdV9mYmNvbl9vcGVuCj4gMjAyMC0wNi0xMyAyMToyMSAtMDUwMCBBZGl0
eWEgUGFra2kg4pSCIG8gZHJtL3JhZGVvbjogRml4IHJlZmVyZW5jZQo+IGNvdW50IGxlYWtzIGNh
dXNlZCBieSBwbV9ydW50aW1lX2dldF9zeW5jCj4gMjAyMC0wNi0xMyAyMDo1NSAtMDUwMCBBZGl0
eWEgUGFra2kg4pSCIOKUgiBvIGRybS9yYWRlb246IGZpeCBtdWx0aXBsZQo+IHJlZmVyZW5jZSBj
b3VudCBsZWFrCgpGb3IgdGhlc2UgdHdvLCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW55IGhhcm0g
dG8gdGhlbS4gIE90aGVyIGRyaXZlcnMKaW4gdGhlIGtlcm5lbCBzZWVtIHRvIGJlIGluY29uc2lz
dGVudCB3aXRoIHJlc3BlY3QgdG8gY2hlY2tpbmcgdGhlCnJldHVybiB2YWx1ZSBvZiBwbV9ydW50
aW1lX2dldF9zeW5jKCkuICBUaGUgZG9jdW1lbnRhdGlvbiBzYXlzIHRoYXQKdGhlIGZ1bmN0aW9u
IGluY3JlbWVudHMgdGhlIHVzZSBjb3VudCBldmVuIGlmIHRoZSBmdW5jdGlvbiByZXR1cm5zIGFu
CmVycm9yLCBzbyB3ZSBzaG91bGQgaW4gdGhlb3J5IGJlIGRlY3JlbWVudGluZyBpdCBhZ2FpbiBp
ZiBpdCBmYWlscy4KSXQncyBub3QgY2xlYXIgd2hhdCB0aGUgcmVjb21tZW5kZWQgaGFuZGxpbmcg
b2YgdGhpcyBjYXNlIGlzIGluIHRoZQpydW50aW1lIHBtIGRvY3VtZW50YXRpb24uICBJZiB0aGUg
cmVzdW1lIGZhaWxlZCBkbyB5b3Ugd2FudCB0byBsZWF2ZQp0aGUgZGV2aWNlIGFjdGl2ZSwgb3Ig
YXR0ZW1wdCB0byBzdXNwZW5kIGl0IGFnYWluIHRvIHNhdmUgcG93ZXI/CkJleW9uZCB0aGF0LCBj
aGVja2luZyB0aGUgcmV0dXJuIHZhbHVlIG9mIHRoaXMgZnVuY3Rpb24gaGFzIHNpbmNlCnNwcmVh
ZCBlbHNld2hlcmUgaW4gdGhlIGRyaXZlciB3aGVyZSB3ZSBjYWxsIHBtX3J1bnRpbWVfZ2V0X3N5
bmMoKSBzbwpyZW1vdmluZyBhbGwgb2YgdGhhdCB3aWxsIGJlIGEgYmlnZ2VyIHRhc2suCgoKPiAy
MDIwLTA2LTEzIDE0OjMyIC0wNTAwIFFpdXNoaSBXdSAgICDilIIg4pSCIOKUgiBvIGRybS9hbWRr
ZmQ6IEZpeCByZWZlcmVuY2UKPiBjb3VudCBsZWFrcy4KCisgRmVsaXgKCkZlbGl4IHRvb2sgYSBs
b29rIGF0IHRoaXMgYW5kIHRob3VnaHQgaXQgd2FzIHN0aWxsIGEgbGVnaXRpbWF0ZSBmaXguCgpB
bGV4Cgo+Cj4gVGhlc2Ugb25lcyBsb29rIHNhbmUgYnV0IG1heWJlIHdlIHNob3VsZCByZXZlcnQg
dGhlbSBhbGwgYW55d2F5cy4KPgo+IDIwMTktMTItMTUgMTM6NDMgLTA2MDAgQWRpdHlhIFBha2tp
IOKUgiDilIIg4pSCIOKUgiBvIGRybTogcmVtb3ZlIGR1cGxpY2F0ZQo+IGNoZWNrIG9uIHBhcmVu
dCBhbmQgYXZvaWQgQlVHX09OCj4gMjAxOS0xMC0xNyAyMzo0MSAtMDUwMCBLYW5namllIEx1ICAg
4pSCIOKUgiDilIIg4pSCIOKUgiBvIGRybS9nbWE1MDA6IGZpeCBtZW1vcnkKPiBkaXNjbG9zdXJl
cyBkdWUgdG8gdW5pbml0aWFsaXplZCBieXRlcwo+IDIwMTktMTAtMTcgMjM6MjkgLTA1MDAgS2Fu
Z2ppZSBMdSAgIOKUgiDilIIg4pSCIOKUgiDilIIgbyBnbWEvZ21hNTAwOiBmaXggYQo+IG1lbW9y
eSBkaXNjbG9zdXJlIGJ1ZyBkdWUgdG8gdW5pbml0aWFsaXplZCBieXRlcwo+IDIwMTktMDMtMjQg
MTg6MTYgLTA1MDAgS2FuZ2ppZSBMdSAgIOKUgiDilIIg4pSCIOKUgiDilIIg4pSCIG8gZHJtL3Yz
ZDogZml4IGEKPiBtaXNzaW5nIGNoZWNrIG9mIHBtX3J1bnRpbWVfZ2V0X3N5bmMKPiAyMDE5LTAz
LTA4IDIyOjM2IC0wNjAwIEthbmdqaWUgTHUgICDilIIg4pSCIOKUgiDilIIg4pSCIOKUgiDilIIg
byBkcm06IHZrbXM6IGNoZWNrCj4gc3RhdHVzIG9mIGFsbG9jX29yZGVyZWRfd29ya3F1ZXVlCj4K
PiBCZW4sIEFsZXggY2FuIHlvdSBsaW5lIHVwIHJldmVydHMgZm9yIG5leHQgZm9yIGFsbCBvZiB0
aGUKPiBub3V2ZWF1L2FtZGdwdS9yYWRlb24gb25lcz8KPgo+IERhdmUuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
