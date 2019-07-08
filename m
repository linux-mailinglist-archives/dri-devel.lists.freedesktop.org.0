Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFF628D0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 21:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8252E89C9C;
	Mon,  8 Jul 2019 19:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E18189C9C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:00:49 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E48C2184B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:00:49 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id h24so19179833qto.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 12:00:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWPCA2Foos5fgEtb+u+nURWNjI0sWRxi/yjg0uj6/h2YzhT2oCK
 CE7iiXAOSkvYocjU9sA/UYG/gTMs/IYiADc0nQ==
X-Google-Smtp-Source: APXvYqzlSTQnpnRv/CV5vQu5Z8IXUWZ6zkbM3J87cJIxmi39a/LLXEvuqPj3FTtNG7bNz9JcifmEnofntf3eTfq1nLk=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr15266589qtb.224.1562612448256; 
 Mon, 08 Jul 2019 12:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-14-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190707181937.6250-14-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 8 Jul 2019 13:00:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLJy=UCeQ_Ex7tFh2OjtitNFVjT4v=PDZSbseva+ZrGDQ@mail.gmail.com>
Message-ID: <CAL_JsqLJy=UCeQ_Ex7tFh2OjtitNFVjT4v=PDZSbseva+ZrGDQ@mail.gmail.com>
Subject: Re: [PATCH 17/60] dt-bindings: Add legacy 'toppoly' vendor prefix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562612449;
 bh=uGnc3RdhO6+Sq0J7DZ+i0A59tIPFnzrjqH6S+XrEzWk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GgGFyI6i0VPptKNlsOVE1jhu+9W/EWPekGilLobTvTeIYxC5wM+RdMYcJyKd/xUp/
 O4GaMQ0SKEFZFfm9PRpzeRnHfRbTpZJ1j2VBjhLmLS12ZKP5C3R3gC/OwFL4u0u7e+
 ELAMcBWPg4BIVcDzI4KtYFlclJEN3GpYVzgjyW9s=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgNywgMjAxOSBhdCAxMjoyNSBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gVGhlICd0b3Bwb2x5JyB2ZW5k
b3IgcHJlZml4IGlzIGluIHVzZSBhbmQgcmVmZXJzIHRvIFRQTywgd2hvc2UgRFQgdmVuZG9yCj4g
cHJlZml4IGlzIGFscmVhZHkgZGVmaW5lZCBhcyAndHBvJy4gQWRkICd0b3Bwb2x5JyBhcyBhbiBh
bHRlcm5hdGl2ZSBhbmQKPiBkb2N1bWVudCBpdCBhcyBsZWdhY3kuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4g
LS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbAo+IGluZGV4IDI1MTQ0NjNmMmM2My4uZDc4NTI3ZWI4MjU0IDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFt
bAo+IEBAIC04NjcsNiArODY3LDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gICAgICBkZXNjcmlw
dGlvbjogVGVjb24gTWljcm9wcm9jZXNzb3IgVGVjaG5vbG9naWVzLCBMTEMuCj4gICAgIl50b3Bl
ZXQsLioiOgo+ICAgICAgZGVzY3JpcHRpb246IFRvcGVldAo+ICsgICJedG9wcG9seSwuKiI6Cj4g
KyAgICBkZXNjcmlwdGlvbjogVFBPIChsZWdhY3kgcHJlZml4LCBzZWUgJ3RwbycpCgpBZGQgJ2Rl
cHJlY2F0ZWQ6IHRydWUnIGFsc28uIFRoYXQncyBhIG5ldyBwcm9wZXJ0eSBpbiBqc29uLXNjaGVt
YQpkcmFmdDguIEl0J3Mgbm90IHVzZWQgZm9yIGFueXRoaW5nIHlldCBvdGhlciB0aGFuIGRvY3Vt
ZW50YXRpb24uCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
