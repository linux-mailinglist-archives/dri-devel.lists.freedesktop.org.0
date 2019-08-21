Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8597903
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50CA6E2EB;
	Wed, 21 Aug 2019 12:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DC26E2EB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:16:14 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f17so1827545otq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 05:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JM8+7Ec7A9MDZFRreGMwQwNOR9ozJM3D4xQgDyyrkY8=;
 b=qmLZImePJsw8tXXxLUSWWTdv5qdG3TSzgDzs+N02zFAoWmrhKhq3ZsUeoiz132SFs0
 33GBfKqKmK0pJQwmTknTKa06QztNr5Mc/3DBDmGHeAopspQ1TwSuPl/TTszNZw5MYTmS
 4d3S+dRxWdEfW535flQyjrzpVIaM2zzd7yhynU+T6jH1f5/8Q2fRK75jX/PPjMKzqWOo
 YBH3DCF87LuW4Q7rZfJD+QlV/1qmQT2x4lmJWWG3JO/ZFnRWNnC0IrE2VDaNqaO9YbTI
 6eVPfWGSz1C/kPhOWlb+TusQSP1efVIi5xmNpD03te+WWaTMMk88YbZL0NJCtwR6cvuu
 tFAw==
X-Gm-Message-State: APjAAAUw5Cer2zLjxHvX4wzS88ZPqxYdqsAKi3ntLjDhJupq5B2XOCBK
 cy2/425TApIy//BBPV5QJQ4NrNEcQQIIYGGR5x0=
X-Google-Smtp-Source: APXvYqwp73cyWDJ24i8HRDQI70zVub6GzQTzwRLYNV8E2VXhehGjEEulwajAQyMYsZSNEAJiaw5euZ2SPNlpndY3P2g=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr26414408otk.145.1566389774076; 
 Wed, 21 Aug 2019 05:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20190706140746.29132-4-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Aug 2019 14:16:02 +0200
Message-ID: <CAMuHMdVXQaqFg-m3a4xTiKLWQLz+itKQgGEBAQpHtG+MkTNzQw@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] arm64: renesas: Update 'vsps' property
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdWwgNiwgMjAxOSBhdCA0OjA3IFBNIEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4gd3JvdGU6Cj4gVXBkYXRlIHRoZSAndnNwcycgcHJvcGVydHkgaW4gdGhl
IFItQ2FyIEdlbjMgU29DIGRldmljZSB0cmVlIGZpbGVzIHRvCj4gbWF0Y2ggd2hhdCdzIGluIGlu
IHRoZSBkb2N1bWVudGF0aW9uIGV4YW1wbGUuCgpkb3VibGUgaW4gKG5vIHdvcnJpZXMsIEknbGwg
Zml4IHRoYXQgdXAgbXlzZWxmKQoKPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29w
bytyZW5lc2FzQGptb25kaS5vcmc+CgpUaGFua3MhCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KaS5lLiB3aWxsIHF1ZXVlIGluIHJlbmVz
YXMtZGV2ZWwgZm9yIHY1LjQuCgpCVFcsIGFueSBwbGFucyB0byBhZGQgY2hhbm5lbCBpbmRpY2Vz
IHRvIHRoZSB2c3BzIHByb3BlcnRpZXMgaW4gdGhlCnJlbWFpbmluZyBEVFMgZmlsZXM/CgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
