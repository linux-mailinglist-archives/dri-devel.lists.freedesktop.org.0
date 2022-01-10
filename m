Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F5489EC4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 19:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C988112EAD;
	Mon, 10 Jan 2022 18:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB79B112CB4;
 Mon, 10 Jan 2022 18:03:09 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 h5-20020a9d6a45000000b005908066fa64so14995059otn.7; 
 Mon, 10 Jan 2022 10:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wHOge8f285bUwWiwcIOK5mGtXreVJpH3JR+WmddSG+w=;
 b=hpFqpKjmTgOI0e5i73Nz59V02BhxIvTM3aiC29d1/9bRkuy3mFUzrWaJvr77XO85kw
 IaJ/77ExY+Hzm+lVwyViJHqQuXdrhYuUiEiLTO3MVbsWf7zVtrESPT6PWpT4L1Z+NjSM
 /rG7nmafMnzY/02i3qm/Ied6RZUrvadtFk3Uyt/oUibSHktJPYpE61Ju4D+wLea4Lzm9
 CVue310YRJkDRiTMum4+sgcrOGDxXKlOBvJvniTW6xBaws2QcYDSClqrvw7KTFmZkjVJ
 41/9T944xff6Zs7G5vDW2GXI8Le9h3h8SksF03On+ZTokvMapByJWlCq+77j/sSMsoPK
 4PxQ==
X-Gm-Message-State: AOAM531IQgfW2mSDjwpFfTRppYIur9CBexA8xkZbUwFi9SzvU2iZygvG
 O8M+kdn32EBZvDEyNSD0dA==
X-Google-Smtp-Source: ABdhPJy2eemZljd8HGQlyZW1LQmzSFvk96tev44J/1OoHkgOIWYMFcYNSrMUsQxaE0C/3FNF0Xh2Kg==
X-Received: by 2002:a05:6830:3110:: with SMTP id
 b16mr705116ots.367.1641837788966; 
 Mon, 10 Jan 2022 10:03:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 23sm1563517oty.6.2022.01.10.10.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 10:03:08 -0800 (PST)
Received: (nullmailer pid 1197339 invoked by uid 1000);
 Mon, 10 Jan 2022 18:03:07 -0000
Date: Mon, 10 Jan 2022 12:03:07 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: Add DisplayPort controller for SM8350
Message-ID: <Ydx028kx9H4skxUu@robh.at.kernel.org>
References: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Dec 2021 20:59:34 -0800, Bjorn Andersson wrote:
> The Qualcomm SM8350 platform comes with a single DisplayPort controller,
> add support for this in the DisplayPort driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
