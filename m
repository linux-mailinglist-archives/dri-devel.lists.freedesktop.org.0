Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D443DC3617
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 15:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8646E7A0;
	Tue,  1 Oct 2019 13:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EB06E79F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 13:43:53 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w144so14429995oia.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 06:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/yW/ATB8FIjR5Cn9PtmrhJch8B9sWOBgNXx/ALh7kW4=;
 b=lOBwuFutW5IHRg+5Jd8RejJpTJZ1rOYevypmENj5PG2l8qBIdOVqfL390yxrucZhLK
 4bB3pvroq/CWSipkpc1zqNCZG/otFobLP4jj+uavBWRND1iEX7e6XL5F+ZnbUguDVtJm
 WW3rgc6zaoXUVRq0YnUt5tl4/w9fXZQzPCVLnFVyCVDP+0rJDsUI2erzuGPo0NjMY3Ch
 64SZkgBNOMbrL8nklqSF1vEtKIbx4gx/UHxYAYUtVDEmkvTDOKPXqyriGa7X/naUThWv
 rVw8avrrbqxMUjqUWBTqDpAhtrfHzcTdKhJlocLqpJ0DUffrYVRSaalW7GKu5rzXpDuj
 OcBg==
X-Gm-Message-State: APjAAAV/ZH7jUtX/kbN9NsgkWRYjyOcwU2gOvnrWhWci1QCulpeRxR5n
 /7n7JSBePBQTlFciOat8KA==
X-Google-Smtp-Source: APXvYqxH2El57SgxyxkgxKtPK7pxEqgYVY65LB7/f68E0xMJaKaZcvMhKHFXAxY2wZestrQ0pvaG5g==
X-Received: by 2002:aca:5186:: with SMTP id f128mr3881842oib.107.1569937432345; 
 Tue, 01 Oct 2019 06:43:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f12sm4950926oij.1.2019.10.01.06.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 06:43:51 -0700 (PDT)
Date: Tue, 1 Oct 2019 08:43:51 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung Image Scaler to
 dt-schema
Message-ID: <20191001134351.GA21744@bogus>
References: <CGME20190927143314eucas1p2d419866cd740207426cd37cb6fdff468@eucas1p2.samsung.com>
 <20190927143306.12133-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927143306.12133-1-m.szyprowski@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNyBTZXAgMjAxOSAxNjozMzowNiArMDIwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90
ZToKPiBGcm9tOiBNYWNpZWogRmFsa293c2tpIDxtLmZhbGtvd3NraUBzYW1zdW5nLmNvbT4KPiAK
PiBDb252ZXJ0IFNhbXN1bmcgSW1hZ2UgU2NhbGVyIHRvIG5ld2VyIGR0LXNjaGVtYSBmb3JtYXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWFjaWVqIEZhbGtvd3NraSA8bS5mYWxrb3dza2lAc2Ftc3Vu
Zy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNh
bXN1bmcuY29tPgo+IC0tLQo+IHYzOgo+IC0gRml4ZWQgZGVzY3JpcHRpb24gb2YgJ2Nsb2Nrcycg
cHJvcGVydHk6Cj4gcmF0aGVyIHRoYW4gJ21zY2wgY2xvY2snLCAncGNsayBjbG9jaycKPiAtIEFk
ZGVkIGVtcHR5IGxpbmUgd2l0aGluIGlmLWVsc2Ugc3RhdGVtZW50Cj4gLSBBZGRlZCAnYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlJwo+IC0gTGlzdGVkIGFsbCBtaXNzaW5nICdwcm9wZXJ0aWVz
JyBpbiBwcm9wZXJ0aWVzIHNjb3BlCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hY2llaiBGYWxrb3dz
a2kKPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2dwdS9zYW1zdW5nLXNjYWxlci50eHQgICAgICAgICAg
IHwgMjcgLS0tLS0tLQo+ICAuLi4vYmluZGluZ3MvZ3B1L3NhbXN1bmctc2NhbGVyLnlhbWwgICAg
ICAgICAgfCA4MSArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgODEgaW5z
ZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctc2NhbGVyLnR4dAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9zYW1z
dW5nLXNjYWxlci55YW1sCj4gCgpBcHBsaWVkLCB0aGFua3MuCgpSb2IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
