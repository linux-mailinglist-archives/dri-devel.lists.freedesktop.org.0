Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E7342F25
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 20:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D346E0AD;
	Sat, 20 Mar 2021 19:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBB26E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 19:11:19 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id x2so8601209oiv.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 12:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qBgmrVULpez7UO3BJU9FJWKaArChzRp0hxsw7bxfXc4=;
 b=NGt5U8aOeAjKCDjg+KQ1yXjaZu3O2diMK7Ow3+klyk21mCKUVbd3uEimbucuM/kj+O
 ro+nkhFvbRRYxofpvZuqHSsnbU7G8jKuQlIdhbO2ffsEdw95jNKT++H8dDcvpnU7xOUK
 OqzRc4/rY9vI1XioYjsuW3NilyLqejfRDJ2rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qBgmrVULpez7UO3BJU9FJWKaArChzRp0hxsw7bxfXc4=;
 b=YqCNUYB5LgHwnEsdqY6utaf3yJ/RKsyHvPCui0/0VPr5WtmmUh+X2qkDXodn5qbYUw
 ju2MMMYaqzwg5ywcy2RRlIjLSpQbnXAw2vdhKGM24fT3EiDUEPjbrDcRQgYWUvhvKihf
 ZY7hqjwFa15gC515EsS8wYHtue0sXtJ0Pit6ypcxVHIPH62MGB15BRVAz7OmCoYkPrd8
 FzTIY4u92U9nLG8l7fBuQchgj7IVE3vNEMnZtcCkVMXE6gmmxDdFv/EPhln3Zt9qZu0l
 xLwWoWK7gDbRmVZRYEAHNuWws3t0oLZQXauG70kY0zx16SzU1lbwzckRpI/axTHhw/rR
 lwsA==
X-Gm-Message-State: AOAM533/1Ex8OPnGbPeWGCI9qQPTZpDQD0SQ8vFFjwqpYRc0aCqJgZDE
 6YvyKGgRie2k666WHb2A5dILnFOaX/Hq5wY5m2w8gw==
X-Google-Smtp-Source: ABdhPJygqoXty9bMa/ZXnCb0eKUA7dAP/hj5TGwwHmLYrVisGkZ6rNv0CxGBE9GmQpW4KhpK0zqZ6enphrHSMYbY/3Q=
X-Received: by 2002:aca:4188:: with SMTP id o130mr4955360oia.101.1616267478225; 
 Sat, 20 Mar 2021 12:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
In-Reply-To: <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 20 Mar 2021 20:11:07 +0100
Message-ID: <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
To: Christian Gmeiner <christian.gmeiner@gmail.com>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBNYXIgMjAsIDIwMjEgYXQgMTA6MjggQU0gQ2hyaXN0aWFuIEdtZWluZXIKPGNocmlz
dGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBMdWNhcwo+Cj4gQW0gRnIuLCAx
OS4gTcOkcnogMjAyMSB1bSAyMDowNiBVaHIgc2NocmllYiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT46Cj4gPgo+ID4gVml2YW50ZSBUUyAodGlsZS1zdGF0dXMpIGJ1ZmZlciBt
b2RpZmllcnMuIFRoZXkgY2FuIGJlIGNvbWJpbmVkIHdpdGggYWxsIG9mCj4gPiB0aGUgVml2YW50
ZSBjb2xvciBidWZmZXIgdGlsaW5nIG1vZGlmaWVycywgc28gdGhleSBhcmUga2luZCBvZiBhIG1v
ZGlmaWVyCj4gPiBtb2RpZmllci4gSWYgYSBUUyBtb2RpZmllciBpcyBwcmVzZW50IHdlIGhhdmUg
YSBhZGRpdGlvbmFsIHBsYW5lIGZvciB0aGUKPiA+IFRTIGJ1ZmZlciBhbmQgdGhlIG1vZGlmaWVy
IGRlZmluZXMgdGhlIGxheW91dCBvZiB0aGlzIFRTIGJ1ZmZlci4KPiA+Cj4KPiBJIGFtIHVuc3Vy
ZSB3aHkgeW91IHdhbnQgdG8gaGF2ZSB0aGUgVFMgbW9kaWZpZXJzIGluIGRybV9mb3VyY2MuaC4g
Q2FuCj4geW91IHNoYXJlIHNvbWUgaW5zaWdodCBvbiB0aGlzPwoKSXQncyB0aGUgb2ZmaWNpYWwg
cmVnaXN0cnkgZm9yIGRybV9mb3VyY2MgY29kZXMgYW5kIGRybSBtb2RpZmllcnMuCldoZXRoZXIg
dGhlIGtlcm5lbCBldmVyIHVzZXMgaXQgb3Igbm90IGRvZXNuJ3QgbWF0dGVyLgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
