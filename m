Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BCED9C3D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 23:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B4F89C99;
	Wed, 16 Oct 2019 21:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9A689C99
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 21:06:49 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id h7so24364ybp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 14:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kn9kClYfIjMlLMagVsf7O1jgmGEjbDUjXt8o0wKyeA8=;
 b=Bp4pfI25g8qwUWh5U78TrL0vEisbAKJ0GeVoI3H3CfYHWtzhc03eWguJfyr75lB+EK
 xVHFjbLxogO8ZbBoBGqtlotTjXCxwrRpr8r0wVOOBDjy6ZrGg79ZelCeJMUdANGNvq31
 INcd/zeabfH43QBXoGl3Y4K2u5dSUjO4o0FoCpVg2HTgy3Bsb63TIwiLfvRDFpj0Om7g
 P4X/jRNBpVc+Nj3KWtSNl5Be1yDr9Ru2fYr96wsCHFo6PrzArfXlHUKVyporSjivMMws
 Ps+BNoaw/zmUpFe5gRAaY6G5tloiTCQz6QT0a/Wd0thwh01VEj2yZciS++pP7oYIk69O
 bLRA==
X-Gm-Message-State: APjAAAWqhQWopzaRsdLgmOQHibV6hEE+kIa2jFzlckHVei/JRWWmjf1u
 o6cbZXypWYMhw26nI611WYrrIdZxUP+6bF0sUzTp7A==
X-Google-Smtp-Source: APXvYqxu5GBkccY4WdK2iDDUA7D2q8HiB4K/u7G+ap2c79C1tbteJwfc3KKqH97NEgtgjyyUiBtZg6c+czBJGTUnfag=
X-Received: by 2002:a25:348e:: with SMTP id b136mr441806yba.159.1571260008543; 
 Wed, 16 Oct 2019 14:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190910075913.17650-1-wen.he_1@nxp.com>
In-Reply-To: <20190910075913.17650-1-wen.he_1@nxp.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 16 Oct 2019 17:06:12 -0400
Message-ID: <CAMavQKLx4QoA4+JCiERY02i+O44yYH7u7BK07R4z7stjWtps3A@mail.gmail.com>
Subject: Re: [v5 1/2] dt/bindings: display: Add optional property node define
 for Mali DP500
To: Wen He <wen.he_1@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Kn9kClYfIjMlLMagVsf7O1jgmGEjbDUjXt8o0wKyeA8=;
 b=MW+sMuq6Y9qrP0acv8qEivB67behGKZEpyPRPODPpJik/T8wUY6SFwrl4SbmV5JSii
 c/fAssXNhAURnnHERFaecM5FPDISVOX2dAMFMl6FOPU2ad3vm8S5O96clQAbmYvaOpOK
 9Xt2YOwWbhqiKK3mMqK/3TKZ9IztqcBCHVzNOU+98JpvHZe99z7Snhkq/fwusi2/tGMI
 0YT95AvtyjpE6PNW9xtWk4OWvhs+L8XK5JmhA1oKtNR/QkKw59clevqzV+EwQ8ny5ohz
 L0rBBmgZCkODDlJ2epNSm7wmv3s82uYAy0Ejmx0+HzGUcg8E4P5XZ+EySSeDlZDXi1kD
 U2aw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, leoyang.li@nxp.com,
 linux-devel@linux.nxdi.nxp.com, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgNDoxMCBBTSBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+
IHdyb3RlOgo+Cj4gQWRkIG9wdGlvbmFsIHByb3BlcnR5IG5vZGUgJ2FybSxtYWxpZHAtYXJxb3Mt
dmFsdWUnIGZvciB0aGUgTWFsaSBEUDUwMC4KPiBUaGlzIHByb3BlcnR5IGRlc2NyaWJlIHRoZSBB
UlFvUyBsZXZlbHMgb2YgRFA1MDAncyBRb1Mgc2lnbmFsaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKTGl2aXUsIEkgc2VlIHlvdSBhcHBsaWVkIDIvMiwgYnV0IGRpZG4ndCBh
cHBseSB0aGlzIHBhdGNoLiBBbnkKcGFydGljdWxhciByZWFzb24sIG9yIGp1c3QgbWlzc2VkIGl0
PwoKVGhhbmtzLAoKU2VhbgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9hcm0sbWFsaWRwLnR4dAo+IGluZGV4IDJmNzg3MDk4M2VmMS4uN2E5
N2EyYjQ4YzJhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2FybSxtYWxpZHAudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYXJtLG1hbGlkcC50eHQKPiBAQCAtMzcsNiArMzcsOCBAQCBPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jlc2VydmVkLW1lbW9yeS9yZXNlcnZlZC1tZW1vcnkudHh0KQo+ICAgICAgdG8gYmUgdXNlZCBm
b3IgdGhlIGZyYW1lYnVmZmVyOyBpZiBub3QgcHJlc2VudCwgdGhlIGZyYW1lYnVmZmVyIG1heQo+
ICAgICAgYmUgbG9jYXRlZCBhbnl3aGVyZSBpbiBtZW1vcnkuCj4gKyAgLSBhcm0sbWFsaWRwLWFy
cW9zLWhpZ2gtbGV2ZWw6IGludGVnZXIgb2YgdTMyIHZhbHVlIGRlc2NyaWJpbmcgdGhlIEFSUW9T
Cj4gKyAgICBsZXZlbHMgb2YgRFA1MDAncyBRb1Mgc2lnbmFsaW5nLgo+Cj4KPiAgRXhhbXBsZToK
PiBAQCAtNTQsNiArNTYsNyBAQCBFeGFtcGxlOgo+ICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
Jm9zY2NsazI+LCA8JmZwZ2Fvc2MwPiwgPCZmcGdhb3NjMT4sIDwmZnBnYW9zYzE+Owo+ICAgICAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJweGxjbGsiLCAibWNsayIsICJhY2xrIiwgInBjbGsi
Owo+ICAgICAgICAgICAgICAgICBhcm0sbWFsaWRwLW91dHB1dC1wb3J0LWxpbmVzID0gL2JpdHMv
IDggPDggOCA4PjsKPiArICAgICAgICAgICAgICAgYXJtLG1hbGlkcC1hcnFvcy1oaWdoLWxldmVs
ID0gPDB4ZDAwMGQwMDA+Owo+ICAgICAgICAgICAgICAgICBwb3J0IHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBkcDBfb3V0cHV0OiBlbmRwb2ludCB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnRkYTk5OHhfMl9pbnB1dD47Cj4gLS0KPiAy
LjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
