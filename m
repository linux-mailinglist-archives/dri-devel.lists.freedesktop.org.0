Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2F6382A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1A289320;
	Tue,  9 Jul 2019 14:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728C89320
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:49:30 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k20so43677392ios.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 07:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NBos5KwAP2Y9O9kzC0Y3x26RLLeEVK2uJfPnwG/7Y9E=;
 b=cFRwQZ/ScI4qGST5TGQNV9ZOcDU1bzjU+YThX4QAdBWsDaN3b0ZvYZs9FEO1fs3b2E
 JC5yqhgW/RHARPQPlITnOO3rPiq79rsugXCYd1RLjBWVBN9ujQPGwLhxu7CvkLsIuJyk
 UfZLpi6Zg6Ws4+CclOngLpqhAJOdRXpO+pNfYTa4hnSZ9NrxZLGErhTLd95gcIi11fJu
 gGmD7FpgxIKUfcdxC+nkn1b251EPKFr8fEh/vvJj61mjjArfvgcqoqSCtvaZ+zY1Pn3G
 mQKDjslzPhtCXMznDiVS60XqPne0U6nBy1EyaTY6/cobbcAoATpv4V5lLMN7j51Ml5Uj
 2nqw==
X-Gm-Message-State: APjAAAVeiGln0Pbtmr+ZnMwMjC7raq14Jx5QsqaP9Zdsm1s3wDfoAS6L
 p1BvNNmk/+xTydVqU/iikw==
X-Google-Smtp-Source: APXvYqyE5RmuWhStelgqyIGOf6PvzmyOg1Fsspjxojnp3v8t3CgCwImQuOBGdwN4EusPvXDRomJhDg==
X-Received: by 2002:a02:230a:: with SMTP id u10mr28541580jau.117.1562683769810; 
 Tue, 09 Jul 2019 07:49:29 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id s2sm15034890ioj.8.2019.07.09.07.49.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:49:29 -0700 (PDT)
Date: Tue, 9 Jul 2019 08:49:28 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: display: Add TCON LCD compatible for
 R40
Message-ID: <20190709144928.GA31407@bogus>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614164324.9427-2-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSAyMjoxMzoxNiArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiBM
aWtlIFRDT04gVFYwLCBUVjEgYWxsd2lubmVyIFI0MCBoYXMgVENPTiBMQ0QwLCBMQ0QxIHdoaWNo
Cj4gYXJlIG1hbmFnZWQgdmlhIFRDT04gVE9QLgo+IAo+IEFkZCB0Y29uIGxjZCBjb21wYXRpYmxl
IFI0MCwgdGhlIHNhbWUgY29tcGF0aWJsZSBjYW4gaGFuZGxlCj4gVENPTiBMQ0QwLCBMQ0QxLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+IEFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gLS0tCj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjRpLWRybS50eHQg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCgpSZXZpZXdlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
