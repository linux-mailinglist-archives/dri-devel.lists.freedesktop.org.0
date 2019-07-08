Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D446258A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326FF89F8B;
	Mon,  8 Jul 2019 16:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B793B89F77;
 Mon,  8 Jul 2019 16:01:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f17so59525wme.2;
 Mon, 08 Jul 2019 09:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYWg9eN+m+wldCSHeIV4qzWDTAdhKCvmjMFIfFa5h/4=;
 b=p7G4KiANay1Jp7Rn/DAVZ7oqQvEJWQCbmVKQBnSzz00l3O8vNvnEy6ECAXi4dSQF7G
 dKG1t5r4fyPOzRsm741Ip8nal2Eyp8/ep7GTFWL7ZJIuF3f0IE9s69ryv0/VaUGZXtkY
 1054aE9bMNK9dkXLyZHacINwkuPBkr+5AwurwIisqKxpX1b7/icELU/XfCSZuMWWbTvr
 2FcTObHkcgfGDDzX4Jlt3fRGOISmSpP9Rjsb1OrePSb32JGCkeaOQ5Hnv+EbzQEzpVQ9
 cIRMSceAyjaKg/jpoqqVxAazSeLcj4+Vs9kMQDJWyZLd5f8egUOsOi6a69mjTm1iG9JD
 jhtQ==
X-Gm-Message-State: APjAAAUlVAXDA1BDk/Iq66Kivs1j9Q78mMaQ24Dy/SuR7bbibSjJL9JJ
 mKpBJMirLA+XRNHTaSkm14aBEn33rlVUwcgBfeE=
X-Google-Smtp-Source: APXvYqwKMWD9C6jvF+OOCj1yu/fb/XO5ZPKTe7eCqQnlKKzJMMvTIcf1awrT4RxJhwYDe8ro3c7vV54SVyzExdTVc+0=
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr17417241wmi.141.1562601687213; 
 Mon, 08 Jul 2019 09:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190708135329.694852-1-arnd@arndb.de>
In-Reply-To: <20190708135329.694852-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 12:01:15 -0400
Message-ID: <CADnq5_P1MC9t5szFNF2TeDDZH6gH+nXrZsMfr785uJKBBmz8nw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: dcn20: include linux/delay.h
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DYWg9eN+m+wldCSHeIV4qzWDTAdhKCvmjMFIfFa5h/4=;
 b=NdAHOfp2BPDWDs0WtzIKNU0sBWcsos0V2dOeOXhRHiHvx/GiIpr+TSD57bmtMgPL7V
 /c0I02zdt3o9Z/zE7rkyCixZUVABFGKYKhRxhuHiwwa93comrLHjqMK64r8Y7d7MCmAY
 If3OdYujEgZI8vXmrHa81Qh2G0HtA1IXelTQniP2SMWkBYHxaFnrpL3tDkh//rcstX2s
 3sZtEXFcQK1Pf3Hew3vqnAqYEmww5iw92rsb09yrkOFYrjl1piJ4AdrKVWyF//MK6QNe
 Vylqg3seyyk6a60m5otWXefRogseTfGvKBT1QXXYaH0SEsaczg4glVe3u+i0Zqg22bfy
 HznQ==
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA5OjUzIEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gV2l0aG91dCB0aGlzIGhlYWRlciwgd2UgZ2V0IGEgY29tcGlsZXIgZXJy
b3IgaW4gc29tZSBjb25maWd1cmF0aW9uczoKPgo+IC4uLi9kYy9kY24yMC9kY24yMF9od3NlcS5j
OiBJbiBmdW5jdGlvbiAnZGNuMjBfaHdzc193YWl0X2Zvcl9ibGFua19jb21wbGV0ZSc6Cj4gLi4u
L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmM6MTQ5MzozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24gJ3VkZWxheScgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCj4KPiBOb3RlOiB0aGUgdXNlIG9mIHVkZWxheSBpdHNlbGYgbWF5IGJlIHByb2JsZW1h
dGljLCBhcyBjYW4gb2NjdXB5Cj4gdGhlIENQVSBmb3IgMjAwbXMgaW4gYSBidXN5LWxvb3AgaGVy
ZS4KPgo+IEZpeGVzOiA3ZWQ0ZTYzNTJjMTYgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBEQ04yIEhX
IFNlcXVlbmNlciBhbmQgUmVzb3VyY2UiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwo+IGluZGV4IDRiMGQ4YjlmNjFkYS4u
NjkyNWQyNWQyNDU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKPiBAQCAtMjIsNiArMjIsNyBAQAo+ICAgKiBBdXRob3Jz
OiBBTUQKPiAgICoKPiAgICovCj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+Cj4gICNpbmNs
dWRlICJkbV9zZXJ2aWNlcy5oIgo+ICAjaW5jbHVkZSAiZG1faGVscGVycy5oIgo+IC0tCj4gMi4y
MC4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
