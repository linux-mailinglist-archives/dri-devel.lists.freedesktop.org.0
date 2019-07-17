Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059B6BDA4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7140B6E1BD;
	Wed, 17 Jul 2019 13:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83AB89E19
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 10:28:29 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w196so18062226oie.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 03:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3OqUE647HuitrzeN56x9jTuLb2Ydo4APiMUt/N1U1gk=;
 b=VIIFoZo5rwo33rwWAGysFxX6Tz+4qi9LkazrbxQOBZr4ch9VPzoiW4TwPWr9beFk9i
 odn4FEnxbOY5BA/oW64FUaT9uC9QjERA1B+SB3skCMRP/s3QLlA3QKTLcILps6dTBBh9
 PyrIUMhmz4bmwKsUd9EiQp06cqRNHs8xA2gxJeLihp322kZ8emLiOYAY4RXko07co4EB
 aWf9a9QqxmlnftFts7TCng1ftH9tHyNlINPo+et+tK2jjlINZXP4rdxNIAqKqACCrC06
 Y6TcqBTxluhBFLe4H8Hq9BPOCRLtoe6GRT5VLHVcC0fpXuyPuk03qf2gP8cs1JHeEsyZ
 6kPg==
X-Gm-Message-State: APjAAAUs+s8AVnTq87g3O4xQh9yHkAVwmmTc9bG+DAYF4DmjLqlYXYCr
 BP5x1sh+sd9VeUdNKs1EcDxfP5sb2VZLOIHTtTWcPQ==
X-Google-Smtp-Source: APXvYqwWwXVZ/BZHTjaG86aX6+cX+YF7cjf0miBCE15x0Nd7s4TeCOAZk+HlSzO1mf3x+jEgUAq8Br9lxzMLzaRz5tc=
X-Received: by 2002:aca:544b:: with SMTP id i72mr20169753oib.174.1563359308762; 
 Wed, 17 Jul 2019 03:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
In-Reply-To: <20190717083327.47646-1-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 17 Jul 2019 18:28:17 +0800
Message-ID: <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
To: Cheng-Yi Chiang <cychiang@chromium.org>
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3OqUE647HuitrzeN56x9jTuLb2Ydo4APiMUt/N1U1gk=;
 b=JDhYZ/XLSp5p+uzs8xtZ+lDFSxyDX6a3a83vp7yY0oH7QR/JUG3nl7G/bfr2BVUVVt
 AT9BWdwzjWgFGhHaPLqfM2IfAKu5tUziTQa2yq6iXjC1JXAIXDIL1bnk3A60xCcqM8v1
 iHXfabVCBA+o6US93D2wHx2oKFBhG9ostlX0XsIagP4+oak+j0c4An6AaDbPkN0LuELE
 sbSIgxgH+PAC7n3MJ4/wXWHhsuSGKXPdLnObSXx350+qAr5xmhsnP0WJC6CsTXqWdSD+
 HwOrD5rSZE1vq3fGbC6Ihq5Zkdwq7tmp9dJjt8JIhcj2TFk/S5P93TXmZQmTmaWwZ/NV
 JatA==
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
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgNDozMyBQTSBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBzdXBwb3J0cyBIRE1J
IGphY2sgcmVwb3J0aW5nIG9uIFJLMzI4OCwgd2hpY2ggdXNlcwo+IERSTSBkdy1oZG1pIGRyaXZl
ciBhbmQgaGRtaS1jb2RlYyBjb2RlYyBkcml2ZXIuCj4KPiBUaGUgcHJldmlvdXMgZGlzY3Vzc2lv
biBhYm91dCByZXBvcnRpbmcgamFjayBzdGF0dXMgdXNpbmcgaGRtaS1ub3RpZmllcgo+IGFuZCBk
cm1fYXVkaW9fY29tcG9uZW50IGlzIGF0Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvMTA4MzAyNy8KPgo+IFRoZSBuZXcgYXBwcm9hY2ggaXMgdG8gdXNlIGEgY2Fs
bGJhY2sgbWVjaGFuaXNtIHRoYXQgaXMKPiBzcGVjaWZpYyB0byBoZG1pLWNvZGVjLgo+Cj4gQ2hh
bmdlcyBmcm9tIHY0IHRvIHY1Ogo+IC0gc3lub3BzeXMvS2NvbmZpZzogUmVtb3ZlIHRoZSBpbmNv
cnJlY3QgZGVwZW5kZW5jeSBjaGFuZ2UgaW4gdjQuCj4gLSByb2NrY2hpcC9LY29uZmlnOiBBZGQg
ZGVwZW5kZW5jeSBvZiBoZG1pLWNvZGVjIHdoZW4gaXQgaXMgcmVhbGx5IG5lZWQKPiAgIGZvciBq
YWNrIHN1cHBvcnQuCj4KPiBDaGVuZy1ZaSBDaGlhbmcgKDUpOgo+ICAgQVNvQzogaGRtaS1jb2Rl
YzogQWRkIGFuIG9wIHRvIHNldCBjYWxsYmFjayBmdW5jdGlvbiBmb3IgcGx1ZyBldmVudAo+ICAg
ZHJtOiBicmlkZ2U6IGR3LWhkbWk6IFJlcG9ydCBjb25uZWN0b3Igc3RhdHVzIHVzaW5nIGNhbGxi
YWNrCj4gICBkcm06IGR3LWhkbWktaTJzOiBVc2UgZml4ZWQgaWQgZm9yIGNvZGVjIGRldmljZQo+
ICAgQVNvQzogcm9ja2NoaXBfbWF4OTgwOTA6IEFkZCBkYWlfbGluayBmb3IgSERNSQo+ICAgQVNv
Qzogcm9ja2NoaXBfbWF4OTgwOTA6IEFkZCBIRE1JIGphY2sgc3VwcG9ydAo+CkxHVE0uCgpSZXZp
ZXdlZC1ieTogVHp1bmctQmkgU2hpaCA8dHp1bmdiaUBnb29nbGUuY29tPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
