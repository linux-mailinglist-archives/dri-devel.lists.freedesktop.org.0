Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E65A32A2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82E96E323;
	Fri, 30 Aug 2019 08:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5476E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 02:55:40 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id m23so1839128uaq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 19:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVJP3tNQZmRfMHp/W2ZEuVlB3ztV/VuTs152oodDoRA=;
 b=LmiGH+pufStux8ErbyQ+t+QeakngzP3gc3Xy55WD/5/99oGsqp+bbugnYS8CdM3IVo
 uCdS94toh3Z8M0iXFU4Ahk1+zNjWnEL/k4p+/rNgTm3IsMluo/e0AzlBTCeBb8qZjMlZ
 raNZlO1hHYpSYeEUUfibW5eKmSl94reOc/7+/0uMidSn6/Y4iY1jXmnkw6xjHI7RYOpv
 djkQnAuTmRWmPEmn1Otg/QqbpTE91sOSpWcmthiG54og6AP+125Wr7c96jJ/fCmwwNqI
 Owz7CV5SwoBj/UtCmgNo/TctkZTZuxY18V+MW3VFU1/HV9ztQzkWGykaU2de9Yhkv7dV
 kpcQ==
X-Gm-Message-State: APjAAAX95kjAotNqW6+Pzq5sFm9lS8DO4kYnFlbyYeulItu6D8hgiU8a
 cSi0hfUOBDOncOspQ+kiKVNWtPZzHPf24WoWhsfy1Q==
X-Google-Smtp-Source: APXvYqz3y2+iMq8OG/5tEVPvpxYHj7wpUTGqFySYc0DUG/K3JsZPiNj8noweU6gAsRnU3oLPZiigq/TH0naxasIEv+E=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr6638328uaf.131.1567133739477;
 Thu, 29 Aug 2019 19:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
In-Reply-To: <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 30 Aug 2019 10:55:12 +0800
Message-ID: <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
To: Tzung-Bi Shih <tzungbi@google.com>
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uVJP3tNQZmRfMHp/W2ZEuVlB3ztV/VuTs152oodDoRA=;
 b=go/AeEsI5vC+mODTwi/w5PsQtEjcwg1f3Pf9r94z/spWywhIHshzlHgOAz73WeypOX
 pqMIDya9cWyUswo1xPqA+BADMwbb805CpsmQht+9dYBhC6NqBViosIEVvwIli8l3sTlO
 1jIG9p8bhTKdxA20ytec9mf4cYGdg+LwRAdxU=
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

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgNjoyOCBQTSBUenVuZy1CaSBTaGloIDx0enVuZ2JpQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgNDozMyBQTSBDaGVu
Zy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBw
YXRjaCBzZXJpZXMgc3VwcG9ydHMgSERNSSBqYWNrIHJlcG9ydGluZyBvbiBSSzMyODgsIHdoaWNo
IHVzZXMKPiA+IERSTSBkdy1oZG1pIGRyaXZlciBhbmQgaGRtaS1jb2RlYyBjb2RlYyBkcml2ZXIu
Cj4gPgo+ID4gVGhlIHByZXZpb3VzIGRpc2N1c3Npb24gYWJvdXQgcmVwb3J0aW5nIGphY2sgc3Rh
dHVzIHVzaW5nIGhkbWktbm90aWZpZXIKPiA+IGFuZCBkcm1fYXVkaW9fY29tcG9uZW50IGlzIGF0
Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEwODMwMjcv
Cj4gPgo+ID4gVGhlIG5ldyBhcHByb2FjaCBpcyB0byB1c2UgYSBjYWxsYmFjayBtZWNoYW5pc20g
dGhhdCBpcwo+ID4gc3BlY2lmaWMgdG8gaGRtaS1jb2RlYy4KPiA+Cj4gPiBDaGFuZ2VzIGZyb20g
djQgdG8gdjU6Cj4gPiAtIHN5bm9wc3lzL0tjb25maWc6IFJlbW92ZSB0aGUgaW5jb3JyZWN0IGRl
cGVuZGVuY3kgY2hhbmdlIGluIHY0Lgo+ID4gLSByb2NrY2hpcC9LY29uZmlnOiBBZGQgZGVwZW5k
ZW5jeSBvZiBoZG1pLWNvZGVjIHdoZW4gaXQgaXMgcmVhbGx5IG5lZWQKPiA+ICAgZm9yIGphY2sg
c3VwcG9ydC4KPiA+Cj4gPiBDaGVuZy1ZaSBDaGlhbmcgKDUpOgo+ID4gICBBU29DOiBoZG1pLWNv
ZGVjOiBBZGQgYW4gb3AgdG8gc2V0IGNhbGxiYWNrIGZ1bmN0aW9uIGZvciBwbHVnIGV2ZW50Cj4g
PiAgIGRybTogYnJpZGdlOiBkdy1oZG1pOiBSZXBvcnQgY29ubmVjdG9yIHN0YXR1cyB1c2luZyBj
YWxsYmFjawo+ID4gICBkcm06IGR3LWhkbWktaTJzOiBVc2UgZml4ZWQgaWQgZm9yIGNvZGVjIGRl
dmljZQo+ID4gICBBU29DOiByb2NrY2hpcF9tYXg5ODA5MDogQWRkIGRhaV9saW5rIGZvciBIRE1J
Cj4gPiAgIEFTb0M6IHJvY2tjaGlwX21heDk4MDkwOiBBZGQgSERNSSBqYWNrIHN1cHBvcnQKPiA+
Cj4gTEdUTS4KPgo+IFJldmlld2VkLWJ5OiBUenVuZy1CaSBTaGloIDx0enVuZ2JpQGdvb2dsZS5j
b20+CgpIaSBEYW5pZWwsCkRvIHlvdSBoYXZlIGZ1cnRoZXIgY29uY2VybiBvbiB0aGlzIHBhdGNo
IHNlcmllcyByZWxhdGVkIHRvIGhkbWktY29kZWMKYW5kIGRybSBwYXJ0ID8KV2Ugd291bGQgbGlr
ZSB0byBtZXJnZSB0aGlzIHBhdGNoIHNlcmllcyBpZiBwb3NzaWJsZS4KVGhleSB3aWxsIGJlIG5l
ZWRlZCBpbiBtYW55IGZ1dHVyZSBjaHJvbWUgcHJvamVjdHMgZm9yIEhETUkgYXVkaW8gamFjawpk
ZXRlY3Rpb24uClRoYW5rcyBhIGxvdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
