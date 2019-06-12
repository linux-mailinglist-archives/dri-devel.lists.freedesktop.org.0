Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB243378
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D0689332;
	Thu, 13 Jun 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FC388AD9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:24:58 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id l15so15778314otn.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1sKWFZ42zcOD32vOR4u87AYkB+rWCXoy3Lc1oy5Odok=;
 b=G2atqVPW/1+fsLhib0uuHp21R+VUXVuTENgVylg84f4J41f1lqsMHpeU/WOTk/KDms
 HJvQHlj2vXft3teDTJM2cZckHzc0kZjhZGFJq3Y9UCOxJGFBWjgXhwjIvqdfvd8MG3+y
 oUG0TVFZeni2KXVy80JmmkhzNkMUbXMVoT7ZX5iWTWlBZG4pYOU2c/2PIN9xFX9DYjf3
 KN48x4YvuZlNZd7FRQNixGOUK0pIziZmuzetBFcVpVvN/84KdAWqMZOgr6Ze9hvQMaHK
 nxWXHm55Q3GIKo7LeaSZwLBtY6cqNuAUj68pIJJ1Mxj4/oYt8AqgElT1cpu1ohZ0TEKn
 2xbA==
X-Gm-Message-State: APjAAAVfK6u/eqgXrqltrV9nuVGAfUz3VObAfW18z3ZIwD0T2j8/mc9f
 t4t69y1cDsjwz08J6bCDWMDfht1RQp+9OhfS25E=
X-Google-Smtp-Source: APXvYqzOtMyu3SgCZjFZq/6yzZn7cj+MGkvP0JYYRvCZXDUzCym9cqYKMX1m14fmVyorD8A4ObNbuxAG+A7PgelgLkM=
X-Received: by 2002:a05:6830:16:: with SMTP id
 c22mr4160188otp.116.1560353097089; 
 Wed, 12 Jun 2019 08:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeX3-0001xe-1A@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1haeX3-0001xe-1A@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:24:46 -0400
Message-ID: <CAGngYiVfggWOJAMC2OmEmwfPQUQWv9JADUH_DkrCqYDjFggxWg@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/i2c: tda998x: introduce tda998x_audio_settings
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1sKWFZ42zcOD32vOR4u87AYkB+rWCXoy3Lc1oy5Odok=;
 b=h/glH9T8RHWnGveuh8yV4YufSmM/XOQpNVBAgNzQ66xbT3P8RhSNr5e0E77ChPisHj
 leD4Wg+WSMrwNgQS4eChcZKKap+z3dGi8Ox5Y4AA16vrzzeYt04sEKJGt851586FSZJO
 bErgnYiPDnISSpMhTewoRWxy8iNgtwoJpuQiSUp4hJc8HX/G7t9F559g+TyX+NoPVH4b
 4d6Mqe5L6nQz0af69oCjNq/UIlKwUlojYE7fPUdWfhWVdEj5TNyjTZ9CHfemJck64p6Z
 JZP3wr41kn6BZI9zSv4UiHrfM8r6e1zEGdmAJxKaK6e1NxxdnlpGjGgllF9Ccqst3vPx
 z83g==
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMSBBTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEludHJvZHVjZSBhIHN0cnVjdHVyZSB0byBob2xk
IHRoZSByZWdpc3RlciB2YWx1ZXMgdG8gYmUgcHJvZ3JhbW1lZCB3aGlsZQo+IHByb2dyYW1taW5n
IHRoZSBUREE5OTh4IGF1ZGlvIHNldHRpbmdzLiAgVGhpcyBpcyBjdXJyZW50bHkgYSBzdHViCj4g
c3RydWN0dXJlLCB3aGljaCB3aWxsIGJlIHBvcHVsYXRlZCBpbiBzdWJzZXF1ZW50IGNvbW1pdHMu
Cj4KPiBXaGVuIHdlIGluaXRpYWxpc2UgdGhpcyBmcm9tIHRoZSBwbGF0Zm9ybSBkYXRhLCBvbmx5
IGRvIHNvIGlmIHRoZXJlIGlzIGEKPiB2YWxpZCBhdWRpbyBmb3JtYXQgc3BlY2lmaWNhdGlvbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs+Cj4gLS0tCgpOaXQ6CkZpeCBjb21waWxlIGVycm9ycz8gTm90ZSB0aGF0IHRoZXNlIGVycm9y
cyBkaXNhcHBlYXIgaWYgcGF0Y2ggMi8xMwppcyBhcHBsaWVkLCBidXQgbWF5YmUgd2Ugd2FudCB0
byBtYWtlIHN1cmUgdGhhdCBldmVyeSBwYXRjaCBjb21waWxlcwpzbyBnaXQgYmlzZWN0IGRvZXMg
bm90IGJyZWFrPwoKZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jOiBJbiBmdW5jdGlv
biDigJh0ZGE5OTh4X2F1ZGlvX2h3X3BhcmFtc+KAmToKZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5
OTh4X2Rydi5jOjEwMTE6MTA6IGVycm9yOiDigJhzdHJ1Y3QKdGRhOTk4eF9hdWRpb19zZXR0aW5n
c+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGNvbmZpZ+KAmQogICAgIGF1ZGlvLmNvbmZpZyA9
IHByaXYtPmF1ZGlvX3BvcnRbaV0uY29uZmlnOwogICAgICAgICAgXgpkcml2ZXJzL2dwdS9kcm0v
aTJjL3RkYTk5OHhfZHJ2LmM6MTAxMjo4OiBlcnJvcjog4oCYc3RydWN0CnRkYTk5OHhfYXVkaW9f
c2V0dGluZ3PigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhmb3JtYXTigJkKICAgYXVkaW8uZm9y
bWF0ID0gQUZNVF9JMlM7CiAgICAgICAgXgpkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2
LmM6MTAxNzoxMDogZXJyb3I6IOKAmHN0cnVjdAp0ZGE5OTh4X2F1ZGlvX3NldHRpbmdz4oCZIGhh
cyBubyBtZW1iZXIgbmFtZWQg4oCYY29uZmln4oCZCiAgICAgYXVkaW8uY29uZmlnID0gcHJpdi0+
YXVkaW9fcG9ydFtpXS5jb25maWc7CiAgICAgICAgICBeCmRyaXZlcnMvZ3B1L2RybS9pMmMvdGRh
OTk4eF9kcnYuYzoxMDE4Ojg6IGVycm9yOiDigJhzdHJ1Y3QKdGRhOTk4eF9hdWRpb19zZXR0aW5n
c+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGZvcm1hdOKAmQogICBhdWRpby5mb3JtYXQgPSBB
Rk1UX1NQRElGOwogICAgICAgIF4KZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jOjEw
MjU6MTE6IGVycm9yOiDigJhzdHJ1Y3QKdGRhOTk4eF9hdWRpb19zZXR0aW5nc+KAmSBoYXMgbm8g
bWVtYmVyIG5hbWVkIOKAmGNvbmZpZ+KAmQogIGlmIChhdWRpby5jb25maWcgPT0gMCkgewogICAg
ICAgICAgIF4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
