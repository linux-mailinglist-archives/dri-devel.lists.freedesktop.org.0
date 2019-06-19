Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C14C2E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 23:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D11D6E46F;
	Wed, 19 Jun 2019 21:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537D6E46F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 21:23:07 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id u13so1096467iop.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Cs6Vhxf3ibwNHsRfPgJ7kBQS0+myDn1Z6sIvkVbn6w=;
 b=sq/U9PNip4BQBdo/rhvzHJP0Pnc0apTKE4x4MVzUad0OQ/II/T+2TV7l3I0IECKPHi
 xJBuK9cMfnR4GN5zjZp4KcNhipaVjnP1tuw+LLWCQscMgXIkDAVZQmspyZSfWAgyUqo4
 QPENmunOlLge8TkT3ez2MoNh3tPWF8gYzGwe/n6pFbi6EW0czhFPni1xnj2dudISaXBg
 zdULRW21KyWBprIfsgfcYMzME9M6fQxXQ4u8ALIKhKTub3XT2p+rnwE9FeEBkgKz7SuJ
 pW9GyFaqLUakpppTDVBqUoC9LpJ84w0JtlUqCfWi/V05fLf6xZWSlL4CQN2diN4PQhrJ
 gDUQ==
X-Gm-Message-State: APjAAAXxiXZP7uN2SA/7UdQgvRFoprztlnLQt9jrTv1QBeIl9u93Cts7
 7AYMy5qEj8wSuO+GQNGWEECAl2OsbJA=
X-Google-Smtp-Source: APXvYqwNpeSzXK/iVVNFWybDIfRDR2NbE2rY2+o/FmOEaeOpdP/eo4gHfWxpLZ1MV4+kD2UIq+z4LQ==
X-Received: by 2002:a5d:9416:: with SMTP id v22mr10707839ion.4.1560979386883; 
 Wed, 19 Jun 2019 14:23:06 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id f4sm18839917iok.56.2019.06.19.14.23.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 14:23:05 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id w25so188700ioc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:23:05 -0700 (PDT)
X-Received: by 2002:a02:878a:: with SMTP id t10mr12921318jai.112.1560979385096; 
 Wed, 19 Jun 2019 14:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190612085147.26971-1-narmstrong@baylibre.com>
In-Reply-To: <20190612085147.26971-1-narmstrong@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Jun 2019 14:22:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UgmMGZHf_Y+GBgQ+fLYGF3yinj3LtLFRhNwABQB6r-qQ@mail.gmail.com>
Message-ID: <CAD=FV=UgmMGZHf_Y+GBgQ+fLYGF3yinj3LtLFRhNwABQB6r-qQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Use automatic CTS generation mode
 when using non-AHB audio
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8Cs6Vhxf3ibwNHsRfPgJ7kBQS0+myDn1Z6sIvkVbn6w=;
 b=jcAWf4ZIO2217+MIicbCG9Un7x60cTFIYR6ZJybuw5Vhx6H9fM+moRWCp4qjjD4imm
 TIb7ZW0IpLxIanQODZnwG/l6RqWUt278U5M73z1SQC65ALD6aqu+B4Z+HCaK18hJGn3t
 KF+A4nrUXysjLjRrFgq191iZRNwC0WFGbd5Lo=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <maxime.ripard@bootlin.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAxOjUxIEFNIE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHVzaW5nIGFuIEkyUyBzb3VyY2Ug
dXNpbmcgYSBkaWZmZXJlbnQgY2xvY2sgc291cmNlICh1c3VhbGx5IHRoZSBJMlMKPiBhdWRpbyBI
VyB1c2VzIGRlZGljYXRlZCBQTExzLCBkaWZmZXJlbnQgZnJvbSB0aGUgSERNSSBQSFkgUExMKSwg
Zml4ZWQKPiBDVFMgdmFsdWVzIHdpbGwgY2F1c2Ugc29tZSBmcmVxdWVudCBhdWRpbyBkcm9wLW91
dCBhbmQgZ2xpdGNoZXMgYXMKPiByZXBvcnRlZCBvbiBBbWxvZ2ljLCBBbGx3aW5uZXIgYW5kIFJv
Y2tjaGlwIFNvQ3Mgc2V0dXBzLgo+Cj4gU2V0dGluZyB0aGUgQ1RTIGluIGF1dG9tYXRpYyBtb2Rl
IHdpbGwgbGV0IHRoZSBIRE1JIGNvbnRyb2xsZXIgZ2VuZXJhdGUKPiBhdXRvbWF0aWNhbGx5IHRo
ZSBDVFMgdmFsdWUgdG8gbWF0Y2ggdGhlIGlucHV0IGF1ZGlvIGNsb2NrLgo+Cj4gVGhlIERlc2ln
bldhcmUgRFctSERNSSBVc2VyIEd1aWRlIGV4cGxhaW5zOgo+ICAgRm9yIEF1dG9tYXRpYyBDVFMg
Z2VuZXJhdGlvbgo+ICAgV3JpdGUgIjAiIG9uIHRoZSBiaXQgZmllbGQgIkNUU19tYW51YWwiLCBS
ZWdpc3RlciAweDMyMDU6IEFVRF9DVFMzCj4KPiBUaGUgRGVzaWduV2FyZSBEVy1IRE1JIERhdGFi
b29rIGV4cGxhaW5zIDoKPiAgIElmICJDVFNfbWFudWFsIiBiaXQgZXF1YWxzIDBiIHRoaXMgcmVn
aXN0ZXJzIGNvbnRhaW5zICJhdWRDVFNbMTk6MF0iCj4gICBnZW5lcmF0ZWQgYnkgdGhlIEN5Y2xl
IHRpbWUgY291bnRlciBhY2NvcmRpbmcgdG8gc3BlY2lmaWVkIHRpbWluZy4KPgo+IENjOiBKZXJu
ZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3
aWJvby5zZT4KPiBDYzogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBDYzogSmVy
b21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBB
cm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDQ0ICsrKysrKysrKysrKysrKy0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKClRl
c3RlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
