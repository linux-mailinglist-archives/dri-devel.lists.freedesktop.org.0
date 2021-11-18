Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED845547A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 06:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BBB6E9B5;
	Thu, 18 Nov 2021 05:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9BB6E9B5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:55:32 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id m14so4876159pfc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M6fU9HCOMXaAwWu55zqsqx8GoNSHTp7qVG4HyvmThLM=;
 b=UHufCLPWyoOczeZ10rpOHREDHnb3KpiCBx3l1fTQm5RvUKFPfoiV3nIdNI1zko70SG
 /rKe8N7G0c0n05WH2WbNalEhgCbNcRUSas8ntyCf23nZUCkn6i9wCai27/OIwEMEJyOv
 ThePhBf4AWclUuOtatuS2nfw5iiz775JEIGgnd/uYe4rXrmhZLY9uVjezatexQW9zJlr
 f/ua1KJym4YKdxaoZO7i5Sm2rmE52E/ZEveHM3ZGMEyCS4qLoJEPYgizR4iGB0ez384E
 65/JeZxmXvJ2XZODMZNCnYNZLTvHyi9Vh/6xPx5IAmj5cvI8gu2XavIl9F9ECYt2hs+g
 UB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M6fU9HCOMXaAwWu55zqsqx8GoNSHTp7qVG4HyvmThLM=;
 b=mtIwJNBPZmsxEU4+QLHfCNdfZ6DRE0yqbKesqzz7gsf6GC5t8+M+51G/5r82Zpw7V+
 cuGDkHSYR6P6TMCCQkhpIFc/HRoUeYZasO1ih75vX2YX/77R7LXiQXE2DCDkMDrMAmzh
 T4NbR9dyiXrhhFJqhRctIzVtzcDCUuMFz1w9gDhjHtkMHuJxJ5ANttkhiFK3Kk0fZYaF
 6yaXI17nP4IjY3nBf0UFWMpdQNBNSbdpKbhQpGp40MDm/ZUkCq6pGCPQ/D86o3hD/5H1
 DptFsKxcHu+mcZ5RVH+yix5gWn+R5Z4WCNLMPvIpfaOhSsPb2emIEQr1cyeI2TzCyVHh
 B61A==
X-Gm-Message-State: AOAM533OzU0WVnVYEg3yXwSXEnDw/mju9HrbjDzY7vXFGlHPB1td5qkk
 y8N/7rVxYt2PnKHiqiR9X1FGLw==
X-Google-Smtp-Source: ABdhPJw1U92hefuFRAL0GmhDcNMuPQUVRaJ5rI4xhjzGg+pVLc+xkbJYl2Vby+uLLS0FJI1gYbeHXQ==
X-Received: by 2002:a05:6a00:23c8:b0:49f:e054:84d7 with SMTP id
 g8-20020a056a0023c800b0049fe05484d7mr53924075pfc.50.1637214931490; 
 Wed, 17 Nov 2021 21:55:31 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8f8:11d:a96a:74d2])
 by smtp.gmail.com with ESMTPSA id u9sm1547277pfi.23.2021.11.17.21.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 21:55:31 -0800 (PST)
Date: Thu, 18 Nov 2021 13:55:27 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
Message-ID: <YZXqz6XDChwscDC0@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-4-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117064158.27451-4-jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 02:41:58PM +0800, jason-jh.lin wrote:
> @@ -158,6 +159,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
>  	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
>  
>  	if (mtk_crtc->cmdq_client.chan) {
> +		device_link_remove(mtk_crtc->drm_dev, mtk_crtc->cmdq_client.chan->mbox->dev);
>  		mbox_free_channel(mtk_crtc->cmdq_client.chan);
>  		mtk_crtc->cmdq_client.chan = NULL;
>  	}
[...]
> @@ -956,6 +959,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	}
>  
>  	if (mtk_crtc->cmdq_client.chan) {
> +		struct device_link *link;
> +
> +		/* add devlink to cmdq dev to make sure suspend/resume order is correct */
> +		link = device_link_add(dev, mtk_crtc->cmdq_client.chan->mbox->dev,
> +				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +		if (!link) {
> +			dev_err(dev, "Unable to link dev=%s\n",
> +				dev_name(mtk_crtc->cmdq_client.chan->mbox->dev));
> +		}
> +

If device_link_add() failed, doesn't mtk_drm_crtc_create() need to return an error and exit?

OTOH, if device_link_add() failed, won't it bring any side effects to call device_link_remove()?
