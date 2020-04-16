Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DB1ABBB1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4D6EB2B;
	Thu, 16 Apr 2020 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00EA6EB2B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:51:00 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e5so7999275edq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 01:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=612iSfEdCExrydRb4c/BtgR5OtI+RlzyNcwVt1HFejQ=;
 b=JHsJ+z80yf3lSSWHtxlPdFNcywQa/PXF8XtgJupOX4L0XVp0Y4iNhp8lCNU9q3vjTx
 LDN0oUm4Egc6xSInuiy5FKlm1eKFbTChcGqXS37vcxMqdlXMt5boHm7beSh+3RySWatU
 LfE31yjlAs/q+SEIP/AtfH4QUwVBQLHRWWp+AjerkFO7aZU0jErSp0e5fch42FhUI377
 KdyKwocs8KeA8+xY0Kuq7xKKB+pVwRNvLLAAKZTPzkl9WWoJDAcZsYKJDwMu8/is3WIW
 p8VJmEaJM7pvl+wXBiNtl72D2Sg3HV6DAICeqgS5IjySJVKOufL7Vup2G3pa6xi0ioII
 wdFQ==
X-Gm-Message-State: AGi0PuYxeVr8l/DQO79APzCb3WXfXPFUStrAAuzFn2LD7od1tGcHY7hp
 Ef1i5e0AHhTNja//kd4zM+4=
X-Google-Smtp-Source: APiQypLBJohNWBf8al3U6Nm7wdqmu7TVhKtwUuNuYqABpoxhkFpKFPfFew2b9nU4yPhd8D2/wycwag==
X-Received: by 2002:aa7:d1d6:: with SMTP id g22mr7466242edp.36.1587027059468; 
 Thu, 16 Apr 2020 01:50:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id b15sm2495600edn.69.2020.04.16.01.50.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Apr 2020 01:50:58 -0700 (PDT)
Date: Thu, 16 Apr 2020 10:50:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Bakker <xc-racer2@live.ca>
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Message-ID: <20200416085049.GA7193@kozik-lap>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
 <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
 <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, James Hogan <jhogan@kernel.org>,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 11:17:16AM -0700, Jonathan Bakker wrote:
 
> >>
> >>> +
> >>> +                       assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> >>> +                       assigned-clock-rates = <0>, <66700000>;
> >>> +                       assigned-clock-parents = <&clocks MOUT_MPLL>;
> >>
> >> Probably this should have status disabled because you do not set
> >> regulator supply.
> 
> I don't believe there is a regulator on s5pv210, if there is, then it is a
> fixed regulator with no control on both s5pv210 devices that I have.
> 
> The vendor driver did use the regulator framework for its power domain
> implementation, but that definitely shouldn't be upstreamed.

Starting with Exynos4210 usually they have separate regulator from PMIC
but maybe S5Pv210 indeed is different.  Leave it then without it.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
