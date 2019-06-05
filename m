Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CFC36547
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 22:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D589389203;
	Wed,  5 Jun 2019 20:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AD089203
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 20:21:04 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id l128so75394qke.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 13:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Oow9DtVx6/e9vc91OkJJ9FrpnBvTPD2Rx2lgdcaFGT8=;
 b=IU1/wR4QcH7k6nIfPqGXzhM8TdDVB/PjC6KniSAyyKKGp1Y1+VrpuhPTl7RMAqGt1r
 5HGgtPYyHw/gvtvxC5dfWaNNRWgiMBUgq+Gp1AfLr2YnH8wSswyN8muotWdi1chwnGrV
 L1CQxJU6Z6Q6Cu6YdIyVIeebrrB8NlprqtfYjPHhtaDyDXLlO6FqnIy/AbuE021SEir1
 ig4lq78rM7pokPhpKs0wQnm+6ZW8AT49YQt6JgWzojVSqzLuybbGARxygATJPggLOqxg
 dmx0fmP1u5TsI+MksvcdbBXQ+BqnBhy6UmK3abbAZXU5OZsnba1PiUMhbp9fiMOnevwQ
 5WvQ==
X-Gm-Message-State: APjAAAWCTaUJzyiowi4ZciiAuUU9mZ+L+MC1AA8l2o2lTQI+OhbqQ8Dx
 mL/OJ40VBeIg1xqysEld/QXZpg==
X-Google-Smtp-Source: APXvYqzshz94DAwlN0c6S4f2hde5nvkY5P0IaQSC3xGDSITmSC2T+3xaW8ArBq7rZ6TYEskvjiotBg==
X-Received: by 2002:a37:f50f:: with SMTP id l15mr16279331qkk.343.1559766063140; 
 Wed, 05 Jun 2019 13:21:03 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d5sm9881582qtj.3.2019.06.05.13.21.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 13:21:02 -0700 (PDT)
Date: Wed, 5 Jun 2019 16:21:01 -0400
From: Sean Paul <sean@poorly.run>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: drm/bridge/synopsys: dw-hdmi: Add
 "unwedge" for ddc bus
Message-ID: <20190605202101.GG17077@art_vandelay>
References: <20190502225336.206885-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502225336.206885-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Oow9DtVx6/e9vc91OkJJ9FrpnBvTPD2Rx2lgdcaFGT8=;
 b=gDJ/pCAVI21mCAOhscYUVpPPbSPZSdohQtVojLJOqXj6LyfNoLVKYA1EdTQBHcRnNV
 gY8GucJcSp74i+ayJHV+sn7wRmTb2V83nd3VxGipHMTNW5oGUZNerkQIOIo6H8ogVrcT
 MtKKHW8Iw1EWQc8olTokbrcD2OIpPNzoaMesSPt8hl1X0nF1osj2k2b2xX5mP2j7GYr8
 9RRw1U5V9bgLGTzeAmVAp6hIoNUhmQdKU4/BWYTtRym5973/zBT314jApMpyX9ipKAxO
 GtfUkDH9BW4veDlaFvbLLIjqemkU+31viOumlbu/QlmXG1RMgP5DQ5JARBVybS9Hzg1E
 AHRQ==
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
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, mka@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDM6NTM6MzJQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNv
biB3cm90ZToKPiBJbiBjZXJ0YWluIHNpdHVhdGlvbnMgaXQgd2FzIHNlZW4gdGhhdCB3ZSBjb3Vs
ZCB3ZWRnZSB1cCB0aGUgRERDIGJ1cwo+IG9uIHRoZSBIRE1JIGFkYXB0ZXIgb24gcmszMjg4LiAg
VGhlIG9ubHkgd2F5IHRvIHVud2VkZ2Ugd2FzIHRvIG11eCBvbmUKPiBvZiB0aGUgcGlucyBvdmVy
IHRvIEdQSU8gb3V0cHV0LWRyaXZlbi1sb3cgdGVtcG9yYXJpbHkgYW5kIHRoZW4KPiBxdWlja2x5
IG11eCBiYWNrLiAgRnVsbCBkZXRhaWxzIGNhbiBiZSBmb3VuZCBpbiB0aGUgcGF0Y2gKPiAoImRy
bS9icmlkZ2Uvc3lub3BzeXM6IGR3LWhkbWk6IEFkZCAidW53ZWRnZSIgZm9yIGRkYyBidXMiKS4K
PiAKPiBTaW5jZSB1bndlZGdlIHJlcXVpcmVzIHJlbXV4aW5nIHRoZSBwaW5zLCB3ZSBmaXJzdCBu
ZWVkIHRvIGFkZCB0byB0aGUKPiBiaW5kaW5ncyBzbyB0aGF0IHdlIGNhbiBzcGVjaWZ5IHdoYXQg
c3RhdGUgdGhlIHBpbnMgc2hvdWxkIGJlIGluIGZvcgo+IHVud2VkZ2luZy4KClB1c2hlZCB0byBk
cm0tbWlzYy1uZXh0IGFsb25nIHdpdGggcGF0Y2ggMi4gSSdsbCBsZXQgSGVpa28gbGFuZCB0aGUg
ZHRzIHBhdGNoZXMuCgpUaGFua3MhCgpTZWFuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiAtLS0KPiAKPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQgICAgICAgICB8IDcgKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWkt
cm9ja2NoaXAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQKPiBpbmRleCAzOTE0MzQyNGE0NzQuLjgzNDZi
YWM4MWYxYyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAu
dHh0Cj4gQEAgLTM4LDYgKzM4LDEzIEBAIE9wdGlvbmFsIHByb3BlcnRpZXMKPiAgLSBwaHlzOiBm
cm9tIGdlbmVyYWwgUEhZIGJpbmRpbmc6IHRoZSBwaGFuZGxlIGZvciB0aGUgUEhZIGRldmljZS4K
PiAgLSBwaHktbmFtZXM6IFNob3VsZCBiZSAiaGRtaSIgaWYgcGh5cyByZWZlcmVuY2VzIGFuIGV4
dGVybmFsIHBoeS4KPiAgCj4gK09wdGlvbmFsIHBpbmN0cmwgZW50cnk6Cj4gKy0gSWYgeW91IGhh
dmUgYm90aCBhICJ1bndlZGdlIiBhbmQgImRlZmF1bHQiIHBpbmN0cmwgZW50cnksIGR3X2hkbWkK
PiArICB3aWxsIHN3aXRjaCB0byB0aGUgdW53ZWRnZSBwaW5jdHJsIHN0YXRlIGZvciAxMG1zIGlm
IGl0IGV2ZXIgZ2V0cyBhbgo+ICsgIGkyYyB0aW1lb3V0LiAgSXQncyBpbnRlbmRlZCB0aGF0IHRo
aXMgdW53ZWRnZSBwaW5jdHJsIGVudHJ5IHdpbGwKPiArICBjYXVzZSB0aGUgU0RBIGxpbmUgdG8g
YmUgZHJpdmVuIGxvdyB0byB3b3JrIGFyb3VuZCBhIGhhcmR3YXJlCj4gKyAgZXJyYXRhLgo+ICsK
PiAgRXhhbXBsZToKPiAgCj4gIGhkbWk6IGhkbWlAZmY5ODAwMDAgewo+IC0tIAo+IDIuMjEuMC4x
MDIwLmdmMjgyMGNmMDFhLWdvb2cKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVy
LCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
