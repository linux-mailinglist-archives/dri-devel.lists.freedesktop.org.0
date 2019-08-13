Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279028B655
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 13:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265656E0F2;
	Tue, 13 Aug 2019 11:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC706E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:08:09 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y26so105909268qto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HIB1FeBMw0kT4n5nY36MOBb0YBcd6Z0mN5e+AnqNyZE=;
 b=mQPGJacI/GwP2zDeZV7xdnPxE1/UqXyxsAsg3bdkI2vqhSv0RhiBUh2BFZcyA8XgJU
 2spO8yXJ9nd2azzA6nqAr3cMDCs9gKkz1V0FeplqecCEdcxCl3snCH5/QJIMBfq90Cyy
 5oq/83s38AShC7tTYt7nxhsc1zL5ugG0xt+HyGnCLotv0UeR/myAf7eQ5KdBHfz8qTrM
 Divdkqt0ybS8/zygc4lJ2nEkld484ktzKc/ee7KDCz99vpw2873t2L8FzcQdFyXkm64O
 VEc1SpATKI3oFstCbUNf//waD+89TDoM/hTlN9mkOXDGrEyBbFmhhkdRb/ozDKGqHgO7
 icnQ==
X-Gm-Message-State: APjAAAU9PE9kPCPClkH6j1Ugub1jPW8oL/EfzMHoopPT9DeMg00fkAyx
 u8S2o67EytQhZw6V2Z4fDAgWCrPeMJ+Z5UOHfCM=
X-Google-Smtp-Source: APXvYqx/nZIPgpCg9fJQAkQukfWpNlMRwI/isdIkz0cHDQdJwM+9xSo+AwlCQhvXJshxqmstDvAO0AUSd3UXwUs7kpw=
X-Received: by 2002:ad4:53cb:: with SMTP id k11mr1250357qvv.93.1565694488565; 
 Tue, 13 Aug 2019 04:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565367567.git.agx@sigxcpu.org>
 <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
 <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
 <20190813101057.GB10751@bogon.m.sigxcpu.org>
In-Reply-To: <20190813101057.GB10751@bogon.m.sigxcpu.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Aug 2019 13:07:52 +0200
Message-ID: <CAK8P3a1q9G8VKgNKh+6khzoW3bFTVR_Zorygy=Qqsq-PYzM4=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTI6MTAgUE0gR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4
Y3B1Lm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTA6MDg6NDRBTSArMDIw
MCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDksIDIwMTkgYXQgNjoyNCBQ
TSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhp
cyBhZGRzIGFsbCB0aGUgZ3ByIHJlZ2lzdGVycyBhbmQgdGhlIGRlZmluZSBuZWVkZWQgZm9yIHNl
bGVjdGluZwo+ID4gPiB0aGUgaW5wdXQgc291cmNlIGluIHRoZSBpbXgtbndsIGRybSBicmlkZ2Uu
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5v
cmc+Cj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgSU9NVVhDX0dQUjAgICAgMHgwMAo+ID4gPiArI2Rl
ZmluZSBJT01VWENfR1BSMSAgICAweDA0Cj4gPiA+ICsjZGVmaW5lIElPTVVYQ19HUFIyICAgIDB4
MDgKPiA+ID4gKyNkZWZpbmUgSU9NVVhDX0dQUjMgICAgMHgwYwo+ID4gPiArI2RlZmluZSBJT01V
WENfR1BSNCAgICAweDEwCj4gPiA+ICsjZGVmaW5lIElPTVVYQ19HUFI1ICAgIDB4MTQKPiA+ID4g
KyNkZWZpbmUgSU9NVVhDX0dQUjYgICAgMHgxOAo+ID4gPiArI2RlZmluZSBJT01VWENfR1BSNyAg
ICAweDFjCj4gPiAobW9yZSBvZiB0aGUgc2FtZSkKPiA+Cj4gPiBodWg/Cj4KPiBUaGVzZSBhcmUg
dGhlIG5hbWVzIGZyb20gdGhlIGlteDhNUSByZWZlcmVuY2UgbWFudWFsIChnZW5lcmFsIHB1cnBv
c2UKPiByZWdpc3RlcnMsIHRoZXkgbHVtcCB0b2dldGhlciBhbGwgc29ydHMgb2YgdGhpbmdzKSwg
aXQncyB0aGUgc2FtZSBvbgo+IGlteDYvaW14Nyk6Cj4KPiAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvaW5j
bHVkZS9saW51eC9tZmQvc3lzY29uL2lteDZxLWlvbXV4Yy1ncHIuaAo+ICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9pbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14Ny1pb211eGMtZ3ByLmgKPgo+ID4gPiAr
LyogaS5NWDhNcSBpb211eCBncHIgcmVnaXN0ZXIgZmllbGQgZGVmaW5lcyAqLwo+ID4gPiArI2Rl
ZmluZSBJTVg4TVFfR1BSMTNfTUlQSV9NVVhfU0VMICAgICAgICAgICAgICBCSVQoMikKPiA+Cj4g
PiBJIHRoaW5rIHRoaXMgZGVmaW5lIHNob3VsZCBwcm9iYWJseSBiZSBsb2NhbCB0byB0aGUgcGlu
Y3RybCBkcml2ZXIsIHRvCj4gPiBlbnN1cmUgdGhhdCBubyBvdGhlciBkcml2ZXJzIGZpZGRsZSB3
aXRoIHRoZSByZWdpc3RlcnMgbWFudWFsbHkuCj4KPiBUaGUgcHVycG9zZSBvZiB0aGVzZSBiaXRz
IGlzIGZvciBhIGRyaXZlciB0byBmaWRkbGUgd2l0aCB0aGVtIHRvIHNlbGVjdAo+IHRoZSBpbnB1
dCBzb3VyY2UuIFNpbWlsYXIgb24gaW14NyBpdCdzIGFscmVhZHkgdXNlZCBmb3IgZS5nLiB0aGUg
cGh5Cj4gcmVmY2xrIGluIHRoZSBwY2kgY29udHJvbGxlcjoKPgo+ICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jI242MzgKClRoYXQgb25lIHNo
b3VsZCBsaWtlbHkgdXNlIGVpdGhlciB0aGUgY2xrIGludGVyZmFjZSBvciB0aGUgcGh5CmludGVy
ZmFjZSBpbnN0ZWFkLgoKPiBUaGUgR1BScyBhcmUgbm90IGFib3V0IHBhZCBjb25maWd1cmF0aW9u
IGJ1dCBnYXRoZXIgYWxsIHNvcnRzIG9mIHRoaW5ncwo+IChzZWN0aW9uIDguMi40IG9mIHRoZSBp
bXg4bXEgcmVmZXJlbmNlIG1hbnVhbCk6IHBjaWUgc2V0dXAsIGRzaSByZWxhdGVkCj4gYml0cyBz
byBJIGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGJlIGRvbmUgdmlhIGEgcGluY3RybAo+IGRyaXZl
ci4gU2hvdWxkIHdlIGhhbmRsZSB0aGF0IGRpZmZlcmVudGx5IHRoYW4gb24gaW14Ni83PwoKSXQg
d291bGQgYmUgbmljZSB0byBmaXggdGhlIGV4aXN0aW5nIGNvZGUgYXMgd2VsbCwgYnV0IGZvciB0
aGUgbW9tZW50LApJIG9ubHkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBhZGQgbW9yZSBvZiB0aGF0LgoK
R2VuZXJhbGx5IHNwZWFraW5nLCB3ZSBjYW4gdXNlIHN5c2NvbiB0byBkbyByYW5kb20gdGhpbmdz
IHRoYXQgZG9uJ3QKaGF2ZSBhIHN1YnN5c3RlbSBvZiB0aGVpciBvd24sIGJ1dCB3ZSBzaG91bGQg
bm90IHVzZSBpdCB0byBkbyB0aGluZ3MKdGhhdCBoYXZlIGFuIGV4aXN0aW5nIGRyaXZlciBmcmFt
ZXdvcmsgbGlrZSBwaW5jdHJsLCBjbG9jaywgcmVzZXQsIHBoeQpldGMuCgogICAgICAgQXJuZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
