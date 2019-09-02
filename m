Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B18A57D2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933989BF0;
	Mon,  2 Sep 2019 13:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D740389C08
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 13:39:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q19so5833305wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 06:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:to;
 bh=GU3za1mDp0snm3Y74J5T69ZboJHf1rUUst4A4GavhcQ=;
 b=e8FS2iczBU2wWwhNTThhXQj21GgZTPvjA2AR/tybpXkhejvdMZYCvoulwdEyFi4SnQ
 GAH9LWJ9/WIcrllU6Ur6xeVX6jpU3kPUT90QSEuEfGoX0McsaWx1CsusVE7zRb9aOQwD
 MvmPWQ4y4j4b/Qc65BlfDkzv9o2Kwm6mgLCexmAs4S//gjiaXu3MuAxFLJuuthFRuJCU
 qz4rEqEteoTS8dBm+NyjAn4WsbY3tZl6rI2lub3krUfKUp55B3iR4HC/aA56R+9b5OK+
 VlUhfSF8YRPjbv3gWG5uloUjWVC/q4Ihi9n72Dkrl9ugnI32ivqBOqVhaQ4++DLPIboc
 n0Hw==
X-Gm-Message-State: APjAAAV4KkzVkaxXdQuOzn5sVK1EVRlK8jX0LWOKxB0t8O81KIZmBO00
 lRdPtlzoLJPCAJ+IKL6VrA==
X-Google-Smtp-Source: APXvYqwlv1zoVJsxsY+eP42S6XXNnpqg8n1idrGUMkPM3XoBL/85siELBm35VrJHqa9xD9qf/J0QFA==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr30814572wmi.103.1567431548399; 
 Mon, 02 Sep 2019 06:39:08 -0700 (PDT)
Received: from localhost ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id q14sm28331700wrc.77.2019.09.02.06.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 06:39:07 -0700 (PDT)
Message-ID: <5d6d1b7b.1c69fb81.2abcd.40af@mx.google.com>
Date: Mon, 02 Sep 2019 14:39:07 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display/bridge: Add binding for NWL
 mipi dsi host controller
References: <cover.1567169464.git.agx@sigxcpu.org>
 <64ec3f9375d9684f432dba48af63e3a5de8875f5.1567169464.git.agx@sigxcpu.org>
In-Reply-To: <64ec3f9375d9684f432dba48af63e3a5de8875f5.1567169464.git.agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: , devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "To : David Airlie" <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAzMCBBdWcgMjAxOSAxNDo1ODoyMSArMDIwMCwgPT9VVEYtOD9xP0d1aWRvPTIwRz1D
Mz1CQ250aGVyPz0gd3JvdGU6Cj4gVGhlIE5vcnRod2VzdCBMb2dpYyBNSVBJIERTSSBJUCBjb3Jl
IGNhbiBiZSBmb3VuZCBpbiBOWFBzIGkuTVg4IFNvQ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3Vp
ZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiBUZXN0ZWQtYnk6IFJvYmVydCBDaGlyYXMg
PHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL253bC1kc2kueWFtbCAgICAgIHwgMTc2ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTc2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9ud2wtZHNpLnlhbWwKPiAK
ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
