Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333E452A3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 05:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E269089301;
	Fri, 14 Jun 2019 03:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1D89301
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 03:18:57 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k8so1265099edr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rY0FBLu0h9/AWoT8gIxRHyZHL+wYrWVVxtiQxFiOFAg=;
 b=QcxprPqwwm1V0pAVd0si9cvCQpDtTKMJc+ODgQANhJSmt+VmXFKgv1cdMHEmW7+3dQ
 d/oyn+5KkBctaYfxZ89vEH6MWCwdv3s7j6hJwS5NKg4XfGbapiDnNXni2WBzgS12gCPu
 9lZ1GA0h7uBJ4vlDi8XbWlMn0ADctDlhiOZtAeZ50vBPOjPArQ4id4SNLmh598TOb3qf
 8wViO9T+miN7gQ+LtwRJ3Dt/WV4FnTJWlNewxkr1JzDn2PXr9Pv0SUr7s/nmQq5I20sb
 P7B6L/t6ANYk52AY1PH4ZWW+3PEuKc5rcQlE8OHNtk4O2tu7FJVoSsbCuEdSqsizdvW5
 aI9Q==
X-Gm-Message-State: APjAAAV5YvfPqJg8jAvYTjI6cP2+np78THdvqaFHHwffGLglXOQXN9n2
 l7wmC/egrisOCiK5HhZNafbjMa1A9CU=
X-Google-Smtp-Source: APXvYqyIA1qnrEFPhmc8qnrTvRdx1XdSzzNo3dDDnzbUoKdd3bRpy8lwNw7VsruIO8XeBWQvaI6Mbw==
X-Received: by 2002:a17:906:2641:: with SMTP id i1mr1961997ejc.9.1560482335071; 
 Thu, 13 Jun 2019 20:18:55 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id m21sm467635edq.57.2019.06.13.20.18.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 20:18:54 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id r16so843730wrl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:18:54 -0700 (PDT)
X-Received: by 2002:a5d:4311:: with SMTP id h17mr64136370wrq.9.1560482334085; 
 Thu, 13 Jun 2019 20:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-2-jagan@amarulasolutions.com>
In-Reply-To: <20190613185241.22800-2-jagan@amarulasolutions.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 14 Jun 2019 11:18:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64NVoakoRzg6XeE0jzgACU3G7=_E6MOGfPYGkw3f8E8nQ@mail.gmail.com>
Message-ID: <CAGb2v64NVoakoRzg6XeE0jzgACU3G7=_E6MOGfPYGkw3f8E8nQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/9] dt-bindings: display: Add TCON LCD
 compatible for R40
To: Jagan Teki <jagan@amarulasolutions.com>
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
 devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1MyBBTSBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBMaWtlIFRDT04gVFYwLCBUVjEgYWxsd2lubmVyIFI0
MCBoYXMgVENPTiBMQ0QwLCBMQ0QxIHdoaWNoCj4gYXJlIG1hbmFnZWQgdmlhIFRDT04gVE9QLgo+
Cj4gQWRkIHRjb24gbGNkIGNvbXBhdGlibGUgUjQwLCB0aGUgc2FtZSBjb21wYXRpYmxlIGNhbiBo
YW5kbGUKPiBUQ09OIExDRDAsIExDRDEuCj4KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz4KPiBDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KCkFja2Vk
LWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
