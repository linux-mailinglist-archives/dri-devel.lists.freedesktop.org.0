Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DB165DE6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0846ED72;
	Thu, 20 Feb 2020 12:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A289C6ED70;
 Thu, 20 Feb 2020 12:53:14 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id p6so2551459vsj.11;
 Thu, 20 Feb 2020 04:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2ZYiaFprZKI8sbOfz0ySwE/77QPZO1cz80M3bvgxz4U=;
 b=TNn7AqxHRyQin/O7IuDw0yRPRsGGT53Fyelgq2Pt1kxn8Yk4O/EwqR/5QxwLbUro4C
 C/iWCfNFz8o4ZD6XWCs30i3QUojQnFxayYPvXzK+6l6zLOIVqCwC76FPzh0aQW+e5REL
 eCKGXf2rrbxKALz8Q9PiJUsUkLIguMR2Jo0/LdMFON1blMHlHYW9Y0Vi0PLa6Gve9rD9
 XDXfb2nLj/tpmS3HFqi+6nS1kJCCek3PNARYI/Zzsjh/HOcgH/obm13EZsz1oCJ9OP8Z
 meuag/3VgbPIRroTspCNocd8z826EcMxedhdDAH5zmS+E91Ch5df4ZE0tZE/WgecwqGz
 4nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2ZYiaFprZKI8sbOfz0ySwE/77QPZO1cz80M3bvgxz4U=;
 b=szjuRlvSiWX+OwzvlQIpDDZ5IzWNvBpLwRF8cnmgoKYyN9KDxPLn/eu3rlRQ8l+K1T
 Vsq4NMtzHwo01vXElUQ9iMHhoHnhmtflCdyblVwfDNdZJbuQqSr0iWyYOmYNWvVZEk56
 3UElOu5OTLR0ZLUJNJVZPEf9/MrMqq6rBhAjonbBrH7bQyv8HSXNtktLK9cCSa96E8Y8
 JjEsr81z2ncy+U/9UwET9SQH3LA4UzMGNS+QOuN4O5DpO44dhhAFMVBf4h4rwtn9abJy
 nBChGQYIhgjROdUDYXho8M3sRx7kOgxsqHqmJ9V1wzyEr9Rxsf8miDg5tINogLTK6I5M
 p2LA==
X-Gm-Message-State: APjAAAX8rDSHvQF+5OgYcDjz4Flq4bJEGSwjv9J+93iFfZYLJGq6NHUB
 YsmFclzfLNX9cgaRWEUtFjUZD8esz2vOuncEdzGoWw==
X-Google-Smtp-Source: APXvYqwYukDE0594XCLoIv9he4fmykpQEr8ngrDMMbGocTt6zzgCGTe6FHXcftVWYQKNtTOAOzBD3ZQA4nuzHtuAJCE=
X-Received: by 2002:a67:c204:: with SMTP id i4mr17796097vsj.118.1582203193845; 
 Thu, 20 Feb 2020 04:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-13-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-13-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 12:53:01 +0000
Message-ID: <CACvgo52d9XN1AkwviN8WhsyHuT94KQd87K1rGaA0wNq3xk6n2g@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm: pahole struct drm_display_mode
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFJlb3JnYW5pemUgZHJtX2Rpc3BsYXlfbW9k
ZSB0byBlbGltaW5hdGUgYWxsIHRoZSBob2xlcy4KPiBXZSdsbCBwdXQgYWxsIHRoZSBhY3R1YWwg
dGltaW5ncyB0byB0aGUgc3RhcnQgb2YgdGhlCj4gc3RydWN0IGFuZCBhbGwgdGhlIGV4dHJhIGp1
bmsgdG8gdGhlIGVuZC4KPgo+IEdldHMgdGhlIHNpemUgZG93biB0byAxMzYgYnl0ZXMgb24gNjRi
aXQgYW5kIDEyMCBieXRlcyBvbgo+IDMyYml0LiBXaXRoIGEgYml0IG1vcmUgd29yayB3ZSBzaG91
bGQgYmUgYWJsZSB0byBnZXQgdGhpcwo+IGJlbG93IHRoZSB0d28gY2FjaGVsaW5lIG1hcmsgZXZl
biBvbiA2NGJpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+CgpQYXRjaGVzIDA3LTEyIGFyZToKUmV2aWV3ZWQtYnk6IEVt
aWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
