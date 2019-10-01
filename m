Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A5C361C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 15:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB01D89B3B;
	Tue,  1 Oct 2019 13:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E192E89B38
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 13:44:51 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id x3so14456922oig.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 06:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tEk9hnIUXWE3u1Rb3n2bhHYcH2Wd7u6ueEiS5QFdFr0=;
 b=knBl8E9t4Xv9bCE9+US7rkRPeLuwPuZnDCNDH9qrvvhFUW1AnkNtGLyPlrOhmfdIVh
 Vd6AmBe4MiEanCpOlxE5ja3knHWN0cPvFS95cGMkc2QZD0UbNG90sYxbT5G3M+3Z1F8A
 kxqgRTjOMpKSbkjCd04F5b5vWgZTOixXKkASafIzYtsauyqQmkJSl3TC+5ONGudUtfUy
 kvDx8SBjcDFYvZmlzB3T5qy/vC/Soi341D/4UtWi2ZCk9Doy3S+uRMd42joKANAggT8N
 XYBPmBc5ureKqhzyokMS5e9Lmm3dv/r8XS4DuiU2FQ1iOu4lCBtADUOcG2MM1EijG+DJ
 AUtQ==
X-Gm-Message-State: APjAAAUqY7Ek1F7wt5BM5QU7WZCiVw8LMor4cOY2P951ar6GKpjBzJHi
 jzcQ6a+L/NI5SugIg1Ec7r6soNsnpA==
X-Google-Smtp-Source: APXvYqwOufGQSK3HWFRGN91rsiUi3BhlQyYODzFgebhOif+j+ruhjh6YpWFbeO3JiM9jfqQ60ojUuw==
X-Received: by 2002:aca:f0d4:: with SMTP id o203mr3677322oih.15.1569937491029; 
 Tue, 01 Oct 2019 06:44:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v75sm5301353oia.6.2019.10.01.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 06:44:50 -0700 (PDT)
Date: Tue, 1 Oct 2019 08:44:49 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung 2D Graphics
 Accelerator to dt-schema
Message-ID: <20191001134449.GA23645@bogus>
References: <CGME20190927143325eucas1p289cb46e8dcbb1ace0b1f80ade738c29b@eucas1p2.samsung.com>
 <20190927143319.12232-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927143319.12232-1-m.szyprowski@samsung.com>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyNyBTZXAgMjAxOSAxNjozMzoxOSArMDIwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90
ZToKPiBGcm9tOiBNYWNpZWogRmFsa293c2tpIDxtLmZhbGtvd3NraUBzYW1zdW5nLmNvbT4KPiAK
PiBDb252ZXJ0IFNhbXN1bmcgMkQgR3JhcGhpY3MgQWNjZWxlcmF0b3IgdG8gbmV3ZXIgZHQtc2No
ZW1hIGZvcm1hdAo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBGYWxrb3dza2kgPG0uZmFsa293
c2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IHYzOgo+IC0gTWVyZ2VkIHR3byBpZi1zdGF0ZW1lbnRz
IHdpdGggc2luZ2xlIGlmLWVsc2Ugc3RhdGVtZW50Cj4gLSBBZGRlZCAnYWRkaXRpb25hbFByb3Bl
cnRpZXM6IGZhbHNlJwo+IC0gTGlzdGVkIGFsbCBtaXNzaW5nICdwcm9wZXJ0aWVzJyBpbiBwcm9w
ZXJ0aWVzIHNjb3BlCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hY2llaiBGYWxrb3dza2kKPiAtLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctZzJkLnR4dCAgIHwgMjcgLS0t
LS0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1nMmQueWFtbCAgfCA3
NSArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygr
KSwgMjcgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctZzJkLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9zYW1zdW5nLWcyZC55YW1s
Cj4gCgpBcHBsaWVkLCB0aGFua3MuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
