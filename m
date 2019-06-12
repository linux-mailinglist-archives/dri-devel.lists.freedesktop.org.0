Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A93843394
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1D18947A;
	Thu, 13 Jun 2019 07:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F73A89381
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:38:18 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id y6so12035742oix.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOkTo1s6DUf5CWhaZWD91rj+8H0jHwr+taCdvSzuC90=;
 b=UNcOiidR3pyWUBlaSMIrApfj7qNs5tTO7FwoncGU/78Cx6zMf+D9p9lBm1QZ1dTINw
 YNG0HQxRZoy9YU+sNtLd7hax1Ez93jdvkiNVH+4ZKJsacdXIHM9LhL55Icz19e0pj92n
 6CHgBguulKniYEb7VLwo9j9mpdZeFIeKGo1ci0sBf6rDaecKeNPXBheIAFdQ9w5+a++3
 8QHWzMDL30g1mM4HanQVeZOF8z61XepVHh744QSpWOch7SU/HchlOqdpF95Hf+dy7KvH
 pR5EdAqyqu6ix4SWZQcNhFoXb19Xzvhpm3ZszK1efgIR8NKujvnaYdWZLcWdZyv5PaEL
 SazA==
X-Gm-Message-State: APjAAAVLRjlH70zEighLozDg9GQfL6EDNUFd3B97lP+YsbkiLP8968zn
 U4fHK+2q3RU5i8Ff2R1yXGKUo5ZnX6r0fyMHUJM=
X-Google-Smtp-Source: APXvYqyNJaPzDQFA20hTEeN7wciG95zHO8vkSTvCSjDcaxtJNzZ4c5C2rfCAOrd0f6RpNUD7hKMPiFJ4vova5+WYuDI=
X-Received: by 2002:aca:e106:: with SMTP id y6mr20265943oig.77.1560353897143; 
 Wed, 12 Jun 2019 08:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXy-0001yu-1V@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1haeXy-0001yu-1V@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:38:06 -0400
Message-ID: <CAGngYiUMCY7Mx30jNxznrUqyPp4D98GJbMOjtoQBOE4qJqf96w@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/i2c: tda998x: add bridge timing information
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZOkTo1s6DUf5CWhaZWD91rj+8H0jHwr+taCdvSzuC90=;
 b=Ske9f+fWRKvCa1GoG9l0MxKRnmIqpxUtjcsYuPpdN7w5KMNk5Zy/H6UEJERnjFZpK6
 oWV/7nNOXGvCzJ3hi5wCWIY6J+DTcMGPjQm9RYaa521hukmr8zFrrco/Uagx4ntsNm5e
 eCpKcuZNNGGsazOM2jSf/JtuPpUVrlA2UYmSWD6TbXeZis4FqzjvnhQFyQ/k5X6d2qCr
 au1HEVepo35VMDnTJdae3AqMcb1YROPrsKWs/WVIRFO6BajORErGqGnq/pzj72BRUmDB
 wj1+o7IW7kA7RVfCue8pmpd70jfwmNSQMBUdJ5UixOPBTIFqKpFBrCdBmIVvMobn2HKL
 Es+g==
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowNCBBTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEFkZCBicmlkZ2UgdGltaW5nIGluZm9ybWF0aW9u
IHNvIHRoYXQgYnJpZGdlIHVzZXJzIGNhbiBmaWd1cmUgb3V0IHRoZQo+IHRpbWluZyBwYXJhbWV0
ZXJzIHRoYXQgYXJlIG5lY2Vzc2FyeSBmb3IgVERBOTk4eC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJ1
c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gLS0tCgorc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgdGRhOTk4OV90aW1pbmdzID0geworICAgICAg
IC5zYW1wbGluZ19lZGdlID0gRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSwKKyAgICAgICAu
c2V0dXBfdGltZV9wcyA9IDE1MDAsCisgICAgICAgLmhvbGRfdGltZV9wcyA9IDEwMDAsCit9Owor
CitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyB0ZGExOTk4OF90aW1pbmdz
ID0geworICAgICAgIC5zYW1wbGluZ19lZGdlID0gRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURH
RSwKKyAgICAgICAuc2V0dXBfdGltZV9wcyA9IDE2MDAsCisgICAgICAgLmhvbGRfdGltZV9wcyA9
IDEyMDAsCit9OwoKTmVlZCB0byBwb3J0IHRoZXNlIHRvIDUuMSBrZXJuZWw6IHNhbXBsaW5nX2Vk
Z2UgLT4gaW5wdXRfYnVzX2ZsYWdzID8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
