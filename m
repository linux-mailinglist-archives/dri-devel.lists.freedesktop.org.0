Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69C417F2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 00:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ACC891D6;
	Tue, 11 Jun 2019 22:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B598A891D6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 22:11:51 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id e5so5690346pls.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8vFvJ8V6ajJREADlkWcQGOvk5dqkkgFT9ytOdn/LZ6s=;
 b=LKOmeUBQWiPSHqcAhrGuabibvm7M/ih9wRTDveASaDutSBI+fJNbQeFBDczySXHqEs
 G/lMmN4u04w9i15lVtdtH0mPbBG0us9X0cCIkhAZ2+1HtMuik77v/IA/N9kHcL5GRdGO
 YsUWX4oN36f+91DQitxOZTb/Ix2No2hNg8+/44FRAE2axBgyNUBnfNwgX/Z0eihQnz/N
 jTsoco4MoFGlY+qur6hUsh66KDsLF6pj2ongZlYG7LDsxqw05jNqYBchlNv2GqykVpFr
 txONRT3sWXUgk0NBwot/jgsqpn4HvOAjKaB4wUjaycgonpKyGwEhv/uCB3DgKbQaU0xO
 oQmw==
X-Gm-Message-State: APjAAAW2ztqVdTRtlZWhEt8sb6DGgmVT04HC9aa0cQ5AaUmsuxbN7vrP
 FJ8cMRaaUdV9iQPShGA917k4FA==
X-Google-Smtp-Source: APXvYqwEviZoSj03YwFf0xshEB8pQdCuQy4uEVw4wDJoV5zm7LJ8rVpZzWCRBK0Mj4y2Dqy1neX5Aw==
X-Received: by 2002:a17:902:e58b:: with SMTP id
 cl11mr57462355plb.24.1560291110514; 
 Tue, 11 Jun 2019 15:11:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id u4sm17102828pfu.26.2019.06.11.15.11.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 15:11:49 -0700 (PDT)
Date: Tue, 11 Jun 2019 15:11:47 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm-backlight: Add 'max-brightness'
 property
Message-ID: <20190611221147.GG137143@google.com>
References: <20190610233739.29477-1-mka@chromium.org>
 <00220cd7-ed4b-5250-d448-cf83ed4c2012@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00220cd7-ed4b-5250-d448-cf83ed4c2012@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8vFvJ8V6ajJREADlkWcQGOvk5dqkkgFT9ytOdn/LZ6s=;
 b=hPfeNzhq51hsmDu/JK7bh3qIFlI5DoZS5suqWw3uFdum9RZoZ2kLpg+CG3WfwtzWqG
 wUsWqTNqS4DVwjG3bZ5K061mHFseBicQAv9ZBnZKQCzCbAd+m0Wm71AVkht6a9BHwRBP
 mH/ugMZuWCy/YaFsK+qaD6od1aOotlirFt6fw=
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjZWssCgpPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMDowMjoyM1BNICswMjAwLCBKYWNl
ayBBbmFzemV3c2tpIHdyb3RlOgo+IEhpIE1hdHRoaWFzLAo+IAo+IE9uIDYvMTEvMTkgMTozNyBB
TSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gPiBBZGQgYW4gb3B0aW9uYWwgJ21heC1icmln
aHRuZXNzJyBwcm9wZXJ0eSwgd2hpY2ggaXMgdXNlZCB0byBzcGVjaWZ5Cj4gPiB0aGUgbnVtYmVy
IG9mIGJyaWdodG5lc3MgbGV2ZWxzIChtYXgtYnJpZ2h0bmVzcyArIDEpIHdoZW4gdGhlIG5vZGUK
PiA+IGhhcyBubyAnYnJpZ2h0bmVzcy1sZXZlbHMnIHRhYmxlLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9wd20tYmFja2xpZ2h0LnR4dCAg
ICAgICB8IDMgKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2Jh
Y2tsaWdodC9wd20tYmFja2xpZ2h0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9wd20tYmFja2xpZ2h0LnR4dAo+ID4gaW5kZXggNjRmYTJmYmQ5
OGM5Li45OGY0YmE2MjYwNTQgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvcHdtLWJhY2tsaWdodC50eHQKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9wd20tYmFja2xp
Z2h0LnR4dAo+ID4gQEAgLTI3LDYgKzI3LDkgQEAgT3B0aW9uYWwgcHJvcGVydGllczoKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc29sdXRpb24gcHdtIGR1dHkgY3ljbGUgY2Fu
IGJlIHVzZWQgd2l0aG91dAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGF2aW5n
IHRvIGxpc3Qgb3V0IGV2ZXJ5IHBvc3NpYmxlIHZhbHVlIGluIHRoZQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYnJpZ2h0bmVzcy1sZXZlbCBhcnJheS4KPiA+ICsgIC0gbWF4LWJy
aWdodG5lc3M6IE1heGltdW0gYnJpZ2h0bmVzcyB2YWx1ZS4gVXNlZCB0byBzcGVjaWZ5IHRoZSBu
dW1iZXIgb2YKPiA+ICsgICAgICAgICAgICAgICAgICAgIGJyaWdodG5lc3MgbGV2ZWxzIChtYXgt
YnJpZ2h0bmVzcyArIDEpIHdoZW4gdGhlIG5vZGUKPiA+ICsgICAgICAgICAgICAgICAgICAgIGhh
cyBubyAnYnJpZ2h0bmVzcy1sZXZlbHMnIHRhYmxlLgo+IAo+IEluIHRoZSBMRUQgc3Vic3lzdGVt
IHdlIGhhdmUgbGVkLW1heC1taWNyb2FtcCBwcm9wZXJ0eSB3aGljaCBzZWVtcyB0bwo+IGJldHRl
ciBkZXNjcmliZSBoYXJkd2FyZSBjYXBhYmlsaXRpZXMuIEl0IHNheXMganVzdDogdGhpcyBpcyB0
aGUgY3VycmVudAo+IGxldmVsIHRoZSBMRUQgY2FuIHdpdGhzdGFuZC4gbWF4LWJyaWdodG5lc3Mg
ZG9lcyBub3QgaW1wbGljaXRseSBjb252ZXkKPiB0aGlzIGtpbmQgb2YgaW5mb3JtYXRpb24uCj4g
Cj4gV2h5IHRoZSBuZWVkIGZvciB0aGUgcHJvcGVydHkgYXQgYWxsPyBJZiBmb3IgdGhlIHJlYXNv
bnMgb3RoZXIgdGhhbgo+IGhhcmR3YXJlIGNhcGFiaWxpdGllcyB0aGFuIGl0IHNob3VsZCBiZSBt
b3JlIGxpa2VseSBoYW5kbGVkCj4gYnkgdXNlcnNwYWNlLgoKVGhlIGRyaXZlciBuZWVkcyB0byBr
bm93IGhvdyBtYW55IGJyaWdodG5lc3MgbGV2ZWxzIHRvIGV4cG9zZSB0bwp1c2Vyc3BhY2UuIEl0
IGN1cnJlbnRseSB1c2VzIGEgaGV1cmlzdGljIGZvciB0aGF0IHdoaWNoIGlzIGJyb2tlbjoKCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEuOS9zb3VyY2UvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvcHdtX2JsLmMjTDIzNApodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdv
cmsvcGF0Y2gvMTA4Njc3Ny8jMTI4MjYxMAoKSW4gYW55IGNhc2UgaXQgc2VlbXMgdGhlIGRpc2N1
c3Npb24gaXMgZ29pbmcgaW50byB0aGUgZGlyZWN0aW9uIG9mCmZpeGluZyB0aGUgaGV1cmlzdGlj
IChhcHBhcmVudGx5IHVzaW5nIHRoZSBwZXJpb2QgYXMgYW4gaW5kaWNhdG9yIG9mCnRoZSBQV00g
cmVzb2x1dGlvbiBoYXMgbW9yZSBtZXJpdCB0aGFuIEkgd2FzIGluaXRpYWxseSBhd2FyZSBvZiks
IGlmCnRoYXQgbW92ZXMgZm9yd2FyZCB0aGUgcHJvcGVydHkgd291bGRuJ3QgYmUgbmVlZGVkLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
