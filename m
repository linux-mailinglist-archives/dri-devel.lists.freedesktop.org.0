Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908032FCA0
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 15:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743B96E14F;
	Thu, 30 May 2019 13:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
 [209.85.166.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BF96E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 13:48:22 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e184so9456512ite.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 06:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4rkyvetspz0f+UlMWFdOOo6R1mEg57wlesDPAijXPo=;
 b=sKvlZePY5cDvBCWmCaGAWIC0wsSCvMMrImFbmloyhrwZ1a1IKSx79VfcvDetkDlymk
 lY0QwCgtLggA7csY+f4sNLIUymveGIbEcvsfT8IoTBNHG8XF1Vvh9Vjkv/+voz44KYPY
 jXGpAAj7fJIPVMGtLGPz//JfEn8onrHwtzyd1scdxwPQACBLEzpUmGWhyVX3lQ7I/Xz/
 WYsCm/Fa+hAYVxd+m9IrD+rwi3jaC7o4hCQ/V3A7f5ARsm74sPkdfuaAnffebC+6QpB7
 CZKvwWewW+zW/zvdpMM3PkvvHV4dJlHLrGh7JCWbo3l7awpeGNwENNp0xZFypbtT+s4F
 KzyA==
X-Gm-Message-State: APjAAAUvf69taVzf/wn1rty9cj1YD+uDwGWHzvm1URkg/FZfIRPiYdUD
 j1/h4OF8IAbubhPS2UXjI8N2X7NfgSE=
X-Google-Smtp-Source: APXvYqwdeEiCbHY7eHLdbyfdQVA6setTnobQ+L6SSJIzjdW+S157kd+csKHZWUplSApghZMWNfPBGg==
X-Received: by 2002:a24:b10d:: with SMTP id o13mr2847970itf.127.1559224100464; 
 Thu, 30 May 2019 06:48:20 -0700 (PDT)
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id n6sm195494iog.82.2019.05.30.06.48.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 06:48:18 -0700 (PDT)
Received: by mail-it1-f175.google.com with SMTP id m3so9965491itl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 06:48:17 -0700 (PDT)
X-Received: by 2002:a24:91d2:: with SMTP id i201mr3054942ite.88.1559224097044; 
 Thu, 30 May 2019 06:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190527120910.18964-1-maxime.ripard@bootlin.com>
In-Reply-To: <20190527120910.18964-1-maxime.ripard@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 30 May 2019 21:48:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v66uhrm20BwmODkPZjSM6Ek+xEg23w2Cs49ikW3WcU1Lqg@mail.gmail.com>
Message-ID: <CAGb2v66uhrm20BwmODkPZjSM6Ek+xEg23w2Cs49ikW3WcU1Lqg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert Allwinner DSI to a schema
To: Maxime Ripard <maxime.ripard@bootlin.com>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgODowOSBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFRoZSBBbGx3aW5uZXIgU29DcyBoYXZlIGEgTUlQ
SS1EU0kgYW5kIE1JUEktRC1QSFkgY29udHJvbGxlcnMgc3VwcG9ydGVkIGluCj4gTGludXgsIHdp
dGggYSBtYXRjaGluZyBEZXZpY2UgVHJlZSBiaW5kaW5nLgo+Cj4gTm93IHRoYXQgd2UgaGF2ZSB0
aGUgRFQgdmFsaWRhdGlvbiBpbiBwbGFjZSwgbGV0J3MgY29udmVydCB0aGUgZGV2aWNlIHRyZWUK
PiBiaW5kaW5ncyBmb3IgdGhhdCBjb250cm9sbGVyIG92ZXIgdG8gYSBZQU1MIHNjaGVtYXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
PgoKTG9va3MgZ29vZCB0byBtZS4gSG93ZXZlciBub3Qgc3VyZSB3aHkgeW91IHJlcGxhY2VkIHRo
ZSBjbG9jayBpbmRleCBtYWNyb3MKd2l0aCByYXcgbnVtYmVycy4KClJldmlld2VkLWJ5OiBDaGVu
LVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
