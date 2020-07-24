Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8310622CF16
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 22:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4406E15B;
	Fri, 24 Jul 2020 20:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7012C6E15B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 20:10:15 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id a21so7898758otq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AkhsDx5M1deiXyYnqvGXpH2Skp0X0LGoNRi0UN9hHgc=;
 b=CnNVrVq4OtbFHxv+FH+udv4VQGqzPuX/bHcFB1rB8uKsLzuwHaaGNDJaFlzZsVw5z1
 2J2wHSqHD4dTWq4sb8kh6P3HipmlSUgjrSPX+KvuNQZWZmJp+nbja9jWv0q9O7pBfFrD
 bwD5oneBCjE8+mkIUbG6q5AluTrT6nWRuY30E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AkhsDx5M1deiXyYnqvGXpH2Skp0X0LGoNRi0UN9hHgc=;
 b=ARWZ8+Ku89LbmsAoGn5x9su64Q9ARuagXpnqbAjkux0f6gyvi/7TcubyD8M5cijc7S
 6MVJBVDPdaYirI4CYhTOLKj4YbEWRdMMKBiMlTGV+UyBYrZqbhcPK0gzIM3DNJu7GU7B
 P/OZ3KZXirqhplCdrI9IzPHXGgaPQpUbeJHSZQkB87VPaYDPxMsyN6cqmKvkmIRWRBEu
 wDnXJCv44+xMWok6nsB95eFc64N5y8xgrvEN7w7umXV2y/CJmKfeG/yBhIgrZjWyToLr
 j2yjlZ1YUTC3mp6ej2IV7blbaNy6btl/ZOx6L/oam3E/34si63hB1WxYy0H+aJSsUmRE
 5fJw==
X-Gm-Message-State: AOAM530UDQUqeTE958N5BxFNy3r/ciL7Cf/EnTiDFcJm5PjdZ/g7zeKj
 0o59WqFlroptYpohSCKz/N5uETSSs9UYpnM0kptztQ==
X-Google-Smtp-Source: ABdhPJzTP3KSbyDXcjXAIUHAR1Y93fRg+1JJPBqjUlhnluqDC8sApFaRDS//u96mt0Ez/7MhvA2MgMtZanPAulclmQQ=
X-Received: by 2002:a9d:f29:: with SMTP id 38mr947831ott.281.1595621414814;
 Fri, 24 Jul 2020 13:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
 <CAKMK7uHBGj-fE17htHOKghsAG15CC_S8vMErPwy0RycM+8Mr7g@mail.gmail.com>
 <20200724200410.GH6112@intel.com>
In-Reply-To: <20200724200410.GH6112@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Jul 2020 22:10:03 +0200
Message-ID: <CAKMK7uE2C_ySwjdqh_92hC4YamoyRUR=dFvH0yZ9u3a=0c=N=w@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Use {} to zero initialize the mode
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMTA6MDQgUE0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAyNCwgMjAyMCBh
dCAwOTo0Mzo0NVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gRnJpLCBKdWwg
MjQsIDIwMjAgYXQgOTowNyBQTSBWaWxsZSBTeXJqYWxhCj4gPiA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPgo+ID4gPiBUaGUgZmlyc3QgbWVtYmVy
IG9mIGRybV9kaXNwbGF5X21vZGUgaXMgbm8gbG9uZ2VyIGEgc3RydWN0dXJlLCBidXQKPiA+ID4g
dGhlIGNvZGUgaXMgc3RpbGwgdXNpbmcge3swfX0gdG8gemVybyBpbml0aWFsaXplIGl0LiBNYWtl
IHRoYXQganVzdAo+ID4gPiB7fSBzbyBpdCB3b3JrcyByZWdhcmRsZXNzIG9mIHdoYXQgbGllcyBp
bnNpZGUuCj4gPiA+Cj4gPiA+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
ID4gPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFz
b25ib2FyZC5jb20+Cj4gPiA+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgo+ID4gPiBGaXhlczogNDJhY2IwNmIwMWIxICgiZHJtOiBwYWhvbGUgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4KPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoLmNoPgo+ID4KPiA+IFRoaXMgbmVlZHMgdG8gZ28g
aW50byBkcm0tbWlzYy1uZXh0LWZpeGVzLCBsb29rcyBsaWtlIE1hYXJ0ZW4gaGFzCj4gPiBhbHJl
YWR5IGZvcndhcmQgaXQgc28geW91IGNhbiBwdXNoIGl0IHRoZXJlLgo+Cj4gVGhhbmtzIGZvciB0
aGUgcmV2aWV3LiBQdXNoZWQuCj4KPiAtPiB2YWNhdGlvbgoKRW5qb3khCgpDaGVlcnMsIERhbmll
bAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
