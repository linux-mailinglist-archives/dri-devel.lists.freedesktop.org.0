Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E444C763F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFC810E37D;
	Mon, 28 Feb 2022 18:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DD510E37D;
 Mon, 28 Feb 2022 18:01:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n14so16720818wrq.7;
 Mon, 28 Feb 2022 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OuGGTGuRIE8usjIvuhTwZdZ+bQXhsBG1NshUB/XmMvQ=;
 b=BIr7I+Ke1z/B1XyFd1SZEZAA7IpEwziRbFuLK8crUxYaPxl3NmzbrTbajm8wsBVGhL
 xEcI9VSLUpkOwaJVnG9cNKyseBq40pGrC30v01hoZ6J0VveiKbWWrWcme+jubwft3tVw
 g2bbTmpq7tuX7rOB2JlIGFZvH1NKf2z/93iwyvdXAhkTf9Haw+VUGNmYv119pgBrN/q5
 YGdDFcEWZuRHtbzfjNNXNu7PKqiarFPoat28khSj0ECaay4di7NbXbVyLt6IVTNsTZlw
 67W/msTLzig3DvBSkK8gPJGtaCykJxXyd6Gsmu1TgQ85df56Zyu/9geTESD87bm3X0Ob
 vi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OuGGTGuRIE8usjIvuhTwZdZ+bQXhsBG1NshUB/XmMvQ=;
 b=XN84PLe0Bza/nVsOfABT8jBbSgMWxnXI6vd9K0di3VNhmGvajHDxE50W833J8OtwcN
 gOH8Zz/CRFrqL4MT4OtsDroC85LwXWH/ZNQ2qdCjWSx2UDf8dY4cuR6blwdo5e6R97h1
 FyzTwbnRqSee1uvypL7cep9rmHjYDnvZ0lhKmTgXA5D5UxKYAAOfVwwERkvZutKmSggZ
 ZtMYcwZnmYsGkk2Va++HY2X2pGv6plWoL1TqziQtnxurDdpFzutMHuKq6ur0+YzMre4D
 e/BaP0teUpNxcfO2Oc2DcYCFb9CQRDaAgDWapRlrnoJawP5Q7i3F9fsu6YGws2GWMLHZ
 bGyQ==
X-Gm-Message-State: AOAM531PttoXAuSAr6P7AY7xC16+ZKL51IxqZmW1YeSU6szKwfNlPwpL
 Bb4YdTmmkNK/nb+28iwBrFM=
X-Google-Smtp-Source: ABdhPJz/JSS05A/Hdl3RiJ9ixIT19NUl8QYWHKPwe98s181rWLVJTVQPr7RrIAjjcwMeeazx20oIKg==
X-Received: by 2002:a05:6000:156a:b0:1ed:ab73:e248 with SMTP id
 10-20020a056000156a00b001edab73e248mr16829738wrz.292.1646071284032; 
 Mon, 28 Feb 2022 10:01:24 -0800 (PST)
Received: from elementary ([94.73.33.246]) by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm5354362wro.80.2022.02.28.10.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:01:23 -0800 (PST)
Date: Mon, 28 Feb 2022 19:01:21 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: switch to devm_drm_of_get_bridge
Message-ID: <20220228180121.GA14354@elementary>
References: <20220221073339.10742-1-jose.exposito89@gmail.com>
 <CAE-0n50cW4-xzabNjb0mHLCgUYj+Mcp3_XxYrYf9AVuZO_9qKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE-0n50cW4-xzabNjb0mHLCgUYj+Mcp3_XxYrYf9AVuZO_9qKg@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, maxime@cerno.tech,
 dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 09:07:49PM +0000, Stephen Boyd wrote:
> Quoting José Expósito (2022-02-20 23:33:39)
> > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > favor of "devm_drm_of_get_bridge".
> >
> > Switch to the new function and reduce boilerplate.
> >
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> 
> Dmitry is rewriting this code in a larger series. This patch is
> superseded by that work.

Thanks for the heads up Stephen, it is indeed superseded by [0].

And thanks for the review Maxime.

[0] https://lore.kernel.org/dri-devel/20220211224006.1797846-3-dmitry.baryshkov@linaro.org/

