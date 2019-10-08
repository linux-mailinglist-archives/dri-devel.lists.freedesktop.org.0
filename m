Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B3CFD35
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DC66E829;
	Tue,  8 Oct 2019 15:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030336E829
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:10:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z9so19799351wrl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 08:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jDr1BzlICCTlwhp3uNGJEPl314YzfcfD31Fib2fRNSo=;
 b=l+N8bWXH4wiuOGyerizV55s+p7BNF1WmurfNgQYpBKin1E1dHlK8ehH3Bbh5FHMV9S
 Q4LPRyVrj1a8vKBDz59uNbv0kZOFHDaikgoVMJtSND+zZh88T3JHS4LWHlRnlJrH48Tx
 oF6MZQWWEEc2EEmsjkKj0sVpsSQMQGGzoTX2CZcyedH9g6cXF7CUq3o1u2GzmhMHi2cO
 qwNAC+i4OmYNN+MwgYCPqGR6vPOhYZffTsRglhKxu4VDzWDfPPj3lEHLyLYTEhBN6O+Y
 7Q4Jfyy0EZsXynRqYBxoe34C8HvEt0ejWtWFkqR9HpSGkAkrtsh6Q7LtYpGJb7Q/JWKs
 G+iA==
X-Gm-Message-State: APjAAAUxdQUil4cgaI1DtRlUaZQnUTZs6UaRdATSwtqRNCPJQnxCGmi5
 0juh/+HWjzySalaHnOhIVeM=
X-Google-Smtp-Source: APXvYqzX4ka2psn6HEE8SlAx19V028jaUxy26b9V7r9ws/He1WJtNpQAY+Uuwiz4uo5g6s4xsd7i9w==
X-Received: by 2002:adf:ecc1:: with SMTP id s1mr19736353wro.223.1570547431457; 
 Tue, 08 Oct 2019 08:10:31 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id 90sm26487496wrr.1.2019.10.08.08.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 08:10:30 -0700 (PDT)
Date: Tue, 8 Oct 2019 17:10:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
Message-ID: <20191008151028.GA2720@pi3>
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
 <20191008125038.GA2550@pi3>
 <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
 <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
 <20191008142900.GA2635@pi3>
 <CAL_Jsq+ObMD=inkMFqkZbKFoKZUxw53gUMnjsC1pU5GwumK8LQ@mail.gmail.com>
 <20191008150456.GA2683@pi3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008150456.GA2683@pi3>
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

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDU6MDQ6NTZQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOTozODoxNUFNIC0wNTAwLCBS
b2IgSGVycmluZyB3cm90ZToKPiA+IEFyZSB5b3UgcnVubmluZyB1c2luZyBEVF9TQ0hFTUFfRklM
RVM/IElmIHNvLCB5b3Ugd29uJ3QgZ2V0IHRoZSBjb3JlIHNjaGVtYS4KPiAKPiBBaCwgeWVzLCBu
b3cgSSBzZWUgcHJvcGVyIGVycm9ycy4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzLgo+IAo+IEkn
bGwgc2VuZCBuZXh0IHZlcnNpb24gb2YgdGhpcyBwYXRjaCBvbmx5IChpZiBvdGhlcnMgYXJlIG9r
KS4KPiAKCk9mIGNvdXJzZSwgdGhlcmUgd2lsbCBiZSBubyB2MiwgdGhpcyBwYXRjaCBjYW4gYmUg
anVzdCBza2lwcGVkLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
