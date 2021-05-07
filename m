Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA773768E0
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 18:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D366EE73;
	Fri,  7 May 2021 16:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4920E6EE73
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 16:34:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s8so9897795wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 09:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=O99QLS/XuXmi5sOenN2CFxQz7Q5z0xeHfl0XAzi4THc=;
 b=U+IByuCcxULK3nxRVkk7JSImKY8trLGHWZcfLZTgiCNxRgComAbd5SB0Cfj6jYZ996
 9lS6uV6uHIiiE4JuSIZxyPiEFBQLgBWjXWWpjAxbl8UM05Asr4O0C2J4hfCVuPJJkeXk
 Lp1lfV5LSbB4AJ6q9iEoC6lTzRO2xg0DHZElM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=O99QLS/XuXmi5sOenN2CFxQz7Q5z0xeHfl0XAzi4THc=;
 b=ZvPNWPXOT/W8kAdnHFQOPDtaiClh38kVWPgHXZQwEVAhfuwy0Dbdm9t5U8MIL1L5aU
 Q6UjBl9OfEp1GjA/ViagWJ3i/GWXfZKVUTADkDF3+RuhoSFVZILvMkn8cnNqZ1sKUUlY
 k3TDSJTEOVsCV9VG1OfOecdpQSFQ6HDQTwElMscHq+lO4cbHqKg3aUFMDoJjfbo4lXCx
 pBSuPdNaZhEWNRForj5pWMj84ATTtJuUe5B8GYMjPOI+z2wSe9gINNqTQ6de85klWmRu
 cdcVBHt19TsRhP5sHQxAflA45e7vmoT+aUBtVYUB1NyblP3C2d/8kjMMyNNFbArfU2BA
 EtZA==
X-Gm-Message-State: AOAM530AOWnVLM3JrN/b2GYHMcAImbKm15TVtMKbyLlMwiy6MxGWwiyx
 +k/j8I0HE7JDCwfCXDdJQvp23w==
X-Google-Smtp-Source: ABdhPJz9eV+VjyShaXPfAx4WvqHMrnt9SIWVOMU/ZLtthyBfUy5zg6ri6iuFlihrahEEp1TfX0GW8g==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr13620583wru.16.1620405276947; 
 Fri, 07 May 2021 09:34:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm8702898wrt.79.2021.05.07.09.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 09:34:36 -0700 (PDT)
Date: Fri, 7 May 2021 18:34:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] video: fbdev: imxfb: Fix an error message
Message-ID: <YJVsGn4+rbh0+b+I@phenom.ffwll.local>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel-janitors@vger.kernel.org,
 krzysztof.h1@poczta.fm, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, j.beisert@pengutronix.de,
 linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
References: <d7b25026f82659da3c6f7159eea480faa9d738be.1620327302.git.christophe.jaillet@wanadoo.fr>
 <20210507050503.iwrcis2xzhjjthmp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210507050503.iwrcis2xzhjjthmp@pengutronix.de>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-fbdev@vger.kernel.org, s.hauer@pengutronix.de,
 kernel-janitors@vger.kernel.org, krzysztof.h1@poczta.fm,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 j.beisert@pengutronix.de, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 07, 2021 at 07:05:03AM +0200, Uwe Kleine-König wrote:
> Hello Christophe,
> 
> On Thu, May 06, 2021 at 08:57:05PM +0200, Christophe JAILLET wrote:
> > 'ret' is known to be 0 here.
> > No error code is available, so just remove it from the error message.
> > 
> > Fixes: 72330b0eeefc ("i.MX Framebuffer: Use readl/writel instead of direct pointer deref")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/video/fbdev/imxfb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
> > index 7f8debd2da06..ad598257ab38 100644
> > --- a/drivers/video/fbdev/imxfb.c
> > +++ b/drivers/video/fbdev/imxfb.c
> > @@ -992,7 +992,7 @@ static int imxfb_probe(struct platform_device *pdev)
> >  	info->screen_buffer = dma_alloc_wc(&pdev->dev, fbi->map_size,
> >  					   &fbi->map_dma, GFP_KERNEL);
> >  	if (!info->screen_buffer) {
> > -		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
> > +		dev_err(&pdev->dev, "Failed to allocate video RAM\n");
> >  		ret = -ENOMEM;
> >  		goto failed_map;
> >  	}
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks for patch& review, queued for 5.14 in drm-misc-next.
-Daniel

> 
> Are you using this driver, or did you find that problem using some
> static checker?
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
