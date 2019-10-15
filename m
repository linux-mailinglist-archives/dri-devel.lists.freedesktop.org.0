Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA757D803D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 21:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DFD6E201;
	Tue, 15 Oct 2019 19:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650C86E201
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:26:31 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k25so17827886oiw.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 12:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5iiAtGxSrTdQp0QGKq/f7302iXtdKwjl0hjxQ3NkrD4=;
 b=l+QYypY8x1cj+iFq9oPA189iG8V5xOpTjKUz3Z5k6UeCE+Agapz8kU1tah3q5jUDLw
 pS68BynYcGtnoL6DdvDgt4Cv92RTp0elcW13bJfxBmT4zdpihsdvNBqiVSrjfrgeW/A1
 5pX6D/awJ5qp7TCB4vPaI3Yj+uBtMApoaJa8yuZaeqPRtTKZbIG7NQn38Dc/VLg43MfB
 wqqropTX3XtyOoWLsbNJXLDZmYpKp3M+yr7OHIOjaK31mbxHE+Q+i8PzRHFcD+n6yFZm
 ue97yUC+hyF1TdzMBs1fBitkdm0rS1xVcqhhwzR+KClSep3QjBsgZNtxcSlRRWKsu7Vh
 xcDA==
X-Gm-Message-State: APjAAAXaT1MWDACJDITihP1PdNPWV+mHvOqCPIeM1Pmm5LLX5bZ4pDgp
 ptG7K1GHGAg9YY9SdWVH/Q==
X-Google-Smtp-Source: APXvYqw58v3zVqOimrVk1o2jEAKMnN+uiNnsHPtWXeHnlXi8YNPQ9rDOhWl9vJKQ34wRh1IL0tYZ8A==
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr132396oic.137.1571167590519; 
 Tue, 15 Oct 2019 12:26:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 109sm6977628otc.52.2019.10.15.12.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 12:26:29 -0700 (PDT)
Date: Tue, 15 Oct 2019 14:26:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: gpu: samsung-rotator: Fix indentation
Message-ID: <20191015192629.GA3241@bogus>
References: <20191004151414.8458-1-krzk@kernel.org>
 <20191004151414.8458-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004151414.8458-2-krzk@kernel.org>
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
 linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>,
 linux-serial@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgNCBPY3QgMjAxOSAxNzoxNDoxMyArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBBcnJheSBlbGVtZW50cyB1bmRlciAnaXRlbXMnIHNob3VsZCBiZSBpbmRlbnRlZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1y
b3RhdG9yLnlhbWwgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAoKQXBwbGllZCwgdGhhbmtzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
