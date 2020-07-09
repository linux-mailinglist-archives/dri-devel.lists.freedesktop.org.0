Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5846321B0A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F406EBA9;
	Fri, 10 Jul 2020 07:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71946E187
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:19:26 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t27so2141275ill.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yyTk6JnzuB+6AJzk46UVONqrdhWhla94soaQwotr7mY=;
 b=evO2b+NGHqDs7esJV54GOrqtSMtDd5WZ2hvUUE9vz9LXVfkTJ+XGA/QlGaVtSvaNVY
 YwmcMWuWFnG4c3A/P5XZW/eAbKJVHZ7ZVouLxJeR70kE+iar6oXOemB5qQMzoJ2ZnBTW
 xEiB6wbwD6phkstnwa3JflNxb+kOT/IfEn8+OAWJcnB6AlVTPgPxhIcLe/u9aUCZkxC+
 PIJV7E8XlQ5ULmQe6d+87Lt7lKyhbgS435egBWH1wsiM1nlAQcIw2lurz8kGLcaKD35Z
 gu/0iPaGLNfKgiozBpxtBAECIkt2iAlRCuC7LOke0jC5M9ta8K4CXDyQKFegh5Cryf2s
 5/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yyTk6JnzuB+6AJzk46UVONqrdhWhla94soaQwotr7mY=;
 b=WDdsMSNNMXz0lxPQr4zxDLRrxIvac9AYHHSTJiGjs6rg+IBCxsvVyQkyt0HM/R1Yb3
 FGPAD7ZxyAttpPhm3loiwtc3tH+qA0ES3j2t0r50n+SSuLc0s+5X+WTqbCc8hkeOeMT2
 ipEjUio/QoO8AeaomIKPVeiZbqGSZvJdYeIYqbJN5jgJlCBhuRagGe1MXWU3y9cXpkm2
 LiPoQcEK1ZRFFeJgMUrwUkBIEA+CH5p196usbCXWfX0ELUM1nN2T7pZMmKmqGDxyPy7W
 yP7UivZpnUUkOxc1e9UhPtnH9diqgern9B0DUWg7oHRMywUumpXGamkY9qWH4blKlJpQ
 5wEA==
X-Gm-Message-State: AOAM53066pX2sYh2X769U1Uy2b18xQb5LQZvpU0zGnE3yCimLIShs8VQ
 xLUvbLCan4qPKYbQOSymzxEunDHdIr/4jKtz9/c=
X-Google-Smtp-Source: ABdhPJzlf+b1KgiUbcjVMUS0N4HWsZdJIbmumIkqsvzYa0CfQiQ7QW9DlQt/UH6FKbef1ssVDxXvYUqiurOJnPvJwiQ=
X-Received: by 2002:a92:52:: with SMTP id 79mr43127196ila.59.1594304365847;
 Thu, 09 Jul 2020 07:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200709140322.131320-1-peron.clem@gmail.com>
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 9 Jul 2020 16:19:14 +0200
Message-ID: <CAJiuCcdRB-ZLepes9BuypR4pErkhiJoOqk6R1meCksuaez-7xQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Add regulator devfreq support to Panfrost
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIDkgSnVsIDIwMjAgYXQgMTY6MDMsIENsw6ltZW50IFDDqXJvbiA8cGVyb24u
Y2xlbUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBUaGlzIHNlcmllIGNsZWFucyBhbmQg
YWRkcyByZWd1bGF0b3Igc3VwcG9ydCB0byBQYW5mcm9zdCBkZXZmcmVxLgo+IFRoaXMgaXMgbW9z
dGx5IGJhc2VkIG9uIGNvbW1lbnQgZm9yIHRoZSBmcmVzaGx5IGludHJvZHVjZWQgbGltYQo+IGRl
dmZyZXEuCj4KPiBXZSBuZWVkIHRvIGFkZCByZWd1bGF0b3Igc3VwcG9ydCBiZWNhdXNlIG9uIEFs
bHdpbm5lciB0aGUgR1BVIE9QUAo+IHRhYmxlIGRlZmluZXMgYm90aCBmcmVxdWVuY2llcyBhbmQg
dm9sdGFnZXMuCj4KPiBGaXJzdCBwYXRjaGVzIFswMS0wN10gc2hvdWxkIG5vdCBjaGFuZ2UgdGhl
IGFjdHVhbCBiZWhhdmlvcgo+IGFuZCBpbnRyb2R1Y2UgYSBwcm9wZXIgcGFuZnJvc3RfZGV2ZnJl
cSBzdHJ1Y3QuCgpKdXN0IHNhdyB0aGF0IHNvbWUgY2hhbmdlcyBoYXZlIGJlZW4gbWFkZSBhbmQg
cHVzaGVkIHRvIDUuOC1yYzQuCgpJIHdpbGwgcHVzaCBhIHY0IHVwIHRvIGRhdGUuCgpSZWdhcmRz
LApDbGVtZW50CgoKPgo+IFJlZ2FyZHMsCj4gQ2zDqW1lbnQKPgo+IENoYW5nZXMgc2luY2UgdjI6
Cj4gIC0gQ29sbGVjdCBBbHlzc2EgUm9zZW56d2VpZyByZXZpZXdlZC1ieSB0YWdzCj4gIC0gRml4
IG9wcF9zZXRfcmVndWxhdG9yIGJlZm9yZSBhZGRpbmcgb3BwX3RhYmxlIChpbnRyb2R1Y2UgaW4g
djIpCj4gIC0gQ2FsbCBlcnJfZmluaSBpbiBjYXNlIG9wcF9hZGRfdGFibGUgZmFpbGVkCj4KPiBD
aGFuZ2VzIHNpbmNlIHYxOgo+ICAtIENvbGxlY3QgU3RldmVuIFByaWNlIHJldmlld2VkLWJ5IHRh
Z3MKPiAgLSBGaXggc3BpbmxvY2sgY29tbWVudAo+ICAtIERyb3AgT1BQIGNsb2NrLW5hbWUgcGF0
aAo+ICAtIERyb3AgZGV2aWNlX3Byb3BlcnR5X3Rlc3QgcGF0Y2gKPiAgLSBBZGQgcmVuYW1lIGVy
cm9yIGxhYmVscyBwYXRjaAo+Cj4KPiBDbMOpbWVudCBQw6lyb24gKDE0KToKPiAgIGRybS9wYW5m
cm9zdDogYXZvaWQgc3RhdGljIGRlY2xhcmF0aW9uCj4gICBkcm0vcGFuZnJvc3Q6IGNsZWFuIGhl
YWRlcnMgaW4gZGV2ZnJlcQo+ICAgZHJtL3BhbmZyb3N0OiBkb24ndCB1c2UgcGZkZXZmcmVxLmJ1
c3lfY291bnQgdG8ga25vdyBpZiBodyBpcyBpZGxlCj4gICBkcm0vcGFuZnJvc3Q6IGludHJvZHVj
ZSBwYW5mcm9zdF9kZXZmcmVxIHN0cnVjdAo+ICAgZHJtL3BhbmZyb3N0OiB1c2Ugc3BpbmxvY2sg
aW5zdGVhZCBvZiBhdG9taWMKPiAgIGRybS9wYW5mcm9zdDogcHJvcGVybHkgaGFuZGxlIGVycm9y
IGluIHByb2JlCj4gICBkcm0vcGFuZnJvc3Q6IHJlbmFtZSBlcnJvciBsYWJlbHMgaW4gZGV2aWNl
X2luaXQKPiAgIGRybS9wYW5mcm9zdDogbW92ZSBkZXZmcmVxX2luaXQoKS9maW5pKCkgaW4gZGV2
aWNlCj4gICBkcm0vcGFuZnJvc3Q6IGR5bmFtaWNhbGx5IGFsbG9jIHJlZ3VsYXRvcnMKPiAgIGRy
bS9wYW5mcm9zdDogYWRkIHJlZ3VsYXRvcnMgdG8gZGV2ZnJlcQo+ICAgYXJtNjQ6IGRlZmNvbmZp
ZzogRW5hYmxlIGRldmZyZXEgY29vbGluZyBkZXZpY2UKPiAgIGFybTY0OiBkdHM6IGFsbHdpbm5l
cjogaDY6IEFkZCBjb29saW5nIG1hcCBmb3IgR1BVCj4gICBbRE8gTk9UIE1FUkdFXSBhcm02NDog
ZHRzOiBhbGx3aW5uZXI6IGg2OiBBZGQgR1BVIE9QUCB0YWJsZQo+ICAgW0RPIE5PVCBNRVJHRV0g
YXJtNjQ6IGR0czogYWxsd2lubmVyOiBmb3JjZSBHUFUgcmVndWxhdG9yIHRvIGJlIGFsd2F5cwo+
Cj4gIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMgICB8ICAgMSAr
Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNpICB8IDEwMiAr
KysrKysrKysrCj4gIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMg
ICB8IDE3NSArKysrKysrKysrKystLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmZyZXEuaCAgIHwgIDMwICsrLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2aWNlLmMgICAgfCAgNjEgKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZpY2UuaCAgICB8ICAxNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAgICAgfCAgMTUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2pvYi5jICAgICAgIHwgIDEwICstCj4gIDkgZmlsZXMgY2hhbmdlZCwg
Mjk2IGluc2VydGlvbnMoKyksIDExMyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4yNS4xCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
