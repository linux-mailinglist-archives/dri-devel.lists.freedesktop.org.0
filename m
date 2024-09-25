Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D233B985596
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 10:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1610E7CB;
	Wed, 25 Sep 2024 08:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YmtNw4N1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD3810E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:36:52 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so6666581e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727253410; x=1727858210; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4LFFK30ORGOB8opISAVi2/AjiV23wsDk5moHBmYPz9c=;
 b=YmtNw4N1FdFZj2qQT5A+m8urYcPOnG2NJuaxe5OKJAfrh8LAl9d9Kk6zwwxi3WiR5b
 4PshFYFG5PHP1nt5SHZmAtcVMpmxqJ7Aj1+4Sm5iXoUJm6PcapznNcjORg7j6+H4oqN3
 kg9rbHfT8Yvmvw0c5OWlgr0jYzSpfbOzYl3Wsv1L2k3AFZQ0X34aKaFIh1DfSjtY1y1Z
 u+hZfB+YDRQu+eLpLsDwjI3PHmXYwaCzvBdyPAPCQAVxPKcekGyEHgWw0MhckfI2jSq8
 3WjEPd9Cz2PJVGEJf8mocMDgavhR5lwa4KpJuhB8VyBAX0aGBiVO9XVHZrHvz2IAPkL4
 nlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727253410; x=1727858210;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LFFK30ORGOB8opISAVi2/AjiV23wsDk5moHBmYPz9c=;
 b=exgcu624K7/e0Cjh8N0MRIFxVAYmYIIBFrDTWxXlZ8WK0gIoJ9oBU+oPVaZOmoSUw5
 aJVv0xOF4P8L00UYmHdS99OQeNg2TRH9q2HKacTzrD0RLw9n3FZ3kNLhg9+QLf7Ao5i6
 1+UiAKvpjNj0dg/Qvh8rmnWd4/VsL7b4eUSbrKGQ96fi8a1+kG9XQoINSLjmfkTc9mpP
 NsFh6gXRlEDSxLCYbzum2atGUiAEOiGWDeBAbTbrj5MqnFRaC54l3S2kjbX4t+qNjewB
 1mWeYVAOipZfeSy2W/oWLPc45uVFv3onBZ1hEwhNwfQsfKUoasyFpGMQp2Ij3hYejs8V
 XyGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOOurAqislLmYxrmkIOHDgXuHw0tv9sPV5UMptLfDnQnOIAti5E8u4hx9SrcTDN8Unn/4GVK2a1YA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWQy9Din0nkloMQbzEIcxs88e1oqr8Qe67Wcf2Ky+zdmhyBL1s
 uuhTbso1JBpXA8/pKY6xTwbRkgcU06N1CPO8XVcy3ni2Ky1RyHiFc40Dtaocp9o=
X-Google-Smtp-Source: AGHT+IFzrCK0VcF5jVceh0qZQhYC3c4kXM0RNJ7sHMGDqRBw1Dr0li2TBcCq7sjXdcDnOzH2DHlX+w==
X-Received: by 2002:a05:6512:110e:b0:52c:e3ad:3fbf with SMTP id
 2adb3069b0e04-5387755cb9cmr1098457e87.42.1727253410148; 
 Wed, 25 Sep 2024 01:36:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0ba7sm457699e87.52.2024.09.25.01.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:36:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, 
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] drm/mediatek: dp: Add sdp path reset
Message-ID: <ybnnqysm2ptvclaal3kw26ttqkgbicn45cwxkkchl72vuzwtt2@el7c34zqxmjl>
References: <20240925064854.23065-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925064854.23065-1-liankun.yang@mediatek.com>
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

On Wed, Sep 25, 2024 at 02:48:22PM GMT, Liankun Yang wrote:
> When using type-c to type-c to connect to the monitor,
> the sound plays normally. If you unplug the type-c and
> connect the type-c to hdmi dongle to the monitor, there will be noise.
> 
> By capturing the audio data, it is found that
> the data position is messy, and there is no error in the data.
> 
> Through experiments, it can be restored by resetting the SDP path
> when unplugging it.
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Changes in V3:
> - No change.

If there are no changes, why did you increase the revision?

> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923132521.22785-1-liankun.yang@mediatek.com/

The link points to some other patch. Please consider using b4 tool, it
will manage changelogs and links for you.

> 
> Changes in V2:
> - Fix build error.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240923133610.23728-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c     | 15 +++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h |  1 +
>  2 files changed, 16 insertions(+)
> 

-- 
With best wishes
Dmitry
