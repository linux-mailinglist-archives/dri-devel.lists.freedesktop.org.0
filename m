Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5906CF98
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186AE891A8;
	Thu, 18 Jul 2019 14:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F597891A8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:21:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k10so27403853qtq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 07:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJSn3w0n1j2YNOpQyI6dRVDfYepa6cxkjB5g4haixAc=;
 b=Py/IfKjGXpwA/8nV8FFGLjiZ4cw884B/pcSWQLlkDaEsi+b5rZ4hEhcvIdOAm5QXwT
 cX7YIhGyi9TUpl8cgykZAV9h9UPCXAig1k8YwCMTOuBuyGcrsBDwwRcHmSmVsF4ja3U6
 lN6d5PA/b8F1lSVlzGr+gN2j8z/Q0v3Ml4OMifNfR7gs3Ms0lM1lhHAs/ITsb4d6qdrI
 +HajhmeG/073i8dtAPmEruHU06txDuPX7ntm5TdOTE9iyWJhOX1eBbdPH6wlOiF4U9D/
 WL8jjHb5yyeXvIeRSS5U4pYUQ4I0GwYFEIJ/O8Ny71cjkGFC62q0DlPBhc5YpdzflA0T
 pdDQ==
X-Gm-Message-State: APjAAAXcOjq3EWWMDrm0YtXo4nLOTiKtv1mRdg77qGV01DXK+f17wFBQ
 m0Mr5lTgGG64yvQQBV8U3EzXIFTo0sKsjlt7Pkw=
X-Google-Smtp-Source: APXvYqyOL96qqaAzWb0sRHrwIHNEekEP/dvPqHMZCRaBijvjyR4X1MbBzgSpIkydH6XLPLJr/VEzj62aMg5/VwD3cus=
X-Received: by 2002:a0c:b88e:: with SMTP id y14mr31941430qvf.93.1563459688451; 
 Thu, 18 Jul 2019 07:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
In-Reply-To: <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Jul 2019 16:21:11 +0200
Message-ID: <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDoxNiBQTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPgo+IEhpIEFybmQsCj4KPiBPbiAxOC4wNy4yMDE5IDE1OjQyLCBB
cm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gVXNpbmcgJ2ltcGx5JyBjYXVzZXMgYSBuZXcgcHJvYmxl
bSwgYXMgaXQgYWxsb3dzIHRoZSBjYXNlIG9mCj4gPiBDT05GSUdfSU5QVVQ9bSB3aXRoIFJDX0NP
UkU9eSwgd2hpY2ggZmFpbHMgdG8gbGluazoKPiA+Cj4gPiBkcml2ZXJzL21lZGlhL3JjL3JjLW1h
aW4ubzogSW4gZnVuY3Rpb24gYGlyX2RvX2tleXVwJzoKPiA+IHJjLW1haW4uYzooLnRleHQrMHgy
YjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcKPiA+IGRyaXZlcnMvbWVk
aWEvcmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlvbiBgcmNfcmVwZWF0JzoKPiA+IHJjLW1haW4uYzoo
LnRleHQrMHgzNTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcKPiA+IGRy
aXZlcnMvbWVkaWEvcmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlvbiBgcmNfYWxsb2NhdGVfZGV2aWNl
JzoKPiA+IHJjLW1haW4uYzooLnRleHQrMHg5MGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBp
bnB1dF9hbGxvY2F0ZV9kZXZpY2UnCj4gPgo+ID4gQWRkIGEgJ2RlcGVuZHMgb24nIHRoYXQgYWxs
b3dzIGJ1aWxkaW5nIGJvdGggd2l0aCBhbmQgd2l0aG91dAo+ID4gQ09ORklHX1JDX0NPUkUsIGJ1
dCBkaXNhbGxvd3MgY29tYmluYXRpb25zIHRoYXQgZG9uJ3QgbGluay4KPiA+Cj4gPiBGaXhlczog
NTAyM2NmMzIyMTBkICgiZHJtL2JyaWRnZTogbWFrZSByZW1vdGUgY29udHJvbCBvcHRpb25hbCIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4KPiBQ
cm9wZXIgc29sdXRpb24gaGFzIGJlZW4gYWxyZWFkeSBtZXJnZWQgdmlhIGlucHV0IHRyZWVbMV0u
Cj4KPgo+IFsxXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBS2RBa1JUR1hOYlVz
dUtBU05HTGZ3VXdDN0Fzb2Q5SzViYVlMUFdQVTdFWC00Mi15QUBtYWlsLmdtYWlsLmNvbS8KCkF0
IHRoYXQgbGluaywgSSBvbmx5IHNlZSB0aGUgcGF0Y2ggdGhhdCBjYXVzZWQgdGhlIHJlZ3Jlc3Np
b24sIG5vdAp0aGUgc29sdXRpb24uIEFyZSB5b3Ugc3VyZSBpdCdzIGZpeGVkPwoKICAgICAgQXJu
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
