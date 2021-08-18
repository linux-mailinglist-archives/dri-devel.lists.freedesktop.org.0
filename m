Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0983EFDBD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49238957B;
	Wed, 18 Aug 2021 07:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBD06E456
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:26:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x12so1882478wrr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GS53dtkSshsWU0pVEuBPMNBIV+APKbgrHvnwbGn/3sI=;
 b=wUAFXLP7N/3NrkHAyZL3s132TwORCZb2Yasjm6SF4+ENfHJw630p79P5rnaT/TiNPz
 ahuhHSKQak4G8VrlvJivcPjqBrh7ED3u4wIMhuAvwdMA5byrIogU9DuE/6W7yL0E1Epk
 Pes++NSdTTotfcp4WEH1ndL0aggIqfvFApo+5Cp60Zxot9KTCUhJYsvLBfrAOKGQ6m9J
 Zy+3d1dR49jlM69gcONakVGqaQMgz/OFd3ssOnrcAV1fpGmNbblLutj342BCFtVL+DkK
 Vnu6QuzaoLvrUk6YiOjh05z84zKqSrumX73bmgAYqolmhzqhhuVh2lJEXj4X1aZIVVJW
 QrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GS53dtkSshsWU0pVEuBPMNBIV+APKbgrHvnwbGn/3sI=;
 b=uKq5kgkze3KpBj4CPr+ibQXGaVLWzsFKfrDdyvtFDxnIZ/PoPXAP32gh9ymCil9nG1
 GyaSSiQ/sLt8kPV//9OcJfWxsGvScL3h7BtBKiTKZ3jSVAJiTdGwjVIa1Q8Dv8ZiNHPn
 nNdmba+qK5iNeBw2p9/SZdOunIZ6OmBdxvK+TCdl6ZuuzRzjKbV1mMeRe16Rgm74uIT4
 nuTvJukB0X2l5FMO3Ydso77rklnF+kQ4JN++cDlGgwKFH9F1E8zw98CCS/Gm5z3DiiKB
 SQbb5N7vmkhU4FxtxFkn2aO0Tl4qRxsv3N1tUbGtrJcdbN+D7tQE1gq+w7hC75TsVqj4
 Qa2g==
X-Gm-Message-State: AOAM532ZCXcYBvsTRhoLEOcXi5NCZez05qIAsejtzwTrHLi1TZSLO+aQ
 Unbp9sZb/SHT0cHslmhDt0lGQg==
X-Google-Smtp-Source: ABdhPJzrPi5e48Mr13B77OJiauHWNOs1hURKk05xXQW1uKoPxv5uzRIX1HpIvMfMIvO7bQHzZDUOjA==
X-Received: by 2002:adf:e507:: with SMTP id j7mr8921378wrm.113.1629271611907; 
 Wed, 18 Aug 2021 00:26:51 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id q17sm4832717wrr.91.2021.08.18.00.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:26:51 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:26:50 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 2/5] drm/mediatek: dpi: Add dpintf support
Message-ID: <20210818072650.wtarykc4rihtio4k@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-3-msp@baylibre.com>
 <1629193844.19746.2.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629193844.19746.2.camel@mtksdaap41>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 17, 2021 at 05:50:44PM +0800, CK Hu wrote:
> Hi, Markus:
> 
> On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> > dpintf is the displayport interface hardware unit. This unit is similar
> > to dpi and can reuse most of the code.
> > 
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >  - Some features/functional components are not available for dpintf
> >    which are now excluded from code execution once is_dpintf is set
> >  - dpintf can and needs to choose between different clockdividers based
> >    on the clockspeed. This is done by choosing a different clock parent.
> >  - There are two additional clocks that need to be managed. These are
> >    only set for dpintf and will be set to NULL if not supplied. The
> >    clk_* calls handle these as normal clocks then.
> >  - Some register contents differ slightly between the two components. To
> >    work around this I added register bits/masks with a DPINTF_ prefix
> >    and use them where different.
> > 
> > Based on a separate driver for dpintf created by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 282 ++++++++++++++++++++----
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  12 +
> >  2 files changed, 247 insertions(+), 47 deletions(-)
> > 
> 
> [snip]
> 
> >  
> > +static void mtk_dpi_set_pixel_clk_parent(struct mtk_dpi *dpi,
> > +					 unsigned int factor)
> > +{
> > +	struct clk *new_parent;
> > +
> > +	switch (factor) {
> > +	case 16:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D16].clk;
> > +		break;
> > +	case 8:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D8].clk;
> > +		break;
> > +	case 4:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D4].clk;
> > +		break;
> > +	case 2:
> > +		new_parent = dpi->tvd_clks[MTK_DPI_TVDPLL_D2].clk;
> > +		break;
> > +	default:
> > +		new_parent = NULL;
> > +	}
> > +	if (new_parent)
> > +		clk_set_parent(dpi->pixel_clk, new_parent);
> 
> I prefer that dpi->pixel_clk provide set_rate() interface, and let clock
> driver to control the parent of dpi->pixel_clk.

Good point, will do that, thanks.

Best,
Markus

> 
> Regards,
> CK
> 
> > +}
> > +
> >  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >  				    struct drm_display_mode *mode)
> >  {
> > @@ -465,6 +568,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >  	drm_display_mode_to_videomode(mode, &vm);
> >  	pll_rate = vm.pixelclock * factor;
> >  
> > +	mtk_dpi_set_pixel_clk_parent(dpi, factor);
> > +
> >  	dev_dbg(dpi->dev, "Want PLL %lu Hz, pixel clock %lu Hz\n",
> >  		pll_rate, vm.pixelclock);
> >  
> 
> 
