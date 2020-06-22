Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB68204B92
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561DA6E956;
	Tue, 23 Jun 2020 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9224C6E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1592824673; bh=0Vk8stGqwL22qIG2VXDYwb4JGvkgfdgnlutpWfVaaAk=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=hMaou2x9rawSaJ4M5p19fxiRzhurhEBjn1CGSowMO2tYKM9IJoFSarK0qMn+8/iUC
 QH14oc8yPRGUjFTfQRuHO4k7CSkHb5Ln3SzS/3PWhOfd5i/IKTAmlqdjH7LMHbhgSz
 2stzJLkR41K8a25eokQMst0y1t2GMdOVo2NEgg60=
Date: Mon, 22 Jun 2020 13:17:52 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 3/5] drm: panel: Add Xingbangda XBD599 panel (ST7703
 controller)
Message-ID: <20200622111752.jsz37zl7hidvkozw@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
References: <20200617003209.670819-1-megous@megous.com>
 <20200617003209.670819-4-megous@megous.com>
 <20200620212529.GB74146@ravnborg.org>
 <20200620223010.fqjwijiixxkewk3p@core.my.home>
 <20200622080802.GA650963@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622080802.GA650963@ravnborg.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: devicetree@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2FtLAoKT24gTW9uLCBKdW4gMjIsIDIwMjAgYXQgMTA6MDg6MDJBTSArMDIwMCwgU2Ft
IFJhdm5ib3JnIHdyb3RlOgo+IE9uIFN1biwgSnVuIDIxLCAyMDIwIGF0IDEyOjMwOjEwQU0gKzAy
MDAsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+ID4gT24gU2F0LCBKdW4gMjAsIDIwMjAgYXQgMTE6
MjU6MjlQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4gPiBIaSBPbmRyZWogZXQgYWwu
CgouLi4KCj4gPiA+IFdvdWxkIGl0IG5vdCBiZSBiZXR0ZXIgdG8gaGF2ZSBvbmUgc3Q3NzAzIGRy
aXZlciB0aGF0IHN1aXBwb3J0cyBib3RoCj4gPiA+IHBhbmVscz8KPiA+ID4KPiA+ID4gVGhlIGRy
aXZlciB3b3VsZCBuZWVkIGRlZGljYXRlZCBpbml0IGZ1bmN0aW9ucyBkZXBlbmRpbmcgb24gdGhl
IHBhbmVsLgo+ID4gPiBCdXQgYSBsb3QgY291bGQgYWxzbyBiZSBzaGFyZWQuCj4gPiAKPiA+IEkg
Z3Vlc3MgSSBjYW4gbW92ZSB0aGUgY29kZSB0aGVyZS4gCj4gSW4gdGhlIHNhbWUgcHJvY2VzcyB0
aGUgcml2ZXIgc2hvdWxkIHRoZW4gYmUgcmVuYW1lZCB0byBmb2xsb3cgb3RoZXIKPiBzaXRyb25p
eCBiYXNlZCBkcml2ZXJzLgo+IFNvIHRoZSBuZXh0IGRldmVsb3BlciB3aWxsIHJlY29nbml6ZSB0
aGlzIGFuZCB1c2UgdGhlIGNvcnJlY3QgZHJpdmVyLgoKQXJlIGRyaXZlci9tb2R1bGUgbmFtZXMg
Y29uc2lkZXJlZCBrZXJuZWwgQUJJPyBPciBpcyBpdCBwb3NzaWJsZSB0bwpjaGFuZ2UgdGhlbT8K
CnJlZ2FyZHMsCglvLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
