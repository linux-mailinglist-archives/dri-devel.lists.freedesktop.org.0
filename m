Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92153EAC3E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FAA6EDEB;
	Thu, 31 Oct 2019 09:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649956EBE2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 04:18:22 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o3so6751191qtj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 21:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nSHy1cjR1xkgmuZz3ish/LYbJAeXr+2guwTMfaEp/2Q=;
 b=ElwDLrQnCpYYxsXvlgcRrLaw/Bmpi9KxhmzzgGhsd4T1YpYQRVITIqMo4837nRJKEj
 hZxtYryRzxyRKj5kLsepGHbBcXQXjJFtRXaMpcyW2ADJ5d9YdGuCa1j5H1wov3ZyFsI/
 YSKhd+vx8fN5RLVu7zUkKAXpjYT35GPFIE4eFUaOu3lfBjMpMhBUYXBQ1M6LD4gKS/Yh
 qpyK4MJkJxZH7tbs0XnaDq4iHq9P3XKGkjkp0VLc9Q4O4dhZ962+z/lLQxU8TjaN8mRI
 s7wC5ANoujwx3i0HvsQhT6KG06zAcRxnjTnZAoS75DJ459CR1v1KzS38vLMYkvVThbU+
 9bfA==
X-Gm-Message-State: APjAAAVWU0tkPnK1+WosgGV0wPOjES4E/i9qo6J7a/ln/25Ios72lqI0
 AxgvBn2IF4Ns0zEEjRFv6IOJmiiOS/ykvOs+wxHqgg==
X-Google-Smtp-Source: APXvYqzvctBznLa1zRorcFn3nFNYxiVwCfSbZqxRisaWDLUronf8jK6QlXFzZaxUI1E4SGi5OziDzFPEZJ9JxHay74A=
X-Received: by 2002:a0c:b35c:: with SMTP id a28mr2755168qvf.238.1572495501348; 
 Wed, 30 Oct 2019 21:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-4-matthias.bgg@kernel.org>
In-Reply-To: <20181116125449.23581-4-matthias.bgg@kernel.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 31 Oct 2019 12:17:55 +0800
Message-ID: <CAJMQK-jHHAsBoL6Zcv8ZW1nRAD9NRjEbH1hnf9q418zGka8Vxg@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] clk: mediatek: mt8173: switch mmsys to platform
 device probing
To: matthias.bgg@kernel.org
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nSHy1cjR1xkgmuZz3ish/LYbJAeXr+2guwTMfaEp/2Q=;
 b=dDi7VJOVxKs0r/d6rOSHZNa49pPy/2qkN3lVs78MtSJYQcuETyVvpU20XKacQl03rP
 Z5Oh4DMuEqvQYoqhlQhRSROYoKiONHSAtvDClYuFK9nQ3xXEyHTBNWnRVRAXAdw0UBBm
 kW+F0NYA3db0/9JquvnCHen6w5K8C2EOkgyrE=
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
 Devicetree List <devicetree@vger.kernel.org>, sean.wang@mediatek.com,
 Matthias Brugger <mbrugger@suse.com>, David Airlie <airlied@linux.ie>,
 mturquette@baylibre.com, rdunlap@infradead.org, sboyd@codeaurora.org,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sean.wang@kernel.org, ulrich.hecht+renesas@gmail.com, wens@csie.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 laurent.pinchart@ideasonboard.com, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMTI6NTQgUE0gPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+
Cj4gU3dpdGNoIHByb2JpbmcgZm9yIHRoZSBNTVNZUyB0byBzdXBwb3J0IGludm9jYXRpb24gdG8g
YQo+IHBsYWluIHBhbHRmb3JtIGRldmljZS4gVGhlIGRyaXZlciB3aWxsIGJlIHByb2JlZCBieSB0
aGUgRFJNIHN1YnN5c3RlbS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1i
cnVnZ2VyQHN1c2UuY29tPgo+IC0tLQoKPiArCj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGNsa19tdDgxNzNfbW1fZHJ2ID0gewo+ICsgICAgICAgLnByb2JlID0gbXRrX21tc3lzX3By
b2JlLAo+ICsgICAgICAgLnByb2JlID0gbXRrX21tc3lzX3JlbW92ZSwKU2hvdWxkIGJlIC5yZW1v
dmU/Cgo+ICsgICAgICAgLmRyaXZlciA9IHsKPiArICAgICAgICAgICAgICAgLm5hbWUgPSAiY2xr
LW10ODE3My1tbSIsCj4gKyAgICAgICB9LAo+ICt9Owo+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KGNsa19tdDgxNzNfbW1fZHJ2KTsKPgo+ICBzdGF0aWMgdm9pZCBfX2luaXQgbXRrX3ZkZWNzeXNf
aW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4gIHsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
