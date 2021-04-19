Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD25363E8D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 11:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D9F89E01;
	Mon, 19 Apr 2021 09:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gw.atmark-techno.com (gw.atmark-techno.com [13.115.124.170])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B11989E01
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 09:34:09 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gw.atmark-techno.com (Postfix) with ESMTPS id B08568049E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 18:34:08 +0900 (JST)
Received: by mail-il1-f197.google.com with SMTP id
 q7-20020a056e0215c7b029013ea7521279so10913391ilu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 02:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f9v+Sm8mKFEbQyXi/sN2tJHr2LOa9v0CsJoz/H5l6cU=;
 b=Nbgf+Yn/+UTfJ4zIaDILJPajRSdFhlOA0IwIOAN6Qx7kG+doUgSugmUZIsq9SCHTgm
 kC5iRBgeSvB98W7+CBbioVbNCpCgWZTPHB+QoC4rxofm1vMgojFZ4WHycDBo56iU0yh0
 k2muSyl/T6btUQa6BQM5p5jDq20AeQkMK0ZU88GGMx0BXVoqtXueQdh7zok7DYBAWQMR
 tbViKgcgAu/3oKPJHHJAs17EvVTF2kKjN1tyKy2stPyI9/gf4KXjtbyfPD/kw+nRwYfW
 Vs2H1arRf2fHyTALg2LYqVaNnUIBGwDZ6QLwRfw1aY4Oso8XlyUoJTzF1sPqpUMJwacd
 dJNg==
X-Gm-Message-State: AOAM530o2mKk9bEDGw6Ng1Mz4WrtObzalJj+THR/fpMJTX5zG7W1iEof
 X7VwKBxfX776TsqKEOsWjtQl7dKq6RECnQvxGMUp/hsPe2Y03+y64dxqiDXNDIdqJZ/5jgm6WkF
 4bbCA2XnoMiF5WPyXNh8DqDva5rg+T2t+
X-Received: by 2002:a63:1665:: with SMTP id 37mr11208875pgw.31.1618824837066; 
 Mon, 19 Apr 2021 02:33:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BVfHB/Iu3InVzb+YLUkuY7/BfcYMlC0sOGsbJiks+G4SQp5aPsproxuobb7vRE8Qif9k+g==
X-Received: by 2002:a63:1665:: with SMTP id 37mr11208853pgw.31.1618824836841; 
 Mon, 19 Apr 2021 02:33:56 -0700 (PDT)
Received: from pc-0115 (103.131.189.35.bc.googleusercontent.com.
 [35.189.131.103])
 by smtp.gmail.com with ESMTPSA id x18sm10982637pjn.51.2021.04.19.02.33.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:33:56 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYQHy-002k7D-3h; Mon, 19 Apr 2021 18:33:54 +0900
Date: Mon, 19 Apr 2021 18:33:44 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH1OeFy+SepIYYG0@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
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
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 peter.ujfalusi@gmail.com, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, wim@linux-watchdog.org,
 herbert@gondor.apana.org.au, horia.geanta@nxp.com, khilman@baylibre.com,
 joro@8bytes.org, narmstrong@baylibre.com, linux-staging@lists.linux.dev,
 iommu@lists.linux-foundation.org, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, will@kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Alice Guo \(OSS\)" <alice.guo@oss.nxp.com>, balbi@kernel.org,
 tomba@kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
 robert.foss@linaro.org, leoyang.li@nxp.com, linux@prisktech.co.nz,
 vkoul@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 j-keerthy@ti.com, dmaengine@vger.kernel.org, Roy.Pledge@nxp.com,
 jyri.sarha@iki.fi, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Geert Uytterhoeven wrote on Mon, Apr 19, 2021 at 11:03:24AM +0200:
> > This is going to need quite some more work to be acceptable, in my
> > opinion, but I think it should be possible.
> 
> In general, this is very hard to do, IMHO. Some drivers may be used on
> multiple platforms, some of them registering an SoC device, some of
> them not registering an SoC device.  So there is no way to know the
> difference between "SoC device not registered, intentionally", and
> "SoC device not yet registered".

Hm, good point, I was probably a bit too optimistic if there are devices
which don't register any soc yet have drivers which want one; I don't
see how to make the difference indeed... And that does mean we can't
just defer all the time.

> soc_device_match() should only be used as a last resort, to identify
> systems that cannot be identified otherwise.  Typically this is used for
> quirks, which should only be enabled on a very specific subset of
> systems.  IMHO such systems should make sure soc_device_match()
> is available early, by registering their SoC device early.

I definitely agree there, my suggestion to defer was only because I know
of no other way to influence the ordering of drivers loading reliably
and gave up on soc being init'd early.

In this particular case the problem is that since 7d981405d0fd ("soc:
imx8m: change to use platform driver") the soc probe tries to use the
nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
So soc loading gets pushed back to the end of the list because it gets
defered and other drivers relying on soc_device_match get confused
because they wrongly think a device doesn't match a quirk when it
actually does.

If there is a way to ensure the nvmem driver gets loaded before the soc,
that would also solve the problem nicely, and avoid the need to mess
with all the ~50 drivers which use it.


Is there a way to control in what order drivers get loaded? Something in
the dtb perhaps?


Thanks,
-- 
Dominique
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
