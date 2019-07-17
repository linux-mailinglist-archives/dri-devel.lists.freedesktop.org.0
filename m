Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152706BD9B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B04289AF3;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783016E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:13:16 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id 34so9311777uar.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPZj9UlJHzFlKhJn6/fmruVkm+j5FSEf7iBCwWIUVP4=;
 b=tNCOHf0S5Q+wU5Dz5fF0hZ1eQlfLN3/+NkskGr86xzBvS4HT+muEsohCE2uzwZiN/6
 6KetsauAo+ByuSqrpGPNr3xhG+XmJ92FZD27RcJGiA9MxZck54utDzhOGJwuPjuqI2El
 oHRhU1C7j/iIT+Ix7zEazsAnS7edhufRwkP8JQLN7gvOcckaRfDvqd2A/wI0b4bdrAlq
 dQD90TrK4EVcnB5119bCEJW4QcvyhYblRfpeg/JeNgioH1gX9sjlBhRfVXB/PPtSiBGc
 IcPFNvHvkEfQ6RfC9IxhO847ysaShmShaiMY5ZxlaD/s7MNk+Jj8V0Xp8QVAPlnDCHfk
 Mk4A==
X-Gm-Message-State: APjAAAXaUa8uxOdDtMMpL295hGpvMK9jVRCUusIM7x5EOaStnos6v8yI
 RqyvvDldSJgkTDbxVzZWXlP2YImmdy5vjlwZKEsGYQ==
X-Google-Smtp-Source: APXvYqw12VFX7Lv6Sh5rKLzmIJDafMfD4+5vdQs5GbevDPTLgen0n5WPlVHqD/WI9vXfnk5kxptgrH3h3fBuUjYs/4Q=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr6146624uaf.131.1563351195035;
 Wed, 17 Jul 2019 01:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-5-cychiang@chromium.org>
 <CA+Px+wV6RSfv4GL8+EJzXGq2nqzKtH9p23VTo2s30h0To2rQtg@mail.gmail.com>
In-Reply-To: <CA+Px+wV6RSfv4GL8+EJzXGq2nqzKtH9p23VTo2s30h0To2rQtg@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 17 Jul 2019 16:12:48 +0800
Message-ID: <CAFv8NwJu14XEDLE3Y+GTU2foFH3b5iBQ-q=tehjBYQ51m2LiCQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] ASoC: rockchip_max98090: Add dai_link for HDMI
To: Tzung-Bi Shih <tzungbi@google.com>
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rPZj9UlJHzFlKhJn6/fmruVkm+j5FSEf7iBCwWIUVP4=;
 b=PGAFc+PfE3kR9fcYCHC8OBC1+IoRoDTjks9fGGEtJhXcGwvydqTrmOTUlJG5NcIoi+
 DhgCrVbGujMZ7kdW7pd2LxhnmzfkWVhrSGU6+vUrDINKdXOnsMlhOmTpRSBNgMGfmh6M
 2FzdJiKfwVdXZUmZgAS729lwaeb3EbIcBDD8E=
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTA6MTQgUE0gVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDc6NTggUE0gQ2hl
bmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2Mvcm9ja2NoaXAvS2NvbmZpZyBiL3NvdW5kL3NvYy9yb2NrY2hpcC9L
Y29uZmlnCj4gPiBpbmRleCBiNDM2NTdlNmU2NTUuLmQ2MTBiNTUzZWEzYiAxMDA2NDQKPiA+IC0t
LSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9LY29uZmlnCj4gPiArKysgYi9zb3VuZC9zb2Mvcm9ja2No
aXAvS2NvbmZpZwo+ID4gQEAgLTQwLDkgKzQwLDEwIEBAIGNvbmZpZyBTTkRfU09DX1JPQ0tDSElQ
X01BWDk4MDkwCj4gPiAgICAgICAgIHNlbGVjdCBTTkRfU09DX1JPQ0tDSElQX0kyUwo+ID4gICAg
ICAgICBzZWxlY3QgU05EX1NPQ19NQVg5ODA5MAo+ID4gICAgICAgICBzZWxlY3QgU05EX1NPQ19U
UzNBMjI3RQo+ID4gKyAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDCj4gPiAgICAgICAg
IGhlbHAKPiA+ICAgICAgICAgICBTYXkgWSBvciBNIGhlcmUgaWYgeW91IHdhbnQgdG8gYWRkIHN1
cHBvcnQgZm9yIFNvQyBhdWRpbyBvbiBSb2NrY2hpcAo+ID4gLSAgICAgICAgIGJvYXJkcyB1c2lu
ZyB0aGUgTUFYOTgwOTAgY29kZWMsIHN1Y2ggYXMgVmV5cm9uLgo+ID4gKyAgICAgICAgIGJvYXJk
cyB1c2luZyB0aGUgTUFYOTgwOTAgY29kZWMgYW5kIEhETUkgY29kZWMsIHN1Y2ggYXMgVmV5cm9u
Lgo+IFlvdSBzaG91bGQgbm90IG5lZWQgdG8gc2VsZWN0IHRoZSBvcHRpb24gaW4gdGhpcyBwYXRj
aCAoYnV0IGluIG5leHQKPiBwYXRjaCksIGJlY2F1c2UgdGhpcyBwYXRjaCBkb2VzIG5vdCBkZXBl
bmQgb24gYW55dGhpbmcgZnJvbQo+IGhkbWktY29kZWMuYy4KVGhhbmtzIGZvciB0aGUgZXhwbGFu
YXRpb24uCkknbGwgZml4IGluIHY1LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
