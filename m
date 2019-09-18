Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC86B7446
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF0A6FACC;
	Thu, 19 Sep 2019 07:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C9488EF0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 07:29:24 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id b123so3823236vsb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 00:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDoUVLf2sM2Wd7eza5DvRhJf8f3rN/ciRvE3nXJqNFQ=;
 b=jQS8WjWB0cmr6MHvOx4fF+fMCPgo9IdPmWBoLul47jf2+3gyNrA6aR/httKqlt2qBO
 S779RsUhGr2XcOw2XHRb3mj5UUGKb+MlKvIjmxcHLQWT4vwz1gvYBXBZx2mIQPixkOu4
 XhRP+JdUrWKrMz4oPspdLe//Bcvj7YhuklFTCGfzTG98TOi2TdBs6hSPMsfrRVS/mW90
 hJuOrGeOX9Z4Gzqtj8egP/zxilgYch64be8SWZ90cLV+QMKVBNrb70UdJBH1TXdOO0Rj
 NqS5XSPRZta+tmqUcsbd6zVoQD7qsqdeF+zy9UZzuqh6avbuTgx5/aIE1pNt9nkz1fpP
 RQWg==
X-Gm-Message-State: APjAAAXDGpUfaV5Qo4LDbgPo2gozi379KiJtBx7MelTAGPVuel8OejxA
 PGbsBazDCVJWu+6Duh3dprDw5HwG7DDBVrdAQnG2qA==
X-Google-Smtp-Source: APXvYqz3X6HVZiW3ZAIrMpmqoTkGT9csY3mslQR+djJ/IC/kNyPMlb3OEGubgnn0YA3Nv38dQWDVGsLPAgmKFKrvNcM=
X-Received: by 2002:a67:db8d:: with SMTP id f13mr1362214vsk.163.1568791763011; 
 Wed, 18 Sep 2019 00:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
 <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
 <20190909135346.GG2036@sirena.org.uk>
 <3fc94731-f66a-223d-995e-97ac67f9e882@baylibre.com>
In-Reply-To: <3fc94731-f66a-223d-995e-97ac67f9e882@baylibre.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 18 Sep 2019 15:28:56 +0800
Message-ID: <CAFv8NwL3+4Qsv0B7PtVhB=HX6uFUMMaw5V=E3NTRE-v_jDVAxg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Thu, 19 Sep 2019 07:35:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SDoUVLf2sM2Wd7eza5DvRhJf8f3rN/ciRvE3nXJqNFQ=;
 b=bHgC61S83XFKjjHLXOkOq4DxsfgHo2iXOrB0kGNER7zB3qrVVxUkcW0pixzEoZ/hFO
 9zlhd8/Ni87ZlTvrJ0eiUB+ehwc8ERiN1SdYfkRdu5K74DlnoLi+h/s3kgUV+MO5yxI4
 IpXJ9/umG++g7tOVTqBUHyZhF1w1+BHeH19F0=
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgNTozMyBQTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiAwOS8wOS8yMDE5IDE1OjUzLCBN
YXJrIEJyb3duIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDk6Mzc6MTRBTSAr
MDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPgo+ID4+IEknZCBsaWtlIHNvbWUgcmV2aWV3
IGZyb20gQVNvQyBwZW9wbGUgYW5kIG90aGVyIGRybSBicmlkZ2UgcmV2aWV3ZXJzLAo+ID4+IEpl
cm5laiwgSm9uYXMgJiBBbmRyemVqLgo+ID4KPiA+PiBKb25hcyBjb3VsZCBoYXZlIHNvbWUgY29t
bWVudHMgb24gdGhlIG92ZXJhbGwgcGF0Y2hzZXQuCj4gPgo+ID4gVGhlIEFTb0MgYml0cyBsb29r
IGJhc2ljYWxseSBmaW5lLCBJJ3ZlIGdvbmUgYWhlYWQgYW5kIGFwcGxpZWQKPiA+IHBhdGNoIDEg
YXMgaXMgc2luY2Ugd2UncmUganVzdCBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdyBhbmQgdGhhdAo+
ID4gd2F5IHdlIHJlZHVjZSBwb3RlbnRpYWwgY3Jvc3MgdHJlZSBpc3N1ZXMuICBJIGtub3cgdGhl
cmUncyBhIGxvdAo+ID4gb2YgZGlzY3Vzc2lvbiBvbiB0aGUgRFJNIHNpZGUgYWJvdXQgaG93IHRo
ZXkgd2FudCB0byBoYW5kbGUKPiA+IHRoaW5ncyB3aXRoIGphY2tzLCBJJ20gbm90IDEwMCUgc3Vy
ZSB3aGF0IHRoZSBsYXRlc3QgdGhpbmtpbmcgaXMKPiA+IHRoZXJlLgo+ID4KPgo+IFRoYW5rcyBN
YXJrLgo+Cj4KPiBDaGVuZy1ZaSBjYW4geW91IHJlc2VudCB0aGlzIHNlcmllIHdpdGhvdXQgdGhl
IGFscmVhZHkgYXBwbGllZAo+IGZpcnN0IHBhdGNoIHdpdGggSmVybmVqLCBKb25hcywgYW5kIEpl
cm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiBDQ2VkID8KCkhpIE5laWwsCkdvdCBp
dC4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgpJIHdpbGwgcmVzZW5kIHRoaXMgc2VyaWVzIHdp
dGhvdXQgdGhlIGZpcnN0IHBhdGNoLCBiYXNlZCBvbiBsYXRlc3QKZHJtLW1pc2MtbmV4dCwgYW5k
IGNjIHRoZSBmb2xrcy4KVGhhbmtzIQoKPgo+IFRoYW5rcywKPiBOZWlsCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
