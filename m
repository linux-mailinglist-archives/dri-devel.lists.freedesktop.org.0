Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C21D0B9A
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24FC6E9D4;
	Wed, 13 May 2020 09:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658626E905
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:21:51 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id z1so7405701vsn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kSYqHkbpOOu/zf0B8Osjbo8kFkCZos6PpJRoEcMflvU=;
 b=iP3TGopJYHRsnSpyRl4vII08KQtE9WzTAQHUselq8zPdubPq9HSnkBXf2+ifRr8l/S
 5z/WoFSa5Zj2Zcmw/7f9mxXQyfELGR/UU+F8e99lZytjyVY7HZvc1nH5Cyw8G0uH7EIF
 ENmvCYbdnvxSTBx5WNchXC0eVW+KTMhU48/Q/WsDU4H7Vq5HVJ2JE6PqKCo1gjykzTBx
 4GH01uUToeG1x2lNYOOr+wHjtNsZhgYl12cLqp1hCqAogNPEUlmPKMw6zUg3GItevqTe
 B42kUBogrodf8dMM8yZ5/E3akUe8Z2MwD0fMb9NQUbmb4m3KWk5XOJnNHkMr+zrVeLlL
 aj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kSYqHkbpOOu/zf0B8Osjbo8kFkCZos6PpJRoEcMflvU=;
 b=Xto1HIelANCdxzivI1Iuuno0OiI2BVBPUZTL0Ah+RqU+7+bXuooJ1VtahHk5srwPpc
 5jlI/bloWX7PAbPOuqXS9CYu054Hrl8+FXVFoMQqb6NkDm7LEZM6NPZDkboBsy1H1ElI
 RgJCTiVLh8XdscYIeIYp1f5WsJgM/RhZzgC9P/sTx7jRSiFwHYP3HEkBqpAhw6mwvEpB
 44oVDKObgO5Nes3qEVtqLORWK3OaF9H+BopHjMXZRhZ4cTNUDkg3MJ2Wc5iRbCC6Nb3+
 cEEz3mGTgdHZJlMnQftQusxVpJ03TUvJh6o1ZwV1oHCixG3fs4p3mH8AS0y/bfoV9gXu
 KHlA==
X-Gm-Message-State: AGi0PuaPxy9twx4wsU8WtWOsRdTbre8aVQ9npnoT+fE5aNYpFSnMCQTd
 9/LsrKbasTJUcwtvfsgDI3O3mmiZhb7+Z17zuA==
X-Google-Smtp-Source: APiQypJaaGdIHXqrt/LnLlTFn55eUYfU2B4m6Kp2ZigTb7euwhGJ95cnTZjLz19ubXmTUkbjetYlyVWRAkvxSYeSRWw=
X-Received: by 2002:a67:63c3:: with SMTP id x186mr14269278vsb.63.1589275310548; 
 Tue, 12 May 2020 02:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
In-Reply-To: <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Tue, 12 May 2020 10:21:39 +0100
Message-ID: <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBNYXkgMjAyMCBhdCAwODo1OCwgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4gd3JvdGU6Cj4KPiBGV0lXLCBvbiBteSBsYXN0LWdlbmVyYXRpb24gUG93ZXJCb29r
IHdpdGggUlYzNTAgKElJUkMpLCB0aGVyZSB3YXMgYSBiaWcKPiBwZXJmb3JtYW5jZSBkaWZmZXJl
bmNlIGJldHdlZW4gQUdQIGFuZCBQQ0kgR0FSVC4gVGhlIGxhdHRlciB3YXMgc29ydCBvZgo+IHVz
YWJsZSBmb3Igbm9ybWFsIGRlc2t0b3Agb3BlcmF0aW9uLCBidXQgbm90IHNvIG11Y2ggZm9yIE9w
ZW5HTCBhcHBzCj4gKHdoaWNoIHdlcmUgdXNhYmxlIHdpdGggQUdQKS4KCkkgbmV2ZXIgcmVhbGx5
IHVuZGVyc3Rvb2Qgd2hhdCB3ZXJlIHRoZSBpc3N1ZXMgd2l0aCBBR1Agb24gUG93ZXJQQwood2Vs
bCwgQXBwbGUsIHRoZSBvbmx5IG9uZXMgSSd2ZSB0ZXN0ZWQpIG1hY2hpbmVzLiBJIG1lYW4sIGRp
ZCBPUyBYCmFsc28gZGlzYWJsZSBBR1AgZW50aXJlbHksIG9yIGRpZCBpdCBoYXZlIHdvcmthcm91
bmRzIHNvbWV3aGVyZSBlbHNlCm9uIHRoZSBzdGFjayBub2JvZHkgd2FzIGFibGUgdG8gZmlndXJl
IG91dD8KCkFueXdheSwgbm90IG1lYW5pbmcgdG8gaGlqYWNrIHRoaXMgdGhyZWFkLCBidXQgc2lu
Y2Ugd2UncmUgbW9zdGx5IG9uCnRoZSBSM3h4KyBoYXJkd2FyZSBwYWdlLCB0aGlzIG1pZ2h0IGJl
IGEgZ29vZCBvcHBvcnR1bml0eSB0byB0YWtlIGEKbG9vayBhdCAjMzg5IFsxXSBhbmQgIzI3ODAg
WzJdIChjYydpbmcgYWlybGllZCwgc2luY2UgaGUgc2VlbXMgdG8gaGF2ZQphY2Nlc3MgdG8gdGhl
IGhhcmR3YXJlKS4gSSBjb3VsZCBiZSB3cm9uZywgYnV0IGl0IHNlZW1zIHRvIGJlIGEgc3RyaWRl
CmNhbGN1bGF0aW9uIGlzc3VlLCBlYXN5IGVub3VnaCB0byBzb2x2ZSBmb3Igc29tZW9uZSBmYW1p
bGlhciB3aXRoIHRoZQpkcml2ZXIgKHdoaWNoIEknbSBub3QgOikpLiBUaGlzIHdvdWxkIGdldCB1
cyB1c2FibGUgRFJJMy9HTEFNT1IKc3VwcG9ydCBvbiBSM3h4KyBoYXJkd2FyZS4KClsxXSBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vaXNzdWVzLzM4OQpbMl0gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2lzc3Vlcy8yNzgwCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
