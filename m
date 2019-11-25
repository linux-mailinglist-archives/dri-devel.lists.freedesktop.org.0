Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1936108BB5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 11:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBC16E0B7;
	Mon, 25 Nov 2019 10:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B979A6E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 10:30:53 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a14so12611834oid.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 02:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZhTG7JrTxVrl8HklVVpBm1b8hN58Dtj6eIptpC87Go=;
 b=XsQ68hnt7qgMk2k4EOT/Naqy+u+IlKDPrQ8QjqpTmIlQS+ZH7Q09Gfde1wnc2Meee7
 hqhDfQvGsCJhXRIcOBMQ+2hgFdmOyhCzp4Htv2+zjiF0qdiynSZc/gpPr+ujJc/xfcqK
 74PGh0Fk7JMVeUi7hG+Mr5ARhl0hWigIlaTGoGbbOusJNEh36WI4vWLrOAtj4bUKxf5u
 mtQYCe7R+x0/37Va0wuyLdDpzTP3ikjk9S2d9zGC2viMiy4igXGxyh/H3T/z5hsN+8x9
 E2OqxaAFYCZfjRjSFQAF037BNTY0HQSiHKITP1f5+bJV98cb6o1mJ4fIO9E4Oc8MyM9P
 Gi5g==
X-Gm-Message-State: APjAAAVL6EKVTtSy0wfzVHwY11WAVFI8YLjmvjEgm0Nk5EYU/X2cE0Ke
 9/odbDQD5NKMcxiv5hg/O0ElZ9X036M4uxIModA=
X-Google-Smtp-Source: APXvYqzahB4IkEd3hY2YMl05tu9CqbTgIRb3JP+J1EsSDdVtzfDIq4iFyngv7ATmScbyCG2vev3Xaugc7OMo6N6vdHE=
X-Received: by 2002:a05:6808:b17:: with SMTP id
 s23mr22937725oij.102.1574677852994; 
 Mon, 25 Nov 2019 02:30:52 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191119001226.GK5171@pendragon.ideasonboard.com>
In-Reply-To: <20191119001226.GK5171@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Nov 2019 11:30:42 +0100
Message-ID: <CAMuHMdWAD_W7r3Ewy-oZPO=YPCGtik0BWrJg2OBr=QwOdKsnZw@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] ARM: shmobile_defconfig: Enable support for
 panels from EDT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMToxMiBBTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgTm92IDEzLCAyMDE5
IGF0IDAzOjUxOjMwUE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+IFRoZSBpd2cy
MGQgY29tZXMgd2l0aCBhbiBMQ0QgcGFuZWwgZnJvbSBFbWVyZ2luZyBEaXNwbGF5Cj4gPiBUZWNo
bm9sb2dpZXMgQ29ycG9yYXRpb24gKEVEVCksIHRoZXJlZm9yZSBlbmFibGUgd2hhdCdzCj4gPiBy
ZXF1aXJlZCB0byBzdXBwb3J0IGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+Cj4gQWNrZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPgo+IEkgZXhw
ZWN0IEdlZXJ0IHRvIHBpY2sgdGhpcyB1cC4KClRoYW5rcywgcXVldWVkIGluIHJlbmVzYXMtZGV2
ZWwgZm9yIHY1LjYuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
