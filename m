Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FBE97C1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301B6E8CB;
	Wed, 30 Oct 2019 08:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3A56E03E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 02:41:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o28so11940753wro.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 19:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZeDXYfJYer9ewRjx0PKDp7gkl9UyDafoP/CtcLx8QMs=;
 b=V6V9cJxyz/qTf9ye4IFLrNW53nqW0JaGRt3kkzKqf+fjXUBsFplF4HpyaHmaxtdfet
 oIbAi4FT4MhobdLUgFIncBaY1onLG0sv5l//YEle1ZdLL/pjETfsGa8cMqIMzatEnTQ3
 huypy+OxCdA0xt5tOeDrIdPCLFNVB3Ut8sFFwzZahGVHMpHmdFNoq0Ybcyes6j6gVLoS
 6jfdH3lqPTjIE7jWrWIUK089KiIh2YDiOvgnyHG939CHfZDffruL8RRQaI7o+dtM4fOB
 HYpNa/ZlId0j8/sC6tAM8itaRUGuPJ1KRSqo5BvZ+y/HwaBEbDm1YBnU1s9VI3i29B8x
 7kKw==
X-Gm-Message-State: APjAAAW7q0i1fKKILmj4hkY3kpMZ6K2VyKVCa4VAznne7hu2OFyxEvxY
 XLu1CId9B8HztTbHNOjNNrGb4+F6OHvRrQmgRXI3Tg==
X-Google-Smtp-Source: APXvYqyc+JXXHY09WmrhUa6gx/7O5d2iKpnoJiK3FXpiuNcBFCoy0/gMtIdx+mtcV6BqjcvdZ3c6ru0/7R8MCJ1fJrA=
X-Received: by 2002:adf:e806:: with SMTP id o6mr15942278wrm.139.1572316882248; 
 Mon, 28 Oct 2019 19:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191025133007.11190-4-cychiang@chromium.org>
 <201910290345.w2EEW5S3%lkp@intel.com>
In-Reply-To: <201910290345.w2EEW5S3%lkp@intel.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 29 Oct 2019 10:40:55 +0800
Message-ID: <CAFv8NwJYrpT=hCFwWfbdRvC971X-XGS-mjEBJrggQTJ02nhv7g@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] ASoC: rockchip_max98090: Optionally support HDMI
 use case
To: kbuild test robot <lkp@intel.com>
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZeDXYfJYer9ewRjx0PKDp7gkl9UyDafoP/CtcLx8QMs=;
 b=VLQKO+JOvP8uz/jmVZM9OjdCfHDXyDMWpkMpTUHQHfjmA84+CUWD7XxXQNaduG/DhK
 WpLIlhGmDUXteBLSWlDLv3lLQKGl9plS/P7jNHsE1n2OgqkcjY1MB0T3Q0WBTvNA1F40
 PLq6JygSU3JQITuvsF6azO0JElsbcTQp8BtSk=
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
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, kbuild-all@lists.01.org,
 Doug Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMzoxMCBBTSBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4gd3JvdGU6Cj4KPiBIaSBDaGVuZy1ZaSwKPgo+IEkgbG92ZSB5b3VyIHBhdGNoISBZ
ZXQgc29tZXRoaW5nIHRvIGltcHJvdmU6Cj4KPiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHJv
Y2tjaGlwL2Zvci1uZXh0XQo+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gdjUuNC1yYzUgbmV4
dC0yMDE5MTAyOF0KPiBbaWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQg
dHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRvIGhlbHAKPiBpbXByb3ZlIHRoZSBzeXN0ZW0u
IEJUVywgd2UgYWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBvcHRpb24gdG8gc3BlY2lmeSB0
aGUKPiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNlZSBodHRwczovL3N0
YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNv
bS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvQ2hlbmctWWktQ2hpYW5nL0FkZC1IRE1JLWphY2stc3Vw
cG9ydC1vbi1SSzMyODgvMjAxOTEwMjgtMjEyNTAyCj4gYmFzZTogICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tbWluZC9saW51eC1yb2NrY2hpcC5naXQg
Zm9yLW5leHQKPiBjb25maWc6IGkzODYtYWxsbW9kY29uZmlnIChhdHRhY2hlZCBhcyAuY29uZmln
KQo+IGNvbXBpbGVyOiBnY2MtNyAoRGViaWFuIDcuNC4wLTE0KSA3LjQuMAo+IHJlcHJvZHVjZToK
PiAgICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVl
Cj4gICAgICAgICBtYWtlIEFSQ0g9aTM4Ngo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRs
eSBhZGQgZm9sbG93aW5nIHRhZwo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPgo+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPgo+
ICAgIHNvdW5kL3NvYy9yb2NrY2hpcC9zbmQtc29jLXJvY2tjaGlwLW1heDk4MDkwOiBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIGlzIDE5NiBieXRlcy4gIFRoZSBsYXN0IG9mIDMgaXM6Cj4gICAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDcyIDB4NmYgMHg2MyAweDZiIDB4NjMgMHg2
OCAweDY5IDB4NzAgMHgyYyAweDcyIDB4NmYgMHg2MyAweDZiIDB4NjMgMHg2OCAweDY5IDB4NzAg
MHgyZCAweDYxIDB4NzUgMHg2NCAweDY5IDB4NmYgMHgyZCAweDZkIDB4NjEgMHg3OCAweDM5IDB4
MzggMHgzMCAweDM5IDB4MzAgMHgyZCAweDY4IDB4NjQgMHg2ZCAweDY5IDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgxMCAweDAwIDB4MDAg
MHgwMAo+ID4+IEZBVEFMOiBzb3VuZC9zb2Mvcm9ja2NoaXAvc25kLXNvYy1yb2NrY2hpcC1tYXg5
ODA5MDogc3RydWN0IG9mX2RldmljZV9pZCBpcyBub3QgdGVybWluYXRlZCB3aXRoIGEgTlVMTCBl
bnRyeSEKClBsZWFzZSBpZ25vcmUgdGhpcyBlcnJvciBmb3IgdjggcGF0Y2ggc2VyaWVzIGJlY2F1
c2UgdGhlIGNoYW5nZSBpbgpyb2NrY2hpcF9tYXg5ODA5MC5jIG9mIG9mX2RldmljZV9pZCBpcyBy
ZW1vdmVkIGluIHY5IHBhdGNoIHNlcmllcy4KVGhhbmtzIQoKPgo+IC0tLQo+IDAtREFZIGtlcm5l
bCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xv
Z3kgQ2VudGVyCj4gaHR0cHM6Ly9saXN0cy4wMS5vcmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAg
ICAgICAgICAgICAgICAgSW50ZWwgQ29ycG9yYXRpb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
