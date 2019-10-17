Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1BDAF3F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 16:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FE76E44D;
	Thu, 17 Oct 2019 14:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724C46E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 14:10:35 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w6so2231773oie.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JUCnmISg9Lo1ZQ+QCRXqmsIfbsyyJ8LBPqArNDz2z6I=;
 b=SZ3QZvZnOlsHAw3XGXI02IjaDkGXpuGw4J0014oVjFSd9VDC3Hvv/kXEWytejpd65U
 CkOQMDXlIm5VFlNAS8o0/C9djynB263PMuNwM3JJTxt0UxGTeerWEgRnlbpZnb58kUSr
 V8/+yc3xP98J9nhv8V4itBXJCjdm1KS00gpAL41Y1EqKAQjd7mDYK71g2SddsSlIAXnd
 GOJPei6cYsaesHdzAJROjeRpufMVQRpmUjMMhHnu/nvKkFtCD4N5pPBY5r26kDbM4AAL
 iWiFROy0e0ECMdd/gmOQWwfNon6B85HPZv+2wlkHKiDIjdNanfpYX2phCsVbvTNmRC3R
 ICwg==
X-Gm-Message-State: APjAAAUkl8IXUl2tS/QZJddUuUV70v0FlWgltc4fTJySkV5Rkqu491Cl
 ojgPRjVjG2xkqDXLdH4e6g==
X-Google-Smtp-Source: APXvYqzDwlaHjxT+MIqCZeMtMjgTyWz8EjeESsVfinAxFG8Pf1W0gxmhQtgmXwqjUlGyzfAxEhO9jg==
X-Received: by 2002:aca:5c82:: with SMTP id q124mr816444oib.19.1571321434424; 
 Thu, 17 Oct 2019 07:10:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t17sm617415otk.14.2019.10.17.07.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 07:10:33 -0700 (PDT)
Date: Thu, 17 Oct 2019 09:10:32 -0500
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v6 1/8] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20191017141032.GA23925@bogus>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191016085548.105703-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016085548.105703-2-jacopo+renesas@jmondi.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, horms@verge.net.au,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 robh+dt@kernel.org, kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, laurent.pinchart@ideasonboard.com,
 geert@linux-m68k.org, uli+renesas@fpond.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBPY3QgMjAxOSAxMDo1NTo0MSArMDIwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+
IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciB0aGUgUmVuZXNhcyBS
LUNhciBEaXNwbGF5Cj4gVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPiAKPiBDTU0gaXMg
dGhlIGltYWdlIGVuaGFuY2VtZW50IG1vZHVsZSBhdmFpbGFibGUgb24gZWFjaCBSLUNhciBEVSB2
aWRlbwo+IGNoYW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBl
eGNsdWRlZCkuCj4gCj4gUmV2aWV3ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hh
bStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwgICAgICAgICB8IDY3ICsrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
Y21tLnlhbWwKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
