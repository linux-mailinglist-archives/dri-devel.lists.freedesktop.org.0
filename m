Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F181EB6F6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 10:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C3F89BFC;
	Tue,  2 Jun 2020 08:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF7C89B95
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 08:05:43 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so9343552edq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 01:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SCR2cHiabRKqtkGaERDcoYhLdk1hHk/2OBBAMb5lQNY=;
 b=NI6EenFXTgfPo3vucCLgKR02p2pmBzXye9wNTA6Y2W0BoRMYIRGPViYlxJcLX2AFJe
 2lupglU1Rk5L3iB0uRnPX2GIVnqF1KThCTtWqKrlEUMHyP4k3OUi/z1xA+n8fKnC0ZTb
 jvX1KvBwOVUBrlUpFwfrSEWg/2RqYX2nNWDO9s/K4pzprDJnzGJ3uqRC3sU6jM62z4KV
 7Y3cQZDU8TSLWYjnYllFKhTzoNwMf04G0WiF1NM4drSMAy/8efIcwfxHkdePHqP+muZa
 HUNt11YCg2S2xCdG/tsAto5t02Fe54S5Kx+PhRcmVtbFsQB8HGx3qmkyq8/qqBZ4pR3z
 IhJQ==
X-Gm-Message-State: AOAM532dKBCRI858NQ+XfbxZ3Pn7UonDy7z/N6xMBjeeslFnABRNpJI2
 rdz33RJ0M/xA8j9ZIMYzxGs=
X-Google-Smtp-Source: ABdhPJwZlPDhteUZ4oQPMQH3bkm+GkPpXcVWfKiuXmPmtRXf3HlXBuN/miC3BujdGRr/785rYqnlRQ==
X-Received: by 2002:a50:af85:: with SMTP id h5mr17930429edd.86.1591085141913; 
 Tue, 02 Jun 2020 01:05:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.118])
 by smtp.googlemail.com with ESMTPSA id u10sm1177397edb.65.2020.06.02.01.05.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jun 2020 01:05:41 -0700 (PDT)
Date: Tue, 2 Jun 2020 10:05:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH v5 1/6] dt-bindings: exynos-bus: Add documentation
 for interconnect properties
Message-ID: <20200602080538.GA8216@kozik-lap>
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163219eucas1p2d127fe3936921f53f6fe7902e7d14a3e@eucas1p2.samsung.com>
 <20200529163200.18031-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529163200.18031-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sw0312.kim@samsung.com, a.swigon@samsung.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjksIDIwMjAgYXQgMDY6MzE6NTVQTSArMDIwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBuZXcgb3B0aW9uYWwgcHJvcGVydGll
cyBpbiB0aGUgZXh5bm9zIGJ1cyBub2RlczoKPiBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQs
ICNpbnRlcmNvbm5lY3QtY2VsbHMuCj4gVGhlc2UgcHJvcGVydGllcyBhbGxvdyB0byBzcGVjaWZ5
IHRoZSBTb0MgaW50ZXJjb25uZWN0IHN0cnVjdHVyZSB3aGljaAo+IHRoZW4gYWxsb3dzIHRoZSBp
bnRlcmNvbm5lY3QgY29uc3VtZXIgZGV2aWNlcyB0byByZXF1ZXN0IHNwZWNpZmljCj4gYmFuZHdp
ZHRoIHJlcXVpcmVtZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5z
d2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxz
Lm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY1Ogo+ICAtIGV4eW5v
cyxpbnRlcmNvbm5lY3QtcGFyZW50LW5vZGUgcmVuYW1lZCB0byBzYW1zdW5nLGludGVyY29ubmVj
dC1wYXJlbnQKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZy
ZXEvZXh5bm9zLWJ1cy50eHQgfCAxNSArKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
