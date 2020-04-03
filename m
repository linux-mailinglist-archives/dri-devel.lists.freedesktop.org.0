Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957819DCEF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583656EC4C;
	Fri,  3 Apr 2020 17:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27D6EC4D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:40:40 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p10so7848646ljn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8RDp4K/dvB2DqCHMRGbTSsNwhQ5/+cJi1oXxVKrFmo=;
 b=eJDAk22lU0U43+noNq5RI+b9wJ/eeRQ5ayIssbySEwBKkkU2Xc0ITvRjqwBS3oDMq3
 s/R8V1/PIGo8eIiasd54u17oVrxZXeE9br7fp3IbDcath4ZE/C43zSZvoEV0hjUHVguo
 znMWWYquyR/igp1jniYjgBcRDDG8wATCksRLAdAJ3thss/waz8NgQJKCaSUc5nYyD8c5
 +WH17tMRBJFU21n1hpKlu1XqbDF3ySjX1fWNFL6pNuSPNj2XYndTTCMRG51p+dir0csP
 XWQxuFLIJickNO5wRM6Q68EFrRgNmXaYK7M2Y69HVOd6Q7CEiVYJfG2gjKAWcVkP9n8e
 wO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8RDp4K/dvB2DqCHMRGbTSsNwhQ5/+cJi1oXxVKrFmo=;
 b=g+bpM9IWOB9zbaB5gIFfxnmwxtLGFq7gfyYsj3Q7PoBIRb8alrfSjxVuckMCTtkRtG
 gQNKskHoqIozwXGl7dW3y3DAR8UkfexxNy5sOtiq7613xcODnunjGj6UrshHqFj76b7F
 zQ5iPRd0UogAoESB0ERrwieiyiKGZ4jINK14K+mTFxzxz18SMXK12PKv8WGl148kYZz+
 d+YlWRvbk/WJGqYNnJZf1RRozbCmGTEhoL0fyldp+wRRgEU4zl7CrpTtV9Ypc3tv6cG2
 qcM7yR6J8ux1A/jfhRMBYFRK/GOslDla7RdEkDWOrXhjGshNBu504j6DM0yUKC8MUBUZ
 Sbxg==
X-Gm-Message-State: AGi0PuZRFoy4kjd7H177U/4G3k5ILs/CVdXdYVZL7hgma7eRwbyQbyWv
 KY/x6FkHpE/D5SEQq8hqpS+O9QOeSX75BQMksUgE1g==
X-Google-Smtp-Source: APiQypL6K9C9KAf8cM322y1wwt4cNClW2SqIJKNy9zZasiFHLXr2fQImDnC3nKrTguc+/KhPtos1Rb5wODUejqSrD8Q=
X-Received: by 2002:a2e:a176:: with SMTP id u22mr5595232ljl.84.1585935638718; 
 Fri, 03 Apr 2020 10:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Apr 2020 10:40:27 -0700
Message-ID: <CADaigPWZ9LHOoOPAX442nrXE2rdko04fHsJkuZcgdraicge6zQ@mail.gmail.com>
Subject: Re: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMywgMjAyMCBhdCA2OjU5IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gVXBjYXN0aW5nIHVzaW5nIGEgY29udGFpbmVyX29mIG1h
Y3JvIGlzIG1vcmUgdHlwZXNhZmUsIGZhc3RlciBhbmQKPiBlYXNpZXIgZm9yIHRoZSBjb21waWxl
ciB0byBvcHRpbWl6ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKQWNr
ZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
