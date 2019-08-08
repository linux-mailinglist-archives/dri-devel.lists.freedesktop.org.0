Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66816873AB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AFF6ED25;
	Fri,  9 Aug 2019 08:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED178904A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 16:44:43 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z17so2746239otk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 09:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdKChiO6toradfdA1i6Jwh7yiUgV/BOpjgptiTpJXTc=;
 b=oFN7dZv1F6fCxXm/peLYonBePj2KKYPTfj4mopr5jFk/bK093mMdVZ8Vx9qcJMQGfA
 W/YQnDmmKL43nm3IRLXhjlzvfzZERToZyZm1wE1KinXjmfnu1PLGXFLS8o21j79Z9sNF
 jhZkZoSWxbu7DOhZNfL7Z7jzCS7WA0oMYjdVddX94fJ1bPiLE1xrFsxrbt9Qcm88bgeI
 +3g9XM6ucdgrzobgLxp/XFtWOF9ht2xqFb1OR89RBQHgE49DEdTNo71uva6qPvPyR4Ad
 T3nS3jIzLCANAh7S2rW/x0WRyov6IBDy7A6c2inYQXQiqvmka6AYqZtiXY+cRkjURy4r
 N8pg==
X-Gm-Message-State: APjAAAWUbFl82diQ3q5u/7l+AMwst4U0lh/2GJ00+G/31RmJTfD0AoTZ
 v7GBnQjxN8EEC7FM3zVw6ReLgUGjCd1T3wn//r4rkw==
X-Google-Smtp-Source: APXvYqzEoYGvoalYE9dVirABjTjcHh9LZvDh0CA4mUt+tKEDBTe88c3+j/qr32L9yYNNrYvPSZymRl+NG991z6cfJJI=
X-Received: by 2002:a02:c549:: with SMTP id g9mr17312340jaj.14.1565282683214; 
 Thu, 08 Aug 2019 09:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
 <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
 <20190807123807.GD54191@lakrids.cambridge.arm.com>
 <CAJs_Fx5xU2-dn3iOVqWTzAjpTaQ8BBNP_Gn_iMc-eJpOX+iXoQ@mail.gmail.com>
 <20190807164958.GA44765@lakrids.cambridge.arm.com>
 <CAJs_Fx71T=kJEgt28TWqzw+jOahSbLQynCg83+szQW7op4xBkQ@mail.gmail.com>
 <20190808075947.GE30308@lst.de>
In-Reply-To: <20190808075947.GE30308@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 8 Aug 2019 09:44:32 -0700
Message-ID: <CAJs_Fx5fJ31CsFODBgBbhcCvoxSX_D1NHDjQs4LtJ_0GwuxMVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mdKChiO6toradfdA1i6Jwh7yiUgV/BOpjgptiTpJXTc=;
 b=nN25bX7pb6egOKBjU+l2ju89PKwN/5apoENIzX1yELI4kWtTHv02FC8vmZ5UY5HgdY
 N0hM9lnejemrdoHWz7YV2JwiOcYaVcO0RE4nBEwv8TFYoMqpzNn1u7FJpugxUj/FB+rB
 qpQ6yLSPsVmThmT5atHi74jQNdieykgqiXoGU=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAxMjo1OSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMDozMDowNEFNIC0wNzAw
LCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiBTbywgd2UgZG8gZW5kIHVwIHVzaW5nIEdGUF9ISUdIVVNF
Uiwgd2hpY2ggYXBwZWFycyB0byBnZXQgcGFzc2VkIHRocnUKPiA+IHdoZW4gc2htZW0gZ2V0cyB0
byB0aGUgcG9pbnQgb2YgYWN0dWFsbHkgYWxsb2NhdGluZyBwYWdlcy4uIG5vdCBzdXJlCj4gPiBp
ZiB0aGF0IGp1c3QgZW5kcyB1cCBiZWluZyBhIGhpbnQsIG9yIGlmIGl0IGd1YXJhbnRlZXMgdGhh
dCB3ZSBkb24ndAo+ID4gZ2V0IHNvbWV0aGluZyBpbiB0aGUgbGluZWFyIG1hcC4KPiA+Cj4gPiAo
QmVhciB3aXRoIG1lIHdoaWxlIEkgInBhZ2UiIHRoaXMgYWxsIGJhY2sgaW4uLiBsYXN0IHRpbWUg
SSBkdWcgdGhydQo+ID4gdGhlIHNobWVtIGNvZGUgd2FzIHByb2JhYmx5IHByZS1hcm12OCwgb3Ig
YXQgbGVhc3QgYmVmb3JlIEkgaGFkIGFueQo+ID4gYXJtdjggaHcpCj4KPiBHRlBfSElHSFVTRVIg
YmFzaWNhbGx5IGp1c3QgbWVhbnMgdGhhdCB0aGlzIGlzIGFuIGFsbG9jYXRpb24gdGhhdCBjb3Vs
ZAo+IGRpcCBpbnRvIGhpZ2htZW0sIGluIHdoaWNoIGNhc2UgaXQgd291bGQgbm90IGhhdmUgYSBr
ZXJuZWwgbWFwcGluZy4KPiBUaGlzIGNhbiBoYXBwZW4gb24gYXJtICsgTFBBRSwgYnV0IG5vdCBv
biBhcm02NC4KCkp1c3QgYSBkdW1iIHF1ZXN0aW9uLCBidXQgd2h5IGlzICphbGwqIG1lbW9yeSBp
biB0aGUgbGluZWFyIG1hcCBvbgphcm02ND8gIEl0IHdvdWxkIHNlZW0gdXNlZnVsIHRvIGhhdmUg
YSBzb3VyY2Ugb2YgcGFnZXMgdGhhdCBpcyBub3QgaW4KdGhlIGxpbmVhciBtYXAuCkkgZ3Vlc3Mg
aXQgaXMgbWFwcGVkIGFzIGh1Z2UgcGFnZXMgKG9yIHNvbWV0aGluZyBsYXJnZXIgdGhhbiA0ayBw
YWdlcyk/CgpBbnkgcmVjb21tZW5kZWQgcmVhZGluZyB0byB1bmRlcnN0YW5kIGhvdy93aHkgdGhl
IGtlcm5lbCBhZGRyZXNzIHNwYWNlCmlzIHNldHVwIHRoZSB3YXkgaXQgaXMgKHNvIEkgY2FuIGFz
ayBmZXdlciBkdW1iIHF1ZXN0aW9ucyk/CgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
