Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E752433A2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473C089394;
	Thu, 13 Jun 2019 07:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90AC89468
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:40:54 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w196so12024105oie.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kuaMNNt7V/BLIiCGVwHEO69wisg+S88NEXtwvuQp+Zo=;
 b=bIKdSQZdBgoqLCmjdL+kcywqd7ELgBT4YDrE5HuKGVuNEj9fRVKmodzsDsCWRVSNNj
 Yop1WpOVXcY6eW423aA57c5DqvmWV9Y8mICP7e+vRFu39VJTGyKGv2WSzcLLi6U9g9lz
 5GcPNvg4N34PMiWb4R8JgFJ5rpKGSqvQIQCTi/0ZXQf7oSkOcmhPWgtEvPhWQkLOBZSg
 21zz5LUSNjnKhpn6AJuCwPsR2orjgXzLcTGWt9lXFm8DsWiPaaT8ndvd72zjLixQ3hd2
 fknvJC7RH2TdV6RIRVNRCsnyPFFDBqOex/TvyxE6hXZUN7wQUMdz9DZna/bFTqTp/byl
 KqBA==
X-Gm-Message-State: APjAAAVzQ/Jn5Lon8HMA0XmTzPVZ3k21epajGpykobVLfKlSTDMXre8T
 KwCizQg7DNtxxKpFZqwMuniEaA2MnjKdaptUkYk=
X-Google-Smtp-Source: APXvYqwLW3BpjBXfo1eR7V1CAT6vtpni9TwgJ7oHW1sSOCF8KCa1nBJOtBRQ3o0HJDWsd7G/e+sEiTslbtUvkajn9Xc=
X-Received: by 2002:aca:75c2:: with SMTP id q185mr2115867oic.103.1560354054017; 
 Wed, 12 Jun 2019 08:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
In-Reply-To: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:40:43 -0400
Message-ID: <CAGngYiXOZH+m6z4FibmjmvCwtALU=vT372k4=7-eJWjryzFAuA@mail.gmail.com>
Subject: Re: [PATCH 00/13] tda998x updates
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kuaMNNt7V/BLIiCGVwHEO69wisg+S88NEXtwvuQp+Zo=;
 b=rEJR+2XE4lU5yIP48QYXFJlO0Ps4+Z9byW5s89nOJWnm//8Ui9qOSk6GE4XOgfgZte
 PEpoWEabsXQ2BUy2hXdYkZ4+hP/J6mD2HEnKgpqObAm84cgY3p1bHNYoH3hi0kfi4FpP
 eq6jeT9Q1Scw1u/+D/2YbAYYp10s8WJKXJZB2CggBhPuL6MMTNmRUvil3BNTHdEljPYC
 AJrbP+dZzSULY2yiPeM8+En2oXdh+aC0hTIvo8ANXqV/PUQhpB+Efy7VxNGjaeHs5Dcv
 zDm5QHqMWbyisa7SKfvNukolkKYAKM+X6DWV6EX0vE2T72Fnkj7ChLg5BSGFdTsNWr0k
 4arA==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMSBBTSBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgg
YWRtaW4KPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyByZXBy
ZXNlbnRzIGRldmVsb3BtZW50IHdvcmsgY29sbGVjdGVkIG92ZXIgdGhlIGxhc3Qgc2l4Cj4gbW9u
dGhzIHRvIGltcHJvdmUgdGhlIFREQTk5OHggZHJpdmVyLCBwYXJ0aWN1bGFybHkgZm9yIHRoZSBh
dWRpbwo+IHNpZGUuICBUaGVzZSBwYXRjaGVzIGNhbiBiZSBmb3VuZCBpbiBteSAiZHJtLXRkYTk5
OHgtZGV2ZWwiIGJyYW5jaAo+IGF0IGdpdDovL2dpdC5hcm1saW51eC5vcmcudWsvfnJtay9saW51
eC1hcm0uZ2l0CgpUaGFuayB5b3UgUnVzc2VsbCAhIQoKSSB0ZXN0ZWQgdGhpcyBwYXRjaCBzZXQg
b24gbXkgcGxhdGZvcm06IGlteDZxIHNzaSBjb2RlYyBkcml2aW5nIGEgdGRhMTk5ODguCk5vIGlz
c3VlcyBhcyBmYXIgYXMgSSBjYW4gdGVsbC4KCk5vdGUgdGhhdCBJIHN0aWxsIGhhdmUgdG8gJ2hh
Y2snIHRoZSBiY2xrX3JhdGlvIGluIHRoZSB0ZGEgZHJpdmVyIHRvIGNvcnJlc3BvbmQKd2l0aCB0
aGUgd2lyZSBmb3JtYXQgdGhhdCB0aGUgaW14NnEgc3NpIGlzIGdlbmVyYXRpbmcuIEJ1dCB0aGF0
J3MgYSBrbm93bgppc3N1ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
