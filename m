Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CDEDADEC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA7C6EA7F;
	Thu, 17 Oct 2019 13:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B686EA86
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:09:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id c6so2834887ioo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O2sCm4ci20pr97mr1Ng7lBlOLxIqCQWlGEv5VaAWrpY=;
 b=afKoB3GZMWKL6piNeLW/n/tbeS9hjLPX9h84ZGE4fyeZoD6mgXBo1phgdmyJ8Dt9eA
 cbXW4tsMBw7eVrfMcrp56hdz/bddpiZMPR1ORw365RmX6EqMeygYIC/SNa46ZX4VVwRV
 nGZ/2FTBW2pAm8zppJNmkqCQNxaSRpeMpeyIy29H9pavh8FNOotgyQ9dlQaDs2KZj429
 ttx5Le1IBNjauR3IxT/Tj4zB6AfEYTlvYZaA3ApOwBRsZ4lVS6QM3pWaHSbiSZYIFYsC
 eio6PKlWplN0570Wh5A8YShiAH1gUBBYWEpF+Rmb7HUiBIeaDetCvi5mxeAOFB73pe1b
 K0WQ==
X-Gm-Message-State: APjAAAUVyrEUGurpRhwr7n0S/HgaCWGLiThiOepNuPkulzuVFB2Zx24O
 fF28nkqz+hMl3v6yRSy0PlM0atEI/VJplBaRVo4=
X-Google-Smtp-Source: APXvYqw6EkAfFeEOZcW1bX3msw64f5/fs9DOq64tYcN0/EmcF2KEfLpPbHDlUF+sYBRfIbSGBN6JO5z7AiG9qZPNLY0=
X-Received: by 2002:a02:7741:: with SMTP id g62mr3188118jac.3.1571317787672;
 Thu, 17 Oct 2019 06:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
 <CAHCN7xKogdqoLmbbTatPdtLzqz+MKh-jgrHkkCh+YA-bwwOkDA@mail.gmail.com>
 <CAHCN7xJFDrsqzR2H2mNYhKB8iF7xYWb9kM+HdzukjDix461gsg@mail.gmail.com>
 <20191017130519.GC3768303@ulmo>
In-Reply-To: <20191017130519.GC3768303@ulmo>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 17 Oct 2019 08:09:36 -0500
Message-ID: <CAHCN7xJz9vOQneMSZQ6GSqLCROWOHNgdx6NF=Ut5J2S+_aLKzw@mail.gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O2sCm4ci20pr97mr1Ng7lBlOLxIqCQWlGEv5VaAWrpY=;
 b=B0thk5RVDI1Q+DC+eDk29v9uNkCKojLy2NkVnH8swRWAYpZLzVE/JZTv5vqa+OtrUC
 XpX9MXfK0cFVmdrb5iczyt0YLFMU2CUmnmF4ywZrs5dhNirBabE8aVCyWkHqXthW93ob
 CicLaMm9leBEX/+G5jRMMrBtJOaV0ZE8+KHIQBpQyCIbOiZZBBftITS3Rqlhzt+e7THf
 F3nZlVXulQfyB99Z8GrV0jHrDHWe3Tt9M9o5g3aRyrRovJYA3pcoRiYQNssgNYRVJj8N
 tJdFzjKRi4qqVFQW3hF8H0BI59zAGuaS9o1VXgkF/u6zaKZqISvx5p+MCks0H40NXChE
 XU2w==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgODowNSBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDA3OjQw
OjQ3QU0gLTA1MDAsIEFkYW0gRm9yZCB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0
IDc6MzQgQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCA3OjE5IEFNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPiA+
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDc6MjdQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MTA6NTlBTSArMDIw
MCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPiA+IEEgcHJldmlvdXMgY2hhbmdl
IGluIHRoZSBwd20gY29yZSAobmFtZWx5IDAxY2NmOTAzZWRkNiAoInB3bTogTGV0Cj4gPiA+ID4g
PiA+IHB3bV9nZXRfc3RhdGUoKSByZXR1cm4gdGhlIGxhc3QgaW1wbGVtZW50ZWQgc3RhdGUiKSkg
Y2hhbmdlZCB0aGUKPiA+ID4gPiA+ID4gc2VtYW50aWMgb2YgcHdtX2dldF9zdGF0ZSgpIGFuZCBk
aXNjbG9zZWQgYW4gKGFzIGl0IHNlZW1zKSBjb21tb24KPiA+ID4gPiA+ID4gcHJvYmxlbSBpbiBs
b3dsZXZlbCBQV00gZHJpdmVycy4gQnkgbm90IHJlbHlpbmcgb24gdGhlIHBlcmlvZCBhbmQgZHV0
eQo+ID4gPiA+ID4gPiBjeWNsZSBiZWluZyByZXRyaWV2YWJsZSBmcm9tIGEgZGlzYWJsZWQgUFdN
IHRoaXMgdHlwZSBvZiBwcm9ibGVtIGlzCj4gPiA+ID4gPiA+IHdvcmtlZCBhcm91bmQuCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IEFwYXJ0IGZyb20gdGhpcyBpc3N1ZSBvbmx5IGNhbGxpbmcgdGhl
IHB3bV9nZXRfc3RhdGUvcHdtX2FwcGx5X3N0YXRlCj4gPiA+ID4gPiA+IGNvbWJvIG9uY2UgaXMg
YWxzbyBtb3JlIGVmZmVjdGl2ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ20gb25seSBpbnRlcmVz
dGVkIGluIHRoZSBzZWNvbmQgcGFyYWdyYXBoIGhlcmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
cmUgc2VlbXMgdG8gYmUgYSByZWFzb25hYmxlIGNvbnNlbnN1cyB0aGF0IHRoZSBpLk1YMjcgYW5k
IGNyb3MtZWMKPiA+ID4gPiA+IFBXTSBkcml2ZXJzIHNob3VsZCBiZSBmaXhlZCBmb3IgdGhlIGJl
bmVmaXQgb2Ygb3RoZXIgUFdNIGNsaWVudHMuCj4gPiA+ID4gPiBTbyB3ZSBtYWtlIHRoaXMgY2hh
bmdlIGJlY2F1c2UgaXQgbWFrZXMgdGhlIHB3bS1ibCBiZXR0ZXIuLi4gbm90IHRvCj4gPiA+ID4g
PiB3b3JrIGFyb3VuZCBidWdzIDstKS4KPiA+ID4gPgo+ID4gPiA+IFRoYXQncyBmaW5lLCBzdGls
bCBJIHRoaW5rIGl0J3MgZmFpciB0byBleHBsYWluIHRoZSBtb3RpdmF0aW9uIG9mCj4gPiA+ID4g
Y3JlYXRpbmcgdGhpcyBwYXRjaC4KPiA+ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9w
d21fYmwuYwo+ID4gPiA+ID4gPiBpbmRleCA3NDZlZWJjNDExZGYuLmRkZWJkNjJiMzk3OCAxMDA2
NDQKPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiA+ID4gPiA+
ID4gQEAgLTY3LDQwICs2MiwyNyBAQCBzdGF0aWMgdm9pZCBwd21fYmFja2xpZ2h0X3Bvd2VyX29u
KHN0cnVjdCBwd21fYmxfZGF0YSAqcGIpCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICBzdGF0aWMg
dm9pZCBwd21fYmFja2xpZ2h0X3Bvd2VyX29mZihzdHJ1Y3QgcHdtX2JsX2RhdGEgKnBiKQo+ID4g
PiA+ID4gPiAgewo+ID4gPiA+ID4gPiAtICAgc3RydWN0IHB3bV9zdGF0ZSBzdGF0ZTsKPiA+ID4g
PiA+ID4gLQo+ID4gPiA+ID4gPiAtICAgcHdtX2dldF9zdGF0ZShwYi0+cHdtLCAmc3RhdGUpOwo+
ID4gPiA+ID4gPiAtICAgaWYgKCFwYi0+ZW5hYmxlZCkKPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
cmV0dXJuOwo+ID4gPiA+ID4gPiAtCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2h5IHJlbW92ZSB0aGUg
cGItPmVuYWJsZWQgY2hlY2s/IEkgdGhvdWdodCB0aGF0IHdhcyB0aGVyZSB0byBlbnN1cmUgd2UK
PiA+ID4gPiA+IGRvbid0IG1lc3MgdXAgdGhlIHJlZ3VsYXIgcmVmZXJlbmNlIGNvdW50cy4KPiA+
ID4gPgo+ID4gPiA+IEkgaGF2bid0IGxvb2tlZCB5ZXQsIGJ1dCBJIGd1ZXNzIEkgaGF2ZSB0byBy
ZXNwaW4uIEV4cGVjdCBhIHYyIGxhdGVyCj4gPiA+ID4gdG9kYXkuCj4gPiA+Cj4gPiA+IEkgd291
bGQgYWdyZWUgdGhhdCBhIGhpZ2gtbGV2ZWwgZml4IGlzIGJldHRlciB0aGFuIGEgc2VyaWVzIG9m
IGxvdwo+ID4gPiBsZXZlbCBkcml2ZXIgZml4ZXMuICBGb3Igd2hhdCBpdHMgd29ydGgsIHlvdXIg
VjEgcGF0Y2ggd29ya2VkIGZpbmUgb24KPiA+ID4gbXkgaS5NWDZRLiAgSSBjYW4gdGVzdCB0aGUg
VjIgcGF0Y2ggd2hlbiBpdHMgcmVhZHkuCj4gPgo+ID4gSSBtYXkgaGF2ZSBzcG9rZW4gdG9vIHNv
b24uICBUaGUgcGF0Y2ggZml4ZXMgdGhlIGRpc3BsYXkgaW4gdGhhdCBpdAo+ID4gY29tZXMgb24g
d2hlbiBpdCBwcmV2aW91c2x5IGRpZCBub3QsIGJ1dCBjaGFuZ2VzIHRvIGJyaWdodG5lc3MgZG8g
bm90Cj4gPiBhcHBlYXIgdG8gZG8gYW55dGhpbmcgYW55bW9yZS4gIEkgZG9uJ3QgaGF2ZSBhbiBv
c2NpbGxvc2NvcGUgd2hlcmUgSQo+ID4gYW0gbm93LCBzbyBJIGNhbm5vdCB2ZXJpZnkgd2hldGhl
ciBvciBub3QgdGhlIFBXTSBkdXR5IGN5Y2xlIGNoYW5nZXMuCj4gPgo+ID4gVG8gbXkgZXllLCB0
aGUgZm9sbG93aW5nIGRvIG5vdCBhcHBlYXIgdG8gY2hhbmdlIHRoZSBicmlnaHRuZXNzIG9mIHRo
ZSBzY3JlZW46Cj4gPiAgICAgIGVjaG8gNyA+IC9zeXMvZGV2aWNlcy9zb2MwL2JhY2tsaWdodC1s
dmRzL2JhY2tsaWdodC9iYWNrbGlnaHQtbHZkcy9icmlnaHRuZXNzCj4gPiAgICAgIGVjaG8gMiA+
IC9zeXMvZGV2aWNlcy9zb2MwL2JhY2tsaWdodC1sdmRzL2JhY2tsaWdodC9iYWNrbGlnaHQtbHZk
cy9icmlnaHRuZXNzCj4gPiAgICAgIGVjaG8gNSA+IC9zeXMvZGV2aWNlcy9zb2MwL2JhY2tsaWdo
dC1sdmRzL2JhY2tsaWdodC9iYWNrbGlnaHQtbHZkcy9icmlnaHRuZXNzCj4KPiBIaSBBZGFtLAo+
Cj4gY2FuIHlvdSB0cnkgdGhlIGkuTVggUFdNIHBhdGNoIHRoYXQgSSBwb3N0ZWQgZWFybGllciBp
bnN0ZWFkPyBJIHJlYWxseQo+IHRoaW5rIHdlIG5lZWQgdG8gZml4IHRoaXMgaW4gdGhlIFBXTSBk
cml2ZXJzIGJlY2F1c2UgdGhleSBhcmUgYnJva2VuLgo+IHB3bS1iYWNrbGlnaHQgaXMgbm90LiAt
cmMzIGlzIHJlYWxseSBub3QgYSB0aW1lIHRvIHdvcmsgYXJvdW5kIGJyZWFrYWdlCj4gaW4gY29u
c3VtZXJzLgoKSSBkaWQgdHJ5IHlvdXIgcGF0Y2gsIGJ1dCBpdCBkaWQgbm90IGFwcGVhciB0byBt
YWtlIGFueSBkaWZmZXJlbmNlIG9uIG15IGkuTVg2US4KCj4KPiBJZiBteSBwYXRjaCBkb2Vzbid0
IGhlbHAsIGNhbiB5b3UgdHJ5IHJldmVydGluZyB0aGUgb2ZmZW5kaW5nIHBhdGNoPyBJZgo+IHdl
IGNhbid0IGNvbWUgdXAgd2l0aCBhIGdvb2QgZml4IGZvciB0aGUgZHJpdmVycywgcmV2ZXJ0aW5n
IGlzIHRoZSBuZXh0Cj4gYmVzdCBvcHRpb24uCgpJIGFtIGFibGUgdG8gZ2V0IGFuIGltYWdlIGFm
dGVyIHJldmVydGluZyB0aGUgb2ZmZW5kaW5nIHBhdGNoLiAgSSBkaWQKbm90IHRyeSBwbGF5aW5n
IHdpdGggYnJpZ2h0bmVzcyBsZXZlbHMgYWZ0ZXIgcmV2ZXJ0aW5nLgoKCj4KPiBUaGllcnJ5Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
