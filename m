Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F32506A4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 19:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F56E2F2;
	Mon, 24 Aug 2020 17:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E084A6E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 17:38:12 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id dp2so7687575ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zjUrc/fIl6zFEZsZkrBTqHUXU0VkYvcfFdf7hySFW0A=;
 b=05W3QLTSfaelLXAZaMqdMBJUgDnQYy8AINCIYD2NBZzo+PzDlrOMu/q9l+Wtg0mOda
 dX0hMtOE4IlF60uXxhhAY13gVfqLeqFKgjaon/oUwX+lwo8fBRpO7+zCmtDxgTvWeP8m
 YHykVgYUF5N1cKgn0lwH/rT1GJS1dj762IwQsuQg5GopFVzTnJrEuJQGQN7nNjCsMKA0
 KNPgtQWYVbFhaSdfwDXQpw57MoY+dsD9DGEW2iXu1ecjLcoeglTx6jRDbozKrPuY6xyq
 BtcPzsE0wtwF/nv9GBHJ8J+oGn99f1aw2KMaf79JpHEhkcHS9/kbReVQP/c5BBdXfdaJ
 EEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zjUrc/fIl6zFEZsZkrBTqHUXU0VkYvcfFdf7hySFW0A=;
 b=TsfT0xlHVCLIfG9235kcdE9ScQNJUjcIen04aaMNB27UoydRXN2hCW8dGa2NO3FyLy
 /v4SA9ld+DOCxoFgMt6/+gnwf+Ffw9y7L7Ad5990Slgb42YDCemPYj6qEfT22bwcSkjk
 cIZgwlBNWJg4ZlGwEvQzoRyScaJPpO+iMfhHMIH9QsQ7TYkbIfQkNVCI62iFRURJK4Z2
 EvZ5+0Cmdx8eWtOtXKRrwO/Jf0FRupupYTILrGdt811r4djBksiej95telCaTQZ3ZAcI
 yBBSX1ZKNX9o7xQMB4hZujnsuRP6XeTK2g31hSR3KqXNgpaSurkQ6PtYAk0jEG4piTgd
 Y17g==
X-Gm-Message-State: AOAM531cW9phIgI5XKYOrkMAki2/sqVjl8ov0bSzniGAnV+Mc+SXW5mx
 bjfdIfS6q8HyerIR94pFUjVf6x030YzXNLdUWd8qhQ==
X-Google-Smtp-Source: ABdhPJwvurA2KdJGjI38jaC4Vi+/rauUyfBqbfEQh/bZg1oovAHLFLiVC0THyMnU4/4pQmhbnroivhHLfRJRozMvHMA=
X-Received: by 2002:a17:906:a209:: with SMTP id
 r9mr6903933ejy.413.1598290691441; 
 Mon, 24 Aug 2020 10:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1940005.XIBaf5lNV5@jeremy> <1857880.I5TKlsx52r@jason>
 <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
 <6531669.OW97vx6Khr@jason> <B8QFFQ.FVZD8SCWAWD51@crapouillou.net>
 <CAAEAJfBQRLKxaR_6HUi-Dvoc+_WC0JPJNGH5C0rz-yxhOwArdw@mail.gmail.com>
 <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
In-Reply-To: <829D6884-D1F1-4197-B25C-F0DBF2F4AEA7@goldelico.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 24 Aug 2020 14:38:00 -0300
Message-ID: <CAAEAJfBO5-T9oG_whDu5=MDcthAJpbJ5ER3eJJx1gXMsHu-v7w@mail.gmail.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNCBBdWcgMjAyMCBhdCAxMzowNSwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bn
b2xkZWxpY28uY29tPiB3cm90ZToKPgo+IEhpIEV6ZXF1aWVsLAo+Cj4gPiBBbSAyNC4wOC4yMDIw
IHVtIDE1OjQ2IHNjaHJpZWIgRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEB2YW5ndWFyZGlhc3Vy
LmNvbS5hcj46Cj4gPgo+ID4gT24gRnJpLCAyMSBBdWcgMjAyMCBhdCAxOToyNCwgUGF1bCBDZXJj
dWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pgo+ID4+IExl
IHNhbS4gMjIgYW/Du3QgMjAyMCDDoCAwOjExLCBQYXVsIEJvZGRpZSA8cGF1bEBib2RkaWUub3Jn
LnVrPiBhCj4gPj4gw6ljcml0IDoKPiA+Pgo+ID4+IElmIHlvdSBzZW5kIGNsZWFuIHBhdGNoZXMs
IHRoZXJlJ3Mgbm8gcmVhc29uIGZvciBtZSBub3QgdG8gbWVyZ2UgdGhlbS4KPiA+Pgo+ID4KPiA+
IEknZCByZWFsbHkgbGlrZSB0byBzZWUgSERNSSBzdXBwb3J0IG9uIG15IENJMjAgYmVpbmcgbWVy
Z2VkLiBUaGFuayB0bwo+ID4gcmVjZW50IGluZ2VuaWMtZHJtIHdvcmsgYW5kIHRoYW5rcyBmb3Ig
UGF1bCBCb2RkaWUgYW5kIE5pa29sYXVzIHdvcmssCj4gPiB0aGUgcGF0Y2hlcyBhcmUgSU1PIHF1
aXRlIGNsZWFuLgo+Cj4gSSBoYXZlIGRvbmUgc29tZSB0ZXN0aW5nIGFuZCBpdCBhcHBlYXJzIHRo
YXQgaXQgb25seSB3b3JrcyBpZiBEUk0gaXMKPiBjb21waWxlZCBpbnRvIHRoZSBrZXJuZWwuIEF0
IGxlYXN0IGluIG15IHNldHVwLiBJZiBEUk0gYW5kL29yIEhETUkgYXJlIG1hZGUKPiBtb2R1bGVz
IHRoZXJlIGlzIG5vIHZpZGVvIG9yIGNvZGUgZG9lc24ndCBjb21waWxlIGNvbXBsZXRlbHkuCj4K
PiBXZSBoYXZlIHRvIGFuYWx5c2UgdGhhdCBmdXJ0aGVyLgo+CgpBaCEgVGhhdCdzIHRydWUuCgpU
aGUgZml4IGlzIGp1c3QgcmUtb3JnYW5pemluZyB0aGUgY29kZSBhIGJpdC4gSnVzdCBwdXNoZWQg
YSBwb3NzaWJsZQpmaXggZm9yIHRoYXQgKGZvbGxvd2luZyB0aGUgSVBVIGhhbmRsaW5nIGJ5IFBh
dWwgQ2VyY3VlaWwpLApwbGVhc2UgZmVlbCBmcmVlIHRvIHRlc3QgdGhpczoKCmh0dHBzOi8vZ2l0
bGFiLmNvbGxhYm9yYS5jb20vbGludXgvMGRheS8tL2NvbW1pdHMvano0NzgwLWRybS1oZG1pLW1v
ZHVsZS1maXgtdjUuOS1yYzIKCkZXSVcsIG15IHRlc3Qgc2V0dXAgdXNlcyBtYWlubGluZSB2YW5p
bGxhIFUtQm9vdCB2MjAyMC4wNy4KVGhlIGtlcm5lbCBpcyBsb2FkZWQgdmlhIFRGVFAuIERlYmlh
biBtaXBzZWwgaXMgbW91bnRlZCB2aWEgTkZTCih3aGljaCBtZWFucyBkbTkwMDAgd29ya3MpLiBJ
J20gdGVzdGluZyB3aXRoIHdlc3RvbiBhbmQgbW9kZXRlc3QuCgpOb3RlIHRoYXQgZW5hYmxpbmcg
RFJNX0lOR0VOSUNfSVBVIHdpbGwgbWFrZSB0aGUgZHJpdmVyCmZhaWwgdG8gbG9hZCwgYXMgdGhl
IElQVSBpcyBub3Qgb3B0aW9uYWwgKGFuZCBub3QgcHJlc2VudCBvbiBjaTIwLmR0cykuCkEgbWlu
b3IgdGhpbmcgdG8gZml4LgoKQ2hlZXJzLApFemVxdWllbAoKPiBBbmQgaXQgc2VlbXMgdG8gZGlm
ZmVyIHNpZ25pZmljYW50bHkgZnJvbSB3aGF0IFBhdWwgaGFzIGRldmVsb3BlZCByZWNlbnRseQo+
IHRvIG1ha2UgaXQgd29yay4gSXQgc2VlbXMgdG8gYmUgcXVpdGUgbHVja3kgdGhhdCB3ZSBoYXZl
IGEgd29ya2luZyBzZXR1cCBub3cgOikKPgo+ID4gTmlrb2xhdXMsIFBhdWw6IERvIHlvdSBoYXZl
IHBsYW5zIHRvIHN1Ym1pdCB0aGVzZT8KPgo+IFllcywgYXMgc29vbiBhcyB3ZSBhcmUgc3VyZSB0
aGF0IGl0IHdvcmtzIChhbmQgd2hlbiBpdCBkb2Vzbid0KS4KPgo+IEJ1dCB0aGFua3MgdG8geW91
ciB3b3JrIGl0IGlzIG5vdyBtdWNoIGVhc2llciB0byBpbXByb3ZlIHRoaW5ncywgc2luY2Ugd2UK
PiBhcmUgbm8gbG9uZ2VyIGxvb2tpbmcgZm9yIGEgYnJlYWstdGhyb3VnaCBidXQganVzdCBoYXZl
IHRvIGF2b2lkIHJlZ3Jlc3Npb25zLgo+Cj4gPiBJZiBub3QsIEknbGwgYmUgaGFwcHkgdG8gZ2V0
IHRoZW0gb3V0IHRoZSBkb29yIGZvciByZXZpZXcuCj4KPiBMZXQgaXQgbWF0dXJlIGEgbGl0dGxl
IGZpcnN0IGFuZCBoYXZlIGl0IHRlc3RlZCBvbiBtb3JlIHNldHVwcyBhbmQgcmViYXNlZAo+IHRv
IG1haW5saW5lIHY1LjktcmMyIDopCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
