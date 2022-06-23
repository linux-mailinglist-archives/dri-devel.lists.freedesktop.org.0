Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A615577CD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 12:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65B110EB52;
	Thu, 23 Jun 2022 10:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5427910E36D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 10:25:08 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a11so13956313ljb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WqCHtUCnOvJqjoM2/65DgkYvOyKmc4p+aq7/u8FCyxA=;
 b=PIkKFT6MmcaUETNYYp/00cGxbMns4B3hZ5K5nmtGI6rNA0GIEW+mljG/Fne1m1MoDJ
 hEob9rUTJYEcXgm+2VfxUeSgEiCC4beWQTqOtIjvrmPzJY59yY0aQjFSYFq6uZ+yCsBY
 TkSAwqVecLhSbMBWc2qGK5asYINBDeVKWuZfIJIRPVXH2ooAOk+CilaQasEiFEnBPvo1
 9yU7sRGCq0pbvG7DXQEPHm1Bepg/+EXQeJ5lKtflHEWo024/pU+tCE0tyKXp96P7eK6/
 MtHCviPz6ujkgIRgMZdT9HQ/BMuTmBvX0T0E+5sbw8JvnmtJwX+DR8LPIVdwao4FUT9T
 fbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WqCHtUCnOvJqjoM2/65DgkYvOyKmc4p+aq7/u8FCyxA=;
 b=w20O8AorFuTNMBNpjRJjTovsXguBE05IPYx4CiJMPy07X1TiE1+antKk7EoX8O+RJQ
 5uapJXZNcyFZ//v+138eTtCnSg7gZL2HWv7vMaN/5/5wnxoMl7KbbopNgGIcADNPx3mQ
 4qL+soiFbkf6JJCjTNeFJ6Bm2TBAXXYEPf4pi42vOrYh9MKy2dYPSBHwp6FRVYPiA06F
 lRL52vqCfwnMFoC01lLAj45da8Qk6DoBnuG9QALmL4PKumpr7E2X43z+H85AO3KNHkjs
 0zEJmj4YkTvnMDw4gzBuQbdOowA2e7VteJ2+pLMV88LrXBZonrtovhD3uHoOTpywaKHF
 itZQ==
X-Gm-Message-State: AJIora8AWy5Ph4NEAoSdA+yOMZqLZUvb2EMlarFFH5t80c0YBkhOCwOH
 0JxTeoobkqzWCFNWdmsd3T0=
X-Google-Smtp-Source: AGRyM1uzm9hmF9QK316rJoAfTTvEoAQhcLS5DK1sh8QXwvTquRMs7E5mQ7FvnFV0WtaDWVYa8qbSYg==
X-Received: by 2002:a2e:a883:0:b0:25a:8d91:27b4 with SMTP id
 m3-20020a2ea883000000b0025a8d9127b4mr2875724ljq.509.1655979906447; 
 Thu, 23 Jun 2022 03:25:06 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a2e9641000000b00253deeaeb3dsm2727519ljh.131.2022.06.23.03.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 03:25:05 -0700 (PDT)
Date: Thu, 23 Jun 2022 13:25:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220623102502.jiksqr3m6y733haq@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
 <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
 <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 jee.heng.sia@intel.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, palmer@dabbelt.com, dmaengine@vger.kernel.org,
 masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 04:06:21PM +0000, Conor.Dooley@microchip.com wrote:
> On 21/06/2022 00:17, Damien Le Moal wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 6/21/22 07:49, Conor Dooley wrote:
> >>
> ---8<---
> >>>>
> >>>> hmm, well I'll leave that up to people that have Canaan hardware!
> >>>
> >>> I will test this series.
> >>>
> >>
> >> Cool, thanks.
> >> I'll try to get a respin out tomorrow w/ the memory node "unfixed".
> > 
> > OK. I will test that then :)
> 
> Since the memory node hit that dt-schema snag, I have not sent a v2.
> Going to be AFK for a few days, so I dropped the memory node change,
> changed the spi binding & put the series on:
> git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ canaan
> 

> If you get a chance to look at it great, if not I'll send a v2 once
> the memory node is figured out.

commit 84df6ca0f277 ("spi: dt-bindings: dw-apb-ssi: update
spi-{r,t}x-bus-width") looks good to me. Feel free to add my ack tag
to v2 of that patch.

-Sergey

> 
> Thanks,
> Conor.
> 
