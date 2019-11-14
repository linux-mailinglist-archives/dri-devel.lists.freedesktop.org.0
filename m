Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1483AFBDA6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 02:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11666E06E;
	Thu, 14 Nov 2019 01:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE466E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 01:52:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f10so3499167oto.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tyy/iJPlcDNJd/yf1nrHt+l6qJbLFsBGezCH8MwXmmM=;
 b=CGQcdYlcRsp+6c1ZqQIv6O7H5VsthmhiFUWpJB3J106g5ZaImZKQxsGf8M+rXvJr5/
 Y1wI4VEO2Abf4YBbAqVvJLeUxJvK4axzwIPk7AK8MFaj4X0Aeci/alUGWplTqpRqfBON
 I1rHaRy/vqS4vP3tZ5bfIaW5poHVbJ4pL4+76SBIgn3fpaCIJ7SWI5DpZQ/QuYU5b/ht
 goJgdzwUuxspix6YidvfQArgkNhfhu+6cjmPPBakDD8vjsenqZDi4jziWv7QjSYTOB4l
 25KThP4+Q7Aw6L/k0DBMCVtWQR0/r8NX6Cw44RME9S2T21UXY+nqB0gflMTZPcclr3+N
 jxPA==
X-Gm-Message-State: APjAAAVicUYR502Mgyxf8UDspAuEP9fFvD3UbZjBmTr8PXGgoLF0XMWz
 Qef9RU/l/GJ/wUZm1VVhHg==
X-Google-Smtp-Source: APXvYqwo1UUZAelKrLAwuSh6trS8OhtcFC9X3B8JtWLGubj/w8/T0NRDlQJnITZxmL8ShTtFhqgOQQ==
X-Received: by 2002:a05:6830:1d4d:: with SMTP id
 p13mr6025041oth.286.1573696322369; 
 Wed, 13 Nov 2019 17:52:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o203sm1334139oia.4.2019.11.13.17.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 17:52:01 -0800 (PST)
Date: Wed, 13 Nov 2019 19:52:01 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: rockchip-dsi: document
 external phys
Message-ID: <20191114015201.GA22126@bogus>
References: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
 <20191108000253.8560-3-heiko.stuebner@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108000253.8560-3-heiko.stuebner@theobroma-systems.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, philippe.cornu@st.com, yannick.fertre@st.com,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgOCBOb3YgMjAxOSAwMTowMjo1MCArMDEwMCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6
Cj4gU29tZSBkdy1taXBpLWRzaSBpbnN0YW5jZXMgaW4gUm9ja2NoaXAgU29DcyB1c2UgZXh0ZXJu
YWwgZHBoeXMuCj4gSW4gdGhlc2UgY2FzZXMgdGhlIG5lZWRzIGNsb2NrIHdpbGwgYWxzbyBiZSBn
ZW5lcmF0ZWQgZXh0ZXJuYWxseQo+IHNvIHRoZXNlIGRvbid0IG5lZWQgdGhlIHJlZi1jbG9jayBh
cyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5l
ckB0aGVvYnJvbWEtc3lzdGVtcy5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3Jv
Y2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCAgICAgfCA3ICsrKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
