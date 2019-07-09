Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2563925
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 18:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8308B6E030;
	Tue,  9 Jul 2019 16:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571336E030
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 16:16:29 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j5so25024846ioj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 09:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cmH0c7rU2QLLyWG/6xPHKfwtrFCXaKp58TMMmxWczzs=;
 b=PVXRsZg9jxNC4ZpBCa2DCOf4PpvlQ3v7xmms08wkYCQjrb6/O7cqDtCyquSCrNRcQX
 KyPOefpBMjxvGZ7NDpyMWyODyZwTAoN/MWSb5/1PhlXcvy3WuBLDBuQKNUgTJbfTSMs6
 HvgE5kNg0JGYykrK41g4JRAwhKsZQekGvbFZJseMQDmOOKIuVoe3JqRmtFd24x62j6Pm
 haN9Nrr9JEHByQIX/jf5gHIsKy+2e8+lIweQ5TBA2R6k0064kHHhBw6YeeBppELhegiW
 jrC+zJ7W5myyYdSX5wQQXkgbEx8Vk3QMHvAYZoxqJg8W/2dALrbQkpRlWZF8kW84Uufm
 vybQ==
X-Gm-Message-State: APjAAAXlB3kELSKhYggwJGynpQg421wEcnMxNJbDVB6nR4anXRa/VoRf
 9c12wrBMwxtW6NxEuyjiNA==
X-Google-Smtp-Source: APXvYqzdvfXwgR2WspdKABPMp95eGUqFQLHUA9L2KvpwEo20v19atw5mJsEZC4pFZvMvyV7fMi+5Rg==
X-Received: by 2002:a5d:9711:: with SMTP id h17mr20726190iol.280.1562688988577; 
 Tue, 09 Jul 2019 09:16:28 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id 8sm13425764ion.26.2019.07.09.09.16.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 09:16:27 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:16:26 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible
 (w/  A31 fallback)
Message-ID: <20190709161626.GA28908@bogus>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-8-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614164324.9427-8-jagan@amarulasolutions.com>
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

T24gRnJpLCAxNCBKdW4gMjAxOSAyMjoxMzoyMiArMDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiBU
aGUgTUlQSSBEU0kgUEhZIGNvbnRyb2xsZXIgb24gQWxsd2lubmVyIFI0MCBpcyBzaW1pbGFyCj4g
b24gdGhlIG9uZSBvbiBBMzEuCj4gCj4gQWRkIFI0MCBjb21wYXRpYmxlIGFuZCBhcHBlbmQgQTMx
IGNvbXBhdGlibGUgYXMgZmFsbGJhY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N1bnhpL3N1bjZpLWRzaS50eHQgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
