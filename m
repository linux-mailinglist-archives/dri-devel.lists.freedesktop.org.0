Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EEE4D229F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC62910E238;
	Tue,  8 Mar 2022 20:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0E10E238
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:31:11 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n7so507587oif.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ggKE+QQN96ACgccKsgFkOnubBkvwOfbXHtYWYxkQBiY=;
 b=ChyVvEiI6i2Y5+AJDxTMK0DvaXspW10L04xc7T3dBzWFVLrvr/QoeFenREIvCdo6a6
 9R7dWKbI7LjPm/hsNp7oZBDMlDQvVHw6DBtblOF/PkcJZIipiktXOCmSy3AcX323Ulwe
 tVpUezHz9kUATYgbAc2FC4LycF9VnfQYUOreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ggKE+QQN96ACgccKsgFkOnubBkvwOfbXHtYWYxkQBiY=;
 b=Yt7RYlewskaqQrFRU9xCFSutxKZlEVupcfr7KYXpTroSXihSKB/aJjEAOWMrxOS7j/
 MXflk9QOzy7mEVYZhxKpzTZYsJD4i/sxjR1qixdbZxqZ49QfeDbo3NgeE3d8hUgr6rQi
 aq70f55gn1gwLpMqH2CVsQqk0mYq8zrWA6OwL4/6ebbREf+74J+bxmuA1VR0K66vpDxB
 MXyoDyJl8QG6CpIG4otVtMFVdmV9g+fmI96s/yuGYoOKkJWwLOWA46o1p2SwiPmY3pgF
 k7uPbAbbhVj8fu7LnF2djccqWROoR/5QnuiHCbb4n7+U7f2cuxfUdXYJsJkXQBRnWaY3
 irYA==
X-Gm-Message-State: AOAM531zAWZ+K947//7QnunFdl7KU1wy5xaULV7tzThy//hSL2Mn8ByZ
 aqs8SkXGT4bRJiGk66n9qq5d1HXFCIpDMydUMub2zA==
X-Google-Smtp-Source: ABdhPJw4rTppu+6vf/ZU341j6fzv5vxD9Y57pMhosx4Tq2+tN5qUwZzja6HMzrdn+PktqJlByzAZ+pahasDpswzJwa0=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3860939oib.63.1646771471006; Tue, 08
 Mar 2022 12:31:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:31:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:31:10 -0800
Message-ID: <CAE-0n509i4o2vWp_Ukms3Uswqpk73JiCN3_Q3DC8qSVbp4P8ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm: split the main platform driver
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-03 19:21:04)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 857eefbb8649..c89de88ed2d1 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -255,3 +258,170 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
[...]
> +
> +static int mdss_probe(struct platform_device *pdev)
> +{
> +       struct msm_mdss *mdss;
> +       struct msm_drm_private *priv;
> +       int mdp_ver = get_mdp_ver(pdev);
> +       struct device *mdp_dev;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);

Is this set here so that msm_mdss_init() can use it? Can we pass 'priv'
as an argument to that function if so?

> +
> +       mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +       if (IS_ERR(mdss)) {
> +               ret = PTR_ERR(mdss);
> +               platform_set_drvdata(pdev, NULL);

Is this platform_set_drvdata to NULL really necessary? It would be nice
to skip it so the mental load of this probe is lower.

> +
> +               return ret;
> +       }
> +
