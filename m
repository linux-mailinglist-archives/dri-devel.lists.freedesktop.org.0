Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6795872
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5366E5F0;
	Tue, 20 Aug 2019 07:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A825E88D18
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 11:28:41 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id t6so3418076ios.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 04:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
 b=LQ0bMTe6CK34rr5Xk8ln/jWVwLUenNm3UT1h1v6BhtJKzFeneobuaOmua7xLzRbUF1
 Qxrmky2dv9DeYCEEq1bF7i/l7KNIpL/MKAXNNwSmzt96FB0a9jRe3lGZ7d7ojiDiPSvF
 ZLUadl+ph0uzciDD4Zyxdnc958RkaDIUMAyvVg2cmQOWEy1gpADMrL6AozlQaUscManb
 Xzq85fB/R3HhXVZw6aCDinUZjpidgjevKcgcsmk78MPZrFHA9YrF9tKGTdvfh/SbFVX8
 08/Vf3D5wXzcPQbQvYVGFP6EgWhf8IzJTv+3tuy1or8bVysh5kqdAEa/ucs/HMMwoRkj
 iIdw==
X-Gm-Message-State: APjAAAWfCQh8FX9Igg5wY4tUuKFML5+KzE46zaCnPmNe0/fYkFBe9EDE
 urT0fmdb7qptV0UlIj93GwQHurtP2xxNEU6eJN7uew==
X-Google-Smtp-Source: APXvYqws9l57+4N1t5CybQVbaJVVd9Nfbb44LfgnzTxj+oSX0EqosHdKwwu2xUgfJeO4/2mhYPOE0MJ85EFvW0XmVeo=
X-Received: by 2002:a02:ca0c:: with SMTP id i12mr25223915jak.82.1566214120815; 
 Mon, 19 Aug 2019 04:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
In-Reply-To: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Mon, 19 Aug 2019 13:28:29 +0200
Message-ID: <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
 b=VomSogBR+Rjw/zSHOgYzWP0EPLOWDtlkOX71pe6ugmjomlrnQcTpcjmO8sKNJJVF88
 eBBJwuHQMPRsPnPRI1d3VWz79WvjiSugyn9jqibRlINZRgvgDoPjI2EtLD1fnsLV99c2
 ShCoueTKwSrH6XIpq3jwrrr8LQOc+bXuyUl/de11l4GYIgokqYrOeou3Ki93L+WqlQJx
 GBubyAUF11lufOEIB4UNoLNvXP6xnBfxBWyQ5xpZJrGplgu4FdH8bkcGeEjP/ZaKEtLl
 6ea5JCPDW1r6tJ7EqnwrgEoniW2UAOXZ55UlUK2Muaf/SGJ0KQMtvI49SO35Tby1zv3b
 l6BQ==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Allison Randal <allison@lohutok.net>, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Lim <Thomas.Lim@amd.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6MzggQU0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+CkhpIEhhbnMuCj4gVGhlIHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgaW5kZXBlbmRlbnRseSBmcm9tIGVhY2gg
b3RoZXIuCj4KPiBJZiB5b3UgbWFpbnRhaW4gb25lIG9mIHRoZXNlIGRyaXZlcnMgYW5kIHlvdSB3
YW50IHRvIG1lcmdlIGl0IGZvciB2NS40Cj4geW91cnNlbGYsIHRoZW4gcGxlYXNlIGRvIHNvIGFu
ZCBsZXQgbWUga25vdy4gSWYgeW91IHByZWZlciBJIGNvbW1pdCBpdAo+IHRvIGRybS1taXNjLCB0
aGVuIHBsZWFzZSByZXZpZXcgYW5kIChob3BlZnVsbHkpIEFjayB0aGUgcGF0Y2guCj4KPiBJIHdv
dWxkIHJlYWxseSBsaWtlIHRvIGdldCB0aGlzIGluIGZvciB2NS40IHNvIEkgY2FuIGdldCB0aGUg
dXNlcnNwYWNlCj4gYml0cyBpbiBmb3IgdjUuNCBhcyB3ZWxsIHRocm91Z2ggdGhlIG1lZGlhIHN1
YnN5c3RlbS4KPgo+IERhcml1c3osIGNhbiB5b3UgcG9zdCBhIHY3LjEgZm9yIHBhdGNoIDUvOSBm
aXhpbmcgdGhlIHR5cG8/Cj4KRG9uZS4KCkkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byB0ZXN0
IHY3IGNoYW5nZXMgdG8gZHctaGRtaSBhbmQgdGRhOTk4eCBvbgphIHJlYWwgaGFyZHdhcmUuIEhh
bnMsIGRvIHlvdSB0aGluayB5b3Ugd291bGQgYmUgYWJsZSB0byB0ZXN0IHRob3NlPwoKVGhhbmsg
eW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
