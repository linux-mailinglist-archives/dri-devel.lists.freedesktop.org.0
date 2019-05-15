Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F71F725
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 17:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FCE89150;
	Wed, 15 May 2019 15:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59E589150
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 15:09:24 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t187so2068470oie.10
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 08:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FzdAY9eNLFH6q18HeEB4S9VM37pJLDSHQjylPsT3TbY=;
 b=bqa+v/f4fwXesx+f0CZnmbAIQ4lj7dm9tW6H7UnyoKChpfYgaxIy21WcMqdlIPeDDs
 a0CUAHpAVb6Wth9aFY57nJ1VHxJ0dMw2Q1cmnzrUBfjbgtMTDOJrOaUMsoyo/qCVsa74
 EYIphlAtDZs8RGJNzvbPF+9eagxTfAUSw9FR8LKnTkjOX+MUENneUH5hrRvjYS+j9uAj
 Ge1Oim00MSaESFZF18b6eF5Y0m6j1yB2HNGSHIgJv9EiHfLGhr2KNevU2nQjG1YQ8EqW
 gIbf1kI2BpLTAU1OFBzj7I1xMiWVIGrNRd1/N0hxL/c/q88PHQeNCkMcM//zE6RQax89
 XxoQ==
X-Gm-Message-State: APjAAAX5lmJYYuQQyzErk6JafA68wyug6tVvNBItRUZN3rBg7qPqVHSs
 xLFR4QQsq5Mq2h9ywNBO8xJuXh7+08jJPFuHBKo=
X-Google-Smtp-Source: APXvYqx2op3tX9A4P1hZwzw0eFhbk5CfYg0Tbl3ieHQEQJwA11MZzaowFPPO1ZfSsj+7d5NaD8TUBJpiL4dsKvwOW9o=
X-Received: by 2002:aca:240d:: with SMTP id n13mr6735433oic.145.1557932964018; 
 Wed, 15 May 2019 08:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
In-Reply-To: <20190515093141.41016b11@blackhole.lan>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 15 May 2019 08:08:57 -0700
Message-ID: <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FzdAY9eNLFH6q18HeEB4S9VM37pJLDSHQjylPsT3TbY=;
 b=MjJ+LF+8pBMZJmrf/PUQGYzx6jkAIvZXVOaDkwDUy9j8LjnckyRKVimNt3qRpZ7QXs
 odt09gcUESirFG4LKGWD8wrs44NwvpmYA2lxf+ihQ7feGSSECN829NXz97xTZk1YqWok
 35/lGba1azoqDEabJk9bWsU7/bkhsjO9nkRYDhC0oT9sbfj+MNtAHSqEKLAJhOF3S6Rs
 R+rUWZGYA0dVjK3uQ9i1dVZfPXcCRFzlBj3LZ2YdHmMedSaa4kOtX9v0QZ8SKRLyhu7Z
 yvA1skM2zKLs6y+yPy3x/+CSXqODR2VRcyLDYU2/3JhylYVvTFrpq49h0oyAJEL7ENkN
 jPtQ==
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6MzIgQU0gVG9yc3RlbiBEdXdlIDxkdXdlQGxzdC5k
ZT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDE0IE1heSAyMDE5IDEwOjQ4OjQwIC0wNzAwCj4gVmFzaWx5
IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gKyAgICAgICBh
bng2MzQ1OiBhbng2MzQ1QDM4IHsKPiA+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
YW5hbG9naXgsYW54NjM0NSI7Cj4gPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8MHgzOD47Cj4g
PiA+ICsgICAgICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDMgMjQgR1BJT19BQ1RJVkVf
TE9XPjsgLyogUEQyNAo+ID4gPiAqLwo+ID4gPiArICAgICAgICAgICAgICAgZHZkZDI1LXN1cHBs
eSA9IDwmcmVnX2RsZG8yPjsKPiA+ID4gKyAgICAgICAgICAgICAgIGR2ZGQxMi1zdXBwbHkgPSA8
JnJlZ19kbGRvMz47Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIHBvcnQgewo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBhbng2MzQ1X2luOiBlbmRwb2ludCB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0KPiA+ID4gPCZ0Y29u
MF9vdXRfYW54NjM0NT47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiA+ICsg
ICAgICAgICAgICAgICB9Owo+ID4KPiA+IEl0IGRvZXNuJ3QgY29tcGx5IHdpdGggYmluZGluZ3Mg
ZG9jdW1lbnQuIFlvdSBuZWVkIHRvIGFkZCBvdXQgZW5kcG9pbnQKPgo+IEl0IGRvZXMgY29tcGx5
IHdpdGggdGhlIGJpbmRpbmdzLiBUaGUgcG9ydHMgYXJlIGFsbCBvcHRpb25hbC4KPiBBcyBmYXIg
YXMgRFQgaXMgY29uY2VybmVkLCB0aGUgc2lnbmFsIHBhdGggZW5kcyBoZXJlLiBUaGlzIGlzIGFs
c28gdGhlCj4gZmluYWwgY29tcG9uZW50IF9yZXF1aXJlZF8gdG8gZ2V0IHRoZSBMaW51eCBrZXJu
ZWwgRFJJIHVwIGFuZCBydW5uaW5nLgoKVWdoLCB0aGVuIGJpbmRpbmdzIHNob3VsZCBiZSBmaXhl
ZC4gSXQncyBub3Qgb3B0aW9uYWwuIEl0IG1heSB3b3JrIGlmCmJvb3Rsb2FkZXIgZW5hYmxlcyBw
b3dlciBmb3IgeW91LCBidXQgaXQgd29uJ3QgaWYgeW91IGRpc2FibGUgZGlzcGxheQpkcml2ZXIg
aW4gdS1ib290LgoKPiA+IGFzIHdlbGwsIGFuZCB0byBkbyBzbyB5b3UgbmVlZCB0byBhZGQgYmlu
ZGluZ3MgZm9yIGVEUCBjb25uZWN0b3IgZmlyc3QKPiA+IGFuZCB0aGVuIGltcGxlbWVudCBwYW5l
bCBkcml2ZXIuCj4gPiBTZWUgUm9iJ3Mgc3VnZ2VzdGlvbnMgaGVyZTogaHR0cDovL3BhdGNod29y
ay5vemxhYnMub3JnL3BhdGNoLzEwNDI1OTMvCj4KPiBXZWxsLCBvbmUgKmNvdWxkKiBleHRlbmQg
dGhlIGhhcmR3YXJlIGRlc2NyaXB0aW9uIGRvd24gdG8gdGhlIGFjdHVhbAo+IHBhbmVsIGlmIG5l
Y2Vzc2FyeSwgYnV0IG9uIHRoZSBUZXJlcy1JIGl0IGlzIG5vdC4gSSBhc3N1bWUgdGhlIHBhbmVs
Cj4gdGhleSBzaGlwIHByb3ZpZGVzIHByb3BlciBFRElEIHRvIHRoZSBhbng2MzQ1LCBiZWNhdXNl
IHRoZSBkaXNwbGF5Cj4gd29ya3MgZmluZSBoZXJlIHdpdGggdGhpcyBEVC4KCkkgZ3Vlc3MgeW91
J3JlIHRlc3RpbmcgaXQgd2l0aCBvbGRlciB2ZXJzaW9uIG9mIGFueDYzNDUuIE5ld2VyIHZlcnNp
b24KdGhhdCBzdXBwb3J0cyBwb3dlciBtYW5hZ2VtZW50IFsxXSBuZWVkcyBzdGFydHVwIGRlbGF5
IGZvciBwYW5lbC4KQW5vdGhlciBpc3N1ZSB0aGF0IHlvdSdyZSBzZWVpbmcgaXMgdGhhdCBiYWNr
bGlnaHQgaXMgbm90IGRpc2FibGVkIG9uCkRQTVMgZXZlbnRzLiBBbGwgaW4gYWxsLCB5b3UgbmVl
ZCB0byBkZXNjcmliZSBwYW5lbCBpbiBkdHMuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2FuYXJz
b3VsL2xpbnV4LTIuNi9jb21taXQvMmZiZjljMjQyNDE5YzhiZGE2OThlODMzMWEwMmQ0MzEyMTQz
YWUyYwoKCj4gRG8gSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5IHRoYXQgdGhlICgzIGRpZmZl
cmVudD8pIHBpbmVib29rIHBhbmVscwo+IGFyZSBub3QgdGhhdCBlYXN5IHRvIGhhbmRsZT8gSSB0
cnkgdG8gaW5jbHVkZSB0aGUgcGluZWJvb2sgd2hlcmV2ZXIKPiBwb3NzaWJsZSwganVzdCBiZWNh
dXNlIGl0J3Mgc28gc2ltaWxhciwgYnV0IGhlcmUgSSdtIGEgYml0IGxvc3QsIHNvIEkKPiBoYWQg
dG8gb21pdCB0aGVzZSBwYXJ0cy4KPgo+IFNob3VsZCBJIGFsc28gaGF2ZSBhZGRlZCBhIFRlc3Rl
ZC1ieTogPyA7LSkKCkkgZG9uJ3QgaGF2ZSBUZXJlcywgc28gSSBoYXZlbid0IHRlc3RlZCB0aGVz
ZS4KCj4KPiAgICAgICAgIFRvcnN0ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
