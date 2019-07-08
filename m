Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90198625A0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CB189EA3;
	Mon,  8 Jul 2019 16:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E5789EA3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 16:06:09 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id i10so36384403iol.13
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 09:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tMCiFsRLDuW6geBulr3EjyW7t17T9yVxinnBG4xjmyE=;
 b=PhQf1hfhKO4L/36lOde7WNWKH6hs2CyNMn1WAEKmt/hdtXEsqg3ZUNKIDQNOInVZpW
 7sjrfrH6JBr7obceZfmOnRqk7VfoZI6MpN/OQ9oAnBIRshXpY0MLuTQvA6qkf1yZ6gAX
 IGcvkRONmsPOHTu1gVFdFAv/5KmkyDrC3y5j7T1SPfLZxwWHRYmADlAoctmVSYu2eF9M
 wfVEWomkof0j2l+fpRozZEU/PsM17nzG4bSpoGaLWaZx/PTtDA6HL2pXkF51xb96tyM7
 A3X4Wub+FFrB8z55/9ZpVCtro4jiSWMaC4fZlzWju0I+KsxwdhvLnmyP1BaTusZ++BcA
 IajA==
X-Gm-Message-State: APjAAAVRXusivKg2LU4cXt0Ex7rfk2c34J1iHcU+L9W/rZuzwvn5te5i
 d66yvy1vCwulnya8O+jJ9rzOfxhWZmI=
X-Google-Smtp-Source: APXvYqyqZekbLj5bpTHp0JvJZDqkCWhQk+9nuhfFdn2Fic9GGQKrYcToxQkATVUmF7ZnoMeUPipmDQ==
X-Received: by 2002:a05:6638:c8:: with SMTP id
 w8mr22972734jao.52.1562601968741; 
 Mon, 08 Jul 2019 09:06:08 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id w23sm32757011ioa.51.2019.07.08.09.06.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 09:06:08 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id k20so36408553ios.10
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 09:06:08 -0700 (PDT)
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr20045788iok.52.1562601529525; 
 Mon, 08 Jul 2019 08:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
 <20190628171342.GA2238@ravnborg.org> <2169143.hEFa8b2HQR@diego>
In-Reply-To: <2169143.hEFa8b2HQR@diego>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2019 08:58:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
Message-ID: <CAD=FV=U3Wj8vaZcQLmkfX6zgjVFEra+GrHMH3OCs5QQ_-tM4hw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tMCiFsRLDuW6geBulr3EjyW7t17T9yVxinnBG4xjmyE=;
 b=OXbjFpWmkvpDp2y6eTwPwQeZzYHFJ41RVnrCR/bBnbn3zmrcjD44kQV6AOejyYbCET
 Xw1BD5zUF87gnasL9QHVthJWk8/FVdH2b4ELdIR34m4lfjlZPKmCl70qe5p2QRmHi8nA
 uP0SYDtYKhdyMH1ZypI3iFmOV4Bcv5ysoSlXw=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Sam Ravnborg <sam@ravnborg.org>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gU2F0LCBKdW4gMjksIDIwMTkgYXQgNzowOSBBTSBIZWlrbyBTdMO8Ym5lciA8
aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEhpIFNhbSwKPgo+IEFtIEZyZWl0YWcsIDI4LiBK
dW5pIDIwMTksIDE5OjEzOjQyIENFU1Qgc2NocmllYiBTYW0gUmF2bmJvcmc6Cj4gPiBIaSBEb3Vn
Lgo+ID4KPiA+ID4gU2FtOiBPaCEgIEkgaGFkbid0IG5vdGljZWQgdGhhdCB5b3UndmUgYmVlbiBh
ZGRlZCBhcyBhIHBhbmVsCj4gPiA+IG1haW50YWluZXIgaW4gY29tbWl0IGVmMGRiOTRmOTRhMCAo
Ik1BSU5UQUlORVJTOiBBZGQgU2FtIGFzIHJldmlld2VyCj4gPiA+IGZvciBkcm0vcGFuZWwiKS4g
IERvZXMgdGhhdCBtZWFuIHlvdSBhcmUgYWJsZSB0byBwcm92aWRlIHNvbWUgYWR2aWNlCj4gPiA+
IGZvciBob3cgdG8gbGFuZCB0aGlzIHNlcmllcz8KPiA+IFJldmlld2VyIG9ubHksIG5vdCBtYWlu
dGFpbmVyLi4uLgo+ID4KPiA+IEl0IGlzIG9uIG15IFRPRE8gbGlzdCBmb3IgdGhlIHdlZWtlbmQg
dG8gZ28gdGhyb3VnaCB0aGUgcGF0Y2ggc2V0IGluCj4gPiBkZXRhaWxzIGFuZCBwcm92aWRlIGZl
ZWRiYWNrLiBJIGhhdmUgcmVhZCB0aGVtIGJlZm9yZSwgYnV0IEkgbWlzcyB0byBkbwo+ID4gYSBt
b3JlIGRldGFpbGVkIHJlYWQgdGhyb3VnaC4KPiA+Cj4gPiBCdXQgSSBjYW5ub3QgYXBwbHkgdGhp
cyB1bmxlc3MgVGhpZXJyeSBvciBvbmUgb2YgdGhlIERSTSBtYWludGFpbmVycwo+ID4gYWNrIGl0
Lgo+ID4gV2Ugc2ltcGx5IG5lZWQgc29tZW9uZSB3aXRoIGEgYmV0dGVyIGdlbmVyYWwga25vd2xl
ZGdlIG9mIERSTSB0byBhY2sgaXQKPiA+IHRoYW4gSSBoYXZlLgo+Cj4gU28gVGhpZXJyeSB3YXMg
YWJsZSB0byBsb29rIGF0IHRoZSBwYXRjaGVzIHllc3RlcmRheSBpdCBzZWVtcyBhbmQgaGFzIEFj
a2VkCj4gYWxsIHRoZSByZWxldmFudCBvbmVzLiBBcyBhIGRybS1taXNjLWNvbnRyaWJ1dG9yIEkg
Y291bGQgYWxzbyBhcHBseSB0aGVtCj4gbXlzZWxmLCBidXQgbm93IGRvbid0IHdhbnQgdG8gcHJl
ZW1wdCBhbnkgYWRkaXRpb25hbCBjb21tZW50cyB5b3UgbWlnaHQKPiBoYXZlIDstKSAuIFNvIEkg
Z3Vlc3MgbXkgcXVlc3Rpb24gd291bGQgYmUgaWYgeW91IHN0aWxsIHdhbnQgdG8gZG8gYSByZXZp
ZXcKPiBvciBpZiBJIHNob3VsZCBhcHBseSB0aGVtLgoKSG9wZWZ1bGx5IHlvdSBzYXcsIGJ1dCBJ
IHJlc3BvbmRlZCB0byBhbGwgb2YgeW91ciByZXZpZXcgZmVlZGJhY2suICBJbgp0aGUgZW5kLCBJ
IHRob3VnaHQgaXQnZCBiZSBPSyB0byBsYW5kIHRoZSBzZXJpZXMgYXMtaXMgYW5kIEkgY2FuIGZp
eAp1cCBuaXRzIGluIGEgZm9sbG93LXVwIHNlcmllcywgdGhvdWdoIEknbSB3YWl0aW5nIGZvciB5
b3VyIHJlc3BvbnNlcwp0byBhIGNvdXBsZSBxdWVzdGlvbnMgZmlyc3QuCgpJdCB3b3VsZCBiZSBp
ZGVhbCBpZiB5b3UgY291bGQgY29uZmlybSB0aGF0IHlvdSdyZSBPSyB3aXRoIHRoaXMgcGxhbgpl
dmVuIGlmIHlvdSBkb24ndCBoYXZlIHRpbWUgdG8gcmVzcG9uZCBpbiBkZXRhaWwgdG8gbXkgZW1h
aWxzIHlldC4gIEkKdGhpbmsgSGVpa28gY2FuIGxhbmQgdGhlbSBhbGwgdGhyb3VnaCB0aGUgYXBw
cm9wcmlhdGUgY2hhbm5lbHMgc2luY2UKdGhlIHBhdGNoZXMgaGF2ZSBhbGwgdGhlIHByb3BlciBB
Y2tzLgoKVGhhbmtzIQoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
