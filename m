Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C153EE742
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F4E8994D;
	Tue, 17 Aug 2021 07:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731F28994D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 07:31:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso1159787wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A2+Lw6uRYk4QEZKbOu0vM7QAf5sH/o6K/BfCCdq3elY=;
 b=qSzoGmtukLgOoF65aePa+A5AChJnPJeVQBf/5shvBkcXdYkAcfouanKF5FhBS05sDv
 x6R4NOEDOziDXay+sg9+q47sBvZQbvKBn+pXqMCWaR6rGVJpjMRNWW0GxLJZVOYggw3h
 Sau+VXy54OojAAMFuSsAOVsqTQNu+P9jsid/1JE5YXQ38dXDpIR2Cs1EPe//gbFMoX2F
 VhN4rXLw/3q3uY6+roXduEE5aqhp212LnwWBUiLMviLACEv3PpSUxFbFeNv79Xz47Gql
 97PGkxZJKNTjJC/wP/hgdWHHdexsZM8zx9lueuMVMHM3p8PaTEYe5k8TsUCT6TfLY07f
 Itaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A2+Lw6uRYk4QEZKbOu0vM7QAf5sH/o6K/BfCCdq3elY=;
 b=mJtiZ+wXbE+FJVo2NerqiZxUhd4S/NGxAFq5+nCY2FtOFXraktSm9kfzb6Pi/cXHh9
 tlTsVSW1BBqpGx3XZOIMzaWJp0oJYfGOEy9V8cslFaPAd41jeqXZnMdOs1zAHMfVynnD
 9dwsMCS+SeAmeOjWI0xncmkfnoM1+oHiPesHFcWgNmW1I+U2u8kg1pMDfmxGehoJz/ks
 1Zft/INI5QHtikGZtHCSK8iYPzyUrGu/f7lOQ5nYJYmi9S5v8xeYUJws3HOGEkdKwIhe
 kVjaJm14oMuH2tPmT59wOzYaTKLfTuLgP6txNSK7E5XyBHT6UuQxx8eD5hDF6Oyoj5jm
 cMow==
X-Gm-Message-State: AOAM533XQoXLjA17F9qq8q3POwY4IRalIdO0iSxVdOqWRHmtPD197Sju
 VkhuQgLiFKE2AS6aueZtDxI7Xw==
X-Google-Smtp-Source: ABdhPJxMIBUssTHuFg+f+xiecHohfOVUViphNPiVPc7ogcvHkzCpoXJ76sTreVditSxIWT9KFPqlDA==
X-Received: by 2002:a05:600c:4fc6:: with SMTP id
 o6mr1024050wmq.122.1629185481030; 
 Tue, 17 Aug 2021 00:31:21 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id p6sm1406274wrw.50.2021.08.17.00.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:31:20 -0700 (PDT)
Date: Tue, 17 Aug 2021 09:31:20 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210817073120.fqa2wybvdgbn55a4@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
 <YRraTWcY4yVuJANQ@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YRraTWcY4yVuJANQ@ravnborg.org>
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

Hi Sam,

On Mon, Aug 16, 2021 at 11:36:13PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> A few general things in the following. This is what I look for first in
> a bridge driver - and I had no time today to review the driver in full.
> Please address these, then cc: me on next revision where I hopefully
> have more time.

Thanks for taking the time and giving me the tips, will fix it and send
a new version.

Best,
Markus

> 
> 	Sam
> 
> > +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> > +                               enum drm_bridge_attach_flags flags)
> > +{
> > +       struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > +       int ret;
> > +
> > +       mtk_dp_poweron(mtk_dp);
> > +
> > +       if (mtk_dp->next_bridge) {
> > +               ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
> > +                                       &mtk_dp->bridge, flags);
> > +               if (ret) {
> > +                       drm_warn(mtk_dp->drm_dev,
> > +                                "Failed to attach external bridge: %d\n", ret);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > +               drm_err(mtk_dp->drm_dev,
> > +                       "Fix bridge driver to make connector optional!");
> > +               return 0;
> > +       }
> 
> This driver is only used by mediatek, and I thought all of mediatek is
> converted so the display driver creates the connector.
> 
> It would be better to migrate mediatek over to always let the display
> driver create the connector and drop the connector support in this
> driver.
> 
> 
> > + struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> > +	.attach = mtk_dp_bridge_attach,
> > +	.mode_fixup = mtk_dp_bridge_mode_fixup,
> > +	.disable = mtk_dp_bridge_disable,
> > +	.post_disable = mtk_dp_bridge_post_disable,
> > +	.mode_set = mtk_dp_bridge_mode_set,
> > +	.pre_enable = mtk_dp_bridge_pre_enable,
> > +	.enable = mtk_dp_bridge_enable,
> > +	.get_edid = mtk_get_edid,
> > +	.detect = mtk_dp_bdg_detect,
> > +};
> 
> 
> For new drivers please avoid the recently deprecated functions.
> 
> - Use the atomic versions of pre_enable, enable, disable and post_disable.
> 
> - Merge mode_set with atomic_enable - as there is no need for the mode_Set
>   operation.
> 
> - Use atomic_check in favour of mode_fixup, albeit the rules for
>   atomic_check is at best vauge at the moment.
>  
> 
