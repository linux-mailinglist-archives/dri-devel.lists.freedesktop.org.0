Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99E2FD747
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2A86E17E;
	Wed, 20 Jan 2021 17:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920AD6E17E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:42:56 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id p5so25886994oif.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZHFJYxonu4R04UeV13qr5aQCh6joeK9ZeuixK9rcGkk=;
 b=hKomSCRs608d2bMutf97y6mNcaeWWXi38yiePkG2w2tDIm25ynueBiiU9WRsqvl5kR
 40Q3FP/QegTjhg3NumRkeSt0ET60h4KAM2xGtz8THPRERE4ob0Z7REuRhkEjg/FL3Ojk
 NAfoS6rvq33lRcjP8PNDSnw57EN1/cYED3UnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZHFJYxonu4R04UeV13qr5aQCh6joeK9ZeuixK9rcGkk=;
 b=g95VpFmAxKLiDB5PfGlaRUT4emzQxXJ78q2YuQFbI3nAd4rwXApor6GkwRAw7e4D8/
 Z06OXMNg2oUSba4lMRn6VG+B9RTehB96f273kUlFq//xwuLYKX8Q4jzQ7VUSifkg36PO
 7u2+wTo9/0MaTLJ+gbjzt0koTpd/SVrda83o9jKpBOpPAVm4l879dh82N91MqR3y0i/h
 SdjIeoU+oIzS8dT+CdQZpB3nfl9ZyokFTzd5hNcUXew7jmmIz55PTawPOX6PwO7GvLil
 3zb2CwFzMropL8liDggE/EOR3d37apxo70/7WJNEjJs4AeSUHqtpQACd+//VLuHcSr42
 RjfA==
X-Gm-Message-State: AOAM530b4uJ9M1DpU81aS0lScOJd5m7Nx+M7Q2LhjZzi8+CD+bjKvPk7
 bPc+mph6i7NVp0m0kXMzzL3BeN+OZgHfrtVdywvV0g==
X-Google-Smtp-Source: ABdhPJyck96jsLs3n3qcqJVFLkf0UQpIkK0m0v7CRoC8WM/OLSvNQAyqVVOnAiMwOVCBFjuGfGkc9ejvNC8Cfc0RRFY=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr3474327oia.14.1611164575945; 
 Wed, 20 Jan 2021 09:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
In-Reply-To: <20210120170033.38468-2-noralf@tronnes.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 18:42:45 +0100
Message-ID: <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tyler Hardin <th020394@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjAsIDIwMjEgYXQgNjoxMCBQTSBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4gd3JvdGU6Cj4KPiBBZGQgYSBjb25uZWN0b3IgdHlwZSBmb3IgVVNCIGNvbm5l
Y3RlZCBkaXNwbGF5IHBhbmVscy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8
bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5o
Cj4gaW5kZXggZmVkNjZhMDNjN2FlLi4zMzAyNGNjNWQyNmUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS91YXBpL2RybS9kcm1fbW9kZS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5o
Cj4gQEAgLTM2Nyw2ICszNjcsNyBAQCBlbnVtIGRybV9tb2RlX3N1YmNvbm5lY3RvciB7Cj4gICNk
ZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX0RQSSAgICAgICAgIDE3Cj4gICNkZWZpbmUgRFJNX01P
REVfQ09OTkVDVE9SX1dSSVRFQkFDSyAgIDE4Cj4gICNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9S
X1NQSSAgICAgICAgIDE5Cj4gKyNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX1VTQiAgICAgICAg
IDIwCgpCZXdhcmUsIG5ldyBjb25uZWN0b3IgdHlwZXMgaGF2ZSBpbiB0aGUgcGFzdCByZXN1bHRl
ZCBpbiB1c2Vyc3BhY2UKYnVybmluZyZjcmFzaGluZy4gTWF5YmUgaXQncyBiZWNvbWUgYmV0dGVy
IC4uLgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4K
PiAgLyoqCj4gICAqIHN0cnVjdCBkcm1fbW9kZV9nZXRfY29ubmVjdG9yIC0gR2V0IGNvbm5lY3Rv
ciBtZXRhZGF0YS4KPiAtLQo+IDIuMjMuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVu
Z2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
