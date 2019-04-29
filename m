Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5DAE515
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 16:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC20892EE;
	Mon, 29 Apr 2019 14:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C7C892BD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 14:44:53 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id v143so6096049itc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XMGdoAytJZYLIEjS5YuwMYRgJWQI6ikHtyLu0eBdrg=;
 b=A4tk9HW1Wa8XWx3BhjuIPSvyhjTrIo78dGTBzyggd3bEdwAbPQEzLWmNZL8fuHof5e
 y349oNNlBQqZM23fPf6/sCDiWbXJXE1WEtuBSl1xjsV6XL4mfPzPvktSqS3sWYcmfGGU
 YspFsJquSnBWiKV6xcoJraY133bC+rHq3eaKMPWXNxPFjPKIh7r5bZD3FjjM5YjW4ybs
 9euvdqzp0LRQJ1XcLr2yOoXktgk7GoVPn7Ffd5/WOsAOf+2oHeW60eZuOA9wKEsCoM4x
 3yYVdXtq9krstBB5LS3jAhKTXMihm3oW6AUFD4ka5H6aD2mmrJjNdLKZaUPI8Jeb+K/z
 qMHQ==
X-Gm-Message-State: APjAAAWMp9Pkn3c1ifzNzK+A2xSh8xkGKIKrVUWiuW3Q9O/6pNfZ/y7N
 N8uhsQL/NCKVEHbWqYopdjNdUUuF4+3aqmaW6sw8bQ==
X-Google-Smtp-Source: APXvYqyC+k0ZQbGHt6LZUZL+iV+YTOgPi+kmdEsi7UKxu3MuNzurrBR7OzXmdy7mQ47RnHA3m349CFEdQv66aJzM/2c=
X-Received: by 2002:a24:6f48:: with SMTP id x69mr5454748itb.117.1556549092746; 
 Mon, 29 Apr 2019 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190426053324.26443-1-kraxel@redhat.com>
 <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
 <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
 <CAKMK7uFB8deXDMP9cT634p_dK5LsM37R1v_vGhAEY1ZLZ+WBVA@mail.gmail.com>
 <20190429143757.yljjfsgobhi23xnb@sirius.home.kraxel.org>
In-Reply-To: <20190429143757.yljjfsgobhi23xnb@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 29 Apr 2019 16:44:40 +0200
Message-ID: <CAKMK7uE_+-pFuVrqznj9ZbRxwyNM9mRhoY-y4xCBjjY9Z-sNDg@mail.gmail.com>
Subject: Re: [Spice-devel] [PATCH] Revert "drm/qxl: drop prime import/export
 callbacks"
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1XMGdoAytJZYLIEjS5YuwMYRgJWQI6ikHtyLu0eBdrg=;
 b=ebLoXPCvsVtjVKlYnuDaoE/vTcZEjFgtCNZy/GJ9RM7CqdGpbdNpyJ/MGlHiTn8mwU
 cNsqm35xFbA0XbkywCTWXXW+87WMdZDdAr99EbknWBCCfipowQkXrsgbO/O6/TKeHRKm
 YCZ4hxNICRW4XSQ9d5gCdAf72YEQsAM9IZEJc=
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgNDozOCBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+IE1vcmUgdXNlZnVsIHdvdWxkIGJlIHNv
bWUgd2F5IHRvIHNpZ25hbCB0aGlzIHNlbGYtcmVpbXBvcnQgY2FwYWJpbGl0eQo+ID4gPiB0byB1
c2Vyc3BhY2Ugc29tZWhvdy4gIFNlZSBEUk1fUFJJTUVfQ0FQX0xPQ0FMIHBhdGNoLgo+ID4KPiA+
IFVzZXJzcGFjZSBpcyBzdXBwb3NlZCB0byB0ZXN0IHdoZXRoZXIgaW1wb3J0L2V4cG9ydCB3b3Jr
cyBmb3IgYQo+ID4gc3BlY2lmaWMgY29tYm8sIG5vdCBibGluZGx5IGFzc3VtZSBpdCBkb2VzIGFu
ZCB0aGVuIGtlZWwgb3Zlci4gSSB0aGluawo+ID4gd2UgbmVlZCB0byBmaXggdGhhdCwgbm90IGFk
ZCBtb3JlIGZsYWdzIC0gdGhlcmUncyBsb3RzIG9mIHJlYXNvbnMgd2h5Cj4gPiBhIGdpdmVuIHBh
aXIgb2YgZGV2aWNlcyBjYW4ndCBzaGFyZSBidWZmZXJzIChlLmcuIGFsbCB0aGUgY29udGlndW91
cwo+ID4gYWxsb2NhdGlvbnMgc3R1ZmYgb24gc29jcykuCj4KPiBPay4gIExldHMgc2NyYXRjaCB0
aGUgRFJNX1BSSU1FX0NBUF9MT0NBTCBpZGVhIHRoZW4gYW5kIGJsYW1lIHVzZXJzcGFjZQo+IGlu
c3RlYWQuCj4KPiA+ID4gUmlnaHQgbm93IEkgaGF2ZSB0aGUgY2hvaWNlIHRvIHNldCBEUk1fUFJJ
TUVfQ0FQX3tJTVBPUlQsRVhQT1JUfSwgaW4KPiA+ID4gd2hpY2ggY2FzZSBzb21lIHVzZXJzcGFj
ZSBhc3N1bWVzIGl0IGNhbiBkbyBjcm9zcy1kcml2ZXIgZXhwb3J0L2ltcG9ydAo+ID4gPiBhbmQg
dHJpcHMgb3ZlciB0aGF0IG5vdCB3b3JraW5nLiAgT3IgSSBkbyBub3Qgc2V0Cj4gPiA+IERSTV9Q
UklNRV9DQVBfe0lNUE9SVCxFWFBPUlR9LCB3aGljaCBicmVha3MgRFJJMyAuLi4KPiA+Cj4gPiBZ
ZWFoIHRoYXQncyBub3QgYW4gb3B0aW9uLgo+Cj4gR29vZC4gIENhbiBJIGdldCBhbiBhY2sgZm9y
IHRoaXMgcGF0Y2ggdGhlbiwgYXMgaXQgdW5icmVha3MgRFJJMyB3aXRoIHF4bD8KCk9oIHN1cmUs
IGFja2VkLWJ5OiBtZS4gU29ycnkgZm9yZ290IHRvIHN1cHBseSB0aGF0IC4uLgotRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEg
KDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
