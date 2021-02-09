Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA693155B4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 19:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577946EB93;
	Tue,  9 Feb 2021 18:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FF86EB93
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 18:15:14 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id k10so15976779otl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 10:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yvEVgFXxj42ho51jb6dVDNgFxU/choj/euDd8LGx2dg=;
 b=Kth2BfLZejP/t99Osbzb17v60fbzyxeXjD4HfmVPAjCgeU3wyflj9lf2F0qixqGavf
 mV+TGkBNU1dGMTsF/sh0bVv8WNCinjmqxaCSFhsqSHFB6KbFOIUhf4BWrStNXGtWhXlu
 AJKWGUw4AQJ4mPN0sCH6h9RjJiEBIivrtYHSglkF36x1mcO4+5A3KViUY/aMvEVnMjI4
 /1NbJtySGMDtm21y29Kk4RydP0rw40abg4nhs5Idjy80QsLLnIDNa9t++pvBZAvV5ral
 8/BsrabHjYYSuba5a95SLBCGu9Dm4Qqcz3yfs7ZN57zcoSnwMnYUsp/vTah4O/2NgE63
 zbJw==
X-Gm-Message-State: AOAM531bZYo1rqmaDDK/aLDzMIvdVDLq0eEvEfzUFZnM/ouspoFZcVFz
 CccZ3K6yjqhW+CqQ4DI/hw==
X-Google-Smtp-Source: ABdhPJw4/5gXHlRhCLR6H+bmHa3XmOMLzdwLZrFeDUAOJtrrf0tETU3GzM5HQDG/rPU0Swpi08bOfg==
X-Received: by 2002:a9d:17ed:: with SMTP id
 j100mr17375162otj.169.1612894513667; 
 Tue, 09 Feb 2021 10:15:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k67sm3069817oia.7.2021.02.09.10.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:15:12 -0800 (PST)
Received: (nullmailer pid 4073574 invoked by uid 1000);
 Tue, 09 Feb 2021 18:15:10 -0000
Date: Tue, 9 Feb 2021 12:15:10 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 09/14] drm/bridge: imx: Add i.MX8qxp pixel link to DPI
 support
Message-ID: <20210209181510.GA4045547@robh.at.kernel.org>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
 <1611737488-2791-10-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611737488-2791-10-git-send-email-victor.liu@nxp.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjcsIDIwMjEgYXQgMDQ6NTE6MjNQTSArMDgwMCwgTGl1IFlpbmcgd3JvdGU6
Cj4gVGhpcyBwYXRjaCBhZGRzIGEgZHJtIGJyaWRnZSBkcml2ZXIgZm9yIGkuTVg4cXhwIHBpeGVs
IGxpbmsgdG8gZGlzcGxheQo+IHBpeGVsIGludGVyZmFjZShQWEwyRFBJKS4gIFRoZSBQWEwyRFBJ
IGludGVyZmFjZXMgdGhlIHBpeGVsIGxpbmsgMzYtYml0Cj4gZGF0YSBvdXRwdXQgYW5kIHRoZSBE
U0kgY29udHJvbGxlcuKAmXMgTUlQSS1EUEkgMjQtYml0IGRhdGEgaW5wdXQsIGFuZAo+IGlucHV0
cyBvZiBMVkRTIERpc3BsYXkgQnJpZGdlKExEQikgbW9kdWxlIHVzZWQgaW4gTFZEUyBtb2RlLCB0
byByZW1hcAo+IHRoZSBwaXhlbCBjb2xvciBjb2RpbmdzIGJldHdlZW4gdGhvc2UgbW9kdWxlcy4g
VGhlIFBYTDJEUEkgaXMgcHVyZWx5Cj4gY29tYmluYXRvcmlhbC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPgo+IC0tLQo+IHYyLT52MzoKPiAqIENhbGwg
c3lzY29uX25vZGVfdG9fcmVnbWFwKCkgdG8gZ2V0IHJlZ21hcCBpbnN0ZWFkIG9mCj4gICBzeXNj
b25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKCkuCj4gCj4gdjEtPnYyOgo+ICogRHJvcCB1bm5l
Y2Vzc2FyeSBwb3J0IGF2YWlsYWJpbGl0eSBjaGVjay4KPiAKPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9pbXgvS2NvbmZpZyAgICAgICAgICAgfCAgIDggKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2lteC9NYWtlZmlsZSAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvaW14L2lteDhxeHAtcHhsMmRwaS5jIHwgNDg4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ5NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhwLXB4bDJkcGkuYwoKPiArCXAy
ZC0+cmVnbWFwID0gc3lzY29uX25vZGVfdG9fcmVnbWFwKG5wLT5wYXJlbnQpOwo+ICsJaWYgKElT
X0VSUihwMmQtPnJlZ21hcCkpIHsKPiArCQlyZXQgPSBQVFJfRVJSKHAyZC0+cmVnbWFwKTsKPiAr
CQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4gKwkJCURSTV9ERVZfRVJST1IoZGV2LCAiZmFp
bGVkIHRvIGdldCByZWdtYXA6ICVkXG4iLCByZXQpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4g
Kwo+ICsJcDJkLT5pZCA9IG9mX2FsaWFzX2dldF9pZChucCwgInB4bDJkcGkiKTsKCkRvbid0IGFk
ZCByYW5kb20gYWxpYXNlcy4gSSdkIHJhdGhlciBzZWUgYSBwcm9wZXJ0eSBpbiB0aGlzIG5vZGUg
YXMgbG9uZyAKYXMgaXQgaXMgc3BlY2lmaWMgdG8gd2hhdCB0aGlzIGlzIHVzZWQgZm9yIChhbmQg
bm90IGEgZ2VuZXJpYyBpbmRleCkuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
