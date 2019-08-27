Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E169DEBE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6460E89805;
	Tue, 27 Aug 2019 07:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFA089BC2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 05:40:40 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id o6so13999957oic.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPIVNL57PP+Nf8p6Kp3uQdhTH38JJW4Kftqg1AMoBV0=;
 b=UqWwvyLRoRfR+BYQ4jKrIZ7qm92mcGT0iEShHvpZOGcvbPPpQbwj3FK2SKMJL/vGka
 737cFlVm4OY/hUJ3frPsKe2yzPGLYnDxOYatg5R4EaW4Hbr8Notv+bGogMzmFngwldjN
 peb58oHqD4QIj6uK+4dkzsjGLNLil7iJQwoGSvJh5gAUDNepEvjxC3mhohg+4mm1Fenh
 fAnGS4CmMYaVo60ITiiEpShiPRLP287UlpaNw+4/isS+y3zrpqpmuMH0mEyt7EP2CTUM
 /Cvy4xxhqqK1YOqmO+aqK5kGNcQXUYwcrUyB8Ev6wxQFP3i/PVrwMPP5myIt/f5Yr5NF
 /AGA==
X-Gm-Message-State: APjAAAX3xLRDxkA2oM3YWrdt1vBgUDtWQXK/SxXn8rkMt37vUsAunF6q
 nNhJ77ht6Ltz0auNcoUwCNXtTkW22dbvCeTRNXM=
X-Google-Smtp-Source: APXvYqzzdF+CZBcadDQQ7FgxQnP/o6XEYbYqavRhDmjtnbu3qIY6iSxJZ19yy0h3us/UdTfoQ3DfXKzq9CSpnzx5c8Y=
X-Received: by 2002:a05:6808:b14:: with SMTP id
 s20mr1881239oij.15.1566884439743; 
 Mon, 26 Aug 2019 22:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190826144647.17302-1-narmstrong@baylibre.com>
In-Reply-To: <20190826144647.17302-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Aug 2019 07:40:28 +0200
Message-ID: <CAFBinCBdxLnHsqvLT863cUkZ3Cf_2FhzOMQVTvLbxNCsQBi1WQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: vclk: use the correct G12A frac max value
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rPIVNL57PP+Nf8p6Kp3uQdhTH38JJW4Kftqg1AMoBV0=;
 b=BmL0Q/rXa+SE59AS2UvXWjSGV+FMJrqcCnqJPuBWJ3ZSW/echijI0VOVWecqgbt7Qz
 2nxWzeojo2p2JD/l/SpAm3aUdyeCKIsCoHY7wHPnWugeUWKZpKcEHfYwC6+XsoehJOFY
 LVrBGjofWFxGqj+Zgw8ey9V+OaVtPnOA1ChR8eIwnxXCPVojr4UWtAMWer4NJL/3Ni5U
 ySTcrvjd6roSYqltfeRB8v5P5UEcYg2K3edHIHHpM+dl2I+ugSy1zc7Xo2wr03Z8gLa0
 Rnwmk66QOHpSORcjCIGeoBhsHOfGW/tTYflZlRaippNifQqAueryoLXa6YojF2h3XW6p
 YETQ==
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgNDo0NyBQTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiBjYWxjdWxhdGluZyB0aGUgSERNSSBQTEwg
c2V0dGluZ3MgZm9yIGEgRE1UIG1vZGUgUEhZIGZyZXF1ZW5jeSwKPiB1c2UgdGhlIGNvcnJlY3Qg
bWF4IGZyYWN0aW9uYWwgUExMIHZhbHVlIGZvciBHMTJBIFZQVS4KPgo+IFdpdGggdGhpcyBmaXgs
IHdlIGNhbiBmaW5hbGx5IHNldHVwIHRoZSAxMDI0eDc2LTYwIG1vZGUuCm5pdC1waWNrOiBpcyB0
aGlzIHJlYWxseSAxMDI0eDc2IG9yIDEwMjR4NzY4PwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
