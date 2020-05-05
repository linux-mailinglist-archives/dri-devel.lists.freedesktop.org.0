Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8D1C4CF8
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 06:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0466E1D7;
	Tue,  5 May 2020 04:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38A6E1D7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 04:08:10 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34B4321582
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 04:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588651690;
 bh=uzzMCgqE/O5IIYjUlJGPkxkNrxePxpFGbx62v87B1yk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BN6Cy/3HpCwbAGqGdvC+qqnnmWcpBeTMOV+avy7c5MqADF8o2RkgcRkJzIQXdsCsk
 1Afk3jIt/KQM3TnQcStiKfqzuLsewX65wxQohWJds/+9oXyCCJshgXhqgUpXBb3dvp
 Pj9E/11iNOGPIQykmHB/KEKg0M4b5I2GMOZkNt/o=
Received: by mail-ot1-f44.google.com with SMTP id j26so594702ots.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 21:08:10 -0700 (PDT)
X-Gm-Message-State: AGi0PuZt0oxArXXM0NoYGl5osAXowpnSXMcrIP1PfNU6sg3fXU8D65p9
 F853hBSxRKMpbzHRGiRAj9kT2XiTcOIHlKN98A==
X-Google-Smtp-Source: APiQypKr0Hhrl0+e44U31hazXs0o4bScaIuGYf4nCgkUWwDdJ4zYt2nRLPemlwjIE7S1TGeNHXWRAj+I7RpOjlh+8dk=
X-Received: by 2002:a9d:7d85:: with SMTP id j5mr690540otn.107.1588651689440;
 Mon, 04 May 2020 21:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
 <20200504174522.GA3383@ravnborg.org>
 <20200504175553.jdm7a7aabloevxba@pengutronix.de>
In-Reply-To: <20200504175553.jdm7a7aabloevxba@pengutronix.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 May 2020 23:07:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJuRrhEtt5uxaQ=7WvDKiF_2v025GiYUvrrFE5jxBr-Xg@mail.gmail.com>
Message-ID: <CAL_JsqJuRrhEtt5uxaQ=7WvDKiF_2v025GiYUvrrFE5jxBr-Xg@mail.gmail.com>
Subject: Re: [PATCH] docs: dt: fix broken links due to txt->yaml renames
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Jyri Sarha <jsarha@ti.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Sandy Huang <hjc@rock-chips.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgNCwgMjAyMCBhdCAxMjo1NiBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhpIFNhbSwKPgo+IE9uIE1vbiwg
TWF5IDA0LCAyMDIwIGF0IDA3OjQ1OjIyUE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+
IE9uIE1vbiwgTWF5IDA0LCAyMDIwIGF0IDExOjMwOjIwQU0gKzAyMDAsIE1hdXJvIENhcnZhbGhv
IENoZWhhYiB3cm90ZToKPiA+ID4gVGhlcmUgYXJlIHNvbWUgbmV3IGJyb2tlbiBkb2MgbGlua3Mg
ZHVlIHRvIHlhbWwgcmVuYW1lcwo+ID4gPiBhdCBEVC4gRGV2ZWxvcGVycyBzaG91bGQgcmVhbGx5
IHJ1bjoKPiA+ID4KPiA+ID4gICAgIC4vc2NyaXB0cy9kb2N1bWVudGF0aW9uLWZpbGUtcmVmLWNo
ZWNrCj4gPiA+Cj4gPiA+IGluIG9yZGVyIHRvIHNvbHZlIHRob3NlIGlzc3VlcyB3aGlsZSBzdWJt
aXR0aW5nIHBhdGNoZXMuCj4gPiBXb3VsZCBsb3ZlIGlmIHNvbWUgYm90IGNvdWxkIGRvIHRoaXMg
Zm9yIG1lIG9uIGFueSBwYXRjaGVzIHRoYXQgY3JlYXRlcwo+ID4gLnlhbWwgZmlsZXMgb3Igc28u
Cj4gPiBJIGtub3cgSSB3aWxsIGZvcmdldCB0aGlzIGFuZCBpdCBjYW4gYmUgYXV0b21hdGVkLgo+
ID4gSWYgSSBnZXQgYSBib3QgbWFpbCB0aGF0IG15IHBhdGNoIHdvdWxkIGJyb2tlIGEgbGluayBJ
IHdvdWxkCj4gPiBoYXZlIGl0IGZpeGVkIGJlZm9yZSBpdCBoaXRzIGFueSB0cmVlLgoKSSBjYW4g
cHJvYmFibHkgYWRkIHRoaXMgdG8gd2hhdCBJJ20gYWxyZWFkeSBjaGVja2luZy4gTm90IGNvbXBs
ZXRlbHkKYXV0b21hdGVkIHRob3VnaCBhcyBpdCBkZXBlbmRzIG9uIG1lIHRvIHJldmlldyBiZWZv
cmUgc2VuZGluZy4KCj4gV2hhdCBhYm91dCBhZGRpbmcgYSBjaGVjayB0byBjaGVja19wYXRjaD8K
ClRoYXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIGdldCBzdWJtaXR0ZXJzIHRvIGRvIHRoaXMu
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
