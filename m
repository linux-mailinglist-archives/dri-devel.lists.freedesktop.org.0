Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8165E54B8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34286EB97;
	Fri, 25 Oct 2019 19:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718256EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 19:57:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b19so521299otq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 12:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vR6JfARNLEdQedVXU6cdnKK1oArUYjwjaYiXjYaoHc0=;
 b=AP1vc6ZOTZ2VvuPbGYYcq0ap/1sLnUtAhmI/TR+VrhomoWTxYa0bxFMvp6bdrlv17v
 Yij53ZmZMqL2WrXUrXXxqTWcQV90YeTZ/0Sc6tOE3zEbjx7Jz4MuQ5CdMyxKry/QFcsX
 7Kq7ssPFqKcs8cmhqucgs+Gs8aKpapJxUpv3iWstirWjuU1HfS8rs4242Waxs6+yOWIS
 EqskCudyycxmN6FgbFsSGAZAgYRNhiZeyf6AbDgb+34IVo8mIvYtz8eutmL3EMmGYa+E
 yMIZq5QOiitGfm64tUZkO5I7pQeXtOp4g2r2PHfhpTtEWs430wrgy4mzFz0hBZkyTNE1
 18Qw==
X-Gm-Message-State: APjAAAV2OscjTV9/Sh7ehhOZUUKl1Cj02WjephWELWLJn8Om6y69ZKlD
 FJ8oWP8v4jN2gTzT0b5aqw==
X-Google-Smtp-Source: APXvYqwv9bZ/xqpklU+q/k/SuPV3s2p1vdM8b7SEvaExUIE1wvWyWTZsIszAxtQysWODjTSXm6aHnQ==
X-Received: by 2002:a9d:7a52:: with SMTP id z18mr4182159otm.234.1572033432552; 
 Fri, 25 Oct 2019 12:57:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t18sm1010526otm.8.2019.10.25.12.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:57:11 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:57:11 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge: lvds-transmitter:
 Add new props
Message-ID: <20191025195711.GA1074@bogus>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-18-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDU6NDU6MDhQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IEFkZCB0aGUgZGF0YS1tYXBwaW5nIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRoZSBv
dXRwdXQgYnVzIGZvcm1hdCBhbmQKPiB0aGUgYnVzLXdpZHRoIHByb3BlcnR5IHRvIGRlc2NyaWJl
IHRoZSBpbnB1dCBidXMgZm9ybWF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoK
PiAqIE5ldyBwYXRjaAo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10
cmFuc21pdHRlci50eHQgICAgfCAxMyArKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVy
LnR4dAo+IGluZGV4IDYwMDkxZGI1ZGZhNS4uN2I0M2I2ZjIwMjc5IDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5z
bWl0dGVyLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAo+IEBAIC0zNiw2ICszNiwxOSBAQCBncmFw
aCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2dyYXBoLnR4dC4KPiAgLSBWaWRlbyBwb3J0IDAgZm9yIHBhcmFsbGVsIGlucHV0Cj4gIC0gVmlk
ZW8gcG9ydCAxIGZvciBMVkRTIG91dHB1dAo+ICAKPiArT3B0aW9uYWwgcG9ydCAwIG5vZGUgcHJv
cGVydGllczoKPiArCj4gKy0gYnVzLXdpZHRoOiBudW1iZXIgb2YgZGF0YSBsaW5lcyB1c2UgdG8g
dHJhbnNtaXQgdGhlIFJHQiBkYXRhLgo+ICsJICAgICBDYW4gYmUgMTggb3IgMjQuCj4gKwo+ICtP
cHRpb25hbCBwb3J0IDEgbm9kZSBwcm9wZXJ0aWVzOgo+ICsKPiArLSBkYXRhLW1hcHBpbmc6IHNl
ZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sdmRzLnlh
bWwKPiArCQlmb3IgbW9yZSBkZXRhaWxzIGFib3V0IHRoaXMgTFZEUyBkYXRhLW1hcHBpbmcgcHJv
cGVydHkuCj4gKwkJU3VwcG9ydGVkIHZhbHVlczoKPiArCQkiamVpZGEtMTgiCj4gKwkJImplaWRh
LTI0Igo+ICsJCSJ2ZXNhLTI0IgoKVGhpcyBpcyBhbHJlYWR5IGRlZmluZWQgdG8gYmUgYSBwYW5l
bCBwcm9wZXJ0eS4gRG8gd2UgbmVlZCBpdCBhdCBib3RoIAplbmRzPwoKQWxzbywgd2h5IGR1cGxp
Y2F0ZSBhbGwgdGhlIHN1cHBvcnRlZCB2YWx1ZXMuCgpSb2IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
