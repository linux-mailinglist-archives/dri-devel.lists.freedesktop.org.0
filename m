Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6367C8ADF1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4986789FE6;
	Tue, 13 Aug 2019 04:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB14289FE6;
 Tue, 13 Aug 2019 04:42:29 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id r3so1156565vsr.13;
 Mon, 12 Aug 2019 21:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BaW9Qx+88VWTx+9b9qhNUZnDUtPuKjG0s1mMU8Nis6c=;
 b=eI9SzPBPXZln6SBYSgWaw8R4IIoOXqrIATWnIOCByB1qMij3iNVaLpYyYM+VuS3Ick
 M1gPuXsBulY1ZcaSdqvn1QbSGIrb36XiE//Oau/QSYJySroNkTt2yV6Ckvk6kBiEvxTF
 d8mnGaz17KSDTMlL8E+JAgL6LZIt1NhtEVg7QqjvR+8EBvQRqBgjPaqW/P5Xdow6KDvu
 zVIKtlEuFGSYaHSVufbEEsvfNT83lSTqTJdh6h/kKLecjWcvsYk4e4Pw4HJQ6GQixPDf
 elF4jN6oDOL/UDIDQIz/Ly+lvtC7eZX/k09IWx0muPvHHj/YIm9Xfo9jxPGFv1fwlEVd
 NOYA==
X-Gm-Message-State: APjAAAWui/+jhX35xbhogDPCfxX6NGpC03niVCq9WYGv58ZDQjfv/eLs
 RSgCCWEPK0AoSlM7jOxBXEavGxDCO90dxqZTlrs=
X-Google-Smtp-Source: APXvYqydG587D1UEKxjvorzxLvwYX0Xd1Mk7ivJDE3O8H78MedLZXKwQIoRBK+0DRz176mBDQw+KrpvYEzOBVrd7qac=
X-Received: by 2002:a67:f9d9:: with SMTP id c25mr2875459vsq.76.1565671348875; 
 Mon, 12 Aug 2019 21:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190807234709.6076-1-lyude@redhat.com>
In-Reply-To: <20190807234709.6076-1-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 13 Aug 2019 14:42:17 +1000
Message-ID: <CACAvsv760Jtzubm2faimEY1z1tfNPBcsOJg6Ns0wL8W-9fxRXw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/nouveau: CRTC Runtime PM ref tracking fixes
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BaW9Qx+88VWTx+9b9qhNUZnDUtPuKjG0s1mMU8Nis6c=;
 b=lvJtcx90FAaGPEu/XW+0vvu8TV1NTazPK5Iq69mb8iVFc4+umjAsRxSE5hH0wGEy/H
 hHuZdHg5i2ZwVSNje4zoKdBZ11PKnY5CZ3y/vR4z8g0sdiuQvKboOdszeql702ttQ115
 cxTriffFWVhKumvp9sct7baljQnsIxxKZzzQHAYVDoqZW8eA7WkH1kdeb4ccHRIJaiJt
 IxoEhlY65n+Q5Psat2W/qyZIcq90sf+tBwpwZ7UCOGbawDOMbxovmufh4K14W2h4qQmt
 CdJxG9Hy79mzZCx92pEe+LtgfvrS7JJEmcAzy9ibUM1T2Jeo+RYjmWzTttz2Ur7EWirM
 eV2Q==
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA4IEF1ZyAyMDE5IGF0IDA5OjQ3LCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PiB3cm90ZToKPgo+IEp1c3Qgc29tZSBydW50aW1lIFBNIGZpeGVzIGZvciBzb21lIG11Y2ggbGVz
cyBub3RpY2VhYmxlIHJ1bnRpbWUgUE0gcmVmCj4gdHJhY2tpbmcgaXNzdWVzIHRoYXQgSSBnb3Qg
cmVtaW5kZWQgb2Ygd2hlbiBmaXhpbmcgc29tZSB1bnJlbGF0ZWQgaXNzdWVzCj4gd2l0aCBub3V2
ZWF1Lgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAqIERvbid0IGZpeCBDUlRDIFJQTSBjb2RlIGlu
IGRpc3BudjA0LCBiZWNhdXNlIGl0J3Mgbm90IGFjdHVhbGx5IGRvaW5nCj4gICBhbnl0aGluZyBp
biB0aGUgZmlyc3QgcGxhY2UuIEp1c3QgZ2V0IHJpZCBvZiBpdC4gLSBpbWlya2luCj4KPiBMeXVk
ZSBQYXVsICgyKToKPiAgIGRybS9ub3V2ZWF1L2Rpc3BudjA0OiBSZW1vdmUgcnVudGltZSBQTQo+
ICAgZHJtL25vdXZlYXUvZGlzcG52NTA6IEZpeCBydW50aW1lIFBNIHJlZiB0cmFja2luZyBmb3Ig
bm9uLWJsb2NraW5nCj4gICAgIG1vZGVzZXRzCj4KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52MDQvY3J0Yy5jIHwgNTEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzOCArKysrKysrKystLS0tLS0tLS0K
PiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCAgIHwgIDMgLS0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkKRm9yIHRoZSBz
ZXJpZXM6ICBBY2tlZC1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKPgo+IC0t
Cj4gMi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
