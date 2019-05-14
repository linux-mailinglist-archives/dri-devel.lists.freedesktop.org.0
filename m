Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627321D0D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 22:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF5A892D2;
	Tue, 14 May 2019 20:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EE2892D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 20:49:14 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t187so148758oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 13:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6T3Ip6O04LTKLd5qWK9Ww230fOKy3msDw8KUYfWmvPM=;
 b=gXoT9HnTsPQShbPHotSDfdKOEC8GgQpbB1QJZovqyPZoyPfWEk8LvCQLQEXCUeDs7J
 MMNX/8/FEq/8nDy2mRfTmjSIurKBtrRC9HFEBA7IiDLRhW13/gyy/4uKZKjsbzUF56i0
 B/QfZl8MS+EuAbI8BTme0LATx6EC5T54dNKLvPMVkkclErr5vzvVCq6sSO4oT0Qj3JLf
 /yVwNdrIkvrynrgntUPPYK62qlsD6tesvbzSYm4SVFBPy0A577Q9appYpcm7hlFANk9u
 fvqZTIok1nXREJW1uW/Ujw34/QyVlCvVjqQ8ifUDxU5FO5jz/zCpp2w1u8DNOfg6oYdf
 3F4w==
X-Gm-Message-State: APjAAAUP0OY9UhavLdSFMRJR9lhHxrUG9dv3UOKXwpLxQy+Rc39hH50y
 iyALYgW6OnIa5yZdf96teg==
X-Google-Smtp-Source: APXvYqw9r62Myv1ZK5vENIP2ad0ZFC9OJdOjoMmtmV5w3i5Ay9PLbIuaxAG0cmS6uL2JJgGZGo7oTQ==
X-Received: by 2002:aca:7255:: with SMTP id p82mr372346oic.119.1557866953685; 
 Tue, 14 May 2019 13:49:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o124sm1524501oig.23.2019.05.14.13.49.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 13:49:12 -0700 (PDT)
Date: Tue, 14 May 2019 15:49:12 -0500
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: drm/bridge/synopsys: dw-hdmi: Add
 "unwedge" for ddc bus
Message-ID: <20190514204912.GA25548@bogus>
References: <20190502225336.206885-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502225336.206885-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 mka@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAgMiBNYXkgMjAxOSAxNTo1MzozMiAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90
ZToKPiBJbiBjZXJ0YWluIHNpdHVhdGlvbnMgaXQgd2FzIHNlZW4gdGhhdCB3ZSBjb3VsZCB3ZWRn
ZSB1cCB0aGUgRERDIGJ1cwo+IG9uIHRoZSBIRE1JIGFkYXB0ZXIgb24gcmszMjg4LiAgVGhlIG9u
bHkgd2F5IHRvIHVud2VkZ2Ugd2FzIHRvIG11eCBvbmUKPiBvZiB0aGUgcGlucyBvdmVyIHRvIEdQ
SU8gb3V0cHV0LWRyaXZlbi1sb3cgdGVtcG9yYXJpbHkgYW5kIHRoZW4KPiBxdWlja2x5IG11eCBi
YWNrLiAgRnVsbCBkZXRhaWxzIGNhbiBiZSBmb3VuZCBpbiB0aGUgcGF0Y2gKPiAoImRybS9icmlk
Z2Uvc3lub3BzeXM6IGR3LWhkbWk6IEFkZCAidW53ZWRnZSIgZm9yIGRkYyBidXMiKS4KPiAKPiBT
aW5jZSB1bndlZGdlIHJlcXVpcmVzIHJlbXV4aW5nIHRoZSBwaW5zLCB3ZSBmaXJzdCBuZWVkIHRv
IGFkZCB0byB0aGUKPiBiaW5kaW5ncyBzbyB0aGF0IHdlIGNhbiBzcGVjaWZ5IHdoYXQgc3RhdGUg
dGhlIHBpbnMgc2hvdWxkIGJlIGluIGZvcgo+IHVud2VkZ2luZy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gCj4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0ICAgICAgICAg
fCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAoKUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
