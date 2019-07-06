Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72361B05
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B415689A5D;
	Mon,  8 Jul 2019 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617EE89F61
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 10:18:23 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id u124so5262582vsu.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2019 03:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jAVwcJuM+YKewDeekBtdpzxDH4pN8Z1qY7lRoAxlQ2k=;
 b=XM5GWjD7KCy35NB/CQUVnakhIxR+6KQMAfMq2qrWgBJ9nop7SShRDeNZsfynIc2lY/
 jfDC0VifJTP7g3Jl7IIkMve8vOgxT2LpByMssMWso4O5JdVgI9/xl1WhxYw34eJiPhkI
 +cjVyyRwslFT+8SUPiDH4IzCO6FUq883tdix36LwnsR0VhZ9suj76RLsMCaFZkGTR4/v
 QVqVPvuO5V9fvHipORD9vaIRYP0PzwKhKWdrJLWj2R9GBBigCuY5/XoMj+toUCvq4cX7
 jOqCEqi4jq0tWCF8y6pGtHmZGogo5Wdu5qBVjiqVM+DkevQToHz/QaXkbNuOBXPuUgHK
 SCBQ==
X-Gm-Message-State: APjAAAXCSUtD2rIed6JvfgZa+THfoiMWRaervL5EgBQ2rsUcxrt+8Ljx
 0SArzcmdrmEQUmZTta2ItBKlFYIf0L59hmFEKfm0Vw==
X-Google-Smtp-Source: APXvYqwHXziO50Z/T/wc7OBaLrepyZ4DeDeLVwv5g2F6618IyLzz5j+3wEg9LMO4ASJyJbXamm3xKkz3W1VhuzqonMQ=
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr2560400vsp.163.1562408301993; 
 Sat, 06 Jul 2019 03:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-3-cychiang@chromium.org>
 <VI1PR06MB41425D1F24AC653F08AFA463ACF50@VI1PR06MB4142.eurprd06.prod.outlook.com>
 <CAFv8NwJXbJo=z_NDj+JQHD9LOmnbfM8v_N1uHn4sdBzF-FZQfA@mail.gmail.com>
 <20190705171618.GA35842@sirena.org.uk>
In-Reply-To: <20190705171618.GA35842@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Sat, 6 Jul 2019 18:17:54 +0800
Message-ID: <CAFv8NwKhBKaDAzfdRVGzOs0M3quZeZANWQ2EDo210jy9M-c0cQ@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/4] drm: bridge: dw-hdmi: Report connector
 status using callback
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jAVwcJuM+YKewDeekBtdpzxDH4pN8Z1qY7lRoAxlQ2k=;
 b=LxmgdcxPecTrogSpOJXeHAvpLygjo6I3MXbMM2SYl+QXjS6fO+EQHhi8KNRAZ1Z1aa
 7c0i45kq3WMa2ftCYUtfQ1IWl836CgNJ1myvCLLiNdPdEEBpafk5GG4cD/UCrtAGhTqT
 oaI01JbitM9uW1q7vmGKd2LVxuVnT5f0gv4yM=
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
Cc: "dianders@chromium.org" <dianders@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdWwgNiwgMjAxOSBhdCAxOjE2IEFNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAwNSwgMjAxOSBhdCAwMzozMToyNFBNICswODAw
LCBDaGVuZy15aSBDaGlhbmcgd3JvdGU6Cj4KPiA+IEl0IHdhcyBhIGxvbmcgZGlzY3Vzc2lvbi4K
PiA+IEkgdGhpbmsgdGhlIGNvbmNsdXNpb24gd2FzIHRoYXQgaWYgd2UgYXJlIG9ubHkgdGFsa2lu
ZyBhYm91dAo+ID4gaGRtaS1jb2RlYywgdGhlbiB3ZSBqdXN0IG5lZWQgdG8gZXh0ZW5kIHRoZSBv
cHMgZXhwb3NlZCBpbiBoZG1pLWNvZGVjCj4gPiBhbmQgZG9uJ3QgbmVlZCB0byB1c2UKPiA+IGhk
bWktbm90aWZpZXIgb3IgZHJtX2F1ZGlvX2NvbXBvbmVudC4KPgo+IFdoYXQgSSdkIHBpY2tlZCB1
cCBmcm9tIHRoZSBiaXRzIG9mIHRoYXQgZGlzY3Vzc2lvbiB0aGF0IEkKPiBmb2xsb3dlZCB3YXMg
dGhhdCB0aGVyZSB3YXMgc29tZSBkZXNpcmUgdG8gY29tZSB1cCB3aXRoIGEgdW5pZmllZAo+IGFw
cHJvYWNoIHRvIEVMRCBub3RpZmljYXRpb24gcmF0aGVyIHRoYW4gaGF2aW5nIHRvIGdvIHRocm91
Z2gKPiB0aGlzIGRpc2N1c3Npb24gcmVwZWF0ZWRseT8gIFRoYXQgd291bGQgY2VydGlhbmx5IHNl
ZW0gbW9yZQo+IHNlbnNpYmxlLiAgQWRtaXR0ZWRseSBpdCB3YXMgYSBsb25nIHRocmVhZCB3aXRo
IGxvdHMgb2YgZW5vcm1vdXMKPiBtYWlscyBzbyBJIGRpZG4ndCBmb2xsb3cgdGhlIHdob2xlIHRo
aW5nLgoKSGkgTWFyaywgdGhhbmtzIGZvciBmb2xsb3dpbmcgdGhlIGxvbmcgdGhyZWFkLgpUaGUg
ZW5kIG9mIHRoZSBkaXNjdXNzaW9uIHdhcyBhdApodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS82
LzIwLzEzOTcKClF1b3RlZCBmcm9tIERhbmllbCdzIHN1Z2dlc3Rpb246CiIKSSBuZWVkIHRvIHRo
aW5rIGFib3V0IHRoaXMgbW9yZSwgYnV0IGlmIGFsbCB3ZSBuZWVkIHRvIGxvb2sgYXQgaXMKaGRt
aV9jb2RlYywgdGhlbiBJIHRoaW5rIHRoaXMgYmVjb21lcyBhIGxvdCBlYXNpZXIuIEFuZCB3ZSBj
YW4gaWdub3JlCmRybV9hdWRpb19jb21wb25lbnQuaCBjb21wbGV0ZWx5LgoiCgpNeSB0aG91Z2h0
IGlzIHRoYXQgdGhlIGNvZGVjIGRyaXZlciB1bmRlciBBU29DIGFyZSBvbmx5IHRoZXNlIHR3bzoK
aGRhY19oZG1pLmMgYW5kIGhkbWktY29kZWMuYyAgKCBmb3JnaXZlIG1lIGlmIEkgbWlzc2VkIG90
aGVycy4gSSBqdXN0CmdyZXAgImhkbWkiIHVuZGVyIHNvdW5kL3NvYy9jb2RlY3MvICkKaGRhY19o
ZG1pLmMgaXMgbGlrZSBhIHdyYXBwZXIgZm9yIEhEQSBhbmQgZHJtX2F1ZGlvX2NvbXBvbmVudHMu
CmhkbWktY29kZWMuYyBpcyB0aGUgb25seSBvdGhlciBjb2RlYyBkcml2ZXIgdGhhdCBjYXJlcyBI
RE1JIHVuZGVyIEFTb0MuClNvIGFkZGluZyB0aGUgamFjay9lbGQgc3VwcG9ydCBhdCBoZG1pLWNv
ZGVjIGRyaXZlciBjYW4gY292ZXIgdGhlCmV4aXN0aW5nIHVzZSBjYXNlcyBmb3IgSERNSSBjb2Rl
YyBkcml2ZXIgaW4gQVNvQy4KVGhhdCBzYWlkLCBhZGRpbmcgYSBuZXcgdW5pZmllZCBhcHByb2Fj
aCBmb3IgSmFjay9FTEQgbm90aWZpY2F0aW9uCnRoYXQgd2lsbCBvbmx5IGJlIHVzZWQgYnkgaGRt
aS1jb2RlYyBzZWVtcyBub3QgYSBoaWdoIHByaW9yaXR5LgpIb3BlIHRoaXMgZXhwbGFuYXRpb24g
aGVscHMgeW91ciBkZWNpc2lvbi4KVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
