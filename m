Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4481FA12
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 20:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBF189152;
	Wed, 15 May 2019 18:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A62891CD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 18:37:14 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o7so893091qtp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SFNuIJemdTLO0xp4SS7eD7mTRt2jx19bhUfAq2FJGCg=;
 b=eqAzeYNoUjz5WyQDQaYKvfMit435FTAvPgPEDLtnPyQmTk6ECT4ONkTXUfafEtCKH1
 CSS5vND9wQMllw5UGQMzqda8hScug9+HnIXpC9BUoh5RGZatAQcb7C/Mh0uYJXVi+cjx
 xBkF1U0Ne1IqJSI5Z2uocEKLduWbMk3BYW1rYUWH27RHkMeityeo6FD1Bvp7UzCKX3hq
 UXuj3jU/xNMjSE2v0/BNtY0i8+8L8zp9nw8TnoDCYtewI7fI3ZpwSNiJZ9we4w2E8wGN
 ryrse9GVTQPmmF4pRPp4n/iN12NrOEfiwMTS54I4uUdoPLEPf77OtvL/drHjRnwxkCUn
 78QQ==
X-Gm-Message-State: APjAAAXsnI9qkZp+/aR7/7MeCyzjV6sjanRlI2Cx2gdvZ3ZDl101Ll4C
 Zgv0K/kkhBoMMuPibQ1qjwOqlw==
X-Google-Smtp-Source: APXvYqxMIfZBBwCvYBUULJBhCR4PNZQyPokNd7gubEnQIC9pIP9wcs/fACEqVBe4sfNi7KMbt+/qXg==
X-Received: by 2002:ac8:534d:: with SMTP id d13mr13916550qto.217.1557945433945; 
 Wed, 15 May 2019 11:37:13 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b19sm1396281qkk.51.2019.05.15.11.37.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 11:37:13 -0700 (PDT)
Date: Wed, 15 May 2019 14:37:12 -0400
From: Sean Paul <sean@poorly.run>
To: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Remove duplicate header
Message-ID: <20190515183712.GZ17077@art_vandelay>
References: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SFNuIJemdTLO0xp4SS7eD7mTRt2jx19bhUfAq2FJGCg=;
 b=eEBO9MSQNtsb6zqoHTndPS0B0pR8E0sMp9T7yHW6qouW7Epg5SAzibiwdCmR3ibNGl
 D/S1jOoC2CAkyYprOIQpXzrm0BT5s0wI2sn0Gix9ARpYci3hGGmbmMyqd9it3GwAEj7C
 CiPRdXhZFO7FQKxofCxcAcaW6/fdl4oUvWmlMZSqXpiRT0sTARPesrhuPgFwsZ/HWvIr
 Nkkx6vFla5YJskiuqMxOiGm+DTXTF5AslGYsE1aXObkoOPMRkJ81w7W9Ne791MKUj9aU
 +saNoD9teyzZjIyA/28tOSqexFL/GyVjCBQCAOer25Gs869VftGpTli5Am3dCRe1qaQh
 NE1g==
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, jrdr.linux@gmail.com, freedreno@lists.freedesktop.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6NTc6MjhQTSArMDUzMCwgU2FieWFzYWNoaSBHdXB0
YSB3cm90ZToKPiBSZW1vdmUgZHB1X2ttcy5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBv
bmNlCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FieWFzYWNoaSBHdXB0YSA8c2FieWFzYWNoaS5saW51
eEBnbWFpbC5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIEkndmUgYXBwbGllZCBpdCB0byBk
cm0tbWlzYy1uZXh0LWZpeGVzLgoKTm90ZSBmb3IgbmV4dCB0aW1lOiBUaGUgcGF0Y2ggZGlkbid0
IGFwcGx5IGNsZWFubHkgc2luY2UgZHB1X2RiZy5oIGhhcyBiZWVuCnJlbW92ZWQgdXBzdHJlYW0u
IEluIGZ1dHVyZSBwbGVhc2UgbWFrZSBzdXJlIHlvdXIgcGF0Y2hlcyBhcHBseSBjbGVhbmx5IGFu
ZAphdCBsZWFzdCBidWlsZCBhZ2FpbnN0IHVwc3RyZWFtLgoKVGhhbmtzIGFnYWluIQoKU2VhbgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfaHdfbG0uYwo+IGluZGV4IGRiZTQ4ZTAwLi5kNjkyZGVlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19sbS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKPiBAQCAtMTYsNyArMTYs
NiBAQAo+ICAjaW5jbHVkZSAiZHB1X2h3X2xtLmgiCj4gICNpbmNsdWRlICJkcHVfaHdfbWRzcy5o
Igo+ICAjaW5jbHVkZSAiZHB1X2RiZy5oIgo+IC0jaW5jbHVkZSAiZHB1X2ttcy5oIgo+ICAKPiAg
I2RlZmluZSBMTV9PUF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgMHgwMAo+ICAjZGVmaW5l
IExNX09VVF9TSVpFICAgICAgICAgICAgICAgICAgICAgICAweDA0Cj4gLS0gCj4gMi43LjQKPiAK
Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
