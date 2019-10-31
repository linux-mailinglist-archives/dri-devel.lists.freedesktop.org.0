Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E2EB984
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 23:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCA56F666;
	Thu, 31 Oct 2019 22:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDBB6F665;
 Thu, 31 Oct 2019 22:03:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 139so8296568ljf.1;
 Thu, 31 Oct 2019 15:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIxs2rD+XtGjv4oIkzDQgq6oUUPBtdaq1rh23U+ann8=;
 b=PX285PTm/sIrTyIaGZSZoNTMhvAQQSZ3OxpZ1c4FwAQf+MBUw704vBAdv5U7B/1oYv
 D19+it23rqyGcb8AKYrjve/VmdPxf8pg5e85b1//DJfrNgtWIdJGxQd5eSwESDK/SHBu
 7Z4Ze4xeJd25iHD0Wfa5i4ZOhqtTRyhUNzBJiD/lKW2w0xYu8GuxUym55USwmEH34BQ+
 V0BFEJFbDnJ8JRdsByCQ0geNw2vZKMi9tBRM7CqXpswKXc2rLRqA2eqOZ7jPSLzutnZ4
 78YdD+khfGkvJ4DUsRp/4OjsazECFqQermpIEJKmCbU01ZVLDXPcU5prSsJEUKRPGZGS
 GSiQ==
X-Gm-Message-State: APjAAAX2mrsd/AYALNh6pFndMQvgyDUTVJg2x4MBRnLjcJZmIDT7pGl/
 4uOZ8Yi89fuEwasdytYo2cqfcJC1Qioy17evETE=
X-Google-Smtp-Source: APXvYqwy81eduPTPvIeLvvmwTLhhEnOifH3m1BykbEAr1yI729VAfwhOatMpM+7ZPEpsLLGb/7Q/Y9R20S90nePlLOI=
X-Received: by 2002:a2e:c51:: with SMTP id o17mr5854585ljd.202.1572559429528; 
 Thu, 31 Oct 2019 15:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191015134012.15165-1-festevam@gmail.com>
 <CAOCk7NpoGA8VmTXSk96VxVtGU2yFs0+n8wyBeQkvwR8HZSOCRQ@mail.gmail.com>
In-Reply-To: <CAOCk7NpoGA8VmTXSk96VxVtGU2yFs0+n8wyBeQkvwR8HZSOCRQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 31 Oct 2019 19:03:59 -0300
Message-ID: <CAOMZO5AnZ2dhgxsLVUSDqSGcPH8T1yOABWrqEniKotONTR29fw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/adreno: Do not print error on
 "qcom, gpu-pwrlevels" absence
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oIxs2rD+XtGjv4oIkzDQgq6oUUPBtdaq1rh23U+ann8=;
 b=QU29OB1Jrh43XVhTGZta1uGjgg0KSdOZG4RqcLIERwOhZA126ggzSyOATgZw+bNuH1
 LAN5A1AkbUVhZ2gTO9a3Nfzt5GlqPEeDSJCLMzSdxMiZ9iRfUJ2KRPaWUDP8VMcHRJGU
 1L3zgw0Tsp5xq7oR9R1b9DNkfiRfXfhHHqidtUYSYWp6c1TWPz0tVWbqO0LZs2RdNml8
 VRZ2hxmuGJ93tEd0ezx+GlQ1OS1zhefJiNLQHHL/kH4XIJCZ2R6E6ikKchVijm9633sL
 BSgjVStJhrQ29z3TVNNm0QZD7U4Ck4uFAgGcVDUwIcUFpHoZc0Avp29CqG6OXTOzy7li
 sHug==
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
Cc: Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MTkgQU0gSmVmZnJleSBIdWdvIDxq
ZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMTUsIDIwMTkg
YXQgNzo0MCBBTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4K
PiA+IEJvb3RpbmcgdGhlIGFkcmVubyBkcml2ZXIgb24gYSBpbXg1MyBib2FyZCBsZWFkcyB0byB0
aGUgZm9sbG93aW5nCj4gPiBlcnJvciBtZXNzYWdlOgo+ID4KPiA+IGFkcmVubyAzMDAwMDAwMC5n
cHU6IFtkcm06YWRyZW5vX2dwdV9pbml0XSAqRVJST1IqIENvdWxkIG5vdCBmaW5kIHRoZSBHUFUg
cG93ZXJsZXZlbHMKPiA+Cj4gPiBBcyB0aGUgInFjb20sZ3B1LXB3cmxldmVscyIgcHJvcGVydHkg
aXMgb3B0aW9uYWwgYW5kIG5ldmVyIHByZXNlbnQgb24KPiA+IGkuTVg1LCB0dXJuIHRoZSBtZXNz
YWdlIGludG8gZGVidWcgbGV2ZWwgaW5zdGVhZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4KPiBTZWVtcyByZWFzb25hYmxlLiAgUmV2
aWV3ZWQtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgoKQW55IGNv
bW1lbnRzLCBwbGVhc2U/CgpKdXN0IHdhbnRlZCB0byBnZXQgcmlkIG9mIHRoaXMgbWlzbGVhZGlu
ZyBlcnJvciBtZXNzYWdlIG9uIGkuTVg1LgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
