Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC83AD3B4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44689850;
	Mon,  9 Sep 2019 07:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A23889A57
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 13:51:29 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id 107so3460878uau.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2019 06:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/OjUEd4QSp7PdF6VW4aQrBE3Z+/uVpO6ArZ5TFedKOc=;
 b=Su4G5/BLXc1zOAx53RD5ceZQU8BSHxj21tX7ylwStu5G9nqSmgmYlQ3nSw2mSyG6iO
 IBP+Pryxw9pkRXgq/BPtnUCutO2C2gAkNFir6hpkvEcpZRIzN9bxKFk6cpbB+NNKlqXl
 3Azqbb3y0lPQAH6jgvLdKDsqxPUMrtT/ojhkuqF0fO5vCTPFbdjwDqdgxP+k4+OOFQtV
 /KbyGaXpf5q2couw0VFkWcYTrGhStsAS37YhaCaScSCMzOKnj++BOtmtrkHv8TJQ6RB1
 o1W1XuFKoIM7ZeSKVMBBA+5Bg5hAFtrwE8DRp6V/EXuVVEVbhd63x9PzMSTKgGfghyrx
 eOFw==
X-Gm-Message-State: APjAAAVrTZDudrRHypoF7Sjs4dqaUaltn2motpmvKGto7rLOfcfgc34B
 UA4nsjeh5r+zONtyabf0GaUjmvORwyYH64Ywe91Hew==
X-Google-Smtp-Source: APXvYqz0WcmHMeiK6IT+v7kmZTAGTgr1Hd/fvxS4YbL4elq2hJMpg584VDsJiFFWnsbRAAo6uqeDZQp5p3+XGhBLzrU=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr8981573uaf.131.1567950687342;
 Sun, 08 Sep 2019 06:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
In-Reply-To: <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Sun, 8 Sep 2019 21:51:01 +0800
Message-ID: <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add HDMI jack support on RK3288
To: Tzung-Bi Shih <tzungbi@google.com>
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/OjUEd4QSp7PdF6VW4aQrBE3Z+/uVpO6ArZ5TFedKOc=;
 b=gVLsd+T0GXYo4KXD8R+kiCVmUyc3iXlvJ5SL3N90TjeV223lfZq0lpVImmm1TQPLvr
 biVG3B/n3OMziPN/L+IVvhgX7Ge1Bk7hcW/JG/CkZ9zrfy4+DonIP5+MTrsf/9lW9zj+
 GDyNN76Ur/2fW2BBK/M7SqE9yXZfqSEsSHkh4=
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
 Neil Armstrong <narmstrong@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMTA6NTUgQU0gQ2hlbmcteWkgQ2hpYW5nIDxjeWNoaWFu
Z0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgNjoyOCBQ
TSBUenVuZy1CaSBTaGloIDx0enVuZ2JpQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdl
ZCwgSnVsIDE3LCAyMDE5IGF0IDQ6MzMgUE0gQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBzdXBwb3J0cyBI
RE1JIGphY2sgcmVwb3J0aW5nIG9uIFJLMzI4OCwgd2hpY2ggdXNlcwo+ID4gPiBEUk0gZHctaGRt
aSBkcml2ZXIgYW5kIGhkbWktY29kZWMgY29kZWMgZHJpdmVyLgo+ID4gPgo+ID4gPiBUaGUgcHJl
dmlvdXMgZGlzY3Vzc2lvbiBhYm91dCByZXBvcnRpbmcgamFjayBzdGF0dXMgdXNpbmcgaGRtaS1u
b3RpZmllcgo+ID4gPiBhbmQgZHJtX2F1ZGlvX2NvbXBvbmVudCBpcyBhdAo+ID4gPgo+ID4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA4MzAyNy8KPiA+ID4KPiA+
ID4gVGhlIG5ldyBhcHByb2FjaCBpcyB0byB1c2UgYSBjYWxsYmFjayBtZWNoYW5pc20gdGhhdCBp
cwo+ID4gPiBzcGVjaWZpYyB0byBoZG1pLWNvZGVjLgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGZyb20g
djQgdG8gdjU6Cj4gPiA+IC0gc3lub3BzeXMvS2NvbmZpZzogUmVtb3ZlIHRoZSBpbmNvcnJlY3Qg
ZGVwZW5kZW5jeSBjaGFuZ2UgaW4gdjQuCj4gPiA+IC0gcm9ja2NoaXAvS2NvbmZpZzogQWRkIGRl
cGVuZGVuY3kgb2YgaGRtaS1jb2RlYyB3aGVuIGl0IGlzIHJlYWxseSBuZWVkCj4gPiA+ICAgZm9y
IGphY2sgc3VwcG9ydC4KPiA+ID4KPiA+ID4gQ2hlbmctWWkgQ2hpYW5nICg1KToKPiA+ID4gICBB
U29DOiBoZG1pLWNvZGVjOiBBZGQgYW4gb3AgdG8gc2V0IGNhbGxiYWNrIGZ1bmN0aW9uIGZvciBw
bHVnIGV2ZW50Cj4gPiA+ICAgZHJtOiBicmlkZ2U6IGR3LWhkbWk6IFJlcG9ydCBjb25uZWN0b3Ig
c3RhdHVzIHVzaW5nIGNhbGxiYWNrCj4gPiA+ICAgZHJtOiBkdy1oZG1pLWkyczogVXNlIGZpeGVk
IGlkIGZvciBjb2RlYyBkZXZpY2UKPiA+ID4gICBBU29DOiByb2NrY2hpcF9tYXg5ODA5MDogQWRk
IGRhaV9saW5rIGZvciBIRE1JCj4gPiA+ICAgQVNvQzogcm9ja2NoaXBfbWF4OTgwOTA6IEFkZCBI
RE1JIGphY2sgc3VwcG9ydAo+ID4gPgo+ID4gTEdUTS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogVHp1
bmctQmkgU2hpaCA8dHp1bmdiaUBnb29nbGUuY29tPgo+Cj4gSGkgRGFuaWVsLAo+IERvIHlvdSBo
YXZlIGZ1cnRoZXIgY29uY2VybiBvbiB0aGlzIHBhdGNoIHNlcmllcyByZWxhdGVkIHRvIGhkbWkt
Y29kZWMKPiBhbmQgZHJtIHBhcnQgPwo+IFdlIHdvdWxkIGxpa2UgdG8gbWVyZ2UgdGhpcyBwYXRj
aCBzZXJpZXMgaWYgcG9zc2libGUuCj4gVGhleSB3aWxsIGJlIG5lZWRlZCBpbiBtYW55IGZ1dHVy
ZSBjaHJvbWUgcHJvamVjdHMgZm9yIEhETUkgYXVkaW8gamFjawo+IGRldGVjdGlvbi4KPiBUaGFu
a3MgYSBsb3QhCgpIaSBOZWlsLApJIGFtIG5vdCBzdXJlIGlmIHRoaXMgcGF0Y2ggc2VyaWVzIGlz
IHVuZGVyIHlvdXIgcmFkYXIuCldvdWxkIHlvdSBtaW5kIHRha2luZyBhIGxvb2sgPwpUaGlzIHBh
dGNoIHNlcmllcyBoYXMgYmVlbiBmb2xsb3dpbmcgZ3JlYXQgc3VnZ2VzdGlvbnMgZnJvbSB2YXJp
b3VzCnJldmlld2Vycywgc28gSSBob3BlIGl0IGlzIGZpbmUgbm93LgoKQXVkaW8gamFjayByZXBv
cnRpbmcgZm9yIEhETUkgbWlnaHQgbm90IGJlIG5lZWRlZCBmb3Igb3RoZXIgT1MsIGJ1dCBpdApp
cyBhIG11c3Qgb24gQ2hyb21lT1MuCldlIGhhdmUgbWFueSBwcmV2aW91cyBwcm9qZWN0cyB1c2lu
ZyBkaWZmZXJlbnQgbG9jYWwgcGF0Y2ggc2V0cyB0bwphY2hpZXZlIEhETUkgamFjayByZXBvcnRp
bmcuCkkgaG9wZSB0aGF0IHdlIGNhbiBhY2hpZXZlIGEgcHJvcGVyIHdheSBhbmQgcmVhbGx5IGdl
dCB0aGUgcGF0Y2hlcwptZXJnZWQgdG8gbWFpbmxpbmUuClRoYW5rcyBhIGxvdCEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
