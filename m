Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D891B8E621
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911EE6E8C4;
	Thu, 15 Aug 2019 08:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F4C6E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 08:22:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l14so1527941ljj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 01:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNifjZHy9qpEjr0GVjpJDJGNo3i2//VHyToq2Gi1I5o=;
 b=Gl0KqdBcvxDhLTbhhreKgYZG0cpCn1cNnuN7Cht7z0wbctl+vVhYioHeB6FltWWGiN
 WRZEqaQYWsdyPznrGKQE+sRiOm1kPldMsEWq+F32/Xv7QWzlzZNOzAdmaEUcQFZDlmLS
 nO8xSvzAS262WKINO99im38+Ka4f9LV8khFVvRZIH4bm0ayXym/kCx+GckPmNW8TXkR7
 MB4oCQC6oXj+V6BYzjW+nvWgia9qttjHBkFVSmtNkUK9b36NaV8dsr1/oNyv+SwGRb8S
 bfQ/lbhc+WhiNnvDoIkA3vwUgOaMW0l9txEaQ4kGDvp6Fhz1FxgJ+/I3sew1EmIkdQc1
 2xFA==
X-Gm-Message-State: APjAAAWI29+rFqyMO9onUf8O4TK5Am/G+X+Lt95ZGOSzLXzP4LcMfXd5
 QUHOt+4qU8wgM0m/uJs+GBgdACKr0sho5zXYcaS9cA==
X-Google-Smtp-Source: APXvYqzSKpPdJ2jsFgd1uIci3/V28JBr33UJghFYLTf8pCPXob33LzLWLieV3eJDVU3sY3EnTwoxgKPof5pySOFlK/A=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr2027257ljc.28.1565857377246; 
 Thu, 15 Aug 2019 01:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-7-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-7-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:22:45 +0200
Message-ID: <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
Subject: Re: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rNifjZHy9qpEjr0GVjpJDJGNo3i2//VHyToq2Gi1I5o=;
 b=OlwYctZRlIMTjnglbFz8m9UPeYHKRsw+HS0cqHa/AZrP3rCVWXzJ5gTfiLfl40hRWX
 cX599NGltZt5oVIqpRPPhMuFrdyeOZm97dwPU+CAxT5l2Fmeh/ZSbFOCb/7nY3jY2z0d
 CIjrlvHSyzJD4VsaZOWNL8WGygu6Rqv8F2u1V5+5Vq2p/D6QfBUPCY82EgeyCZmGRItF
 sjGHEgbToBdt25gqu0ZmUeiwWbzQ33NvDXBHQd6ysLH7sZmeFJ9duV5eFYsKV7RiV72h
 eNWFtqLstPI4m/mvgNB4pqyITfo+BGeWUfVdKBuxzmRIaxr6JBuXwM1U7lK/HLoL9KU5
 xc1w==
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMjo0OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgYXZkZDMzIHJlZ3VsYXRv
ciB0byB0aGUgYW5hbG9naXgtYW54Nzh4eCBkcml2ZXIuCj4gTm90ZSB0aGF0IHRoZSByZWd1bGF0
b3IgaXMgY3VycmVudGx5IGVuYWJsZWQgZHVyaW5nIGRyaXZlciBwcm9iZSBhbmQKPiBkaXNhYmxl
ZCB3aGVuIHRoZSBkcml2ZXIgaXMgcmVtb3ZlZC4gVGhpcyBpcyBjdXJyZW50bHkgaG93IHRoZQo+
IGRvd25zdHJlYW0gTVNNIGtlcm5lbCBzb3VyY2VzIGRvIHRoaXMuCj4KPiBMZXQncyBub3QgbWVy
Z2UgdGhpcyB1cHN0cmVhbSBmb3IgdGhlIG1lYW4gdGltZSB1bnRpbCBJIGdldCB0aGUgZXh0ZXJu
YWwKPiBkaXNwbGF5IGZ1bGx5IHdvcmtpbmcgb24gdGhlIE5leHVzIDUgYW5kIHRoZW4gSSBjYW4g
c3VibWl0IHByb3Blcgo+IHN1cHBvcnQgdGhlbiB0aGF0IHBvd2VycyBkb3duIHRoaXMgcmVndWxh
dG9yIGluIHRoZSBwb3dlciBvZmYgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBN
YXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KCj4gK3N0YXRpYyB2b2lkIGFueDc4eHhfZGlz
YWJsZV9yZWd1bGF0b3JfYWN0aW9uKHZvaWQgKl9kYXRhKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
YW54Nzh4eF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IF9kYXRhOwo+ICsKPiArICAgICAgIHJlZ3Vs
YXRvcl9kaXNhYmxlKHBkYXRhLT5hdmRkMzMpOwo+ICt9CiguLi4pCj4gKyAgICAgICBlcnIgPSBk
ZXZtX2FkZF9hY3Rpb24oZGV2LCBhbng3OHh4X2Rpc2FibGVfcmVndWxhdG9yX2FjdGlvbiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZGF0YSk7CgpDbGV2ZXIgaWRlYS4gR29vZCBm
b3IgaW5pdGlhbCBzdXBwb3J0LCBwcm9iYWJseSBsYXRlciBvbiBpdCB3b3VsZApuZWVkIHRvIGJl
IHJld29ya2VkIHVzaW5nIHJ1bnRpbWUgUE0gc28gaXQncyBub3QgY29uc3RhbnRseQpwb3dlcmVk
IHVwLgoKU2VlIGZvciBleGFtcGxlIGhvdyBJIHRyeSB0byBwdXNoIGRvd24gcG93ZXIgZGlzc2lw
YXRpb24Kb2Ygc2Vuc29ycyBpbiAzZDgzODExOGM2YWEuCgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
