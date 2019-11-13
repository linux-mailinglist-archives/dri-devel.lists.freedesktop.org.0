Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADCFB1B6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 14:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B46E0F8;
	Wed, 13 Nov 2019 13:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3DA6E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 13:49:49 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id q5so2005167lfo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 05:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vy52t4FQzUJl7MVUo8BlNINCjNunGWRfRGrKR4TBf7s=;
 b=mpGp6En8IR0lNy2hKKdRI8QjIXapEzgdCDohgqn86YgU5HD53wmJP0hbZoFQ3VDzjZ
 vx8APQV6RjmqgDpN7byRH5aTNewr8CviuIeT84nVnAe5rs3D53/VJ7TsHfn3k6rTIoZr
 p3yUb9vxNr8gQV3p/+lP6J+UfzbowZeRXw0MVG9vsT+yKzbQSYPXlvSr6W8rvoK65onA
 6Pwu4cjP6zv87cPySDJ267A9YvsGRdZ5ZlDUaDz0phCMnde1F/dwDCl5UF2V+j3QhszG
 1gAMGk9tuQNEVEL5BENJLSP+wDwjNPK3GCzl5Vfhwwrr3m1adKSRwuEHcXcMkZBI93yS
 7HuQ==
X-Gm-Message-State: APjAAAWq4cht+e8OMOmaQFjVtp1R+ahHljhD59NU9cw6P0iVsCTnpZdh
 az/aEoywdo4XLPy1cJUGKVQllvVcLV96dSln0bXt4g==
X-Google-Smtp-Source: APXvYqxTHXdzhopP2ypRF0d0fSJw9rDupVGAE6bShbQVd9KMnkQr9bDucRfPSMwvlJeNx+bIQwFND5x8xx9CugRiZao=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr2668883lfn.86.1573652987493;
 Wed, 13 Nov 2019 05:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20191014184320.GA161094@dtor-ws>
In-Reply-To: <20191014184320.GA161094@dtor-ws>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2019 14:49:36 +0100
Message-ID: <CACRpkdYwinMT71se1WqmGii=qHH1s-JUOigs37EV+ywZ4aiYSA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vy52t4FQzUJl7MVUo8BlNINCjNunGWRfRGrKR4TBf7s=;
 b=H/fmVXpHY/Bz3Zm3tJMqNv+AwRbpI/Zdj1npokpo1y0SxsWgZjJZnvJrrRC8kmjyF/
 Ipmvra71qU83rRRC6Zf68jUmOzBcSx9OE4TbXtwGoWuGsNNRcFSmls8L4Ikb9DQ0gbVa
 bIERJQIfZQrW26RWuowHjLM1w7GcY1aEehUkrnKgOPc0mQmyCxtJxKMuz8ugn6lSgiSO
 Hv4IN4Sd8TJjiufkEb0EReSwfMXDqhEP6nhCXcfAgql/5dFvrnHc+J1zyyWc0Ky1+fCQ
 +noraUwssI0RFzdcPnNsMRe6cGAgYpAKJ/w8HgkkkHSaNPT+qtFoEaIeh3t945mNFQay
 vyIw==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgODo0MyBQTSBEbWl0cnkgVG9yb2tob3YKPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIGZ3bm9kZV9nZXRfbmFtZWRf
Z3Bpb2QoKSB0aGF0IEkgcGxhbiB0byBoaWRlIGF3YXksIGxldCdzIHVzZQo+IHRoZSBuZXcgZndu
b2RlX2dwaW9kX2dldF9pbmRleCgpIHRoYXQgbWltaWNzIGdwaW9kX2dldF9pbmRleCgpLCBidXQK
PiB3b3JrcyB3aXRoIGFyYml0cmFyeSBmaXJtd2FyZSBub2RlLgo+Cj4gUmV2aWV3ZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+CgpJ
IGFwcGxpZWQgdGhpcyB3aXRoIHNvbWUgQUNLcyB0byB0aGUgR1BJTyBkZXZlbCBicmFuY2ggZm9y
IHY1LjUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
