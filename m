Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CF878EB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 13:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1626ED43;
	Fri,  9 Aug 2019 11:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B596ED43
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 11:43:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u190so7687573qkh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 04:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVKEn1uhwnct32QQNQWKMMQwz1IKox/lIkY41QXr3n4=;
 b=Df5LGc5iQ6rHdu0m6GtNIz/8rXAWvX5i49PLpZ6IWQGudwn8BcZofOmV5sXZEnWXyA
 J6p1V+iM69+L0LolnBdBeUWEpHM8/JHK/TeaUsP/JbgRAAjtC3qTrbrIkp2LN9dGxaXm
 Uz5P/mAW4/QPejYKWAcc8hZVbXvFv1KIwmcIUmik+Oqk0JIOsp/Mzyz3hrmHYPNayCi6
 Ix118SVA74SwvXY80iZl5i9w1dW42ACiwjcWscMdL1iKFwId6XQsFhGD4jGNov7PWMj9
 HhSe/smq2aEsqO5xIOzeiPi9GOAxPko8zOJxQ3V/FCSBh63jEOnlUtg+snnUKPoMfp9h
 svog==
X-Gm-Message-State: APjAAAXA9odm3bQ+PJ4yFBsfGMqPNF3wxfFsjSEPXW4/YAThe7qR1184
 sK+BBmtAy1CvForbgXx7FSAOtuBMg3O+JAKOO/M=
X-Google-Smtp-Source: APXvYqz3y2NTzxkuXgdthyLbml49Ah52Sn2rqR//B9FnkAzFwcen/MazMdX5ZFS3FoRo2xISosV/96/4q4XOkHiRGAw=
X-Received: by 2002:a05:620a:b:: with SMTP id
 j11mr17853054qki.352.1565351009257; 
 Fri, 09 Aug 2019 04:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190808212234.2213262-1-arnd@arndb.de>
 <CGME20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f@epcas2p4.samsung.com>
 <20190808212234.2213262-3-arnd@arndb.de>
 <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
In-Reply-To: <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Aug 2019 13:43:13 +0200
Message-ID: <CAK8P3a3grFEGr33s327yNMabK5=1kCJc3k7y55dhzQx9sTvkyQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] ARM: omap1: make omapfb standalone compilable
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgOSwgMjAxOSBhdCAxOjMyIFBNIEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oK
PGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gT24gOC84LzE5IDExOjIyIFBNLCBB
cm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gVGhlIG9tYXBmYiBkcml2ZXIgaXMgc3BsaXQgaW50byBw
bGF0Zm9ybSBzcGVjaWZpYyBjb2RlIGZvciBvbWFwMSwgYW5kCj4gPiBkcml2ZXIgY29kZSB0aGF0
IGlzIGFsc28gc3BlY2lmaWMgdG8gb21hcDEuCj4gPgo+ID4gTW92aW5nIGJvdGggcGFydHMgaW50
byB0aGUgZHJpdmVyIGRpcmVjdG9yeSBzaW1wbGlmaWVzIHRoZSBzdHJ1Y3R1cmUKPiA+IGFuZCBh
dm9pZHMgdGhlIGRlcGVuZGVuY3kgb24gY2VydGFpbiBvbWFwIG1hY2hpbmUgaGVhZGVyIGZpbGVz
Lgo+ID4KPiA+IFRoZSBpbnRlcnJ1cHQgbnVtYmVycyBpbiBwYXJ0aWN1bGFyIGhvd2V2ZXIgbXVz
dCBub3QgYmUgcmVmZXJlbmNlZAo+ID4gZGlyZWN0bHkgZnJvbSB0aGUgZHJpdmVyIHRvIGFsbG93
IGJ1aWxkaW5nIGluIGEgbXVsdGlwbGF0Zm9ybQo+ID4gY29uZmlndXJhdGlvbiwgc28gdGhlc2Ug
aGF2ZSB0byBiZSBwYXNzZWQgdGhyb3VnaCByZXNvdXJjZXMsIGlzCj4gPiBkb25lIGZvciBhbGwg
b3RoZXIgb21hcCBkcml2ZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+Cj4KPiBGb3IgZmJkZXYgcGFydDoKPgo+IEFja2VkLWJ5OiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpUaGFua3MgZm9y
IHRha2luZyBhIGxvb2suCgo+IFsgSXQgc2VlbXMgdGhhdCBhZGRpbmcgb2Ygc3RhdGljIGlubGlu
ZSBmb3Igb21hcF9zZXRfZG1hX3ByaW9yaXR5KCkKPiAgIHdoZW4gQVJDSF9PTUFQPW4gc2hvdWxk
IGJlIGluIHBhdGNoICM5IGJ1dCB0aGlzIGlzIGEgbWlub3IgaXNzdWUuIF0KClRoYXQgd291bGQg
aGF2ZSBiZWVuIG9rIGFzIHdlbGwsIGJ1dCBoYXZpbmcgdGhlIGFkZGl0aW9uIGhlcmUgd2FzCmlu
dGVudGlvbmFsIGFuZCBzZWVtcyBtb3JlIGxvZ2ljYWwgdG8gbWUgYXMgdGhpcyBpcyB3aGVyZSB0
aGUgaGVhZGVycwpnZXQgbW92ZWQgYXJvdW5kLgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
