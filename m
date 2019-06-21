Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C54EE6D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 20:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D46897E0;
	Fri, 21 Jun 2019 18:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD5189100
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 18:05:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v18so6744123ljh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkYyL67CNGYKGgM9r7dwT8ZYE4U7QkyC3ItCF9X1hcM=;
 b=Mt0NPGrJbyZmWB/puDaHz/8nXDKDLHWi2J7CU9jVsIsCljq7bZhW0fnbpA4wVdqdOd
 ePOqn8TAt7n5thDPqudr00KapIcu4CirvFzKl6OG/BX3gx2ZPJ+p3r4/CTxMzsZyk0K6
 /yrGXRCWoF+Y7NbxPZpW8oSEUTKnmaAadvUX8zDNYRreClHAWYQTz8dozUJQifk7NPyG
 nli5nYDnqR3KWEEENgODHjbIylZzoesotrTGE7Z7QKPGjhcelVcK/T9h/dCZ+nqy+07A
 D3JSZZ338XSG+DEUH4q8d+pB1J6xasXmh7BIH4X2GRNeg8JFrFNvgHG4Z9m/m8FWKt6H
 idMg==
X-Gm-Message-State: APjAAAWZxfWm5xJ3yK0d6PBJOiffbfzjESNMoiMkYwxt/gSJequkE6l6
 nnNJw7xnnhHKUq/6iji5quMkdmq3K9A=
X-Google-Smtp-Source: APXvYqxKS19NkXEJW+HDNwUPSBRQs/p5EVIli4JPIc4dbRAu5vOZlVGY+pQHK7/oO4ng2EueLtXmqw==
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr64291396lje.7.1561140333624; 
 Fri, 21 Jun 2019 11:05:33 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id u13sm486061lfi.4.2019.06.21.11.05.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 11:05:32 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id h10so6787620ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:05:32 -0700 (PDT)
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr10076233ljm.180.1561140332237; 
 Fri, 21 Jun 2019 11:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyM7BRfAwruJ4QsY_gMCGVHxS=ag7cNA1H304zcnAFK+A@mail.gmail.com>
 <CAHk-=wifNAnkd+bXfoNWXO1K5NQ8Tr+Hc13SgaBXU3RoQB7Pwg@mail.gmail.com>
 <CAPj87rP451duPWi4TQjcqzbyVKYp_v7=ibwR=2UnQyWttLDWNg@mail.gmail.com>
In-Reply-To: <CAPj87rP451duPWi4TQjcqzbyVKYp_v7=ibwR=2UnQyWttLDWNg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Jun 2019 11:05:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wih2mBygBvVru4QLbBHEO_5C5yLwbE8qL47Fzj3A1m6vA@mail.gmail.com>
Message-ID: <CAHk-=wih2mBygBvVru4QLbBHEO_5C5yLwbE8qL47Fzj3A1m6vA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.2-rc6
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PkYyL67CNGYKGgM9r7dwT8ZYE4U7QkyC3ItCF9X1hcM=;
 b=dv9Qvp8QX5IP5eCfEA74EyTjANkLhGHdTL6idhmn93L0PLv8UwhQOuZJyDSXIiXMh0
 G0QjXxaba0bumx+9KOJcvCd/6/ze7+24mK+uCLBNVeMWatUp1oCVLbji7XZmgbxa9FJ8
 d1fgYMD4EFaoGpXyrtOJAaQwtVZjUFNJSGv6Y=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTA6MDYgQU0gRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9v
aXNoYmFyLm9yZz4gd3JvdGU6Cj4KPiA+IERvZXMgaXQgd29yayBmb3IgeW91PyBJJ20gZ2V0dGlu
ZyBhIGNvbm5lY3Rpb24gcmVzZXQsIG5vIGRhdGEuCj4KPiBJdCBpcyBxdWl0ZSBzaWNrIGluZGVl
ZDsgaXQncyBmYWxsZW4gZG93biBhbiBORlMgaG9sZSBhbmQgaXMgYmVpbmcKPiByZXN0YXJ0ZWQu
IFNob3VsZCBiZSBiYWNrIGluIGEgZmV3IG1pbnV0ZXMuCgpUaGFua3MsICBldmVyeXRoaW5nIGRv
ZXMgaW5kZWVkIGxvb2sgZ29vZCBhZ2FpbiBub3csCgogICAgICAgICAgICAgICAgIExpbnVzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
