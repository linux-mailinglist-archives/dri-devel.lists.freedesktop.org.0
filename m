Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA41DE03B
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C946E34B;
	Fri, 22 May 2020 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE4B6E5D4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:22:41 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n14so3078450qke.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZjqVhvVauJwxzdubRCxzpwyDgNZsr/jK/zmF2UGqkm0=;
 b=LzRhD8IVgnmIVQzzoYcQc9SGvryKW9AvjBv+5xt1U5TlXPqkgWZYhhLZ+fDOiIMJVE
 j8fn5+fABxBNdukYPVM+l0vF16UvWxzpEJBJLKCW56Z4DkC5xa0rvUGkgFzj9G0Agcbl
 CR4ePEwCrdO65XTKv1Q7qKPo1V5T2jQjs+MOPyTun845of6hg3kQqItmtboNDlREjJcu
 Z2pKrl+oLt5umJH0Z+pIMp+EXFb7tOaN6BDew0UWwQ+/7bg+moQfUGPSduuzZJPyI5/X
 2YFdC3nAFQopV7V8BMDEMRy8CAn1JlcOebH4yDfMrImRBq3nMNW49Dcoe93t2TjTRQsi
 5qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZjqVhvVauJwxzdubRCxzpwyDgNZsr/jK/zmF2UGqkm0=;
 b=s22FzT6bk0J4lD5aCgR73MB5Uo7xf3J8vraNMdTFtMo+JSjTCUVjs3uBXChm/I7ETx
 6MVkK/Zq++5O0boZMGeNtHtzeEmjRIqSymySCf7yvb117iEAtHmhLz5MsgehzV3uqGuM
 KrphhJoEWyVIT8XbpsRowHiPZVs4uCHHPXLy7XdojMA5z9fEk7UEgwJLOzi2uaAgcwDE
 ST7MpQTz50KrHhN/UsIudal4k+I0wK5ArcOdzoQChea76C+ggpq0Yq2DRmocyRhPOpa8
 YSuHePP/XfWsJ7f/WQYeTNoE0gF23EGZmlcS9Jyu6f8hpgVDOi4MzdErHc1+SH/+ysc3
 SbLA==
X-Gm-Message-State: AOAM532KIWEZsZvcm7NNMNpMRO+FUh6iyw64fw8wjPdsEORDkqW7iXIW
 jl5n9mYKnOC/g7GSWTU5neFoqvlCG1lBQICyrn8=
X-Google-Smtp-Source: ABdhPJxBdmgJNCR88xlbXPGclNlO2GaIwRkfV+dyapGMbu4Q9RuUthOHvMqPP4yv8y1KdCvdCmqnj7BHtLVZZI62f64=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr4087174qke.121.1589973760794; 
 Wed, 20 May 2020 04:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
In-Reply-To: <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 May 2020 19:22:19 +0800
Message-ID: <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Lucas Stach <l.stach@pengutronix.de>
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:06 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 shawnguo@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, perex@perex.cz,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDU6NDIgUE0gTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gQW0gTWl0dHdvY2gsIGRlbiAyMC4wNS4yMDIwLCAx
NjoyMCArMDgwMCBzY2hyaWViIFNoZW5naml1IFdhbmc6Cj4gPiBIaQo+ID4KPiA+IE9uIFR1ZSwg
TWF5IDE5LCAyMDIwIGF0IDY6MDQgUE0gTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXgu
ZGU+IHdyb3RlOgo+ID4gPiBBbSBEaWVuc3RhZywgZGVuIDE5LjA1LjIwMjAsIDE3OjQxICswODAw
IHNjaHJpZWIgU2hlbmdqaXUgV2FuZzoKPiA+ID4gPiBUaGVyZSBhcmUgdHdvIHJlcXVpcmVtZW50
cyB0aGF0IHdlIG5lZWQgdG8gbW92ZSB0aGUgcmVxdWVzdAo+ID4gPiA+IG9mIGRtYSBjaGFubmVs
IGZyb20gcHJvYmUgdG8gb3Blbi4KPiA+ID4KPiA+ID4gSG93IGRvIHlvdSBoYW5kbGUgLUVQUk9C
RV9ERUZFUiByZXR1cm4gY29kZSBmcm9tIHRoZSBjaGFubmVsIHJlcXVlc3QgaWYKPiA+ID4geW91
IGRvbid0IGRvIGl0IGluIHByb2JlPwo+ID4KPiA+IEkgdXNlIHRoZSBkbWFfcmVxdWVzdF9zbGF2
ZV9jaGFubmVsIG9yIGRtYV9yZXF1ZXN0X2NoYW5uZWwgaW5zdGVhZAo+ID4gb2YgZG1hZW5naW5l
X3BjbV9yZXF1ZXN0X2NoYW5fb2YuIHNvIHRoZXJlIHNob3VsZCBiZSBub3QgLUVQUk9CRV9ERUZF
Ugo+ID4gcmV0dXJuIGNvZGUuCj4KPiBUaGlzIGlzIGEgcHJldHR5IHdlYWsgYXJndW1lbnQuIFRo
ZSBkbWFlbmdpbmUgZGV2aWNlIG1pZ2h0IHByb2JlIGFmdGVyCj4geW91IHRyeSB0byBnZXQgdGhl
IGNoYW5uZWwuIFVzaW5nIGEgZnVuY3Rpb24gdG8gcmVxdWVzdCB0aGUgY2hhbm5lbAo+IHRoYXQg
ZG9lc24ndCBhbGxvdyB5b3UgdG8gaGFuZGxlIHByb2JlIGRlZmVycmFsIGlzIElNSE8gYSBidWcg
YW5kCj4gc2hvdWxkIGJlIGZpeGVkLCBpbnN0ZWFkIG9mIGJ1aWxkaW5nIGV2ZW4gbW9yZSBhc3N1
bXB0aW9ucyBvbiB0b3Agb2YKPiBpdC4KPgoKSSBzZWUgc29tZSBkcml2ZXIgYWxzbyByZXF1ZXN0
IGRtYSBjaGFubmVsIGluIG9wZW4oKSBvciBod19wYXJhbXMoKS4KaG93IGNhbiB0aGV5IGF2b2lk
IHRoZSBkZWZlciBwcm9iZSBpc3N1ZT8KZm9yIGV4YW1wbGXvvJoKc291bmQvYXJtL3B4YTJ4eC1w
Y20tbGliLmMKc291bmQvc29jL3NwcmQvc3ByZC1wY20tZG1hLmMKCj4gPiA+ID4gLSBXaGVuIGRt
YSBkZXZpY2UgYmluZHMgd2l0aCBwb3dlci1kb21haW5zLCB0aGUgcG93ZXIgd2lsbAo+ID4gPiA+
IGJlIGVuYWJsZWQgd2hlbiB3ZSByZXF1ZXN0IGRtYSBjaGFubmVsLiBJZiB0aGUgcmVxdWVzdCBv
ZiBkbWEKPiA+ID4gPiBjaGFubmVsIGhhcHBlbiBvbiBwcm9iZSwgdGhlbiB0aGUgcG93ZXItZG9t
YWlucyB3aWxsIGJlIGFsd2F5cwo+ID4gPiA+IGVuYWJsZWQgYWZ0ZXIga2VybmVsIGJvb3QgdXAs
ICB3aGljaCBpcyBub3QgZ29vZCBmb3IgcG93ZXIKPiA+ID4gPiBzYXZpbmcsICBzbyB3ZSBuZWVk
IHRvIG1vdmUgdGhlIHJlcXVlc3Qgb2YgZG1hIGNoYW5uZWwgdG8gLm9wZW4oKTsKPiA+ID4KPiA+
ID4gVGhpcyBpcyBjZXJ0YWlubHkgc29tZXRoaW5nIHdoaWNoIGNvdWxkIGJlIGZpeGVkIGluIHRo
ZSBkbWFlbmdpbmUKPiA+ID4gZHJpdmVyLgo+ID4KPiA+IERtYSBkcml2ZXIgYWx3YXlzIGNhbGwg
dGhlIHBtX3J1bnRpbWVfZ2V0X3N5bmMgaW4KPiA+IGRldmljZV9hbGxvY19jaGFuX3Jlc291cmNl
cywgdGhlIGRldmljZV9hbGxvY19jaGFuX3Jlc291cmNlcyBpcwo+ID4gY2FsbGVkIHdoZW4gY2hh
bm5lbCBpcyByZXF1ZXN0ZWQuIHNvIHBvd2VyIGlzIGVuYWJsZWQgb24gY2hhbm5lbAo+ID4gcmVx
dWVzdC4KPgo+IFNvIHdoeSBjYW4ndCB5b3UgZml4IHRoZSBkbWFlbmdpbmUgZHJpdmVyIHRvIGRv
IHRoYXQgUlBNIGNhbGwgYXQgYQo+IGxhdGVyIHRpbWUgd2hlbiB0aGUgY2hhbm5lbCBpcyBhY3R1
YWxseSBnb2luZyB0byBiZSB1c2VkPyBUaGlzIHdpbGwKPiBhbGxvdyBmdXJ0aGVyIHBvd2VyIHNh
dmluZ3Mgd2l0aCBvdGhlciBzbGF2ZSBkZXZpY2VzIHRoYW4gdGhlIGF1ZGlvCj4gUENNLgo+Cj4g
UmVnYXJkcywKPiBMdWNhcwo+CgpJdCBzZWVtcyB0aGUgYmVzdCBwbGFjZSBmb3IgY2FsbGluZyBw
bV9ydW50aW1lX2dldF9zeW5jIGlzIHRoZQpkZXZpY2VfYWxsb2NfY2hhbl9yZXNvdXJjZXMsIGFu
ZCBjYWxsaW5nIHBtX3J1bnRpbWVfcHV0X3N5bmMKaW4gdGhlIC5kZXZpY2VfZnJlZV9jaGFuX3Jl
c291cmNlcwoKRm9yIHRoZSBzbGF2ZV9zZyBtb2RlLCB0aGUgLmRldmljZV9wcmVwX3NsYXZlX3Nn
IGFuZAouZGV2aWNlX2lzc3VlX3BlbmRpbmcgIHdpbGwgYmUgY2FsbGVkIG1hbnkgdGltZXMgYWZ0
ZXIKLmRldmljZV9hbGxvY19jaGFuX3Jlc291cmNlcy4gc28gaXQgaXMgbm90IGdvb2QgdG8gY2Fs
bApwbV9ydW50aW1lX2dldF9zeW5jIGluIC5kZXZpY2VfcHJlcF9zbGF2ZV9zZyBvcgouZGV2aWNl
X2lzc3VlX3BlbmRpbmcKCmJlc3QgcmVnYXJkcwp3YW5nIHNoZW5naml1Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
