Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5292FCFD1B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F836E82A;
	Tue,  8 Oct 2019 15:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888716E82A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:05:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o18so19783127wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 08:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rX0PXXQKYXyZRDbrBWfRRnZ6rIagZRqMiLAQaZV8zbs=;
 b=Z2Qkgv9pb01Q0LPT3T/iJ/w8J7L9E6ZFXnFuDKmIx/AyiHMDDJ+KqIeuB7I+axxcgV
 qFHHOOvrCA7x9ur2ywKfmc6bpm1wWiOetbHeEkXTT3RcHRfIdcolcpgb6IDdQdVJ2+9U
 hqV7IolaYHEdVne4sRCeTHBtyckqwvALNES3Pu6SNEoaHmu9bqm0qKEVYTa2/wOAjatW
 89DGpQkJcwoTlq2JPGn+ib5cgm6uHGrCtRf1gtx3RHspREb+kIlIkDXSt1+iWmNW+2YI
 1ZW2Mf6beyc8J21RO9ZhCImdIybZsRvxFKVtKxiTnKl6buWA/MtuvDfWcqKz/T6biwYd
 lNtg==
X-Gm-Message-State: APjAAAXrYozOatDP0pMoiMYXr1ePgCJb3DcuwnS+B/SVNnhdN6Ol2kXX
 a3wk158npvnBKbwV8lRjUV4=
X-Google-Smtp-Source: APXvYqxbH6kNC2No7U6c2Eckjb4BC3VaoHcgnIuNUSw/LgzIdnnn5qz0WdDmVXiEjMQbUVy1l+M2yg==
X-Received: by 2002:adf:f311:: with SMTP id i17mr17611648wro.394.1570547099949; 
 Tue, 08 Oct 2019 08:04:59 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id l9sm3273799wme.45.2019.10.08.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 08:04:59 -0700 (PDT)
Date: Tue, 8 Oct 2019 17:04:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
Message-ID: <20191008150456.GA2683@pi3>
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
 <20191008125038.GA2550@pi3>
 <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
 <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
 <20191008142900.GA2635@pi3>
 <CAL_Jsq+ObMD=inkMFqkZbKFoKZUxw53gUMnjsC1pU5GwumK8LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+ObMD=inkMFqkZbKFoKZUxw53gUMnjsC1pU5GwumK8LQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDk6Mzg6MTVBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gQXJlIHlvdSBydW5uaW5nIHVzaW5nIERUX1NDSEVNQV9GSUxFUz8gSWYgc28sIHlvdSB3
b24ndCBnZXQgdGhlIGNvcmUgc2NoZW1hLgoKQWgsIHllcywgbm93IEkgc2VlIHByb3BlciBlcnJv
cnMuIFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcy4KCkknbGwgc2VuZCBuZXh0IHZlcnNpb24gb2Yg
dGhpcyBwYXRjaCBvbmx5IChpZiBvdGhlcnMgYXJlIG9rKS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6
dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
